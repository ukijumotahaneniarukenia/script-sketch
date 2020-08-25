#!/usr/bin/env bash

VIM_MACRO_FILE=QH014-001-emmet-html-snippet-macro.vim

vim -c "so $VIM_MACRO_FILE" -c ":norm @q" -c ':wq! a' && cat a && rm a
