#!/bin/bash

echo '[' {1..10}, | sed 's;,$;;;s;$;];'
