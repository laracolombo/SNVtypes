
context("testing mutation types function")
library(BSgenome.Hsapiens.UCSC.hg19)

test_that("running with correct parameters", {
  vcf <- system.file("extdata", "chr22.vcf.gz", package="VariantAnnotation")
  vcf <- LoadVCF(vcf)
  expect_silent(MutationsType(vcf[1:20], 3, Hsapiens))
})

test_that("running with wrong values of context_length", {
  vcf <- system.file("extdata", "chr22.vcf.gz", package="VariantAnnotation")
  vcf <- LoadVCF(vcf)
  expect_error(MutationsType(vcf[1:20], '3', Hsapiens))
  expect_equal(MutationsType(vcf[1:20], 1.5, Hsapiens), character(0))
})

test_that("running with wrong input file", {
  vcf <- system.file("extdata", "chr22.vcf.gz", package="VariantAnnotation")
  vcf <- readVcf(vcf)
  expect_error(MutationsType(vcf[1:20], 3, Hsapiens))
})



