Personal AppArmor profiles
============================
-------------------------------------------------------------------------------
This repository houses a collection of the custom AppArmor profiles I
personally use to sandbox applications. I put them online primarily so I could
easily fetch them from any machine, but feel free to use them yourself, as
everything here is released under the MIT license. 

Notes
-----

- Profile names match the target executable's binary name
- No profiles provided by the "apparmor" package are included
- All profiles were tested on Arch/Artix Linux machines running the
linux-hardened kernel. They might also work on other distros, but no guarantees
- Programs which don't require internet access to fulfill their primary
function, e.g. photo managers, have their internet access blocked by default.

Limitations
-----------

- Only default paths are specified within the profiles. Some applications allow the user
to specify custom paths to search/downloads files from/to. Since these paths
can be arbitrary, the profiles don't even attempt to cover them. If you use custom
paths, you must specify them manually.
- Most profiles have full read access to /usr/lib due to maintenance limitations.
Trying to map out and maintain what shared objects/libraries each program needs and
doesn't need is just asking to be thrown into dependency hell.
