事前準備

Dockerfileにはこれが必須

```
ARG DEBIAN_FRONTEND=noninteractive
```

```
pip3 install --upgrade pip
```

結構出たので

```
404  Not Found [IP: 150.65.7.130 80]
```

以下のコマンド実行後

```
sed -i.bak -e 's/archive.ubuntu.com\|security.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list
```

アップデートし

```
apt-get update
```

再インストール


```
apt-get install -y qttools5-dev-tools qttools5-dev


apt-get install -y python3-qtpy pyqt5-dev pyqt5-dev-tools python3-pyqt5 libqt5widgets5 libqt5gui5 libqt5dbus5 libqt5network5 libqt5core5a


pip3 install SIP

pip3 install PyQt5


pip3 install PySide2
```


初回起動時のエラー


```
kuraine doc-ubuntu-19-10-vim ~$cat ~/launch_qt_designer.log
./designer: error while loading shared libraries: libQt5Core.so.5: cannot open shared object file: No such file or directory
```


rootユーザーで以下のコマンドを実行

```

strip --remove-section=.note.ABI-tag /usr/lib/x86_64-linux-gnu/libQt5Core.so.5

```


アプリ起動

```
( mkdir -p $HOME/qt-wrksp && export XDG_RUNTIME_DIR=$HOME/qt-wrksp && cd /usr/lib/x86_64-linux-gnu/qt5/bin && ./designer 1>~/launch_qt_designer.log 2>&1 </dev/null & )
```



ウィジェット等を配置後、


Ctrl+R等でプレビューなどし、


Ctrl＋Sで名前をつけて保存


拡張子は.uiだが中身はxmlファイル


```
$cd ~/qt-wrksp
$cat calender.ui
<?xml version="1.0" encoding="UTF-8"?>
<ui version="4.0">
 <class>Dialog</class>
 <widget class="QDialog" name="Dialog">
  <property name="geometry">
   <rect>
    <x>0</x>
    <y>0</y>
    <width>640</width>
    <height>473</height>
   </rect>
  </property>
  <property name="windowTitle">
   <string>Dialog</string>
  </property>
  <widget class="QCalendarWidget" name="calendarWidget">
   <property name="geometry">
    <rect>
     <x>90</x>
     <y>50</y>
     <width>491</width>
     <height>351</height>
    </rect>
   </property>
  </widget>
 </widget>
 <resources/>
 <connections/>
</ui>
```


以下のコマンドでpythonスクリプトにコンバート

```
pyuic5 $HOME/qt-wrksp/calender.ui -o calender.py
```


```
$cd ~/qt-wrksp
$ls
calender.py  calender.ui
```

なかみ

```
$cd ~/qt-wrksp
$cat calender.py
# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file '/home/kuraine/qt-wrksp/calender.ui'
#
# Created by: PyQt5 UI code generator 5.12.3
#
# WARNING! All changes made in this file will be lost!


from PyQt5 import QtCore, QtGui, QtWidgets


class Ui_Dialog(object):
    def setupUi(self, Dialog):
        Dialog.setObjectName("Dialog")
        Dialog.resize(640, 473)
        self.calendarWidget = QtWidgets.QCalendarWidget(Dialog)
        self.calendarWidget.setGeometry(QtCore.QRect(90, 50, 491, 351))
        self.calendarWidget.setObjectName("calendarWidget")

        self.retranslateUi(Dialog)
        QtCore.QMetaObject.connectSlotsByName(Dialog)

    def retranslateUi(self, Dialog):
        _translate = QtCore.QCoreApplication.translate
        Dialog.setWindowTitle(_translate("Dialog", "Dialog"))
```


これはうまくうごかせた

```
$cat list.py
from PyQt5.QtWidgets import *
import sys

class Window(QWidget):
    def __init__(self):
        QWidget.__init__(self)
        layout = QGridLayout()
        self.setLayout(layout)
        self.listwidget = QListWidget()
        self.listwidget.insertItem(0, "Red")
        self.listwidget.insertItem(1, "Orange")
        self.listwidget.insertItem(2, "Blue")
        self.listwidget.insertItem(3, "White")
        self.listwidget.insertItem(4, "Green")
        self.listwidget.clicked.connect(self.clicked)
        layout.addWidget(self.listwidget)

    def clicked(self, qmodelindex):
        item = self.listwidget.currentItem()
        print(item.text())

app = QApplication(sys.argv)
screen = Window()
screen.show()
sys.exit(app.exec_())

```



起動


```
$python3 list.py 1>/dev/null 2>&1 &
[1] 8996
```


戦法としてはqtデザインで部品のスニペットをパイソンファイルにコンバートしていけばいいんじゃないか

いい方法があった

- https://fereria.github.io/reincarnation_tech/11_PySide/01_PySide_Basic/00_Tutorial/02_create_designer/


管理者権限で起動するのがあんぱい


```
$ls -l
total 36
drwx------. 2 kuraine kuraine 4096  5月 22 11:53 ./
drwxr-xr-x. 1 kuraine kuraine 4096  5月 22 11:41 ../
-rwxr-xr-x. 1 kuraine kuraine  579  5月 22 11:50 launch-mygui.py*
-rw-r--r--. 1 kuraine kuraine 6982  5月 22 11:15 table.py
-rw-r--r--. 1 kuraine kuraine 4277  5月 22 11:14 table.ui
```

```

root doc-ubuntu-19-10-vim /home/kuraine/qt-wrksp$python3 launch-mygui.py 1>/dev/null 2>&1 &
[1] 9651

```


テーブルウィジェットがいいかんじ

モジュール選択してダブルクリックするとデータとか指定できる



- https://tomosoft.jp/design/?p=9067


pythonファイルからも起動できる

```
root doc-ubuntu-19-10-vim /home/kuraine/qt-wrksp$python3 launch-mygui-from-pyfile.py 1>/dev/null 2>&1 &
[1] 9686
```
