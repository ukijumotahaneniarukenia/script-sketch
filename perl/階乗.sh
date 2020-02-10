#!/bin/bash

seq 10 | xargs -I@ perl -e 'print @**2,"\n"'
