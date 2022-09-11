\name{MutationsType}
\alias{MutationsType}
\title{
Mutation types of single nucleotide variants
}
\description{
The function takes as input the VCF file returned by the LoadVCF function, filters only single nucleotide variants and determines the mutation type of each SNV in the UP[REF>ALT]DOWN notion. The length of the returned pattern is determined by the context_length parameter.}
\usage{
MutationsType(vcf, context_length, reference_genome)
}

\arguments{
  \item{vcf}{
Complete VCF file, including indels and single nucleotide variants, returned by the LoadVCF function.

}
  \item{context_length}{
Integer, length of the returned notion UP[REF>ALT]DOWN.  
}
\item{reference_genome}{
Genome of reference (ex. Hsapiens): the corresponding library has to be uploaded in the environment. E.g., for the Human Genome hg19 the library to be uploaded is 'BSgenome.Hsapiens.UCSC.hg19' and 'reference_genome' will be 'Hsapiens'.
}
}
\details{
REF>ALT counts as 1 in the pattern length: T[C>T]G will correspond to a context length of 3.
}
\value{
A vector of characters, each corresponding to the mutation notion of one single nucleotide variant.
}
\examples{
vcf <- system.file("extdata", "chr22.vcf.gz", package="VariantAnnotation")
vcf <- LoadVCF(vcf)
MutationsType(vcf[1:20], 3, Hsapiens)
}
\author{
Lara Colombo
}
\note{
All mutation types are reported such as they have C or T as the mutated reference base. Therefore, whenever the mutated base is A or G, the mutation on the reverse strand is returned. 
}




