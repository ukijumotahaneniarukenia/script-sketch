#!/bin/bash

echo $[{1..24}**2] | jq -s 'add|sqrt'
