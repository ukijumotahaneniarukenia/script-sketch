( export s=12354;export e=12454;export dtm="$(date -d '1 day ago' +%Y-%m-%d)";jq -ncr '[range(env.s|tonumber;((env.e|tonumber)+1))]|map({seq:.,str:([.]|implode),dtm:((env.dtm|strptime("%Y-%m-%d")|mktime)+(.*24*3600))|strftime("%Y-%m-%d")})|.[]' )


