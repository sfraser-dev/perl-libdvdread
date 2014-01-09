#!/usr/bin/perl
# Example usage:
# dvdrip.pl -i [.IFO file in VIDEO_TS dir] -f [VIDEO_TS dir]
use strict;
use warnings;
use feature qw(say);
use Getopt::Long;

# Get the name of the .IFO file and the DVD folder from the command line.
my %args;
GetOptions(\%args,
    'i=s',
    'f=s'
) or die "Invalid parameters!";
die "Missing -i switch" unless $args{i};
die "Missing -f switch" unless $args{f};
my $ifo=$args{i};
my $dvdfolder=$args{f};

# Print DVD information to file.
system("mplayer -identify -frames 0 $ifo > temp.dat");

# Parse file with DVD information and get the number of titles.
my $noOfTitles;
my $fin = "temp.dat";
open (my $fhin,"<",$fin) || die "Couldn't open '".$fin."' for reading because: ".$!;
while (my $line = <$fhin>) {
    if (($line =~ /There are/) && ($line =~ /titles on this DVD/)) {
        $noOfTitles=$line;
        $noOfTitles=~s/\D//g;
    }
}
close(fhin);

say"Number of titles is: $noOfTitles";
say"folder=$dvdfolder";
my $theStr;
my $theNum;
#system("mplayer -dvd-device $dvdfolder dvd://1");
for(my $i=1; $i<=$noOfTitles; $i++){
    if ($noOfTitles < 1000) {
        $theNum=sprintf("%03d",$i);
    }
    else {
        die "Error: wrong number format for theNum\n";
    }
    $theStr="mplayer -dvd-device ".$dvdfolder." dvd:\/\/".$i." -dumpstream -dumpfile ./VTS_".$theNum."_1.VOB";
    say"$theStr";
    system($theStr);
}
