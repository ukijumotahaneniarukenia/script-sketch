#!/bin/bash

cd $HOME/script-sketch/java/lib

ls sqlite-jdbc-3.30.1.jar || curl -LO https://bitbucket.org/xerial/sqlite-jdbc/downloads/sqlite-jdbc-3.30.1.jar
ls sqlite-jdbc-3.30.1.jar && :
