#!/usr/bin/perl

use warnings;

## ---------------------------
##
## fastq_header.pl
##
## Adds "/1" and "/2" to the end of the seq identifiers in PE fastq files.
##
## Author: Juan Santos, SLU, 2020 December
## Usage: perl fastq_header.pl sample_r1.fastq sample_r2.fastq 
## ---------------------------

my $input_1 = shift @ARGV;
my $input_2 = shift @ARGV;


die "Please provide 2 files in FASTQ format to continue\n" unless ($input_2);

open (IN1, $input_1) or die "Failed to read from file $input_1: $!\n";
open (IN2, $input_2) or die "Failed to read from file $input_2: $!\n";


open (OUT1, '>', "${input_1}_headed.fastq") or die "Failed to write to file ${input_1}.headed.fastq: $!\n";

my @headed_fq1 = ();

while (<IN1>){ 

	if ($_ =~ /^\@/ ) {
		chomp $_;
		@header = split(/\s/, $_);
		$header[0] = $header[0]."\/1"."\n";
		push @headed_fq1, $header[0];
						}

	else { push @headed_fq1, $_; }

			}

print OUT1 @headed_fq1;


open (OUT2, '>', "${input_2}_headed.fastq") or die "Failed to write to file ${input_2}.headed.fastq: $!\n";

my @headed_fq2 = ();

while (<IN2>){ 

	if ($_ =~ /^\@/ ) {
		chomp $_;
		@header = split(/\s/, $_);
		$header[0] = $header[0]."\/2"."\n";
		push @headed_fq2, $header[0];
						}

	else { push @headed_fq2, $_; }

			}

print OUT2 @headed_fq2;

