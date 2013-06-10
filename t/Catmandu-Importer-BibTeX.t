#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use Test::Exception;
use Data::Dumper;
use lib	qw(/home/vitali/projects/LibreCat/Catmandu-BibTeX/lib);
use Catmandu::Importer::BibTeX;
#use lib qw(../lib);
#my $pkg;
#BEGIN {
#    $pkg = 'Catmandu::Importer::BibTeX';
#    use_ok $pkg;
#}
#require_ok $pkg;

#my $file = "test.bib";
#my $fh = IO::File->new("t");

my $imp = Catmandu::Importer::BibTeX->new(file => "test.bib");

$imp->each( sub {
	print Dumper $_[0];
	});

#done_testing 2;