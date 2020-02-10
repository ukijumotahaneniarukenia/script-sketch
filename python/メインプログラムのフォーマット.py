#!/usr/local/bin/python3.7

#$./メインプログラムのフォーマット.py
#[1, 3, 5, 7, 9]
#[-2, 6, -10, 14, -18]
#[1, -3, 5, -7, 9]

def main():
    lst = [-1, 3, -5, 7, -9] 

    print(type(lst))

    print(lst)

    print(type(map(abs, lst)))

    # 関数
    print(map(abs, lst))

    # 関数
    #元がリストだからlist関数でラップしている。
    #リファラだと実体が見えないため。
    print(list(map(abs, lst))) 

    # ラムダ式 
    print(list(map(lambda x: x * 2, lst))) 

    # 関数形式の標準演算子 
    # operator.negは引数を負にした数値を返す
    import operator 
    print(list(map(operator.neg, lst)))

if __name__ == '__main__':
    print("START")
    main()
    print("END")
