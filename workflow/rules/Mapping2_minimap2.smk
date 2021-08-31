rule Mapping2_minimap2:
   input:
      os.path.join(outputdir, "consensus","{sample}.preconsensus.fasta"),
      os.path.join(FASTQdir, "{sample}.fastq")
   output:
      temp(os.path.join(outputdir, "mapping2","{sample}.sam")),
      temp(os.path.join(outputdir, "mapping2","{sample}.bam")),
      os.path.join(outputdir, "mapping2","{sample}.sorted.bam"),
      os.path.join(outputdir, "mapping2","{sample}.sorted.bam.bai")
   shell:"""
      minimap2 -ax map-ont -R '@RG\\tID:foo\\tSM:{wildcards.sample}' {input[0]} {input[1]} > {output[0]}
      samtools view -b {output[0]} -o {output[1]}
      samtools sort {output[1]} -o {output[2]}
      samtools index {output[2]}
      """
