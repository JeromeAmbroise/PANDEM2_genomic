rule mark_lowcoverage_in_consensus:
   input:
      os.path.join(outputdir, "mapping2","{sample}.sorted.bam"),
      os.path.join(outputdir, "consensus","{sample}.preconsensus.fasta")
   output:
      os.path.join(outputdir, "consensus","{sample}.consensus.fasta")
   script:
      "../scripts/consensus_mark_low_coverage.R"
