#!/bin/bash

cd $HOME/script-sketch/java/lib

ls sqlite-jdbc-3.30.1.jar || curl -LO https://bitbucket.org/xerial/sqlite-jdbc/downloads/sqlite-jdbc-3.30.1.jar
ls sqlite-jdbc-3.30.1.jar && :


ls htmlcleaner-2.23.jar || curl -LO https://sourceforge.net/projects/htmlcleaner/files/htmlcleaner/htmlcleaner%20v2.23/htmlcleaner-2.23.zip && unzip htmlcleaner-2.23.zip
ls htmlcleaner-2.23.jar && :
