//
// Created by BraxtonN on 10/22/2019.
//

#include "Field.h"
#include "../Compiler.h"
#include "ClassObject.h"
#include "Method.h"
#include "../Expression.h"

void Field::free() {
    release();
    if(utype)
    {
        utype->free();
        delete utype;
    }

    if(dvExpression)
    {
        dvExpression->free();
        delete dvExpression;
    }
}

bool Field::equals(Field &f) {
    if(f.type == this->type && f.isArray == this->isArray) {
        if(type == CLASS)
            return (utype != NULL && f.utype != NULL && utype->getType() == f.utype->getType() &&
                    ((ClassObject*)utype->getResolvedType())->match((ClassObject*)f.utype->getResolvedType()));
        else {
            if(type==FNPTR) {
                return utype != NULL && f.utype != NULL && utype->getType() == f.utype->getType() &&
                       Compiler::simpleParameterMatch(((Method*)this->utype->getResolvedType())->params,
                                                      ((Method*)f.utype->getResolvedType())->params);
            }
            return true;
        }
    }
    return false;
}

bool Field::isEnum() {
    return utype && utype->getType() == utype_class
            && IS_CLASS_ENUM(((ClassObject*)utype->getResolvedType())->getClassType());
}

string Field::toString() {
    stringstream ss;
    if(fullName != "")
        ss << fullName << ": ";
    if(type == UNTYPED)
        ss << "<untyped>";
    else if(utype)
        ss << utype->toString();
    else
        ss << "?";
    return ss.str();
}

bool Field::isRelated(Field &f) {
    if(type == CLASS) {
        if(f.type == CLASS)
            return ((ClassObject*)f.utype->getResolvedType())->isClassRelated((ClassObject*)utype->getResolvedType());
    } else if(type == OBJECT) {
        if(f.type == CLASS || f.type == OBJECT)
            return true;
    }  else if(type == VAR) {
        if(f.type >= _INT8 && f.type <= VAR)
            return true;
    } else if(type == FNPTR) {
        if(f.type == FNPTR) {
            return Compiler::simpleParameterMatch(((Method*)this->utype->getResolvedType())->params,
                                           ((Method*)f.utype->getResolvedType())->params);
        }
    } else if(type >= _INT8 && type <= _UINT64) {
        if(f.type >= _INT8 && f.type <= VAR)
            return true;
    }
    return false;
}