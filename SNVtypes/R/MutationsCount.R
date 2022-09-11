MutationsCount <- function(vcf, reference_genome, plot = c(TRUE, FALSE), context_length = NULL) {
  Mutation_Types <- c(rep(NA, length(vcf)))
  if (!is.null(context_length)) {if (all(startsWith(levels(vcf@seqnames), 'chr')) == FALSE) {levels(vcf@seqnames) <- paste('chr', levels(vcf@seqnames), sep = '')}
    N <- length(vcf)
    seqnames <- as.character(seqnames(vcf))
    real_start <- vcf@ranges@start
    a_width <- c(rep(context_length,N)) 
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
      ref_seq <- getSeq(reference_genome, ranges_of_reference)
    }
    ref_seq <- as.character(ref_seq)
    type_mut <- c(rep(NA, N))
    for (x in seq_len(length(ref_seq))) {
      if (ref[x] == 'A' || ref[x] == 'G') {
        base <- as.character(reverseComplement(DNAString(ref_seq[x])))
        alt[x] <- as.character(reverseComplement(DNAString(alt[x])))
        ref[x] <- as.character(reverseComplement(DNAString(ref[x])))
      }
      else {base <- ref_seq[x]}
      Mutation_Types[x] <-  paste(substr(base, 1, floor(context_length/2)),'[', ref[x], '>', alt[x], ']', substr(base, floor(context_length/2) +2, context_length), sep = '')}
      Mutation_Types <- Mutation_Types[nchar(Mutation_Types) == context_length + 4]}
  
  else{
  ref <- as.character(vcf@elementMetadata$REF)
  alt <- as.character(unlist(vcf@elementMetadata$ALT))
  for (x in seq_len(length(vcf))) {
    if (ref[x] == 'A' || ref[x] == 'G') {
      alt[x] <- as.character(reverseComplement(DNAString(alt[x])))
      ref[x] <- as.character(reverseComplement(DNAString(ref[x])))
    }
    Mutation_Types[x] <-  paste(ref[x], '>', alt[x], sep = '')
    
  }
  Mutation_Types <- Mutation_Types[nchar(Mutation_Types) == 3]}
  
  count_table <- as.data.frame(table(Mutation_Types))
  if (plot == TRUE) {g <-ggplot(count_table,aes(x=Mutation_Types,y=Freq)) + geom_bar(stat='identity') + coord_flip()
  print(g)}
  return(count_table)}
