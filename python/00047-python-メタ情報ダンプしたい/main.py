import re
import os
import sys
import itertools
import pandas
import inspect
import numpy
import warnings
import scipy
import matplotlib
from bs4 import BeautifulSoup
import lxml
import requests
import datetime
import scrapy
import selenium
from inspect import signature

warnings.simplefilter('ignore')  # https://note.nkmk.me/python-warnings-ignore-warning/

# libraryNameList = ['pandas', 'inspect', 'warnings', 'numpy']  # 複数ライブラリ対応

# 行を全て出力 １０００万行
pandas.set_option('display.max_rows', 10000000)

mxTabCnt = 3

def mkFullPathModuleUtilFunction(subTypeFullName, libraryName, moduleList):
    rt = []
    for rn, subType in enumerate(moduleList):

        # if rn >= 10:
        #     # 動作確認用
        #     break

        if len(subTypeFullName) == 0:
            # 初回
            subTypeFullName = libraryName + '.' + subType

            confirmAndMoreSubType = '[e[0] for e in inspect.getmembers(' + subTypeFullName + ', inspect.isfunction)]'  # ファンクション化どうか判定

            finalSubTypeFullName = subTypeFullName
        else:
            # ２回目以降
            tmpSubTypeFullName = subTypeFullName + '.'
            nextSubTypeFullName = tmpSubTypeFullName[0:tmpSubTypeFullName.rfind('.')] + '.' + subType
            confirmAndMoreSubType = '[e[0] for e in inspect.getmembers(' + nextSubTypeFullName + ', inspect.isfunction)]'  # ファンクション化どうか判定

            # 事前評価してエラー出たら、再度再度直前までを切り取り処理
            try:
                eval(confirmAndMoreSubType)
            except AttributeError:
                tmpSubTypeFullName = subTypeFullName
                nextSubTypeFullName = tmpSubTypeFullName[0:tmpSubTypeFullName.rfind('.')] + '.' + subType
                confirmAndMoreSubType = '[e[0] for e in inspect.getmembers(' + nextSubTypeFullName + ', inspect.isfunction)]'  # ファンクション化どうか判定

            finalSubTypeFullName = nextSubTypeFullName

        andModeList = eval(confirmAndMoreSubType)

        if len(andModeList) == 0:
            # print(finalSubTypeFullName)
            rt.append(finalSubTypeFullName)
        else:
            mkFullPathModuleUtilFunction(finalSubTypeFullName, libraryName, eval(confirmAndMoreSubType))

    return rt


def extractType(subTypeFullNameList):
    # 個別対応が必要
    # 必要に応じて完璧である必要は今ないと思われ
    pass


def extractFunction(subTypeFullNameList):
    rt = []
    for subTypeFullName in subTypeFullNameList:
        a = 'type(' + subTypeFullName + ')'
        # print(subTypeFullName)
        # print(eval(a))
        if re.sub("'>", "", re.sub("<class '", "", str(eval(a)))) in 'function':
            rt.append(subTypeFullName)
    return rt


def getSignature(subTypeFullNameList):
    rt = {}

    for subTypeFullName in subTypeFullNameList:

        a = 'list(signature(' + subTypeFullName + ').parameters)'

        # print(subTypeFullName)

        try:
            argsNameList = eval(a)
            argsNameValue = {}
            for argsName in argsNameList:

                name = 'str(signature(' + subTypeFullName + ').parameters[' + '"' + str(argsName) + '"' + '].name)'
                kind = 'str(signature(' + subTypeFullName + ').parameters[' + '"' + str(argsName) + '"' + '].kind)'
                default = 'str(signature(' + subTypeFullName + ').parameters[' + '"' + str(argsName) + '"' + '].default)'
                annotation = 'str(signature(' + subTypeFullName + ').parameters[' + '"' + str(argsName) + '"' + '].annotation)'
                returnAnnotation = 'str(signature(' + subTypeFullName + ').return_annotation)'

                argsName = eval(name)
                argsKind = eval(kind)
                argsDefault = eval(default)
                argsAnnotation = eval(annotation)
                argsReturnAnnotation = eval(returnAnnotation)

                argsNameValueList = [argsName, argsKind, argsDefault, argsAnnotation, argsReturnAnnotation]

                argsNameValue[argsName] = argsNameValueList

            rt[subTypeFullName] = argsNameValue
        except(ValueError, TypeError):
            #シグニチャが取れなかったら、カラマップ代入
            rt[subTypeFullName] = {}
    return rt


def mkTsvRecord(functionArgsMap):
    rt = ''
    for fullFunctionName, functionArgsMap in functionArgsMap.items():
        # print(fullFunctionName,functionArgsMap)
        if len(functionArgsMap) == 0:
            # タブ数を揃える
            rt = rt + '\t'.join([fullFunctionName, '', ''.join(list(numpy.repeat('\t', mxTabCnt)))]) + '\n'
            # print(fullFunctionName, '', ''.join(list(numpy.repeat('\t', mxTabCnt))), sep = '\t')
        else:
            for functionArgsName, functionArgsInfoList in functionArgsMap.items():
                tmp = '\t'.join(functionArgsInfoList[1:]).replace('\t\t', '\t')
                rt = rt + '\t'.join([fullFunctionName, functionArgsName, tmp + ''.join(list(numpy.repeat('\t', mxTabCnt - tmp.count('\t'))))]) + '\n'
                # print(fullFunctionName, functionArgsName, tmp + ''.join(list(numpy.repeat('\t', mxTabCnt - tmp.count('\t')))), sep = '\t') #デフォルト値でタブを使用している場合の置換ハンドリング
    return rt


def usage():
    usage="""
Usage:
    echo pandas inspect | python3 a.py
    or
    echo  pandas numpy | python3 a.py
    or
    echo  numpy | python3 a.py
    or
    echo  re | python3 a.py
"""
    exit(0)

if __name__ == "__main__":

    try:
      if len(sys.argv[1:]) == 0:
        libraryNameList = list(map(lambda x:x.strip(),sys.stdin.readlines()))[0].split() #パイプ経由引数の場合
      else:
        libraryNameList = sys.argv[1:] #コマンドライン経由引数の場合
    except KeyboardInterrupt:
      usage()

    if len(libraryNameList) == 0:
        usage()


    for libraryName in libraryNameList:

        with open(libraryName + '.tsv', mode='w') as f:
            f.write('\t'.join(['ファンクション名', '引数名', '引数の属性', '引数のデフォルト値', '引数の型', '戻り値型']) + '\n')

        subTypeFullName = ''  # 処理結果格納用変数
        resultSubTypeFullNameList = []  # 処理結果格納用変数

        a = 'dir(' + libraryName + ')'

        try:
            resultSubTypeFullNameList.append(mkFullPathModuleUtilFunction(subTypeFullName, libraryName, eval(a)))
        except (NameError, TypeError):
            os.remove(libraryName + '.tsv')
            sys.exit(1)

        functionList = extractFunction(list(itertools.chain.from_iterable(resultSubTypeFullNameList))) #フラットんして呼び出し

        functionArgsMap = getSignature(functionList)

        with open(libraryName + '.tsv', mode='a') as f:
            f.write(mkTsvRecord(functionArgsMap))
