\name{MutationsCount}
\alias{MutationsCount}
\title{
Count table of the mutation types of single nucleotide variants
}
\description{
The function takes as input the VCF file returned by the LoadVCF function, filters only single nucleotide variants and returns the count table of the set of SNV mutations. The plot parameter returns a countplot of the number of mutations per mutation type. 
}
\usage{
MutationsCount(vcf, reference_genome, plot, context_length)
}
\arguments{
  \item{vcf}{
Complete VCF file, including indels and single nucleotide variants, returned by the LoadVCF function.
}

\item{reference_genome}{
Genome of reference (ex. Hsapiens): the corresponding library has to be uploaded in the environment. E.g., for the Human Genome hg19 the library to be uploaded is 'BSgenome.Hsapiens.UCSC.hg19' and 'reference_genome' will be 'Hsapiens'.   
}
  \item{plot}{
Boolean: if set to TRUE (default), a barplot that summarizes the mutation count for each mutation type will be displayed. 

}
\item{context_length}{
Optional parameter: if set to an integer, the count table of the mutation types in UP[REF>ALT]DOWN format of length 'context_length' is returned. If nothing is passed, the count table of mutations in [REF>ALT] format is returned.
}
}
\details{
A dataframe will be returned: the type_mut column will store the mutation type, while the Freq column will store the absolute frequency (count) of the mutations. 
}
\value{
A count table (data.frame) of the mutation types present in the VCF file. Optionally, a barplot showing the counts can be returned. 
}
\examples{
vcf <- system.file("extdata", "chr22.vcf.gz", package="VariantAnnotation")
vcf <- LoadVCF(vcf)
MutationsCount(vcf[1:20], Hsapiens, TRUE, 3)
MutationsCount(vcf[1:20], Hsapiens, FALSE)
}
\author{
Lara Colombo
}
\note{
If the context length parameter is high, probably too many different mutation types will be returned and the plot might get unclear. The same might happen for very large VCF files. Whenever a large number of different mutation types is returned, skipping the context length parameter is preferrable for the plot interpretability. 

All mutation types are reported such as they have C or T as the mutated reference base. Therefore, whenever the mutated base is A or G, the mutation on the reverse strand is returned. 
}
