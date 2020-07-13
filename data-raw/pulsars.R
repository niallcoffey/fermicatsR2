# Script to read the Public List of LAT Pulsars
# Pablo Saz Parkinson
# 2015-04-21
# Updated by Niall Coffey on 2020-07-13

library(XML)
library(dplyr)

Today <- Sys.Date()
fileUrl <- "https://confluence.slac.stanford.edu/display/GLAMCOG/Public+List+of+LAT-Detected+Gamma-Ray+Pulsars"
filePSR.html <- paste("data-raw/Public_List_of_LAT_Pulsars_",Today,".html", sep="")
#filePSR.rdata <- paste("LATPSRs_",Today,".rdata", sep="")
download.file(fileUrl, destfile = filePSR.html, method = "curl")

#filePSR.html <- "data-raw/Public_List_of_LAT_Pulsars_2016-02-22.html"
tmp <- as_tibble(readHTMLTable(filePSR.html, as.data.frame = TRUE, which = 1, stringsAsFactors = FALSE))
npulsars <- dim(tmp)[1]-1
pulsars <- tmp[2:(npulsars+1),]
colnames(pulsars) <- c("PSR", "RAJ_deg", "DECJ_deg", "P_ms", "Edot", "Codes", "Refs")
pulsars$RAJ_deg <- as.numeric(pulsars$RAJ_deg)
pulsars$DECJ_deg <- as.numeric(pulsars$DECJ_deg)
pulsars$P_ms <- as.numeric(pulsars$P_ms)
pulsars$Edot <- as.numeric(pulsars$Edot)
#pulsars$date_public <- as.Date("2016-02-22")
pulsars$date_public <- as.Date("2020-04-16")
rm(tmp)

codes <- as_tibble(readHTMLTable(filePSR.html, as.data.frame = TRUE, which = 2, stringsAsFactors = FALSE))
references <- as_tibble(readHTMLTable(filePSR.html, as.data.frame = TRUE, which = 3, stringsAsFactors = FALSE))
save(pulsars, file = "data/pulsars.rdata", compress = "xz")
