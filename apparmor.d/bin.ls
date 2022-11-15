# vim:syntax=apparmor
##-----------------------------------------------------------------------------
## AppArmor profile for the "ls" GNU coreutil
## Tested with coreutils 9.1-1 on Artix Linux
##             coreutils 8.32-4.1ubuntu1 on Ubuntu 22.04
## Profile author: EarthlySkies <earthlyskies@protonmail.ch>
## Profile license: MIT license
## Target program: https://gnu.org/software/coreutils/ls
##-----------------------------------------------------------------------------

abi <abi/3.0>,

include <tunables/global>

profile ls /{,usr/}{bin,sbin}/ls {

  # Basic operating necessities
  include <abstractions/base>
  include <abstractions/consoles>
  include <abstractions/nameservice>

       capability dac_read_search,
  deny capability dac_override,

  /{,usr/}bin/ls mr,

  # Allow to read only directory contents
  / r,
  /**/ r,

  # Site-specific additions and overrides. See local/README for details
  include if exists <local/bin.ls>

}
