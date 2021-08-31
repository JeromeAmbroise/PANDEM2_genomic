library(Biostrings)
library(GenomicAlignments)


aln <- readGAlignments(snakemake@input[[1]])
coverage <- as.numeric(coverage(aln)[[1]])
draftconsensus <- readDNAStringSet(snakemake@input[[2]])
consensus <- DNAStringSet(replaceLetterAt(draftconsensus[[1]], which(coverage<10), rep('N',length(which(coverage<10)))))
names(consensus) <- names(draftconsensus)
writeXStringSet(consensus,snakemake@output[[1]])
