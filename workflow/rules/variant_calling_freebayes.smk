rule variant_calling_freebayes:
   input:
      config['reference_genome'],
      os.path.join(outputdir, "mapping1","{sample}.sorted.bam")
   output:
      os.path.join(outputdir, "variant_calling","{sample}.vcf"),
      os.path.join(outputdir, "variant_calling","{sample}.vcf.gz")
   shell:"""
      freebayes -f {input[0]} --ploidy 1 {input[1]} > {output[0]}
      bcftools view {output[0]} -Oz -o {output[1]}
      """
