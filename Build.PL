use 5.006;
use strict;
use warnings FATAL => 'all';
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Catmandu::BibTeX',
    license             => 'Artistic_2_0',
    dist_author         => [ 
        'Nicolas Steenlant <nicolas.steenlant@ugent.be>'
        'Vitali Peil <vitali.peil@uni-bielefeld.de>'
        ],
    dist_version_from   => 'lib/Catmandu/BibTeX.pm',
    release_status      => 'stable',
    configure_requires => {
        'Module::Build' => 0,
    },
    build_requires => {
        'Test::More' => 0,
    },
    requires => {
        'Catmandu' => 0.02,
        'LaTeX::Encode' => 1.0,
    },
    add_to_cleanup     => [ 'Catmandu-BibTeX-*' ],
    create_makefile_pl => 'traditional',
    create_license => 1,
);

$builder->create_build_script();
