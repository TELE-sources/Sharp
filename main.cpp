#include <iostream>
#include "stdimports.h"

#ifdef MAKE_COMPILER
#include "lib/grammar/runtime.h"
#include "lib/runtime/interp/Opcode.h"

#else
#include "lib/runtime/startup.h"
#include "lib/util/file.h"
#include "lib/runtime/internal/Exe.h"
#include "lib/runtime/interp/Opcode.h"
#include "lib/runtime/interp/register.h"
#include "lib/runtime/oo/Object.h"
#include "lib/util/time.h"
#endif

Sharp versions;

int main(int argc, const char* argv[]) {

#ifndef MAKE_COMPILER
    uint64_t past=realTimeInUSecs(),now;
    for(long i = 0; i < 10000000; i++) {
        realTimeInUSecs();
    }

    now=realTimeInUSecs();
    cout << "time " << now-past << " epoch " << (realTimeInUSecs()/1000000L) << endl;
    runtimeStart( argc, argv );
#else
    _bootstrap( argc, argv );
#endif
    cout << " program exiting..." << endl;
    return 0;
}