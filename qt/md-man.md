- https://fereria.github.io/reincarnation_tech/11_PySide/01_PySide_Basic/00_Tutorial/02_create_designer/

- https://tomosoft.jp/design/?p=9067

アプリ起動

```
$( mkdir -p $HOME/qt-wrksp && export XDG_RUNTIME_DIR=$HOME/qt-wrksp && cd /usr/lib/x86_64-linux-gnu/qt5/bin && ./designer 1>~/launch_qt_designer.log 2>&1 </dev/null & )
```

以下のコマンドでpythonスクリプトにコンバート

```
$pyuic5 $HOME/qt-wrksp/calender.ui -o calender.py
```

pythonファイルからも起動できる

```
$python3 launch-mygui-from-pyfile.py 1>/dev/null 2>&1 &
[1] 9686
```

launch-mygui-from-pyfile.py

```
import sys
from PyQt5.QtCore import *
from PyQt5.QtWidgets import *


#ここの部分をかえる
#from句の引数にパイソンファイル名 import句の引数にそのファイルのクラス名を指定
from table2 import Ui_Form

class Test(QDialog):
    def __init__(self,parent=None):
        super(Test, self).__init__(parent)
        self.ui = Ui_Form()
        self.ui.setupUi(self)


if __name__ == '__main__':
    app = QApplication(sys.argv)
    window = Test()
    window.show()
    sys.exit(app.exec_())
```

