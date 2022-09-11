\name{LoadVCF}
\alias{LoadVCF}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Load the VCF file content as GRanges object
}
\description{
The function takes as input a VCF file and a reference genome (optional) and returns a GRanges object. 
}
\usage{
LoadVCF(vcf, genome)
}

\arguments{
  \item{vcf}{
 File in VCF format, storing both indels and single nucleotide variants. 
}
 \item{genome}{
 Character: genome identifier that replaces the genome information in the VCF Seqinfo. When not provided, genome is taken from the VCF file header.
}
}
\value{
The function returns a GRanges object of the mutation data provided by the VCF file.
}
\examples{
vcf <- system.file("extdata", "chr22.vcf.gz", package="VariantAnnotation")
vcf <- LoadVCF(vcf)
}
\author{
Lara Colombo
}
