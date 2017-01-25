//
// Created by bknun on 1/7/2017.
//
#include "parser.h"
#include <sstream>

void parser::parse()
{
    if(toks->getentities() == 0)
        return;

    errors = new Errors(toks->getlines());
    _current= &(*std::next(toks->getentities()->begin(), cursor));

    while(!isend())
    {
        eval(NULL);
    }

    if(errors->_errs())
        return;

    for(auto &ast : *tree)
    {
        int i = 0; 
    }
}

Errors* parser::geterrors()
{
    return errors;
}

bool parser::isend() {
    return current().gettokentype() == _EOF;
}

void parser::eval(ast* _ast) {
    if(isaccess_decl(current()))
    {
        parse_accesstypes();
    }

    if(isend())
    {
        remove_accesstypes();
        return;
    }
    else if(ismodule_decl(current()))
    {
        if(access_types->size() > 0)
        {
            errors->newerror(ILLEGAL_ACCESS_DECLARATION, current());
        }
        parse_moduledecl(_ast);
    }
    else if(isclass_decl(current()))
    {
        parse_classdecl(_ast);
    }
    else if(isimport_decl(current()))
    {
        if(access_types->size() > 0)
        {
            errors->newerror(ILLEGAL_ACCESS_DECLARATION, current());
        }
        parse_importdecl(_ast);
    }
    else
    {
        // "expected class, or import declaration"
        errors->newerror(UNEXPECTED_SYMBOL, current(), " `" + current().gettoken() + "`; expected class, or import declaration");
        parse_all(_ast);
    }

    advance();
    remove_accesstypes();
}

void parser::parse_classdecl(ast* _ast) {
    _ast = get_ast(_ast, ast_class_decl);

    for(token_entity &entity : *access_types)
    {
        _ast->add_entity(entity);
    }
    _ast->add_entity(current());


    expectidentifier(_ast);

    parse_classblock(_ast);
}

void parser::parse_importdecl(ast* _ast) {
    _ast = get_ast(_ast, ast_import_decl);
    _ast->add_entity(current());

    parse_modulename(_ast);

    if(!expect(SEMICOLON, "`;`"))
    {
        pushback();
        return;
    }

    cout << "parsed import declaration" << endl;
}

void parser::parse_moduledecl(ast* _ast) {
    _ast = get_ast(_ast, ast_module_decl);
    _ast->add_entity(current());

    parse_modulename(_ast);

     if(!expect(SEMICOLON, "`;`"))
         return;

     cout << "parsed module declaration" << endl;
}

token_entity parser::current()
{
    return *_current;
}

void parser::advance()
{
    if((cursor+1)>=toks->getentitycount())
        *_current =*toks->EOF_token;
    else
        _current = &(*std::next(toks->getentities()->begin()
                , ++cursor));
}

token_entity parser::peek(int forward)
{

    if(cursor+forward >= toks->getentities()->size())
        return *std::next(toks->getentities()->begin(), toks->getentitycount()-1);
    else
        return *std::next(toks->getentities()->begin(), cursor+forward);
}

bool parser::isvariable_decl(token_entity token) {
    return (token.getid() == IDENTIFIER && !iskeyword(token.gettoken())) || isnative_type(token.gettoken());
}

bool parser::ismethod_decl(token_entity token) {
    return token.getid() == IDENTIFIER && token.gettoken() == "function";
}

bool parser::isstatement_decl(token_entity token) {
    return
            (token.getid() == IDENTIFIER && token.gettoken() == "return") // return statement
            /*
             * Variable assignment
             * x = 9;
             *
             * method invocation
             * examples#Main.func(9.1e+10, Class.x)
             */
            || (token.getid() == IDENTIFIER && !iskeyword(token.gettoken()))
            || (token.getid() == IDENTIFIER && isnative_type(token.gettoken()))

            || (token.gettokentype() == SEMICOLON); // for empty statements
}

ast* parser::ast_at(long p)
{
    return &(*std::next(tree->begin(), p));
}

bool parser::ismodule_decl(token_entity entity) {
    return entity.getid() == IDENTIFIER && entity.gettoken() == "mod";
}

bool parser::isclass_decl(token_entity entity) {
    return entity.getid() == IDENTIFIER && entity.gettoken() == "class";
}

bool parser::isimport_decl(token_entity entity) {
    return entity.getid() == IDENTIFIER && entity.gettoken() == "import";
}

bool parser::isreturn_stmnt(token_entity entity) {
    return entity.getid() == IDENTIFIER && entity.gettoken() == "return";
}

bool parser::issemicolon(token_entity entity) {
    return entity.gettokentype() == SEMICOLON;
}

