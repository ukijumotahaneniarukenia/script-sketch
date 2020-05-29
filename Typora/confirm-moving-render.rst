========================
confirm-moving-render.md
========================

.. role:: math(raw)
   :format: html latex
..

見出し
======

-  IN

.. code:: 

    # 見出し1
    ## 見出し2
    ### 見出し3
    #### 見出し4
    ##### 見出し5
    ###### 見出し6

-  OUT

見出し1
=======

見出し2
-------

見出し3
~~~~~~~

見出し4
^^^^^^^

見出し5
'''''''

見出し6
       

色コード
========

-  IN

.. code:: 

    ![](https://via.placeholder.com/16/c7e7f6/FFFFFF/?text=%20) `#c7e7f6`
    ![](https://via.placeholder.com/16/abdbf1/FFFFFF/?text=%20) `#abdbf1`
    ![](https://via.placeholder.com/16/6ec1e9/FFFFFF/?text=%20) `#6ec1e9`
    ![](https://via.placeholder.com/16/47b1e1/FFFFFF/?text=%20) `#47b1e1`
    ![](https://via.placeholder.com/16/0093d6/FFFFFF/?text=%20) `#0093d6`
    ![](https://via.placeholder.com/16/221816/FFFFFF/?text=%20) `#221816`

-  OUT

| |image0| ``#c7e7f6``
| |image1| ``#abdbf1``
| |image2| ``#6ec1e9``
| |image3| ``#47b1e1``
| |image4| ``#0093d6``
| |image5| ``#221816``

インラインコード
================

-  IN

.. code:: 

    これは `echo うんこ`です。

-  OUT

これは ``echo うんこ``\ です。

ノンインラインコード
====================

-  IN

.. code:: 


    ```

    #!/usr/bin/env bash


    echo うんこ

    ```

-  OUT

.. code:: 


    #!/usr/bin/env bash


    echo うんこ

ノンオーダリスト
================

-  IN

.. code:: 

    - リスト1
        - リスト1-1
            - リスト1-1-1
            - リスト1-1-2
        - リスト1-2
    - リスト2
    - リスト3

-  OUT

-  リスト1

   -  リスト1-1

      -  リスト1-1-1

      -  リスト1-1-2

   -  リスト1-2

-  リスト2

-  リスト3

オーダリスト
============

-  IN

.. code:: 

    1. 番号付きリスト1
        1. 番号付きリスト1-1
        1. 番号付きリスト1-2
    1. 番号付きリスト2
    1. 番号付きリスト3

-  OUT

1. 番号付きリスト1

   1. 番号付きリスト1-1

   2. 番号付きリスト1-2

2. 番号付きリスト2

3. 番号付きリスト3

引用
====

-  IN

.. code:: 


    > **Note:**  Interfere when the enemy is making a mistake.

-  OUT

    **Note:** Interfere when the enemy is making a mistake.

リンク
======

-  IN

.. code:: 

    [pngフリー画像集](https://www.pngonly.com/owl-png/)

-  OUT

`pngフリー画像集 <https://www.pngonly.com/owl-png/>`__

強調表示
========

-  IN

.. code:: 

    これは **うんこ** です

-  OUT

これは **うんこ** です

画像
====

.. code:: shell

    curl -sSLO https://www.pngonly.com/wp-content/uploads/2017/06/Owl-Close-PNG-Photo.png

-  IN

.. code:: 


    ![フクロウ](./Owl-Close-PNG-Photo.png "Owl")

-  OUT

.. figure:: /home/kuraine/script-sketch/Typora/Owl-Close-PNG-Photo.png
   :alt: Owl

   Owl

テーブル
========

-  IN

.. code:: 

    |                  | ASCII                           | HTML                          |
    | ---------------- | ------------------------------- | ----------------------------- |
    | Single backticks | `'Isn't this fun?'`             | 'Isn't this fun?'             |
    | Quotes           | `"Isn't this fun?"`             | "Isn't this fun?"             |
    | Dashes           | `-- is en-dash, --- is em-dash` | -- is en-dash, --- is em-dash |

-  OUT

+--------------------+-------------------------------------+---------------------------------+
|                    | ASCII                               | HTML                            |
+====================+=====================================+=================================+
| Single backticks   | ``'Isn't this fun?'``               | 'Isn't this fun?'               |
+--------------------+-------------------------------------+---------------------------------+
| Quotes             | ``"Isn't this fun?"``               | "Isn't this fun?"               |
+--------------------+-------------------------------------+---------------------------------+
| Dashes             | ``-- is en-dash, --- is em-dash``   | -- is en-dash, --- is em-dash   |
+--------------------+-------------------------------------+---------------------------------+

-  IN

.. code:: 

    | 左揃え | 中央揃え | 右揃え |
    |:--|:--:|--:|
    |1 |2 |3 |
    |4 |5 |6 |

-  OUT

+----------+------------+----------+
| 左揃え   | 中央揃え   | 右揃え   |
+==========+============+==========+
| 1        | 2          | 3        |
+----------+------------+----------+
| 4        | 5          | 6        |
+----------+------------+----------+

-  IN

.. code:: 


    |`code`    |*italic*                  |
    |:--:|:--:|
    |**bold**  |***bold italic***         |
    |$ omega $|[Qiita](http://qiita.com)|

-  OUT

texうまくいかんな

+-------------+--------------------------------+
| ``code``    | *italic*                       |
+=============+================================+
| **bold**    | ***bold italic***              |
+-------------+--------------------------------+
| $ omega $   | `Qiita <http://qiita.com>`__   |
+-------------+--------------------------------+

tex
===

-  https://qiita.com/MuAuan/items/64dc82030a9ec4f5cef9

The *Gamma function* satisfying $\\Gamma(n) = (n-1)!\\quad\\forall
n\\in\\mathbb N$ is via the Euler integral

.. math:: \Gamma(z) = \int_0^\infty t^{z-1}e^{-t}dt\,.

    You can find more information about **LaTeX** mathematical
    expressions
    `here <http://meta.math.stackexchange.com/questions/5020/mathjax-basic-tutorial-and-quick-reference>`__.

UML diagrams
============

これはvscodeでdraw.ioができるようになったから、あんま使わんかも？？

You can render UML diagrams using
`Mermaid <https://mermaidjs.github.io/>`__. For example, this will
produce a sequence diagram:

.. code:: mermaid

    sequenceDiagram
    Alice ->> Bob: Hello Bob, how are you?
    Bob-->>John: How about you John?
    Bob--x Alice: I am good thanks!
    Bob-x John: I am good thanks!
    Note right of John: Bob thinks a long<br/>long time, so long<br/>that the text does<br/>not fit on a row.

    Bob-->Alice: Checking with John...
    Alice->John: Yes... John, how are you?

And this will produce a flow chart:

.. code:: mermaid

    graph LR
    A[Square Rect] -- Link text --> B((Circle))
    A --> C(Round Rect)
    B --> D{Rhombus}
    C --> D

.. |image0| image:: https://via.placeholder.com/16/c7e7f6/FFFFFF/?text= 
.. |image1| image:: https://via.placeholder.com/16/abdbf1/FFFFFF/?text= 
.. |image2| image:: https://via.placeholder.com/16/6ec1e9/FFFFFF/?text= 
.. |image3| image:: https://via.placeholder.com/16/47b1e1/FFFFFF/?text= 
.. |image4| image:: https://via.placeholder.com/16/0093d6/FFFFFF/?text= 
.. |image5| image:: https://via.placeholder.com/16/221816/FFFFFF/?text=
