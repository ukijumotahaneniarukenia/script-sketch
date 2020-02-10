#!/bin/bash

seq 40 | xargs -I@ dc -e'10i@dpd2opd8opd16op' | xargs -n 4 | keta
