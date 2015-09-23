#!/bin/bash

# dockertest
#
# LICENSE:    MIT
#
# @project    dockertest
# @package    scripts
# @author     André Lademann <vergissberlin@googlemail.com>
# @license    http://opensource.org/licenses/MIT

# Colour definitions
red='\033[01;31m'
blue='\033[01;34m'
green='\033[01;32m'
yellow='\033[01;35m'
norm='\033[0m'
code='\033[40m'

# Styling definitions
bold_begin='\033[1m'
bold_end='\033[21m'


# Message
function messageError {
	echo -e "[ ${bold_begin}${red}error${norm}${bold_end} ]\t ${@:2}"
	exit $1;
}

function messageOk {
	echo -e "[ ${bold_begin}${green}ok${norm}${bold_end} ]\t\t$*"
}

function messageInfo {
	echo -e "[ ${bold_begin}${blue}info${norm}${bold_end} ]\t$*"
}

function messageCode {
	echo -e "[ ${yellow}code${norm} ]\t${code} $* ${norm}"
}
