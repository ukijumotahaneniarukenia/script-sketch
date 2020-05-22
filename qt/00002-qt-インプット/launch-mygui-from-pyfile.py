import sys

from PyQt5.QtCore import *

from PyQt5.QtWidgets import *

from input import Ui_Form

class Test(QDialog):
    def __init__(self,parent=None):

        super(Test, self).__init__(parent)

        self.ui = Ui_Form()

        # View2ModelBean作成
        self.model = QStringListModel()

        #イベントの設定までがひとくくり
        self.ui.setupUi(self)
        self.ui.retranslateUi(self,self.model)

        self.ui.pushButton.clicked.connect(self.setSearchCondition)

    def setSearchCondition(self):

        searchWord=self.ui.plainTextEdit.toPlainText()

        strList = self.model.stringList()

        strList.append(searchWord)

        self.model.setStringList(strList)

        print("viewSetData ...")
        print(searchWord)

        self.ui.reSetupUi(self,self.model)

        self.ui.retranslateUi(self,self.model)

        print("re rendering...")

if __name__ == '__main__':
    app = QApplication(sys.argv)
    window = Test()
    window.show()
    sys.exit(app.exec_())
