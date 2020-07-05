import unicodedata

def show(i):
    defaultUnicodeName=""
    try:
       defaultUnicodeName=unicodedata.name(chr(i))
    except(ValueError):
        pass

    return i,hex(i),chr(i),defaultUnicodeName

[print(*show(i),sep="\t") for i in range(0x0,0x10FFFF) if (not 0x0<=i<=0x20) and (not 0x7f<=i<=0x9f) and (not 0xd800<=i<=0xdfff) ]
