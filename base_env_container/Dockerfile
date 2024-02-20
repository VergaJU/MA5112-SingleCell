FROM bioconductor/tidyverse:3.17


RUN apt update && apt upgrade -y

RUN Rscript -e "install.packages('Seurat', repos='http://cran.us.r-project.org')"
RUN Rscript -e "install.packages('ggsignif', repos='http://cran.us.r-project.org')"
RUN Rscript -e "install.packages('rmarkdown', repos='http://cran.us.r-project.org')"
RUN Rscript -e "install.packages('markdown', repos='http://cran.us.r-project.org')"
RUN Rscript -e "BiocManager::install(c('SingleR','clusterProfiler','org.Hs.eg.db','SingleCellExperiment'))"

RUN Rscript -e "BiocManager::install('scran')"
