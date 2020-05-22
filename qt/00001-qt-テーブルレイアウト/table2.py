# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'table.ui'
#
# Created by: PyQt5 UI code generator 5.12.3
#
# WARNING! All changes made in this file will be lost!


from PyQt5 import QtCore, QtGui, QtWidgets

import sqlite3
import sys
import os

def setUpUiData(args):
    rt=[];
    tgt_db='testdb'
    script_filepath='test.sql'
    conn=sqlite3.connect(tgt_db)
    with open(script_filepath) as f:
      sql_txt=f.read()
    row_cnt=len(conn.execute(sql_txt).fetchall())
    for i,row in enumerate(conn.execute(sql_txt).fetchall()):
      for j,dat in enumerate(row):
        rt.append([i,j,dat])
    conn.close()
    return rt

def retranslateUiData(args):
    rt=[];
    tgt_db='testdb'
    conn=sqlite3.connect(tgt_db)
    for key,items in enumerate(conn.execute('select name from PRAGMA_table_info(\'test_tbl\')').fetchall()):
        rt.append([key,items[0]])
    conn.close()
    return rt

#たぶんいける
class Ui_Form(object):

    def setupUi(self, Form):
        widgetName="Form"

        rt=setUpUiData('')

        mn_row=min(rt)[0]
        mn_col=min(rt)[1]
        mx_row=max(rt)[0]
        mx_col=max(rt)[1]

        Form.setObjectName(widgetName)
        Form.resize(1280, 780)
        self.tableWidget = QtWidgets.QTableWidget(Form)
        self.tableWidget.setGeometry(QtCore.QRect(10, 10, 1260, 760))
        self.tableWidget.setObjectName("tableWidget")

        self.tableWidget.setColumnCount(mx_col+1)
        self.tableWidget.setRowCount(mx_row+1)

        for row in range(mn_row,mx_row+1):
          item_row = QtWidgets.QTableWidgetItem()
          self.tableWidget.setVerticalHeaderItem(row, item_row)

        for col in range(mn_col,mx_col+1):
          item_col = QtWidgets.QTableWidgetItem()
          self.tableWidget.setHorizontalHeaderItem(col, item_col)

        for row in range(mn_row,mx_row+1):
            for col in range(mn_col,mx_col+1):
              item_cell = QtWidgets.QTableWidgetItem()
              self.tableWidget.setItem(row, col, item_cell)

        self.tableWidget.horizontalHeader().setVisible(True)
        self.tableWidget.horizontalHeader().setCascadingSectionResizes(True)
        self.tableWidget.horizontalHeader().setHighlightSections(True)
        self.tableWidget.horizontalHeader().setMinimumSectionSize(10)
        self.tableWidget.horizontalHeader().setSortIndicatorShown(False)
        self.tableWidget.verticalHeader().setVisible(True)
        self.tableWidget.verticalHeader().setCascadingSectionResizes(False)

        self.retranslateUi(Form)
        QtCore.QMetaObject.connectSlotsByName(Form)

    def retranslateUi(self, Form):
        widgetName="Form"
        _translate = QtCore.QCoreApplication.translate
        Form.setWindowTitle(_translate(widgetName, widgetName))

        rt=setUpUiData('')
        mn_row=min(rt)[0]
        mn_col=min(rt)[1]
        mx_row=max(rt)[0]
        mx_col=max(rt)[1]

        rtColHeader=retranslateUiData('')

        for row in range(mn_row,mx_row+1):
          item_row = self.tableWidget.verticalHeaderItem(row)
          item_row.setText(_translate(widgetName, str(row+1)))

        for h in rtColHeader:
          item_header = self.tableWidget.horizontalHeaderItem(h[0])
          item_header.setText(_translate(widgetName, str(h[1])))

        __sortingEnabled = self.tableWidget.isSortingEnabled()
        self.tableWidget.setSortingEnabled(False)

        for e in rt:
          row=e[0]
          col=e[1]
          dat=e[2]
          item_data = self.tableWidget.item(row, col)
          item_data.setText(_translate(widgetName, str(dat)))

        self.tableWidget.setSortingEnabled(__sortingEnabled)
