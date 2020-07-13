library(FITSio)
library(dplyr)

# Read the 3LAC data files into a data frame
LAC3_LO <- as_tibble(read.csv("data-raw/3LAC_LO.csv"))
LAC3_LO <- select(LAC3_LO, -Simbad, -NED, -recno) # remove Simbad, NED, and recno
vars_lo <- c("GLON","GLAT","ASSOC_3FGL","VHE","CName","RAJ2000","DEJ2000","Sep","PosErr","SpCl","SEDCl","lognu","lognuRf","z","Prob","LR-RG","LR-XG","FRad","n_FRad","FX")
colnames(LAC3_LO) <- vars_lo


LAC3_HI <- as_tibble(read.csv("data-raw/3LAC_HI.csv"))
LAC3_HI <- select(LAC3_HI, -recno, -Simbad) # remove recno and Simbad
vars_hi <- c("GLON","GLAT","ASSOC_3FGL","VHE","Cln","CName","RAJ2000","DEJ2000","Sep","PosErr","SpCl","SEDCl","lognu","lognuRf","z","Prob","LR-RG","LR-XGP","logCpt","FRad","n_FRad","FX","Vmag1", "Vmag2", "ARO","AOX")
colnames(LAC3_HI) <- vars_hi


save(LAC3_LO, file = "data/LAC3_LO.rdata", compress = "xz")
save(LAC3_HI, file = "data/LAC3_HI.rdata", compress = "xz")
