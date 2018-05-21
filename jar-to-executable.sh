#!/bin/bash
# Core functions

## Print the usage. Takes no arguments.
usage() {
    echo "jar-to-executable.sh"
    echo "usage: "
    echo "jar-to-executable.sh <jar-file> <executable-output-file>"
    echo "Where jar-file is the filename of a jar file"
    echo "And executable-output-file is the filename name of the executable"
    echo "to be created."
    exit 1
}

## Create the executable file.
## Takes the filename of a jar file,
## the filename of header.sh,
## and the filename of the executable
## to be created
create_jar() {
    jar="$1"
    header="$2"
    output="$3"
    cat "$header" "$jar" > "$output"
}

# Naming the arguments to this program
## The name of the jar file
JAR="$1"

## The name of the output file
OUTPUT="$2"

# Sanity checks on the arguments
## Test that there are both jar files and output files
## as arguments
if [ "x$JAR" = "x" ] || [ "x$OUTPUT" = "x" ]
then
    usage
fi

## Test that --help or -h has not been passed to this program
if [ "$1" = "-h" ] || [ "$1" = "--help" ]
then
    usage
fi


## Name the filename of the header.sh file
## The name of the directory
## that this file is in
TOPLEVEL_DIR="$(dirname 0)"

## The name of header.sh
HEADER="$TOPLEVEL_DIR/header.sh"

## Create the file
create_jar "$JAR" "$HEADER" "$OUTPUT"

## Set the file to executable
chmod +x "$OUTPUT"
