use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Catmandu::BibTeX',
    license             => 'perl',
    build_requires => {
        'Test::Exception' => 0,
        'Test::More' => 0,
    },
    requires => {
        'perl' => '5.10.1',
        'Catmandu' => '0.5',
        'BibTeX::Parser' => '0.64',
        'LaTeX::Encode' => '0.08',
        'namespace::clean' => '0.24',
    },
    add_to_cleanup     => [ 'Catmandu-BibTeX-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script;
