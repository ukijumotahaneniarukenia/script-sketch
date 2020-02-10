#!/usr/local/bin/awk

BEGIN{
  ORS="\r\n";
  base_url="localhost";
  port=8080;
  service="/inet/tcp/0/"base_url"/"port;
  request="GET /cms/pag/20190630170109_unko/slf.html HTTP/1.0";

  print request |& service;
  print "" |& service;

  while ((service |& getline)>0){
    print $0;
  }
  close(service);
}
