# Personal Bubblewrap profiles
This repository houses a collection of the Bubblewrap profiles I personally use
to sandbox applications. I put them online primarily so I could easily fetch them
from any machine, but feel free to use them yourself. Everything is released under
the MIT license. The profile names are the same as their applications binary names.

# Notes
- All profiles were tested on Arch/Artix Linux machines running the linux-hardened
kernel. They should work on other distros, but there won't be any guarantees!
- To call the sandboxed version of the application before the regular one, the profiles
should be placed somewhere like /usr/local/bin or some other directory that is earlier
in your $PATH than /usr/bin
- Some desktop entries use an absolute path to launch their applications. They need to
be manually modified to use the sandboxed version instead.
- Most profiles try to automatically set the Dark Theme on the application
- Programs which don't require internet access to fulfill their primary function,
e.g. photo managers, have their internet access blocked by default. If internet access
is still required, just add the "--share-net" option after the "--unshare-all"
option on the profile.

### Requirements
- The GNU Coreutils should be installed on the system since some profiles need them.
- If the sysctl value of "kernel.unprivileged_userns_clone" is set to 0, Bubblewrap
needs to be installed as its SUID variant to work properly.

## Limitations
- Only default paths are specified within the profiles. Some applications allow the user
to specify custom paths to search/downloads files from/to. Since these paths
can be arbitrary, the profiles don't even attempt to cover them. If you use custom
paths, you must specify them manually.
- Most profiles have full read access to /usr/lib due to maintenance limitations.
Trying to map out and maintain what shared objects/libraries each program needs and
doesn't need is just asking to be thrown into dependency hell.
- The profiles only accommodate setups with up to 3 monitors. If you have more
monitors than that, you'll have to manually add the Wayland socket binds from your
XDG runtime dir to the new runtime dir.
- Most profiles detatch from the terminal they were called from and thus don't accept
direct keyboard control. This is due to the --new-session option to cover a security
issue. If direct cmdline keyboard control is necessary, just remove the line from
the profile.
- The profiles (or Bubblewrap itself) cannot guarantee security on a compromised
machine. They are designed to keep an attacker in a sandbox, not out of it.
- The profiles also cannot isolate communication weakpoints such as X11 or DBus, since
they carry data in/out of the sandbox. They need to be secured in other ways, such as
using Wayland and tightening the DBus security policy.
- Bubblewrap is not a silver bullet for security. Running untrusted code is never
safe and sandboxing cannot change this.
