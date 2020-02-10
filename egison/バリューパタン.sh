#!/bin/bash

#単一スカラによる比較

#<>の先頭文字は大文字の英字しか受け付けない
#https://www.egison.org/manual/patterns.html#value-patterns
egison -e '
(match 1 integer {[,1 <RESULT???---***+++OK>] [_ <RESULT###+++***---NG>]
})
'
egison -e '
(match 1 integer {[,2 <result???---***+++OK>] [_ <RESULT###+++***---NG>]
})
'
egison -e '
(match 2 integer {[,2 <RESULT???---***+++ok>] [_ <RESULT###+++***---ng>]
})
'
egison -e '
(match 2 integer {[,2 <RESULT???---***+++ok>] [_ <RESULT###+++***---ng>]
})
'
egison -e '
(match 2 integer {[,2 <RESULT???---***+++ok>] [_ <RESULT###+++***---ng>]
})
'
egison -e '
(match 3 integer {[,2 <RESULT???---***+++ok>] [_ <RESULT###+++***---ng***>]
})
'
egison -e '
(match 3 integer {[,2 <RESULT???---***+++ok>] [_ <RESULT###+++***---ng###>]
})
'
egison -e '
(match 3 integer {[,2 <RESULT???---***+++ok>] [_ <RESULT###+++***---ng--->]
})
'
egison -e '
(match 3 integer {[,2 <RESULT???---***+++ok>] [_ <RESULT###+++***---ng+++>]
})
'
