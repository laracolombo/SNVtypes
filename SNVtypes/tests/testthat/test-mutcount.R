context("testing mutation count function")
library(BSgenome.Hsapiens.UCSC.hg19)

test_that("running with correct parameters", {
  vcf <- system.file("extdata", "chr22.vcf.gz", package="VariantAnnotation")
  vcf <- LoadVCF(vcf)
  expect_silent(MutationsCount(vcf[1:20], Hsapiens, plot = TRUE))
})

test_that("running with wrong input file", {
  vcf <- system.file("extdata", "chr22.vcf.gz", package="VariantAnnotation")
  vcf <- readVcf(vcf)
  expect_error(MutationsCount(vcf[1:20], Hsapiens))
})

test_that("running with wrong context length parameter", {
  vcf <- system.file("extdata", "chr22.vcf.gz", package="VariantAnnotation")
  vcf <- LoadVCF(vcf)
  expect_equal(length(MutationsCount(vcf[1:20], Hsapiens, plot = FALSE, 1.4)), 1)
})