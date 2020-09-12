def XXX:

    if (has("contents"))
    then
        .contents[] |
        if ( length == 0)
        then
            [.type,.name,.mode,.prot,.user,.group]
        else
            "AAAAAAAAAAAAAAAAAA"
            ,[.type,.name,.mode,.prot,.user,.group]
            ,.
        end
    else
        null
    end;

XXX
