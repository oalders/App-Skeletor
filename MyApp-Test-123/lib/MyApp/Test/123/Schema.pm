use strict;
use warnings;

package MyApp::Test::123::Schema;

our $VERSION = 1;
use base 'DBIx::Class::Schema';

__PACKAGE__->load_components(qw/
  Helper::Schema::QuoteNames
  Helper::Schema::DidYouMean
  Helper::Schema::DateTime/);

__PACKAGE__->load_namespaces(
  default_resultset_class => "DefaultRS");

sub new_game {
  return shift->resultset('Game')->_new_game;
}

1;

=head1 TITLE

MyApp::Test::123::Schema - Data objects

=head1 DESCRIPTION

Schema representing all the database objects, result and resultset methods
available under the logic required to model the system

=head1 METHODS

This class defines the following methods

=head1 AUTHORS & COPYRIGHT

See L<MyApp::Test::123>.

=head1 LICENSE

See L<MyApp::Test::123>.

=cut