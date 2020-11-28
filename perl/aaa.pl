use utf8;
use Mojolicious::Lite;
use Mojolicious::Lite -signatures;
use JSON qw/encode_json decode_json to_json from_json/;
use Encode qw/encode_utf8 decode_utf8/;

#https://www.mojolicious-document.com/Mojolicious::Controller.html
#https://github.com/mojolicious/mojo/tree/master/examples



#$ perl aaa.pl daemon -m production -l http://*:8080



get '/res1' => sub ($c) {
  $c->render(json => {test => 'I ♥ Mojolicious!うんこモリモリ森鴎外'});
};

get '/res2' => sub ($c) {
  $c->render(text => 'I ♥ Mojolicious!I ♥ Mojolicious!うんこモリモリ森鴎外');
};

get '/res3' => sub ($c) {
  my $id     = $c->req->request_id;
  $c->render(json => {request_id => $id});
};

get '/res4' => sub ($c) {
  my $id     = $c->req->request_id;
  my $method = $c->req->method;
  my $url    = $c->req->url->to_abs;
  my $info   = $c->req->url->to_abs->userinfo;
  my $host   = $c->req->url->to_abs->host;
  my $user_agent  = $c->req->headers->user_agent;
  my $response_data = {
    request_id => $id,
    method => $method,
    url => $url,
    info => $info,
    host => $host,
    user_agent => $user_agent,
  };
  $c->render(json => $response_data);
};

app->start;
