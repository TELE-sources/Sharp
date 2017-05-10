//
// Created by bknun on 1/6/2017.
//

#ifndef SHARP_TOKENIZER_H
#define SHARP_TOKENIZER_H

#include <list>
#include "../../../../stdimports.h"
#include "tokenentity.h"
#include "../parseerrors.h"
#include "../../../util/List2.h"

class tokenizer
{
public:
    tokenizer(string tokens, string file)
    :
            toks(tokens),
            cursor(0),
            col(0),
            line(1),
            file(file)
    {
        entites.init();
        lines = new list<string>();

        parse();
    }

    uint64_t getentitycount();
    List<token_entity>& getentities();
    Errors* geterrors();
    list<string>* getlines();

    string file;
    token_entity* EOF_token;
    void free();

    static bool iswhitespace(char c);

private:
    void parse();
    void parse_lines();
    char peek(int forward);
    bool isletter(char c);
    bool isnumber(char c);
    bool issymbol(char c);

    char advance();
    void newline();
    char current();
    bool isend();
    bool peekend(int forward);
    void scan();
    void invalidate_comments();
    void invalidate_whitespace();
    uint64_t  tokensLeft();

    void scan_identifier();
    void scan_symbol();
    void scan_number();
    bool ismatch(char i, char current);
    bool issign(char current);
    void scan_stringliteral();
    void scan_characterliteral();
    string get_escaped_string(string msg) const;

    List<token_entity> entites;
    Errors* errors;
    list<string> *lines;
    string toks;
public:
    const string &getData() const;

private:
    uint64_t cursor;

    int line;
    int col;

    void scan_hex();

    bool ishexnum(char current);
};

#endif //SHARP_TOKENIZER_H
