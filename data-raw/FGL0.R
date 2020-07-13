library(FITSio)
library(dplyr)

# Read the 0FGL FITS file into a data frame
FGL0 <- as_tibble(readFrameFromFITS("data-raw/gll_psc3month_BSL_v2.fit", hdu = 1))
FGL0$CLASS1 = gsub(" ", "", FGL0$CLASS1)
save(FGL0, file = "data/FGL0.rdata", compress = "xz")
