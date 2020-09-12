def XXX:

    select (. != null) |
    if (has("contents"))
    then
        .contents[] |
        if ( length == 0)
        then
            "AAAAAAAAAAAAAAAAA"
            ,[.type,.name,.mode,.prot,.user,.group]
        else
            ( "BBBBBBBBBBBBBBBBB"
            ,[.type,.name,.mode,.prot,.user,.group])
            , (.contents |
            if ( length == 0 )
            then
               null
            else
               .[] | XXX
            end)
        end
    else
        null
    end;

XXX
