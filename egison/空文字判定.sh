#!/bin/bash

egison -e '
(match {} (list integer)
{[<nil> #t]
   [_ #f]});'
