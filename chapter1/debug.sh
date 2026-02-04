#!/usr/bin/env bash

n=0

if [ -f /tmp/bug_output.txt ]; then
    rm /tmp/bug_output.txt
fi

if [ -f /tmp/bug_error.txt ]; then
    rm /tmp/bug_error.txt
fi

run_shell() {
    n=$(( n + 1 ))
    sh ./bug.sh 1>> /tmp/bug_output.txt 2>> /tmp/bug_error.txt
    if [ $? -eq 0 ]; then
        run_shell
    else
        echo "bug.sh exited with an error at Counter: $n"
        echo "Standard Output:"
        cat /tmp/bug_output.txt
        echo "Standard Error:"
        cat /tmp/bug_error.txt
    fi
}

run_shell
