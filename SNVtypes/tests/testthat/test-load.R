
context("loading vcf file") # Note: this is deprecated!

test_that("loading a file in non-VCF format", {
  txtfile<-file("output.txt")
  writeLines(c("Hello","World"), txtfile)
  close(txtfile)
  expect_error(LoadVCF(txtfile, 'GRCh37'))
})
