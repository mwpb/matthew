#!/usr/bin/env bash
# sudo apt install cmark wkhtmltopdf

RUN_DIR=$PWD
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd "$SCRIPT_DIR" || return

rm matthew-burke.html
cat pre.html >> matthew-burke.html
cmark matthew-burke.md >> matthew-burke.html
cat post.html >> matthew-burke.html

wkhtmltopdf matthew-burke.html matthew-burke.pdf

cd "$RUN_DIR" || return