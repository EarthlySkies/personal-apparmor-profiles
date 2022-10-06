# vim:syntax=apparmor
##-----------------------------------------------------------------------------
## AppArmor profile for the "ls" GNU coreutil
## Tested with coreutils 9.1-1 on Artix Linux
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

  # As a coreutil, we might read data from anywhere on the system
  /** r,

  # Site-specific additions and overrides. See local/README for details
  include if exists <local/bin.ls>

}
