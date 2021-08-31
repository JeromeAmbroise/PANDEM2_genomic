

filelist <- list.files('fastq/')
samplename <- gsub(basename(filelist),pattern = '.fastq',replacement = '')
sequencing_technologies <- c('Oxford Nanopore Minion')
sequencing_center <- c('National Institute of ...')
library_preparation <- c('amplicon_sequencing_artic_v4')
sequencing_date <- c('2021.05.12')
Country <- c('India')
patient_id <- paste0('India_',round(runif(length(samplename),10000000,99999999)))


metadata <- data.frame(samplename,sequencing_technologies,sequencing_center,library_preparation,sequencing_date,Country,patient_id)
write.csv(metadata,'metadata.csv',row.names = F)