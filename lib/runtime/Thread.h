//
// Created by BraxtonN on 2/12/2018.
//

#ifndef SHARP_THREAD_H
#define SHARP_THREAD_H

#include "../../stdimports.h"
#include "Mutex.h"
#include "oo/ClassObject.h"
#include "oo/Exception.h"
#include "oo/Method.h"

#define MAX_THREADS 0xffba

#define STACK_SIZE 0xcfba

enum ThreadState {
    THREAD_CREATED      =0x000,
    THREAD_RUNNING      =0x001,
    THREAD_SUSPENDED    =0x002,
    THREAD_KILLED       =0x003
};

class Thread {
    Thread()
            :
            id(-1),
            mutex(),
            daemon(false),
            state(THREAD_KILLED),
            suspended(false),
            name(""),
            main(NULL),
            exitVal(1),
            suspendPending(false),
            exceptionThrown(false),
            throwable(),
            callStack(),
            dataStack(NULL)

    {

#ifdef WIN32_
        thread = NULL;
#endif
    }

    static void Startup();
    static void suspendSelf();
    static int start(int32_t);
    static int destroy(int64_t);
    static int interrupt(int32_t);
    static int join(int32_t);
    static Thread* getThread(int32_t);
    static void waitForThreadSuspend(Thread* thread);
    static void waitForThreadExit(Thread* thread);
    static int waitForThread(Thread *thread);
    static void killAll();
    static void shutdown();

    static int startDaemon(
#ifdef WIN32_
            DWORD WINAPI
#endif
#ifdef POSIX_
    void*
#endif
    (*threadFunc)(void*), Thread* thread);


    static int32_t Create(int32_t, unsigned long);
    void Create(string);
    void CreateDaemon(string);
    void exit();

    static int32_t tid;
    static List<Thread*> threads;
    static Mutex threadsMonitor;

    int32_t id;
    Mutex mutex;
    bool daemon;
    unsigned int state;
    bool suspended;
    bool exited;
    native_string name;
    Method *main;
    int exitVal;
    bool suspendPending;
    bool exceptionThrown;

    uint64_t pc;
    Method *current;
    List<Frame> callStack;
    StackElement* dataStack;
    unsigned long stack_lmt;
    Cache cache;
    Throwable throwable;
#ifdef WIN32_
    HANDLE thread;
#endif
#ifdef POSIX_
    pthread_t thread;
#endif

    void term();

    static void suspendAllThreads();

    static void resumeAllThreads();

    void run();

private:
    void executeMethod(int64_t id);
    int returnMethod();

    void wait();

    static int threadjoin(Thread*);
    static int unsuspendThread(Thread*);
    static void suspendThread(Thread*);
    static int interrupt(Thread*);

    static void pushThread(Thread *thread);
    static void popThread(Thread *thread);

    bool TryThrow(sh_asp* asp, Object* exceptionObject);
    void Throw(Object *exceptionObject);

    void fillStackTrace(Object *exceptionObject);

    void fillStackTrace(native_string &str);

    string getPrettyErrorLine(long line, long sourceFile);
};

extern thread_local Thread* thread_self;
extern thread_local double registers[12];

#define main_threadid 0x0

#endif //SHARP_THREAD_H
