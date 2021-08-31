rule merge_results:
   input:
      mylistfile = expand(os.path.join(outputdir, "nextclade","{sample}.tsv"),sample=metadata.samplename.tolist()),
      mymetadata = config["metadata"]
   output:
      os.path.join(outputdir, "merged_result.csv"),
   script:
      "../scripts/merge_results.R"
