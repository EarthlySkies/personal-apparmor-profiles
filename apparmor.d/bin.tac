# vim:syntax=apparmor
##-----------------------------------------------------------------------------
## AppArmor profile for the "tac" GNU coreutil
## Tested with coreutils 9.1-1 on Artix Linux
##             coreutils 8.32-4.1ubuntu1 on Ubuntu 22.04
## Profile author: EarthlySkies <earthlyskies@protonmail.ch>
## Profile license: MIT license
## Target program: https://gnu.org/software/coreutils/tac
##-----------------------------------------------------------------------------

abi <abi/3.0>,

include <tunables/global>

profile tac /{,usr/}{bin,sbin}/tac {

  # Basic operating necessities
  include <abstractions/base>
  include <abstractions/consoles>

  # As a coreutil, we might read data from anywhere on the system
  /** r,

  # Site-specific additions and overrides. See local/README for details
  include if exists <local/bin.tac>

}
