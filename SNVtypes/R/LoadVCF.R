LoadVCF <-
function(vcf, genome = NULL) {
  if (!is.null(genome)) {vcf <- readVcf(vcf, genome)}
  else {vcf <- readVcf(vcf)}
  r <- rowRanges(vcf)
}
