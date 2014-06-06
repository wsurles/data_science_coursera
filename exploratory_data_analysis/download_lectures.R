##| Lecture download script

## Create lecture directory
if(!file.exists("./lectures")){dir.create("./lectures")}

## Set url and file names
url <- "https://d396qusza40orc.cloudfront.net/exdata/lecture_slides/"

lecture_name <- c("Principles.pdf",
                  "exploratoryGraphs.pdf",
                  "PlottingSystems.pdf",
                  "PlottingBase.pdf",
                  "GraphicsDevices.pdf",
                  "PlottingLattice.pdf",
                  "ggplot2.pdf",
                  "hierachicalClustering.pdf",
                  "kmeansClustering.pdf",
                  "dimensionReduction.pdf",
                  "RColors.pdf",
                  "clusteringExample.pdf"
                  )

file_name <- c("01_01_Principles.pdf",
                "01_02_exploratoryGraphs.pdf",
                "01_03_PlottingSystems.pdf",
                "01_04_PlottingBase.pdf",
                "01_05_GraphicsDevices.pdf",
                "02_01_PlottingLattice.pdf",
                "02_02_ggplot2.pdf",
                "03_01_hierachicalClustering.pdf",
                "03_02_kmeansClustering.pdf",
                "03_03_dimensionReduction.pdf",
                "03_04_RColors.pdf",
                "04_01_clusteringExample.pdf"
                )

##| Download files
for (i in 1:length(lecture_name)) {
  fileURL <- paste0(url,lecture_name[i])
  download.file(fileURL, destfile = paste0("./lectures/",file_name[i]), method="curl")  
}
