#!/usr/bin/env bash

ls | grep -Po '[0-9]{5}' | tail -n1 | xargs -I@ bash -c 'printf "%05d\n" $((@+1))' | xargs -I@ printf "%s-%s-\n" @ $(pwd|perl -pe 's;.*/;;')