bool parser::isnative_type(string type) {
    return type == "int" || type == "short"
            || type == "long" || type == "bool"
            || type == "char" || type == "float"
            || type == "double";
}

bool parser::isaccess_decl(token_entity token) {
    return
            token.getid() == IDENTIFIER && token.gettoken() == "protected" ||
                    token.getid() == IDENTIFIER && token.gettoken() == "private" ||
                    token.getid() == IDENTIFIER && token.gettoken() == "static" ||
                    token.getid() == IDENTIFIER && token.gettoken() == "const" ||
                    token.getid() == IDENTIFIER && token.gettoken() == "override" ||
                    token.getid() == IDENTIFIER && token.gettoken() == "public";
}

void parser::parse_accesstypes() {
    remove_accesstypes();

    while(isaccess_decl(current()))
    {
        access_types->push_back(current());
        advance();
    }
}

void parser::remove_accesstypes() {
    if(access_types->size() > 0)
        access_types->clear();
}

void parser::expect(token_type ty, ast* pAst, const char *expectedstr) {
    advance();

    if(current().gettokentype() == ty)
    {
        if(pAst != NULL)
            pAst->add_entity(current());
    }
    else {
        errors->newerror(GENERIC, current(), "expected " + string(expectedstr));
    }
}


bool parser::expectidentifier(ast* pAst) {
    advance();

    if(current().getid() == IDENTIFIER && !iskeyword(current().gettoken()))
    {
        if(pAst != NULL)
            pAst->add_entity(current());
        return true;
    }
    else {
        errors->newerror(GENERIC, current(), "expected identifier");
    }
    return false;
}

bool parser::expect(token_type type, const char *expectedstr) {
    advance();

    if(current().gettokentype() == type)
    {
        return true;
    }
    else {
        errors->newerror(GENERIC, current(), "expected " + string(expectedstr));
    }
    return false;
}

void parser::parse_classblock(ast *pAst) {
    expect(LEFTCURLY, "`{` after class declaration");
    pAst = get_ast(pAst, ast_block);

    int brackets = 1;

    while(!isend() && brackets > 0)
    {
        advance();
        if(isaccess_decl(current()))
        {
            parse_accesstypes();
        }

        if(ismodule_decl(current()))
        {
            if(access_types->size() > 0)
            {
                errors->newerror(ILLEGAL_ACCESS_DECLARATION, current());
            }
            parse_moduledecl(pAst);
        }
        else if(isclass_decl(current()))
        {
            parse_classdecl(pAst);
        }
        else if(isimport_decl(current()))
        {
            if(access_types->size() > 0)
            {
                errors->newerror(ILLEGAL_ACCESS_DECLARATION, current());
            }
            parse_importdecl(pAst);
        }
        else if(isvariable_decl(current()))
        {
           parse_variabledecl(pAst);
        }
        else if(ismethod_decl(current()))
        {
            parse_methoddecl(pAst);
        }
        else if(current().gettokentype() == _EOF)
        {
            errors->newerror(UNEXPECTED_EOF, current());
            break;
        }
        else if (current().gettokentype() == RIGHTCURLY)
        {
            if((brackets-1) < 0)
            {
                errors->newerror(ILLEGAL_BRACKET_MISMATCH, current());
            }
            else
            {
                brackets--;

                // end of class block
                if(brackets == 0)
                {
                    pushback();
                    break;
                }
            }
        }
        else if(current().gettokentype() == LEFTCURLY)
            brackets++;
        else {
            if(!errors->newerror(GENERIC, current(), "expected method, class, or variable declaration"))
            {
                parse_all(pAst);
            }
            // parse secondary entities
        }

        remove_accesstypes();
    }

    if(brackets != 0)
        errors->newerror(GENERIC, current(), "expected `}` at end of class declaration");

    expect(RIGHTCURLY, "`}` at end of class declaration");
}

/**
 * Gets the current ast based on context of the program. If we are at the highest level,
 * the highests level ast is returned otherwise we get back a newly created ast branch in the tree
 * @param pAst
 * @return
 */
ast * parser::get_ast(ast *pAst, ast_types typ) {
    if(pAst == NULL)
    {
        tree->push_back(ast(NULL, typ));
        ast_cursor++;

        return ast_at(ast_cursor);
    }
    else {
        pAst->add_ast(ast(pAst, typ));

        return pAst->getsubast(pAst->getsubastcount() - 1);
    }
}

void parser::pushback() {
    _current = &(*std::next(toks->getentities()->begin(), cursor-1));
    cursor--;
}

