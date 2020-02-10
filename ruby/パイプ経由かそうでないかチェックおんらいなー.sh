#!/bin/bash

ruby -e 'printf "STDIN %s\n", FileTest.pipe?(STDIN) ? "open" : "close"'



echo hello | ruby -e 'printf "STDIN %s\n", FileTest.pipe?(STDIN) ? "open" : "close"'
