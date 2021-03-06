# Change List
This file contains all the various changes made to sharp. 
For each stable build of sharp pushed to master there will be a corresponding version.

Backwards Compatibility:
For backwards compatibility support only the version posted below each release is the gaurnteed supported version and beyond,
any other version below that is considered deprecated and no longer supported. Backwards compatibility is only in reference
to the ability to interchange the runtime system and the compiler between versions; meaning if the compiler of the new version is buggy you can use the compiler
from the older version with the updated runtime system and vise versa. Any other compatibilty issues/changes will be otherwise noted in the release notes specifially.

##### Version 0.2.422 (August 12, 2019)
    # Bug Fixes
        *

    # QoL Improvements
        *

    # New Additions & Updates
        *

    # Known Issues
        *

    # Comments
        *
        
    Backwards compatibility support tested Version: ()

##### Version 0.2.422 (August 15, 2019)
    # Bug Fixes
        * Added a check to prevent native variables from being assigned objects values i.e { object o =  new Object(); var i = o; }
        * Fixed holes and edge cases in Template classes and sub template classes
        * Standard Library Thread files were incorrectly starting and creating threads
        * Various other small fixes

    # QoL Improvements
        * Changed publishing procedure to a more detailed breakdown of the changes made for better insights on the language's progress
          as well as backwards compatibility support will now be implemented
        * Debug mode is not disabled by default as its intended for developer mode anyway

    # New Additions & Updates
        * "thread_local" & "local" attributes added to language
        * Updated multithreadng interface frontend and backend to utilize thread locals
        * JIT Compiler first pass added to significantly increase performance
            - x86/64 & ARM will be the only systems supported for a while
        * Internal stack size can now be set on the runtime engine to allow of bigger or smaller stack space in "interpreted" mode
        * Renamed the sharp profiler to "tanto" a tpe of knife used for cutting

    # Known Issues
        * JIT compiler is very buggy therefore it is disabled for now
        * Templates inside of classes currently do not work

    # Comments
        * I will now pick back up the project to continue development and make it better than the language has ever been

    Backwards compatibility support tested Version: (0.2.422+)

##### Version 0.2.372 (August 6, 2018)
* Added dynamic threshold updating in GC
* More bug fixes and improvements
* Added sharp speed profiler
* Began support for gui processing

##### Version 0.2.343 (July 13, 2018)

- All objects now inherit Std#Object class to allow for baseline support
for basic operators used in std#Dictionary<>
* Major performance improvements to overall language
    - Anti-lag system implemented to GC to minimize pausing of threads during allocation
    - Added various optimizations to the garbage collector that prevent the thread from slowing down your program by a factor of 10+ 
    - Calling function using preallocated list instead of calling malloc() and free()
* Major bug fixes to system causing silent (SEGV) Seg faults
* Compiler in Sharp began
* Global variables and methods added
* Threading support added