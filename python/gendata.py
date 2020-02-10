#!/usr/local/bin/python3.7

import datetime as dt
import pandas as pd
import random as rd
import numpy as py

mk_datecol_key="date"
mk_datecol_cmd='pd.date_range(dt.date.today(),periods='+'15'+',freq=\''+str(rd.randint(-10,10))+'D\')'
mk_datecol_val=eval(mk_datecol_cmd)

print(mk_datecol_key)
print(mk_datecol_cmd)
print(mk_datecol_val)

mk_itemcol_key="item"
mk_itemcol_cmd='[c for _ in range('+5') for c in ["apple", "banana","orange"]'
mk_itemcol_val=eval(mk_item_cmd)