void parser::parse_variabledecl(ast *pAst) {
    pAst = get_ast(pAst, ast_var_decl);

    for(token_entity &entity : *access_types)
    {
        pAst->add_entity(entity);
    }
    pushback();
    parse_type_identifier(pAst);
    expectidentifier(pAst);

    advance();
    if(isassiment_decl(current()))
    {
        pAst->add_entity(current());
        parse_value(pAst);
    }
    else
        pushback();

    if(!expect(SEMICOLON, "`;`"))
        return;

    cout << "parsed variable declaration" << endl;
}

bool parser::isassiment_decl(token_entity token) {
    return token.gettokentype() == ASSIGN && token.gettoken() == "=";
}

void parser::parse_value(ast *pAst) {
    pAst = get_ast(pAst, ast_value);

    errors->enable(_emcheck);
    if(parse_reference_pointer(pAst)) {
        errors->disable((void*)false);
        return;
    }
    else {
        errors->disable((void*)true);
        pushback();
    }

    if(peek(1).getid() == BOOLEAN_LITERAL || peek(1).getid() == CHAR_LITERAL
       || peek(1).getid() == NUMBER_LITERAL || peek(1).getid() == STRING_LITERAL)
    {
        advance();
        pAst->add_entity(current());
    }
    else {
        errors->newerror(GENERIC, current(), "expected identifier or literal");
    }
}

void parser::parse_methoddecl(ast *pAst) {
    pAst = get_ast(pAst, ast_method_inv);

    for(token_entity &entity : *access_types)
    {
        pAst->add_entity(entity);
    }
    pAst->add_entity(current());

    expectidentifier(pAst);

    parse_methodparams(pAst);

    parse_methodreturn_type(pAst);
    parse_methodblock(pAst);

}

void parser::parse_methodparams(ast* pAst) {
    pAst = get_ast(pAst, ast_method_params);

    expect(LEFTPAREN, pAst, "`(`");

    int brackets = 1, errs = 3;
    bool comma = false, first = true;

    while (!isend() && brackets > 0)
    {
        advance();
        if(current().getid() == IDENTIFIER)
        {
            if(!comma && !first)
                errors->newerror(GENERIC, current(), "expected `,`");
            else
                first = false;

            pushback();
            parse_type_identifier(pAst);
            if(!expectidentifier(pAst))
            {
                pushback();
            }

            comma = false;
        }
        else if(current().gettokentype() == COMMA)
        {
            pAst->add_entity(current());

            if(comma)
            {
                errors->newerror(GENERIC, current(), "expected identifier before `,`");
            }

            comma = true;
        }
        else if(current().gettokentype() == LEFTPAREN)
        {
            errors->newerror(UNEXPECTED_SYMBOL, current(), "`" + current().gettoken() + "`" + " expected params");
        }
        else if(current().gettokentype() == RIGHTPAREN)
        {
            if((brackets-1) < 0)
            {
                errors->newerror(UNEXPECTED_SYMBOL, current(), " `)`");
            }
            else
            {
                brackets--;

                // end of class block
                if(brackets == 0)
                {
                    pushback();
                    break;
                }
            }
        }
        else {
            errs -= errors->newerror(UNEXPECTED_SYMBOL, current(), "`" + current().gettoken() + "`" + " expected identifier");

            if(errs < 0)
                break;
        }

        remove_accesstypes();
    }


    if(comma)
        errors->newerror(GENERIC, current(), "expected identifier after `,`");

    if(brackets != 0)
        errors->newerror(GENERIC, current(), "expected `)` at end of method args");

    expect(RIGHTPAREN, pAst, "`)`");
    cout << "parsed method declaration" << endl;
}

void parser::parse_methodblock(ast *pAst) {
    expect(LEFTCURLY, "`{` after method declaration");
    pAst = get_ast(pAst, ast_block);
    ast *ref = pAst;

    int brackets = 1;

    while(!isend() && brackets > 0)
    {
        advance();
        if(isstatement_decl(current()))
        {
            parse_statement(pAst);
        }
        else if (current().gettokentype() == RIGHTCURLY)
        {
            pAst = pAst->getparent() == NULL ? ref : pAst->getparent();
            if((brackets-1) < 0)
            {
                errors->newerror(ILLEGAL_BRACKET_MISMATCH, current());
            }
            else
            {
                brackets--;

                // end of method block
                if(brackets == 0)
                {
                    pushback();
                    break;
                }
            }
        }
        else if(current().gettokentype() == LEFTCURLY)
        {
            pAst = get_ast(pAst, ast_block);
            brackets++;
        }
        else if(current().gettokentype() == _EOF)
        {
            errors->newerror(UNEXPECTED_EOF, current());
            break;
        }
        else {
            errors->newerror(UNEXPECTED_SYMBOL, current(), " expected statement");
        }

        remove_accesstypes();
    }

    if(brackets != 0)
        errors->newerror(GENERIC, current(), "expected `}` at end of method declaration");

    expect(RIGHTCURLY, "`}` at end of method declaration");
}

