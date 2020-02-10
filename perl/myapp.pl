#!/usr/bin/perl

use Mojolicious::Lite;

get '/' =>sub{
    my $c = shift;
    $c->render(text=>'HelloWorld!');
};

app->start;