def XXX:

    select (. != null) |
    if (has("contents"))
    then
       ([.type,.name,.mode,.prot,.user,.group,.size,.directories,.files])
       , (.contents[] | XXX)
    else
       [.type,.name,.mode,.prot,.user,.group,.size,.directories,.files]
    end;

XXX
