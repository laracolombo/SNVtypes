\name{SNVtypes-package}
\alias{SNVtypes-package}
\alias{SNVtypes}
\docType{package}
\title{Qualitative and quantitative analysis of the mutation types of single nucleotide variants stored in VCF files
\packageTitle{SNVtypes}
}
\description{The package takes as input a VCF file, filters only the single nucleotide variants and returns their type and mutation
\packageDescription{SNVtypes}
}
\details{

The DESCRIPTION file:
\packageDESCRIPTION{SNVtypes}
\packageIndices{SNVtypes}
It is suggested to upload the VCF file by the function LoadVCF, which returns it as a GRanges object: indeed, the other functions in the package take as input a GRanges object. 
Alternatively, the user might upload the file and retrieve GRanges format with functions of other packages.
}
\author{Lara Colombo
\packageAuthor{SNVtypes}

Maintainer: \packageMaintainer{SNVtypes}
}

\examples{
vcf <- system.file("extdata", "chr22.vcf.gz", package="VariantAnnotation")
vcf <- LoadVCF(vcf)
MutationsType(vcf[1:20], 3, Hsapiens)
MutationsCount(vcf[1:20], Hsapiens, TRUE)
}
