# Download FITS file containing the 3FHL Catalog from the Fermi Science Support Center (FSSC) website
if (!file.exists("data-raw/gll_psch_v13.fit")) {
  FHL3Url <- "http://fermi.gsfc.nasa.gov/ssc/data/access/lat/3FHL/gll_psch_v13.fit"
  download.file(FHL3Url, destfile = "data-raw/gll_psch_v13.fit", method="curl")
}

# Read the 3FHL FITS file into a data frame
FHL3 <- as_tibble(readFrameFromFITS("data-raw/gll_psch_v13.fit", hdu = 1))
save(FHL3, file = "data/FHL3.rdata", compress = "xz")
