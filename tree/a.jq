def XXX:

  if (select(. != null) | .[].contents|length == 0)
  then
      null
  else
      .[] |
      if (has("contents"))
      then
          .contents[] |
          if ( length == 0)
          then
              [.type,.name,.mode,.prot,.user,.group]
          else
              .
          end
      else
          null
      end
  end;

XXX
