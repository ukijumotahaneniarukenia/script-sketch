#!/bin/bash

echo こんなことができるよーん | grep -o '.\{,5\}'

[sqlite💟ceacf3fb0808 (金 11月 15 23:24:15) ~/script_scratch/sed]$echo 0123456789abcdef | grep -o '.\{4\}'
0123
4567
89ab
cdef

