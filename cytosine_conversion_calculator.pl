#!/usr/bin/perl

## ---------------------------
##
## cytosine_conversion_calculator.pl
##
## Calculates nuclear and chloroplast CHH methylation 
##
## Author: Juan Santos, SLU, 2020 December
## Usage: cytosine_conversion_calculator.pl sample.deduplicated.CX_report.txt 
## ---------------------------

use warnings;
use strict;
use List::Util qw(sum);


my @chl_met =();
my @nuc_met =();

while (<>) {
	chomp $_;
	if (/CHH/ & /chloroplast/) {
		my @chl_line = (split/\t/, $_);
		#calculates methylation
			if ($chl_line[4] !=0 || $chl_line[3] !=0 )	
			{	my $chl_methyl = $chl_line[3]/($chl_line[3]+ $chl_line[4]); 
			push @chl_met, $chl_methyl;	
			}
		}
	if (/CHH/ & /Chr/i) {
		my @nuc_line = (split/\t/, $_);
		#calculates methylation
			if ($nuc_line[4] !=0 || $nuc_line[3] !=0 )	
			{	my $nuc_methyl = $nuc_line[3]/($nuc_line[3]+ $nuc_line[4]); 
			push @nuc_met, $nuc_methyl;	
			}
		}
	}

print "The mean chloroplast CHH methylation is : ", sum (@chl_met)/@chl_met * 100, "% \n";
print "The mean nuclear CHH methylation is : ", sum (@nuc_met)/@nuc_met * 100, "% \n";



