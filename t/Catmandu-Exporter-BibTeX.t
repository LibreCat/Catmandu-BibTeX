#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use Test::Exception;

my $pkg;
BEGIN {
  $pkg = 'Catmandu::Exporter::BibTeX';
  use_ok($pkg);
}
require_ok($pkg);

my $bibtex = <<TEX;
\@inproceedings{2602779,
  author       = {Boukricha, Hana and Wachsmuth, Ipke and Carminati, Maria Nella and Knoeferle, Pia},
  language     = {English},
  publisher    = {IEEE},
  title        = {A Computational Model of Empathy: Empirical Evaluation},
  year         = {2013},
}
TEX

my %attrs = (
	fh => $bibtex,
);

my $exporter = $pkg->new(%attrs);

isa_ok($exporter, $pkg);

can_ok($exporter, 'add');

can_ok($exporter, 'add_many');

done_testing 5;