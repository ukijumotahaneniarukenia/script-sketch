#!/bin/bash

echo -e '\U1f4a'{0..9} | xargs -I@ bash -c '
jshell -s <(cat <<EOS
import javax.swing.*;
var f = new javax.swing.JFrame("💩");
var textarea = new JTextArea();
textarea.append("@")
f.add("East",textarea);
f.setSize(400,300);
f.show();
Thread.sleep(10000); 
/exit
EOS
)
'
