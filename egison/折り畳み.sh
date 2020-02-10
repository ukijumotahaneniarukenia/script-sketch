#!/bin/bash
egison -e '
;;((lambda [$n $ns] {n @ns}) {} {1 2 3})
;;((lambda [$n $ns] {n ns}) {} {1 2 3})
(foldr (lambda [$n $ns] {n @ns}) {} {4 5 6})
'
