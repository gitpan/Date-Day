package Date::Day;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;

@ISA = qw(Exporter AutoLoader);
@EXPORT = qw(
&day	
);
$VERSION = '1.02';

sub day 
{

my $m = @_[0];
my $d = @_[1];
my $y = @_[2];

my %month=(1,0,2,3,3,2,4,5,5,0,6,3,7,5,8,1,9,4,10,6,11,2,12,4,);
my %weekday=(0,'SUN',1,'MON',2,'TUE',3,'WED',4,'THU',5,'FRI',6,'SAT',);

$m = int($m);
$d = int($d);
$y = int($y);

my $wday = (($d+$month{$m}+$y+(int($y/4))-(int($y/100))+(int($y/400)))%7);
return $weekday{$wday};

}

1;
__END__

=head1 NAME

Date::Day - Perl extension for converting a date to its respective day.

=head1 SYNOPSIS

  use Date::Day;

  ## The following will print the weekday corresponding 
  ## to the date March 11, 1998.  

  $result = &day(03,11,1998);
  print "$result";

=head1 DESCRIPTION

After noticing the complexity of some modules for determining the day of a 
specific date, I decided to write this module. It is by far the shortest 
module of its kind performing the above task. This module exports a 
subroutine called day() which takes as arguments numerical month, day, and 
year. See Synopsis for example. As far as range of usage, the day() 
function will return a proper day for all dates starting from year 0 
through infinity. There are no restrictions. If you pass bad data to the 
function, a day will still be returned, it just won't have any meaning. So 
March 45, 2001 will return a day, just one with no meaning. So make sure 
you pass real dates.

=head1 AUTHOR

John Von Essen, john@essenz.com

=head1 SEE ALSO

perl(1).

=cut
