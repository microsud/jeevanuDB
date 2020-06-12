# objects from raw data

#The large biom file was downloaded from [ftp server of emp data](ftp://ftp.microbio.me/emp/release1/otu_tables/deblur/)
#Following code was run on server due to size of the original data in QIIME v1.

#removed doubletons from all data.
#Then filterd to have only human microbiome data and then removedd doubletons from these also. The biom files are available in folder "human_microbiome/data"

#Then read into R


library(microbiome)
ps_human <- read_phyloseq(otu.file = "inst/extras/human_associated_no_doubletons.biom",
                          taxonomy.file = NULL,
                          metadata.file = "inst/extras/emp_map.csv",
                          type = "biom")
#write_phyloseq(ps_human, "METADATA")
taxa_names(ps.100.host)[1:10]
# save the biom with seq infor
ps_human <- subset_taxa(ps_human, Family !="f__mitochondria")
emp_human <- subset_taxa(ps_human, Class !="c__Chloroplast")

# for data pkg
saveRDS(emp_human,"inst/extras/emp_human.rds")
save(emp_human, file = "data/emp_human.rda")


############################ moving picturs #########

biom <- "inst/extras/caparaso_deblur_150_no_singletons.biom"

meta <- "inst/extras/550_mapping_file.csv"

ps.mv <- read_phyloseq(biom, NULL,meta, "biom")

ps.mv <- subset_taxa(ps.mv, Family !="f__mitochondria")
moving_pictures <- subset_taxa(ps.mv, Class !="c__Chloroplast")

# for data pkg
saveRDS(moving_pictures,"inst/extras/moving_pictures.rds")
save(moving_pictures, file = "data/moving_pictures.rda")

