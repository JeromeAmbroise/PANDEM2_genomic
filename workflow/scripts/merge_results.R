

filelist <- snakemake@input[["mylistfile"]]
metadata <- snakemake@input[["mymetadata"]]

nfiles <- length(filelist)
full_result <- read.csv(filelist[1],sep='\t')

for(i in 2:nfiles)
{
  currentfile <- read.csv(filelist[i],sep='\t')
  full_result <- rbind(full_result,currentfile)
}

samplename <- gsub(basename(filelist),pattern = '.tsv',replacement = '')
full_result <- data.frame(samplename,full_result)

metadata <- read.csv(metadata)

full_result <- merge(metadata,full_result,by='samplename')

write.csv(full_result,snakemake@output[[1]],row.names = F)
