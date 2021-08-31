rule merge_vcf:
   input:
      expand(os.path.join(outputdir, "variant_calling","{sample}.filtrated.vcf.bgz"),sample=metadata.samplename.tolist())
   output:
      os.path.join(outputdir, "variant_calling","allsample.vcf")
   shell:"""
      bcftools merge {input} -o {output[0]}
      """
