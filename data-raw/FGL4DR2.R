library(FITSio)
library(dplyr)

# Read the 4FGL-DR2 FITS file into a data frame after
# downloading the FITS file containing the 4FGL-DR2 Catalog from the Fermi Science Support Center (FSSC) website
# File Rev 1, Released 22 May 2020
# URL: http://fermi.gsfc.nasa.gov/ssc/data/access/lat/10yr_catalog/gll_psc_v23.fit
FGL4DR2 <- as_tibble(readFrameFromFITS("data-raw/gll_psc_v23.fit", hdu = 1))
FGL4DR2$Source_Name = gsub(" ", "", FGL4DR2$Source_Name)
FGL4DR2$CLASS1 = gsub(" ", "", FGL4DR2$CLASS1)
save(FGL4DR2, file = "data/FGL4DR2.rdata", compress = "xz")
