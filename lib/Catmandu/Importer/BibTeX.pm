package Catmandu::Importer::BibTeX;

use namespace::clean;
use Catmandu::Sane;
use BibTeX::Parser;
use LaTeX::Encode;
use Moo;

with 'Catmandu::Importer';

has bibtex => (is => 'ro', lazy => 1, builder => '_build_bibtex');


sub _build_bibtex {

}

sub generator {

}

=head1 NAME

Catmandu::Importer::BibTeX - a BibTeX importer

=head1 SYNOPSIS

    use Catmandu::Importer::BibTeX;

    my $importer = Catmandu::Importer::BibTeX->new(file => "/foo/bar.bib");

    

=head1 DESCRIPTION

=head1 SEE ALSO

L<Catmandu::Importer>, L<Catmandu::Exporter::BibTeX>

=cut

1;