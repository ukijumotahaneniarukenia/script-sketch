#!/bin/bash

seq 123 345 | awk -F '' '/^[1-5]+$/&&$1<$2&&$2<$3'
