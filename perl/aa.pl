use LWP::UserAgent       ();

my $ua  = LWP::UserAgent->new(
    protocols_allowed => ['http', 'https'],
    timeout           => 3600,
);

$ua->env_proxy;

my $response = $ua->get('https://official-joke-api.appspot.com/jokes/random');

if ($response->is_success) {
    print $response->decoded_content;
}
else {
    die $response->status_line;
}
