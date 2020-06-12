
## jeevanuDB: Example data sets for microbiome R pkg     


<font color="red">This package consists only of examples and modified data!</font>


## Installing jeevanuDB   

Before intalling `jeevanuDB`, you will need to install R (3.6.0 or later) and RStudio (1.1.463 or later).

``` 
install.packages("devtools")

devtools::install_github("microsud/jeevanuDB")
```

## Change ASV names

```
library(jeevanuDB)
library(phyloseq)
data(moving_pictures)
taxa_names(moving_pictures)[1:3]
pseq <- moving_pictures
taxa_names(pseq) <- paste0("ASVID", seq(ntaxa(pseq)))
taxa_names(pseq)[1:3]

```
From the dada2 tutorial page [link here](https://benjjneb.github.io/dada2/tutorial.html) for saving seqs inside phyloseq object.   

```
dna <- Biostrings::DNAStringSet(taxa_names(ps))
names(dna) <- taxa_names(ps)
ps <- merge_phyloseq(ps, dna)
taxa_names(ps) <- paste0("ASV", seq(ntaxa(ps)))
ps
```


## Author
Sudarshan A. Shetty (sudarshanshetty9[@]gmail[dot]com)

