#!/bin/bash
seq 123 456 | awk -vFS='' '{print $0,$1,$2,$3}'	 | head
