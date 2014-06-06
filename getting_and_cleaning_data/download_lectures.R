##| Lecture download script

## Create lecture directory
if(!file.exists("./lectures")){dir.create("./lectures")}

## Set url and file names
url <- "https://d396qusza40orc.cloudfront.net/getdata/lecture_slides/"

lecture_name <- c("01_01_obtainingDataMotivation.pdf",
                  "01_02_rawAndProcessedData.pdf",
                  "01_03_componentsOfTidyData.pdf",
                  "01_04_downLoadingFiles.pdf",
                  "01_05_readingLocalFiles.pdf",
                  "01_06_readingExcelFiles.pdf",
                  "01_07_readingXML.pdf",
                  "01_08_readingJSON.pdf",
                  "01_09_dataTable.pdf",
                  "02_01_readingMySQL.pdf",
                  "02_02_readingHDF5.pdf",
                  "02_03_readingFromTheWeb.pdf",
                  "02_04_readingFromAPIs.pdf",
                  "02_05_readingFromOtherSources.pdf",
                  "03_01_subsettingAndSorting.pdf",
                  "03_02_summarizingData.pdf",
                  "03_03_creatingNewVariables.pdf",
                  "03_04_reshapingData.pdf",
                  "03_05_mergingData.pdf",
                  "04_01_editingTextVariables.pdf",
                  "04_02_regularExpressions.pdf",
                  "04_03_regularExpressionsII.pdf",
                  "04_04_workingWithDates.pdf",
                  "04_05_dataResources.pdf"
                  )

##| Download files
for (name in lecture_name) {
  fileURL <- paste0(url,name)
  download.file(fileURL, destfile = paste0("./lectures/",name), method="curl")  
}
