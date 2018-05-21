#!/bin/bash
## Understanding this file

### Variable names
#### $0
# $0 is the filename of this program.
# It comes from argv, where the first
# part of argv is the filename
# of the process being called.

#### $?
# $? is the return status of the last
# call.

### External programs
#### which
# To understand which, one first has to understand
# $PATH. When you enter a command in bash,
# bash looks in all the paths in $PATH to find
# the program that you asked for.
# The program which undoes this by
# finding the complete path of the program,
# and returning it.

#### exec
# exec replaces the current program
# with the program in its argument.

### Code

# Using the which program,
# set MYSELF to the full path of the program
MYSELF=`which "$0" 2>/dev/null`
# When the above step fails,
# and if $0 is a file,
# set MYSELF to ./ appended to $0
[ $? -gt 0 -a -f "$0" ] && MYSELF="./$0"
# Re-execute the current program
# with java -jar
exec java -jar $MYSELF "$@"
# If the above step fails, exit with
# the above step's exit status
exit $?
# The rest of the file will be a binary (a jar).
# the command java -jar will skip to the
# following portion of the file.
