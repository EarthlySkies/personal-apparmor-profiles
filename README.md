Personal AppArmor profiles
============================

This repository houses a collection of the custom AppArmor profiles I
personally use to sandbox applications. I put them online primarily so I could
easily fetch them from any machine, but feel free to use them yourself, as
everything here is released under the MIT license. 

Notes
-----

### Internet access is not guaranteed

Some applications have the ability extend their capabilities by fetching
additional data from the internet. Most profiles disable such functionality.
In general, unless internet access is needed to fulfill the primary function
of a program, it will be completely disabled.

### Only default paths are supported

Many applications allow the user to specify custom paths for file storage and
search. Trying to account for all possibilities would only result in not being
able to confine an applications access to personal files at all. As such,
custom paths are simply not supported any further than perhaps with variables
in some profiles.

### Static path to resolv.conf is expected

Profiles that need internet access assume that the system's resolv.conf can be
found under `/etc/resolv.conf` and that it's not a symlink to another file. If
it is, users need to modify the profiles by hand to match their system's
configuration.

### Naming scheme

Basic utilities, such as coreutils, findutils, diffutils and binutils have
their filenames as `bin.*`. General user applications have their name as
`usr.bin.*` The actual profile names defined inside the files always match the
binary executable's name they are designed for.

### AppArmor package profiles

To avoid duplicates, no profiles provided by Arch's "apparmor" package
can be found in the repository. This way the custom profiles can be easily
integrated into a system without interfering with the package. See the profile
list of the package [here](https://archlinux.org/packages/extra/x86_64/apparmor/).
