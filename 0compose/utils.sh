#!/bin/bash

#
#Set Colors
#

bold=$(tput bold)
underline=$(tput sgr 0 1)
reset=$(tput sgr0)

purple=$(tput setaf 171)
red=$(tput setaf 1)
green=$(tput setaf 76)
tan=$(tput setaf 3)
blue=$(tput setaf 38)

#
# Headers and  Logging
#

e_header() { printf "\n${bold}${purple}==========  %s  ==========${reset}\n" "$@"
}
e_arrow() { printf "➜ $@\n"
}
e_success() { printf "${green}✔ %s${reset}\n" "$@"
}
e_error() { printf "${red}✖ %s${reset}\n" "$@"
}
e_warning() { printf "${tan}➜ %s${reset}\n" "$@"
}
e_underline() { printf "${underline}${bold}%s${reset}\n" "$@"
}
e_bold() { printf "${bold}%s${reset}\n" "$@"
}
e_note() { printf "${underline}${bold}${blue}Note:${reset}  ${blue}%s${reset}\n" "$@"
}

#
# Test whether a command exists
# $1 = cmd to test
# Usage:
# if type_exists 'git'; then
#   some action
# else
#   some other action
# fi
#
type_exists() {
if [ $(type -P $1) ]; then
  return 0
fi
return 1
}

#
# Test which OS the user runs
# $1 = OS to test
# Usage: if is_os 'darwin'; then
#
is_os() {
if [[ "${OSTYPE}" == $1* ]]; then
  return 0
fi
return 1
}

#
# My helpers function
#

