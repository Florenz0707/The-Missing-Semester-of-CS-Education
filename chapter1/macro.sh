#!/usr/bin/env bash

macro() {
    echo "This is a macro function"
    echo "Now at location: $PWD"
    pwd > /tmp/macro_path.txt
}

polo() {
    echo "This is a polo function"
    echo "Now at location: $PWD"
    cd "$(cat /tmp/macro_path.txt)"
    echo "Returned to location: $PWD"
}

macro
cd ../../..
polo
