#!/usr/local/bin/awk

{
  print
}

/UNKO/{
  while (getline < "./UNKO")
    print
  close ("./UNKO")
}

/ANKO/{
  while (getline < "./ANKO")
    print
  close ("./ANKO")
}
