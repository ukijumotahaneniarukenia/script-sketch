#!/bin/bash

#echo -e '\U1f4a'{0..9} | xargs -I@ bash -c '
#jshell -s <(cat <<EOS
#import javax.swing.*;
#var f = new javax.swing.JFrame("💩");
#var textarea = new JTextArea();
#textarea.append("@")
#f.add(textarea);
#f.setSize(400,301);
#f.show();
#Thread.sleep(10000); 
#/exit
#EOS
#)
#'

echo -e '\U1f4a'{0..9} | xargs -I@ bash -c '
jshell -s <(cat <<EOS
import javax.swing.*;
var f = new javax.swing.JFrame("💩");
var t = new JTextArea();
t.append("@")
f.add(t);
f.setSize(400,301);
f.show();
Thread.sleep(5000); 
EOS
)
'
#/exit
