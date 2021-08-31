rule annotate_nextclade:
   input:
      os.path.join(outputdir, "consensus","{sample}.consensus.fasta"),
      os.path.join(config['dir_next_clade'],"reference.fasta"),
      os.path.join(config['dir_next_clade'],"tree.json"),
      os.path.join(config['dir_next_clade'],"qc.json"),
      os.path.join(config['dir_next_clade'],"genemap.gff")
   output:
      os.path.join(outputdir, "nextclade","{sample}.tsv"),
      temp(directory(os.path.join(outputdir, "nextclade","{sample}.temp")))
   shell:"""
      nextclade --genes S --input-fasta {input[0]} --input-root-seq {input[1]} --input-tree {input[2]} --input-qc-config {input[3]} --input-gene-map {input[4]} --output-tsv {output[0]} --output-dir {output[1]}
      """
