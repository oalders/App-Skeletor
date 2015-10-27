package MyApp::Test::123::View::HTML;

use Moose;
use Text::Xslate::Util 'mark_raw', 'html_builder';

extends 'Catalyst::View::Xslate';

has '+xslate' => ( handles=>{'render_clean'=>'render'});

__PACKAGE__->config(
  encode_body=>undef,
  content_charset=>'UTF-8',
  expose_methods=>[qw/model/],
  function=>+{
    form_to_html => html_builder(\&form_to_html),
  });

sub model { pop->model }
sub form_to_html { shift->render }

sub template_for {
  my ($self, $action) = @_;
  return $action . $self->suffix;
}

__PACKAGE__->meta->make_immutable;