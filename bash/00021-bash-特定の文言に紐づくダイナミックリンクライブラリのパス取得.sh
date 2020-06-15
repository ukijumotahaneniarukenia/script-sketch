#!/usr/bin/env bash


find / -type f 2>/dev/null | grep Android | grep emulator | grep -P '(\.so(\.[0-9]*)*)+$'
