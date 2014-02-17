#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;

use Catmandu::Exporter::BibTeX;
use Catmandu::Importer::BibTeX;
use Catmandu::Fix::expand_date;

sub test_expand(@) {
    my ($input, $expect, $msg) = @_;

    my $bibtex;
    my $exporter = Catmandu::Exporter::BibTeX->new( 
        file => \$bibtex,
        fix  => 'expand_date();',
    );

    $exporter->add( $input );
 
    my $importer = Catmandu::Importer::BibTeX->new( file => \$bibtex );
    is_deeply $importer->first, $expect, $msg;
}
   
test_expand { date => '2001-11-09' }
    => { type => 'misc', _citekey => 1, year => 2001, month => 11, day => 9 };

test_expand { date => '2001:11', _id => 'abc' }
    => { type => 'misc', _citekey => 'abc', year => 2001, month => 11 };

done_testing;
