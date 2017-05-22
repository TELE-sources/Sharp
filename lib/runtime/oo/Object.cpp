//
// Created by BraxtonN on 2/17/2017.
//

#include "Object.h"
#include "../internal/Environment.h"
#include "ClassObject.h"
#include "../alloc/GC.h"
#include <stdio.h>
#include <cstring>

Sh_object::Sh_object() {
    this->mark = gc_orange;
    this->monitor = Monitor();
    this->HEAD = NULL;
    this->klass=NULL;
    _Node = NULL;
    refs.init();
}

Sh_object::Sh_object(int64_t type) {
    this->mark = gc_orange;
    this->klass=NULL;
    this->monitor = Monitor();
    this->HEAD = NULL;
    _Node = NULL;
    refs.init();
}

void Sh_object::free() {
    mark = gc_orange;
    if(HEAD != NULL)
        std::free(HEAD); HEAD = NULL;

    if(_Node != NULL) {
        for(int64_t i = 0; i < size; i++) {
            _Node[i].free();
        }
        std::free(_Node); _Node = NULL;
    }

    size=0;
    refs.free();
    klass=NULL;
}

void Sh_object::createnative(int64_t size) {
    if(mark != gc_green) {

        if(size == 0)
            HEAD = NULL;
        else
            HEAD= (double*)memalloc(sizeof(double)*size);
        this->size=size;
        klass=NULL;
        _Node=NULL, _rNode=NULL;
        mark = gc_green;

        for(int64_t i=0; i<size; i++){
            _nativewrite(i,0)
        }
    }
}

void Sh_object::inc_ref(Sh_object *ptr) {
    this->refs.addif(ptr);
    ptr->HEAD=HEAD;
    ptr->klass=klass;
    ptr->size=size;
    ptr->_Node=_Node;
    ptr->_rNode=this;
    ptr->mark = gc_green;
}

void Sh_object::createstr(int64_t ref) {
    nString str;
    str = env->getstring(ref);

    createstr(str);
}

void Sh_object::createclass(int64_t k) {
    ClassObject* klass = env->findClass(k);
    createclass(klass);
}

void Sh_object::createclass(ClassObject *klass) {
    if(mark == gc_green) {
        GC::_insert(this);
    }

    this->klass =klass;
    HEAD = NULL;
    _rNode =NULL;

    mark = gc_green;
    size =klass->fieldCount;
    if(size > 0)
        _Node =(Sh_object*)memalloc(sizeof(Sh_object) * size);
    else
        _Node = NULL;
    Environment::init(_Node, size);
}

void Sh_object::del_ref() {
    if(_Node != NULL) {
        _rNode->refs.remove(this);

        HEAD=NULL;
        klass=NULL;
        size=0;
        _Node=NULL;
        _rNode=NULL;
    }
}

/**
 * Objects cannot be coppied as they can be infinatley large,
 * they can only be mutated
 */
void Sh_object::mutate(Sh_object *object) {
    if(mark == gc_green) {
        GC::_insert(this);
    }

    std::memcpy(this, object, sizeof(Sh_object));

    if(object->_rNode != NULL) {
        object->_rNode->refs.replace(object, this);
    }
    object->refs.free();

    for(unsigned int i = 0; i < refs.size(); i++) {
        refs.get(i)->_rNode = this;
    }
    Sh_InvRef(object)
}

void SH_object::null() {
    if(mark == gc_green) {
        GC::_insert(this);
    }
}

void Sh_object::createstr(nString &str) {
    if(mark == gc_green) {
        GC::_insert(this);
    }

    if(str.len == 0)
        HEAD = NULL;
    else
        HEAD= (double*)memalloc(sizeof(double)*str.len);
    this->size=str.len;
    klass=NULL;
    _Node=NULL, _rNode=NULL;
    mark = gc_green;

    for(int64_t i=0; i<size; i++){
        _nativewrite(i,str.chars[i])
    }
}
