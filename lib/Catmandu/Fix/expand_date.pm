package Catmandu::Fix::expand_date;

use Catmandu::Sane;
use Moo;

our $dateRegexp = qr{
    ^([0-9]{4})
        ( [:-] ([0-9]{1,2})
            ( [:-] ([0-9]{1,2}) )?
        )?
}x;

sub fix {
    my ($self, $data) = @_;
    if ($data->{date} && $data->{date} =~ $dateRegexp) {
        $data->{year}  = $1;
        $data->{month} = 1*$3 if $3;
        $data->{day}   = 1*$5 if $5;
    }
    $data;
}

=head1 NAME

Catmandu::Fix::expand_date - expand a date field into year, month, and date

=head1 SYNOPSIS

    # date is "2001-09-11"
    expand_date();
    # year is "2001", month is "9", day is "11"

=head1 DESCRIPTION

The date field is expanded if it contains a year, optionally followed by
numeric month and day, each separated by C<-> or C<:>.

=head1 SEE ALSO

For more elaborated date parsing see L<Date::Parse>.

=cut
