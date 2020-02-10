#!/bin/bash

seq 10 | xargs -I@ printf "%s\n%s%s\n" @ @@ | xargs -n2
