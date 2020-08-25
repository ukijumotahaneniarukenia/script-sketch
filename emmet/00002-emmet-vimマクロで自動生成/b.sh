#!/usr/bin/env bash
vim -c "so QH014-001-emmet-html-snippet-macro.vim" -c ":norm @q" -c ':wq! a' && cat a && rm a
