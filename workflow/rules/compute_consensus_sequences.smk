rule compute_consensus_sequence:
   input:
      config['reference_genome'],
      os.path.join(outputdir, "variant_calling","{sample}.filtrated.vcf")
   output:
      os.path.join(outputdir, "consensus","{sample}.preconsensus.fasta")
   run:
      import os
      if os.stat(input[1]).st_size > 0:
        shell("bcftools consensus -f {input[0]} {input[1]}.bgz > {output[0]}")
      else:
        shell("cp {input[0]} {output[0]}")
