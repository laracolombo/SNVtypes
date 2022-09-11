MutationsType <-
function(vcf, context_length, reference_genome) {
  if (all(startsWith(levels(vcf@seqnames), 'chr')) == FALSE) {levels(vcf@seqnames) <- paste('chr', levels(vcf@seqnames), sep = '')}
  N <- length(vcf)
  seqnames <- as.character(seqnames(vcf))
  real_start <- vcf@ranges@start
  a_width <- c(rep(context_length,N)) # 3 is the parameter context_length
  ref <- as.character(vcf@elementMetadata$REF)
  alt <- as.character(unlist(vcf@elementMetadata$ALT))
  if ((context_length %% 2) != 0) {
    start <- ceiling(real_start - ((a_width/2)))
    end <- floor(real_start + ((a_width/2)))
    ranges_of_reference <- GRanges(seqnames = seqnames, ranges = IRanges(start = start, end = end))
    ref_seq <- getSeq(reference_genome, ranges_of_reference)
  } else {
    start <- (real_start - ((a_width/2)))
    end <- (real_start + ((a_width/2))) -1
    ranges_of_reference <- GRanges(seqnames = seqnames, ranges = IRanges(start = start, end = end))
    ref_seq <- getSeq(Hsapiens, ranges_of_reference)
  }
  ref_seq <- as.character(ref_seq)
  mutations <- c(rep(NA, N))
  for (x in seq_len(length(ref_seq))) {
    if (ref[x] == 'A' || ref[x] == 'G') {
      base <- as.character(reverseComplement(DNAString(ref_seq[x])))
      alt[x] <- as.character(reverseComplement(DNAString(alt[x])))
      ref[x] <- as.character(reverseComplement(DNAString(ref[x])))
    }
    else {base <- ref_seq[x]}
    mutations[x] <-  paste(substr(base, 1, floor(context_length/2)),'[', ref[x], '>', alt[x], ']', substr(base, floor(context_length/2) +2, context_length), sep = '')
  }
  mutations <- mutations[nchar(mutations) == context_length + 4]
 return(mutations)}