void parser::parse_methodreturn_type(ast *pAst) {
    if(peek(1).gettokentype() == COLON)
    {
        pAst = get_ast(pAst, ast_method_return_type);
        advance();

        pAst->add_entity(current());
        parse_type_identifier(pAst);
    }
}

void parser::parse_returnstmnt(ast *pAst) {
    pAst = get_ast(pAst, ast_return_stmnt);

    pAst->add_entity(current());
    parse_value(pAst);
}


void parser::parse_statement(ast* pAst) {
    pAst = get_ast(pAst, ast_statement);

    if(isreturn_stmnt(current()))
    {
        parse_returnstmnt(pAst);
    }
    else if(isvariable_decl(current()))
    {
        parse_variabledecl(pAst);
    }
    else if(current().gettokentype() == SEMICOLON)
    {
        /* we don't care about empty statements but we allow them */
        advance();
    }
}

void parser::parse_modulename(ast* pAst)
{
    pAst = get_ast(pAst, ast_modulename);

    expectidentifier(pAst);

    advance();
    while(current().gettokentype() == DOT) {
        pAst->add_entity(current());

        expectidentifier(pAst);
        advance();
    }

    pushback();
}

/**
 * This function is used to parse through every possible outcome that the parser can run into when it does not find a class or import
 * statement to process. This alleviates your console getting flooded with a bunch of unnessicary "unexpected symbol" complaints.
 *
 */
void parser::parse_all(ast *pAst) {

    if(isaccess_decl(current()))
    {
        parse_accesstypes();
    }

    if(isstatement_decl(current()))
    {
        parse_statement(pAst);
    }
    else if(ismethod_decl(current()))
    {
        parse_methoddecl(pAst);
    }
}


bool parser::iskeyword(string key) {
    return key == "mod" || key == "true"
           || key == "false" || key == "class"
           || key == "int" || key == "short"
           || key == "long" || key == "char"
           || key == "bool" || key == "float"
           || key == "double" || key == "static"
           || key == "protected" || key == "private"
           || key == "function" || key == "import"
           || key == "return" || key == "this"
           || key == "const" || key == "override"
           || key == "public";
}

void parser::parse_type_identifier(ast *pAst) {
    pAst = get_ast(pAst, ast_type_identifier);
    advance();

    if(!isnative_type(current().gettoken())){
        pushback();
    }
    else {
        pAst->add_entity(current());
        return;
    }

    errors->enable(_emcheck);
    if(!parse_reference_pointer(pAst)){}
    else {

        errors->disable((void*)true);
        return;
    }

    errors->disable((void*)true);
    errors->newerror(GENERIC, current(), "expected native type or reference pointer.");
}

bool parser::parse_reference_pointer(ast *pAst) {
    pAst = get_ast(pAst, ast_refrence_pointer);

    advance();
    if(!(current().getid() == IDENTIFIER && !iskeyword(current().gettoken())))
        return false;
    else
        pushback();
    parse_modulename(pAst);

    /*
     * We want the full name to be on the ast
     */
    token_entity e;
    for(int64_t i = 0; i <  pAst->getsubast(0)->getentitycount(); i++)
    {
        pAst->add_entity(pAst->getsubast(0)->getentity(i));
    }

    pAst->freesubs();

    advance();
    if(current().gettokentype() == HASH) {
        pAst->add_entity(current());

        if(expectidentifier(pAst))
            advance();

        while(current().gettokentype() == DOT) {
            pAst->add_entity(current());

            expectidentifier(pAst);
            advance();
        }

        pushback();
    }
    else
        pushback();

    return true;
}

void parser::free() {
    this->cursor = 0;
    this->toks = NULL;

    if(this->tree != NULL) {
        /*
         * free ast tree
         */
        ast* pAst;
        for(int64_t i = 0; i < this->tree->size(); i++)
        {
            pAst = &(*std::next(this->tree->begin(),
                                i));
            pAst->free();
        }

        ast_cursor = 0;
        remove_accesstypes();
        this->tree->clear();
        std::free(this->tree); this->tree = NULL;
        std::free(this->_current); this->_current = NULL;
        std::free(this->access_types); this->access_types = NULL;
        errors->free();
    }
}