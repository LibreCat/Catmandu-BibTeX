package Catmandu::Importer::BibTeX;

use namespace::clean;
use Catmandu::Sane;
use BibTeX::Parser;
use Moo;

with 'Catmandu::Importer';

sub generator {
    my ($self) =@_;
    my $fh = $self->fh;
    sub {
        my $parser = BibTeX::Parser->new($fh);
        while (my $entry = $parser->next ) {
            my $bib = {};
            if ($entry->parse_ok) {
                $bib->{type} = $entry->type;
                map {$bib->{$_} = $entry->field($_)} $entry->fieldlist;
                return $bib;
            } else {
                Catmandu::Error->throw($entry->error);
            }
        }
        return;
    }
}

=head1 NAME

Catmandu::Importer::BibTeX - a BibTeX importer

=head1 SYNOPSIS

    use Catmandu::Importer::BibTeX;

    my $importer = Catmandu::Importer::BibTeX->new(file => "/foo/bar.bib");

    my $n = $importer->each(sub {
        my $hashref = $_[0];
        # ...
    }); 

=head1 DESCRIPTION

=head1 SEE ALSO

L<Catmandu::Importer>, L<Catmandu::Exporter::BibTeX>

=cut

1;