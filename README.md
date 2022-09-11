# SNVtypes
SNVtypes is a Bioconductor-compliant package that I developed as a project for a Scientific Programming course delivederd by the Politecnico of Milan (M.Sc. in Bioinformatics for computational genomics).

It provides functions to determine the mutation types of single nucleotide variants stored in VCF files. 

## SHORT DESCRIPTION 
This is an R package which takes:

1. a set of mutations (single nucleotide variants) in VCF format,
2. the corresponding reference genome (e.g., human genome hg38) and
3. a parameter “context_length” (see below)

and determines for each mutation the corresponding mutation type as follows: 

The mutation type is “UP[REF>ALT]DOWN” where

- “REF>ALT” is the single nucleotide variant from REF base to ALT base, e.g., “C>T”
- “UP” is one or more upstream bases from the reference genome (depending on the user
parameter “context_length”)
- “DOWN” is one or more downstream bases from the reference genome (same user
parameter)

The package provides an additional function which summarizes the mutation types for the set of mutations into a count table (number of mutations per mutation type) and into a countplot. 
