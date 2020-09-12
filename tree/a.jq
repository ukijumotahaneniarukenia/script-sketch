def XXX:

    select (. != null) |
    if (has("contents"))
    then
       ([.type,.name,.mode,.prot,.user,.group])
       , (.contents[] | XXX)
    else
       [.type,.name,.mode,.prot,.user,.group]
    end;

XXX
