#!/bin/bash

echo hello | perl -e 'printf "STDIN %s\n", -p STDIN ? "open" : "close";'

perl -e 'printf "STDIN %s\n", -p STDIN ? "open" : "close";'
