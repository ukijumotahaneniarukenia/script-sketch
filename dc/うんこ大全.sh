#!/bin/bash

dc -e '117 110 107 111PPPP' | rev

dc -e '[うんこ]p'

dc -e '[産んこ]p'

dc -e '[unko]p'

dc -e '[UNKO]p'

dc -e '[💩]p'

echo -e 💩| xxd -ps -c1 | tr '[:lower:]' '[:upper:]' | xargs | tr -d ' ' | xargs -I@ echo "dc -e '16i@P'" | bash

echo -e ｳﾝｺ | xxd -ps -c1 | tr '[:lower:]' '[:upper:]' | xargs | tr -d ' ' | xargs -I@ echo "dc -e '16i@P'" | bash

echo -e うんこ | xxd -ps -c1 | tr '[:lower:]' '[:upper:]' | xargs | tr -d ' ' | xargs -I@ echo "dc -e '16i@P'" | bash
