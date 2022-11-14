
# INTRODUCTION

This is a catalogue of diverse scripts used at the lab for smaller customised tasks.
 
# SUPPORTED PLATFORMS AND DEPENDENCIES

Linux, Mac OS

Shell scripts (*.sh) of this software were developed and tested using GNU bash (v4.4.20) in a Ubuntu 18.04 linux system. R scripts were developed using the R console (v4.1.1) in macOS Monterey. Perl scripts tested on v5.32.1.

# TOOLS

## fastq_header.pl
In pair-end (PE) fastq files the sequence identifiers in line 1 (of 4) of each sequence are identical in both read1 and read2 files. Sometimes one wants to concatenate (```cat```) both paired-end files into a single-end (SE) fastq file for downstream analysis. This creates a fastq file were each sequence identifier is present twice, therefore not unique. This lack of uniqueness can cause bugs down the line at some processes like e.g. deduplication. 
This script adds endings '/1' and '/2' to the identifier of each read in the pair to make them unique prior to concatenation.

Usage:
```
perl fastq_header.pl sample_r1.fastq sample_r2.fastq
```

This creates two output files **sample_r1.fastq_headed.fastq** and **sample_r2.fastq_headed.fastq**

Looking like this in the first three fastq identifiers (header):
```
@A00627:342:HHL5LDSX3:3:1101:14479:1016/1
@A00627:342:HHL5LDSX3:3:1101:23032:1016/1
@A00627:342:HHL5LDSX3:3:1101:1597:1031/1
```

```
@A00627:342:HHL5LDSX3:3:1101:14479:1016/2
@A00627:342:HHL5LDSX3:3:1101:23032:1016/2
@A00627:342:HHL5LDSX3:3:1101:1597:1031/2
```
# cytosine_conversion_calculator.pl

Evaluates nuclear and chloroplast CHH methylation to estimate cytosine non-conversion and other errors in bisulfite treated sequencing reads (BS-Seq) in *Arabidopsis* TAIR10. Input is the methylation report produced by the **bismark_methylation_extractor** (CX_report) from the BS-seq mapping tool [bismark](https://www.bioinformatics.babraham.ac.uk/projects/bismark/).

Usage:
```
perl cytosine_conversion_calculator.pl sample.deduplicated.CX_report.txt
```

Produce standard output like:
```
The mean chloroplast CHH methylation is :0.663193735143279% 
The mean nuclear CHH methylation is :2.04898463286775% 
```

# CONTACT
juan.santos at slu.se
