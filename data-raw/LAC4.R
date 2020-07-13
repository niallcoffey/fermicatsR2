library(FITSio)
library(dplyr)

# LAC4.R
# Input raw data
# No changes to NaN, -Inf, and "" found in original fits
# Created by Niall Coffey
# 7 July 2020

LAC4_LO <- as_tibble(readFrameFromFITS("data-raw/table_4LAC_l.fits", hdu = 1))
LAC4_HI <- as_tibble(readFrameFromFITS("data-raw/table_4LAC_h.fits", hdu = 1))


# Read the 4LAC data files into a data frame
LAC4_LO <- tbl_df(read.csv("data-raw/4LAC_LO.csv"))
LAC4_LO <- select(LAC4_LO, -Simbad, -NED, -recno) # remove Simbad, NED, and recno
vars_lo <- c("GLON","GLAT","ASSOC_3FGL","VHE","CName","RAJ2000","DEJ2000","Sep","PosErr","SpCl","SEDCl","lognu","lognuRf","z","Prob","LR-RG","LR-XG","FRad","n_FRad","FX")
colnames(LAC3_LO) <- vars_lo


LAC4_HI <- tbl_df(read.csv("data-raw/4LAC_HI.csv"))
LAC4_HI <- select(LAC4_HI, -recno, -Simbad) # remove recno and Simbad
vars_hi <- c("GLON","GLAT","ASSOC_3FGL","VHE","Cln","CName","RAJ2000","DEJ2000","Sep","PosErr","SpCl","SEDCl","lognu","lognuRf","z","Prob","LR-RG","LR-XGP","logCpt","FRad","n_FRad","FX","Vmag1", "Vmag2", "ARO","AOX")
colnames(LAC4_HI) <- vars_hi


save(LAC4_LO, file = "data/LAC4_LO.rdata", compress = "xz")
save(LAC4_HI, file = "data/LAC4_HI.rdata", compress = "xz")
