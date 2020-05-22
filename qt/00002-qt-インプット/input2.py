# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'input.ui'
#
# Created by: PyQt5 UI code generator 5.12.3
#
# WARNING! All changes made in this file will be lost!


from PyQt5 import QtCore, QtGui, QtWidgets


class Ui_Form(object):
    def setupUi(self, Form):

        Form.setObjectName("Form")
        Form.resize(640, 480)

        self.plainTextEdit = QtWidgets.QPlainTextEdit(Form)
        self.plainTextEdit.setGeometry(QtCore.QRect(110, 60, 241, 31))
        self.plainTextEdit.setObjectName("plainTextEdit")

        self.pushButton = QtWidgets.QPushButton(Form)
        self.pushButton.setGeometry(QtCore.QRect(440, 70, 80, 25))
        self.pushButton.setObjectName("pushButton")

        self.listWidget = QtWidgets.QListWidget(Form)
        self.listWidget.setGeometry(QtCore.QRect(190, 170, 256, 192))
        self.listWidget.setObjectName("listWidget")





        item = QtWidgets.QListWidgetItem()
        self.listWidget.addItem(item)
        item = QtWidgets.QListWidgetItem()
        self.listWidget.addItem(item)
        item = QtWidgets.QListWidgetItem()
        self.listWidget.addItem(item)
        item = QtWidgets.QListWidgetItem()
        self.listWidget.addItem(item)





        self.label = QtWidgets.QLabel(Form)
        self.label.setGeometry(QtCore.QRect(280, 140, 59, 17))
        self.label.setObjectName("label")

        QtCore.QMetaObject.connectSlotsByName(Form)

    def reSetupUi(self,Form,QStringListModel):

        print("reSetUpUi... View2ModelData")
        if 0==len(QStringListModel.stringList()):
            pass
        else:
            item = QtWidgets.QListWidgetItem()
            self.listWidget.addItem(item)


    def retranslateUi(self, Form,QStringListModel):

        _translate = QtCore.QCoreApplication.translate
        Form.setWindowTitle(_translate("Form", "Form"))
        self.pushButton.setText(_translate("Form", "検索"))
        __sortingEnabled = self.listWidget.isSortingEnabled()
        self.listWidget.setSortingEnabled(False)

        print("retranslateUi... View2ModelData")
        if 0==len(QStringListModel.stringList()):
            pass
        else:
           mx = len(self.listWidget)
           ele=QStringListModel.stringList()[-1]
           item = self.listWidget.item(mx-1)
           item.setText(_translate("Form", ele))

        item = self.listWidget.item(0)
        item.setText(_translate("Form", "うんこ"))
        item = self.listWidget.item(1)
        item.setText(_translate("Form", "森子"))
        item = self.listWidget.item(2)
        item.setText(_translate("Form", "森鴎外"))
        item = self.listWidget.item(3)
        item.setText(_translate("Form", "アンドロメダ"))

        self.listWidget.setSortingEnabled(__sortingEnabled)
        self.label.setText(_translate("Form", "検索結果"))
