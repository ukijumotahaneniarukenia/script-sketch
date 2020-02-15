#!/bin/bash

TGT="$(curl -s -H 'Authorization: Bearer A9pkpfplWP7jE2LphCjPK9xGpsVV4LalMSv9yBAVN8fk4FvR0qfvbAuQJrvn7ZhafJj4fyN_ZTyfC6edKRQpmHOqYx0gMPmGojHeMOc3PoOXdd1P_t3sx4piQPyBFAaITqzwOSxK-e9w7XN9mLo4WE3OALLiarVqMSgTIOPhwLuu4Z5OPqodfKTdnSqJTs9tHv4AslNBa7PJFZrF5mNe8JkVUe1h0yvOCCHFvRetevCz3g:feedly' https://cloud.feedly.com/v3/streams/user%2F26c34d27-f858-40be-89a3-527fa5cb76ef%2Fcategory%2FProgramming/contents?count=2 | jq -c --stream 'select(length==2)|{key:.[0]|join("."),value:.[1]}' | jq -s -c '.[]|select(.key|test("items\\.[0-9]\\.(title|id|htmlUrl|origin\\.htmlUrl|origin\\.title|crawled|summary\\.content|published|alternate\\.[0-9]{1,}\\.href|categories\\.[0-9]{1,}\\.id)"))' | jq -s 'from_entries' | gron | grep -vP 'json = {};')"



KEY="$(echo "$TGT" | perl -pe 's;=.*;;g' | perl -pe 's;json\["|"\];;g;' | perl -pe 's;\.[0-9]{1,}\.;-;g;')"

#echo "$KEY"

VALUE="$(echo "$TGT" | perl -pe 's;.*= ;;;')"


paste -d'\t' <(echo "$KEY") <(echo "$VALUE")
