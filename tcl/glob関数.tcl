#!/usr/bin/tclsh

set files [glob *.sh]

foreach file $files {
  puts $file
}
