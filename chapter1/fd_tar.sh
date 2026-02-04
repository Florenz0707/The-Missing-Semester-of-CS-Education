#!/usr/bin/env bash

fd -t f -e html -0 . | xargs -0 tar -cvf html_files.tar
