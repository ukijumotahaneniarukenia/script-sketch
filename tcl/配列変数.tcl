#!/usr/bin/tclsh

#https://wiki.tcl-lang.org/page/upvar

# print elements of an array
proc show_array arrayName {
    upvar $arrayName myArray

    foreach element [array names myArray] {
       puts stdout "${arrayName}($element) = $myArray($element)"
    }
}

proc main {} {
    set arval(0) zero
    set arval(1) one
    show_array arval
  }

main
