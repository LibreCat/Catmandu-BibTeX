package Catmandu::Importer::BibTeX;

use namespace::clean;
use Catmandu::Sane;
use BibTeX::Parser;
use LaTeX::Encode;
use Moo;

with 'Catmandu::Importer';

has bibtex => (is => 'ro', lazy => 1, builder => '_build_bibtex');

sub _build_bibtex {
	my $self = $_[0];
    my $parser = BibTeX::Parser->new($self->file);
}

sub generator {
    my ($self) = @_;
    sub {

    }
}

1;