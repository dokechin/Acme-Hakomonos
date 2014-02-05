package Acme::Hakomonos::Register;

use strict;
use warnings;

sub import {
  my ($class, %hakomonos) = @_;

  my $caller = caller;
  {
    no strict 'refs';
    no warnings 'redefine';
    *{"$caller\::hakomonos"} = sub { wantarray ? %hakomonos : \%hakomonos };

    (my $category = $caller) =~ s/^Acme::Hakomonos:://;
    *{"$caller\::category"} = sub { $category };
  }
}

1;

__END__

=head1 NAME

Acme::Hakomonos::Register

=head1 SYNOPSIS

  package Acme::Hakomonos::YourGroup
  use strict;
  use warnings;
  our $VERSION = '0.071226';
  use Acme::Hakomonos::Register (
    ID  => {name => 'Real Name', cost => building_cost, size => floor_size},
  );

  1;

  # then you can get authors list like these.
  # note that ->authors is context sensitive)

  my %hash    = Acme::Hakomonos::YourGroup->hakomonos;
  my $hashref = Acme::Hakomonos::YourGroup->hakomonos;

=head1 DESCRIPTION

This is used to register Public Halls (Hakomonos) and real names of Hakomono and building cost and floor size.

=head1 SEE ALSO

L<Acme::Hakomonos>

=head1 AUTHOR

dokechin

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2014 by Dokechin.

This program is free software; you can redistribute it and/or
modify it under the same terms as Perl itself.

=cut
