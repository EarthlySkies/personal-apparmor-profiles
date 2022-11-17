# vim:syntax=apparmor
##-----------------------------------------------------------------------------
## AppArmor profile for the "ls" GNU coreutil
## Tested with: coreutils 9.1-3 on Arch Linux
##              coreutils 9.1-1 on Artix Linux
##              coreutils 8.32-4.1ubuntu1 on Ubuntu 22.04
## Profile authors: EarthlySkies <earthlyskies@protonmail.ch>
##                  nobody43 <https://github.com/nobody43>
## Profile license: the MIT license
## Target program : https://gnu.org/software/coreutils/ls
##-----------------------------------------------------------------------------

abi <abi/3.0>,

include <tunables/global>

profile ls /{,usr/}{bin,sbin}/ls {

  # Basic operating necessities
  include <abstractions/base>
  include <abstractions/nameservice>
  /{,usr/}{bin,sbin}/ls mr,

  # As a coreutil, we might read data from any directory on the system
  /{,**/} r,
       capability dac_read_search,
  deny capability dac_override,

  # Site-specific additions and overrides. See local/README for details.
  include if exists <local/bin.ls>

}
