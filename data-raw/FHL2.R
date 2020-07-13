library(FITSio)
library(dplyr)

# Download FITS file containing the 2FHL Catalog from the Fermi Science Support Center (FSSC) website
if (!file.exists("data-raw/gll_psch_v09.fit")) {
  FHL2Url <- "http://fermi.gsfc.nasa.gov/ssc/data/access/lat/2FHL/gll_psch_v09.fit"
  download.file(FHL2Url, destfile = "data-raw/gll_psch_v09.fit", method="curl")
}

# Read the 2FHL FITS file into a data frame
FHL2 <- as_tibble(readFrameFromFITS("data-raw/gll_psch_v09.fit", hdu = 1))
save(FHL2, file = "data/FHL2.rdata", compress = "xz")
