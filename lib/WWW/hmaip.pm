use strict;
use warnings;
package WWW::hmaip;

use HTTP::Tiny;
use 5.008;

# ABSTRACT: Returns your ip address using L<http://geoip.hidemyass.com/ip/>

=head1 SYNOPSIS

    use WWW::hmaip;

    my $ip = get_ip(); # 54.123.84.6

=head1 EXPORTS

Exports the C<get_ip> function.

=cut

BEGIN {
    require Exporter;
    use base 'Exporter';
    our @EXPORT = 'get_ip';
    our @EXPORT_OK = ();
}

=head1 FUNCTIONS

=head2 get_ip

Returns your ip address, using L<http://geoip.hidemyass.com/ip/>.

    use WWW::hmaip;

    my $ip = get_ip();

=cut

sub get_ip {
    my $response = HTTP::Tiny->new->get('http://geoip.hidemyass.com/ip/');
    return $response->{content} if $response->{success};
    die join(' ', 'Error fetching ip: ',
                  ($response->{status} or ''),
                  ($response->{reason} or ''));
}

=head1 SEE ALSO

L<WWW::curlmyip> - another module that returns your ip address

L<WWW::ipinfo> - a module that returns ip address and geolocation data

=cut

1;
