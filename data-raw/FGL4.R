library(FITSio)
library(dplyr)

# Read the 4FGL FITS file into a data frame after
# downloading the FITS file containing the 4FGL Catalog from the Fermi Science Support Center (FSSC) website
# File Rev 6, Released 27 May 2020
# URL: http://fermi.gsfc.nasa.gov/ssc/data/access/lat/8yr_catalog/gll_psc_v22.fit
FGL4 <- as_tibble(readFrameFromFITS("data-raw/gll_psc_v22.fit", hdu = 1))
FGL4$Source_Name = gsub(" ", "", FGL4$Source_Name)
FGL4$CLASS1 = gsub(" ", "", FGL4$CLASS1)
save(FGL4, file = "data/FGL4.rdata", compress = "xz")
