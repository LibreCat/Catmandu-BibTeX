use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Catmandu::BibTeX',
    license             => 'perl',
    dist_author         => [ 
        'Nicolas Steenlant <nicolas.steenlant@ugent.be>'
        ],
    dist_version_from   => 'lib/Catmandu/BibTeX.pm',
    release_status      => 'stable',
    build_requires => {
        'Software::License' => 0,
        'Test::Exception' => 0,
        'Test::More' => 0,
    },
    requires => {
        'Catmandu' => '0.3',
        'LaTeX::Encode' => '1.0',
    },
    add_to_cleanup     => [ 'Catmandu-BibTeX-*' ],
    create_makefile_pl => 'traditional',
    create_license => 1,
);

$builder->create_build_script();
