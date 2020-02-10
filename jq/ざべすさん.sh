#!/bin/bash

seq "$@" | xargs -I@ bash -c 'seq @ | xargs -n@'
seq "$@" |tac | xargs -I@ bash -c 'seq @ | xargs -n@'
