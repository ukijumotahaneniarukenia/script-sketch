#!/usr/bin/tclsh

proc lshift {listVar {cnt 1}} {
  upvar 1 $listVar l
  puts $cnt
  puts $listVar
  puts $l
  #set r [lrange $l 0 [incr cnt -1]]
  #set l [lreplace $l [set l 0] $cnt]
  #return $r
}

lshift {1 2 3}
