rule filter_vcf:
   input:
      os.path.join(outputdir, "variant_calling","{sample}.vcf.gz")
   output:
      temp(os.path.join(outputdir, "variant_calling","{sample}.filtrated.temp.vcf")),
      os.path.join(outputdir, "variant_calling","{sample}.filtrated.vcf"),
      os.path.join(outputdir, "variant_calling","{sample}.filtrated.vcf.bgz")
   script:
      "../scripts/filter_vcf.R"
