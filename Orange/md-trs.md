- 事象

```
$ /home/kuraine/.local/bin/orange-canvas
/home/kuraine/.local/lib/python3.7/site-packages/pandas/compat/__init__.py:117: UserWarning: Could not import the lzma module. Your installed Python is incomplete. Attempting to use lzma compression will result in a RuntimeError.
  warnings.warn(msg)
Traceback (most recent call last):
  File "/home/kuraine/.local/bin/orange-canvas", line 6, in <module>
    from Orange.canvas.__main__ import main
  File "/home/kuraine/.local/lib/python3.7/site-packages/Orange/canvas/__main__.py", line 29, in <module>
    from AnyQt.QtGui import QFont, QColor, QPalette, QDesktopServices, QIcon
  File "/home/kuraine/.local/lib/python3.7/site-packages/AnyQt/QtGui.py", line 1, in <module>
    from . import _api
  File "/home/kuraine/.local/lib/python3.7/site-packages/AnyQt/_api.py", line 100, in <module>
    raise ImportError("PyQt4, PyQt5, PySide or PySide2 are not available for import")
ImportError: PyQt4, PyQt5, PySide or PySide2 are not available for import
```


- 対処

rootユーザーでpip3をアップグレードしたあと

```
pip3 install --upgrade pip
```

一般ユーザーでインストール

```
pip3 install --user pyforms-gui
```

起動した

```
$ /home/kuraine/.local/bin/orange-canvas
/home/kuraine/.local/lib/python3.7/site-packages/pandas/compat/__init__.py:117: UserWarning: Could not import the lzma module. Your installed Python is incomplete. Attempting to use lzma compression will result in a RuntimeError.
  warnings.warn(msg)
QStandardPaths: XDG_RUNTIME_DIR not set, defaulting to '/tmp/runtime-kuraine'
```
