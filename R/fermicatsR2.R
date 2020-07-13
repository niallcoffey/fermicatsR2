#' fermicatsR2 (v 1.0): A package containing catalogs from the Fermi Large Area Telescope.
#'
#' Since its launch from the Kennedy Space Center on the 11th of June 2008, the Large Area Telescope (LAT, \url{https://www-glast.stanford.edu}), on board the Fermi Gamma-ray
#' Space Telescope (formerly GLAST) has been performing an all-sky survey of the gamma-ray sky at energies between 20 MeV and
#' 300 GeV. The LAT Collaboration, consisting of more than 400 scientists at over 90 universities and laboratories in 12 countries,
#' has produced a number of catalogs and lists of gamma-ray sources, at various phases of the mission.
#' The fermicatsR2 package builds on the fermicatsR package, amounting to the following data sets:
#' FGL0, FGL1, FGL2, FGL3, FGL4, FGL4DR2, LAC3_LO, LAC3_HI, LAC4_LO, LAC4_HI, FHL1, FHL2, FHL3, FIG1, and pulsars. For an application of the fermicatsR package, see Saz Parkinson et al.,
#' "Classification and Ranking of Fermi LAT Gamma-ray Sources from the 3FGL Catalog using Machine Learning Techniques", The Astrophysical Journal, \strong{820}, 8 (2016).
#'
#' @section fermicatsR2 :
#' The following is a brief description of the data sets available within the fermicatsR2 package and their corresponding Fermi LAT catalogs/lists.
#'
#' \itemize{
#' \item FGL0: Fermi LAT Bright Gamma-ray Source List, 205 gamma-ray sources, using 3 months of data \[Abdo et al., ApJS, \strong{183}, 46 (2009)]
#' \item FGL1: Fermi LAT First Source Catalog, 1451 gamma-ray sources, using 11 months of data \[Abdo et al., ApJS, \strong{188}, 405 (2010)]
#' \item FGL2: Fermi LAT Second Source Catalog, 1873 gamma-ray sources, using 24 months of data \[Nolan et al., ApJS, \strong{199}, 31 (2012)]
#' \item FGL3: Fermi LAT Third Source Catalog, 3034 gamma-ray sources, using 48 months of data \[Acero et al., ApJS, \strong{218}, 23 (2015)]
#' \item FGL4: Fermi LAT Fourth Source Catalog, 5064 gamma-ray sources, using 96 months of data \[Abdollahi et al., ApJS, \strong{247}, 33 (2020)]
#' \item FGL4DR2: Fermi LAT Fourth Source Catalog, 5788 gamma-ray sources, using 120 months of data \[Abdollahi et al., ApJS, \strong{247}, 33 (2020)]
#' \item LAC3_LO: Fermi LAT Third Catalog of Active Galactic Nuclei - Low Galactic Latitude (|GLAT| < 10 deg.), 182 sources, using 48 months of data \[Ackermann et al., ApJ, \strong{810}, 14 (2015)]
#' \item LAC3_HI: Fermi LAT Third Catalog of Active Galactic Nuclei - High Galactic Latitude (|GLAT| > 10 deg.), 1591 sources, using 48 months of data \[Ackermann et al., ApJ, \strong{810}, 14 (2015)]
#' \item LAC4_LO: Fermi LAT Fourth Catalog of Active Galactic Nuclei - Low Galactic Latitude (|GLAT| < 10 deg.), 344 sources, using 96 months of data \[Ajello et al., ApJ, \strong{892}, 105 (2020)]
#' \item LAC4_HI: Fermi LAT Fourth Catalog of Active Galactic Nuclei - High Galactic Latitude (|GLAT| > 10 deg.), 2863 sources, using 96 months of data \[Ajello et al., ApJ, \strong{892}, 105 (2020)]
#' \item FHL1: First Fermi-LAT Catalog of Sources Above 10 GeV, 514 high-energy gamma-ray sources, using 36 months of data \[Ackermann et al., ApJS, \strong{209}, 34 (2013)]
#' \item FHL2: The Second Catalog of Hard Fermi-LAT Sources, 360 gamma-ray sources, using 80 months of data \[Ackermann et al., ApJS, \strong{222}, 5 (2016)]
#' \item FHL3: The Third Catalog of Hard Fermi-LAT Sources, 1556 gamma-ray sources, using 84 months of data \[Ajello et al., ApJS, \strong{232}, 18 (2017)]
#' \item FIG1: The First Fermi-LAT Inner Galaxy point source catalog, 48 gamma-ray sources, using 62 months of data \[Ajello et al., ApJ, \strong{819}, 44 (2016)]
#' \item DF1: The First D3PO Fermi catalog of gamma-ray source candidates, 3106 sources, using 6.5 years of data \[Selig et al., A\&A, \strong{581}, 126 (2015)]
#' \item pulsars: Fermi LAT List of Detected Pulsars [https://confluence.slac.stanford.edu/display/GLAMCOG/Public+List+of+LAT-Detected+Gamma-Ray+Pulsars], 253 gamma-ray pulsars, last updated 2020-04-16
#'}
#'
#' For more details on any of these data sets, type 'help(dataset)' or go to the Fermi Science Support Center (FSSC) web page (\url{http://fermi.gsfc.nasa.gov/ssc/data/access/}).
#' You can also contact me directly with your questions.
#' @docType package
#' @name fermicatsR2
#' @author Niall Coffey (\email{niallcoffey@@uchicago.edu})
#' @examples
#' # Variability index vs Curvature significance of 2FGL sources, color-coded by source class
#' data(FGL2)
#' if (require("ggplot2")) {
#' qplot(log(Signif_Curve), log(Variability_Index), data = FGL2, color = CLASS1)
#' }
#' # Distribution of spindown luminosities of LAT-detected gamma-ray pulsars
#' data(pulsars)
#' hist(log10(pulsars$Edot),
#' xlab = "Log(Spindown Luminosity) (erg/s)",
#' ylab = "Number of pulsars",
#' main = "LAT-Detected Gamma-ray Pulsars")
NULL

#' 0FGL Catalog (Fermi Large Area Telescope Bright Gamma-ray Source List)
#'
#' Fermi Large Area Telescope Bright Gamma-ray Source List (0FGL).
#' Abdo, A. A. et al., The Astrophysical Journal Supplement Series, 183, 46 (2009).
#'
#'FITS Filename: gll_psc3month_BSL_v2.fit
#'
#' @format A data frame with 21 variables on 205 gamma-ray sources.
#' @section Fields:
#' \describe{
#' \item{\code{Source_Name}}{0FGL JHHMM.m+DDMM, constructed according to IAU Specifications for Nomenclature;
#' m is decimal minutes of R.A.; in the name R.A. and decl. are truncated at 0.1 decimal minutes and 1' , respectively}
#' \item{RA}{Right Ascension, J2000, deg, 3 decimal places}
#' \item{DEC}{Declination, J2000, deg, 3 decimal places}
#' \item{GLON}{Galactic Longitude, deg, 3 decimal places}
#' \item{GLAT}{Galactic Latitude, deg, 3 decimal places}
#' \item{Conf_95_Radius}{Radius of 95\% confidence region, deg, 3 decimal places}
#' \item{Sqrt_TS}{Square root of likelihood TS from 200 MeV - 100 GeV analysis, used for the TS > 100 cut, 1 decimal place}
#' \item{Flux_100_1000}{Flux 100 MeV to 1 GeV (i.e., log_10 E = 2-3), 10^{-8} cm^{-2} s^{-1}, 2 decimal places}
#' \item{Unc_Flux100_1000}{1 sigma uncertainty on F_23, same units and precision. A 0 in this column indicates that the entry in the F_23 flux column is an upper limit.}
#' \item{Flux1000_100000}{Flux for 1 GeV to 100 GeV (i.e., log_10 E = 3-5), 10^{-8} cm^{-2} s^{-1}, 2 decimal places}
#' \item{Unc_Flux1000_100000}{1 sigma uncertainty on F_35, same units and precision.}
#' \item{Variability_Flag}{T indicates < 1\% chance of being a steady source on a weekly timescale}
#' \item{Sqrt_TS23}{Square root of TS for the 100 MeV to 1 GeV range, 1 decimal place}
#' \item{Sqrt_TS35}{Square root of TS for the 1 GeV to 100 GeV range, 1 decimal place}
#' \item{ASSOC_GAM1}{Identification or positional associations with 3EG, EGR, or AGILE sources}
#' \item{ASSOC_GAM2}{Identification or positional associations with 3EG, EGR, or AGILE sources}
#' \item{ASSOC_GAM3}{Identification or positional associations with 3EG, EGR, or AGILE sources}
#' \item{CLASS1}{Class designation for associated source. Capital letters indicate firm identifications;
#' lower-case letters indicate associations: Pulsar (PSR), Pulsar wind nebula (pwn), High-mass X-ray binary (hxb),
#' BL Lac type of blazar (bzb), FSRQ type of blazar (bzq), Uncertain type of blazar (bzu), Radio galaxy (rdg),
#' Globular cluster (glb), Special case - potential association with SNR or PWN (x), Unassociated (  ).}
#' \item{CLASS2}{2nd class designation for associated source}
#' \item{ASSOC1}{Name of identified or likely associated source}
#' \item{ASSOC2}{Alternate name of identified or likely associated source}
#' }
#' @source \url{http://heasarc.gsfc.nasa.gov/W3Browse/fermi/fermilbsl.html}
"FGL0"

#' 1FGL Catalog (Fermi Large Area Telescope First Source Catalog)
#'
#' Fermi Large Area Telescope First Source Catalog (1FGL).
#' Abdo, A. A. et al., The Astrophysical Journal Supplement Series, 188, 405 (2010).
#'
#' Initial Release: 14 Jan 2010
#' Latest Release: gll_psc_v03.fit (9 February 2010)
#'
#' @format A data frame with 89 variables on 1451 gamma-ray sources.
#' @section Fields:
#' \describe{
#' \item{Source_Name}{1FGL JHHMM.m+DDMM[c], constructed according to IAU Specifications for Nomenclature;
#' m is decimal minutes of R.A.; in the name R.A. and decl. are truncated at 0.1 decimal minutes and 1' ,
#' respectively; 'c' indicates that based on the region of the sky the source is considered to be potentially confused with Galactic diffuse emission}
#' \item{RA}{Right Ascension, J2000, deg, three decimal places}
#' \item{DEC}{Declination, J2000, deg, three decimal places}
#' \item{GLON}{Galactic longitude, deg, three decimal places}
#' \item{GLAT}{Galactic latitude, deg, three decimal places}
#' \item{Conf_68_SemiMajor}{Semimajor radius of 68\% confidence region, deg, three decimal places}
#' \item{Conf_68_SemiMinor}{Semiminor radius of 68\% confidence region, deg, three decimal places}
#' \item{Conf_68_PosAng}{Position angle of 68\% confidence region, deg. east of north, 0 decimal places}
#' \item{Conf_95_SemiMajor}{Semimajor radius of 95\% confidence region, deg, three decimal places}
#' \item{Conf_95_SemiMinor}{Semiminor radius of 95\% confidence region, deg, three decimal places}
#' \item{Conf_95_PosAng}{Position angle of 95\% confidence region, deg. east of north, 0 decimal places}
#' \item{Signif_Avg}{Significance derived from likelihood TS for 100 MeV\342\200\223100 GeV analysis, one decimal place}
#' \item{Pivot_Energy}{Energy at which error on differential flux is minimal, in MeV}
#' \item{Flux_density}{Differential flux at Pivot_Energy, in cm^{-2} MeV^{-1} s^{-1}}
#' \item{Unc_Flux_Density}{1 sigma error on differential flux at Pivot_Energy, in cm^{-2} MeV^{-1} s^{-1}}
#' \item{Spectral_Index}{Best-fit power-law slope}
#' \item{Unc_Spectral_Index}{1 sigma error on best-fit power-law slope}
#' \item{Flux1000}{Integral flux from 1 to 100 GeV, in cm^{-2} s^{-1}}
#' \item{Unc_Flux1000}{1 sigma error on integral flux from 1 to 100 GeV, in cm^{-2} s^{-1}}
#' \item{Energy_Flux}{Energy flux from 100 MeV to 100 GeV, in erg cm^{-2} s^{-1}}
#' \item{Unc_Energy_Flux}{1 sigma error on energy flux from 100 MeV to 100 GeV, in erg cm^{-2} s^{-1}}
#' \item{Curvature_Index}{Measure of how spectrum follows power law (currently simple chi-squared)}
#' \item{Flux30_100}{Integral flux from 30 to 100 MeV (not filled)}
#' \item{Unc_Flux30_100}{1 sigma error on integral flux from 30 to 100 MeV (not filled)}
#' \item{Sqrt_TS30_100}{Square root of the TS between 30 and 100 MeV (not filled)}
#' \item{Flux100_300}{Integral flux from 100 to 300 MeV, in cm^{-2} s^{-1}}
#' \item{Unc_Flux100_300}{1 sigma error on integral flux from 100 to 300 MeV, in cm^{-2} s^{-1}}
#' \item{Sqrt_TS100_300}{Square root of the TS between 100 to 300 MeV}
#' \item{Flux300_1000}{Integral flux from 100 to 300 MeV, in cm^{-2} s^{-1}}
#' \item{Unc_Flux300_1000}{1 sigma error on integral flux from 300 MeV to 1 GeV, in cm^{-2} s^{-1}}
#' \item{Sqrt_TS300_1000}{Square root of the TS between 300 MeV to 1 GeV}
#' \item{Flux1000_3000}{Integral flux from 1 to 3 GeV, in cm^{-2} s^{-1}}
#' \item{Unc_Flux1000_3000}{1 sigma error on integral flux from 1 to 3 GeV, in cm^{-2} s^{-1}}
#' \item{Sqrt_TS1000_3000}{Square root of the TS between 1 to 3 GeV}
#' \item{Flux3000_10000}{Integral flux from 3 to 10 GeV, in cm^{-2} s^{-1}}
#' \item{Unc_Flux3000_10000}{1 sigma error on integral flux from 3 to 10 GeV, in cm^{-2} s^{-1}}
#' \item{Sqrt_TS3000_10000}{Square root of the TS between 3 to 10 GeV}
#' \item{Flux10000_100000}{Integral flux from 10 to 100 GeV, in cm^{-2} s^{-1}}
#' \item{Unc_Flux10000_100000}{1 sigma error on integral flux from 10 to 100 GeV, in cm^{-2} s^{-1}}
#' \item{Sqrt_TS10000_100000}{Square root of the TS between 10 to 100 GeV}
#' \item{Variability_Index}{Measure of source variability (currently simple chi-squared)}
#' \item{Signif_Peak}{Source significance in peak interval in sigma units}
#' \item{Flux_Peak}{Peak integral flux from 100 MeV to 100 GeV, in cm^{-2} s^{-1}}
#' \item{Unc_Flux_Peak}{1 sigma error on peak integral flux, in cm^{-2} s^{-1}}
#' \item{Time_Peak}{Time of center of interval in which peak flux was measured}
#' \item{Peak_Interval}{Length of interval in which peak flux was measured}
#' \item{Flux_History.1 ... Flux_History.11}{Integral flux from 100 MeV to 100 GeV in time interval 1 ... 11, in cm^{-2} s^{-1}}
#' \item{Unc_Flux_History.1 ... Unc_Flux_History.11}{Error on the integral flux from 100 MeV to 100 GeV in time interval 1 ... 11, in cm^{-2} s^{-1}, using the method indicated in Unc_Flag_History column and added in quatrature with 3\% systematic component.}
#' \item{Unc_Flag_History.1 ... Unc_Flag_History.11}{1 if it is half of the difference between the 2 sigma upper limit and the maximum likelihood value given in Flux_History; 0 if it is the 1 sigma uncertainty derived from a significant detection in the interval.}
#' \item{X0FGL_Name}{Name of the corresponding 0FGL source, if any}
#' \item{ASSOC_GAM1}{Identification or positional associations with AGILE source}
#' \item{ASSOC_GAM2}{Identification or positional associations with 3EG source}
#' \item{ASSOC_GAM3}{Identification or positional associations with EGR source}
#' \item{TEVCAT_FLAG}{Positional association with a TeVCat source, P for angular size < 40', E for extended, N if no TeV association}
#' \item{CLASS1}{Class designation for most likely association. Capital letters indicate firm identifications;
#' lower-case letters indicate associations: Pulsar (PSR), Pulsar wind nebula (PWN), Supernova remnant (SNR), Globular cluster (GLC),
#' Micro-quasar object (MQO), High-mass binary (HXB), Blazar of the BL Lac type (BZB), Blazar of the FSRQ type (BZQ),
#' Non-blazar active galaxy (AGN), Active galaxy of uncertain type (AGU), Normal galaxy (GAL), Starburst galaxy (SBG),
#' Unassociated source (  ).}
#' \item{CLASS2}{2nd class designation for associated source.}
#' \item{ASSOC1}{Name of identified or likely associated source.}
#' \item{ASSOC2}{Alternate name of identified or likely associated source.}
#' \item{Flags}{Binary coding. See Table 4 of 1FGL paper for the definition of the various Analysis Flags.}
#' }
#' @source \url{http://fermi.gsfc.nasa.gov/ssc/data/access/lat/1yr_catalog/}
"FGL1"

#' 2FGL Catalog (Fermi Large Area Telescope Second Source Catalog)
#'
#' Fermi Large Area Telescope Second Source Catalog (2FGL).
#' Nolan, P. L. et al., The Astrophysical Journal Supplement Series, 199, 31 (2012).
#'
#' Initial Release: 11 July 2011
#' Latest Release: gll_psc_v09.fit (18 May 2015)
#'
#' @format A data frame with 137 variables on 1873 gamma-ray sources.
#' @section Fields:
#' \describe{
#' \item{Source_Name}{2FGL JHHMM.m+DDMM[c/e], constructed according to IAU Specifications for Nomenclature;
#' m is decimal minutes of R.A.; in the name R.A. and decl. are truncated at 0.1 decimal minutes and 1' ,
#' respectively; 'c' indicates that based on the region of the sky the source is considered to be potentially confused with
#' Galactic diffuse emission; e indicates a source that was modeled as spatially extended (see Section 3.4 of 2FGL paper)}
#' \item{RAJ2000}{Right Ascension, J2000, deg, three decimal places}
#' \item{DEJ2000}{Declination, J2000, deg, three decimal places}
#' \item{GLON}{Galactic longitude, deg, three decimal places}
#' \item{GLAT}{Galactic latitude, deg, three decimal places}
#' \item{Conf_68_SemiMajor}{Semimajor radius of 68\% confidence region, deg, three decimal places}
#' \item{Conf_68_SemiMinor}{Semiminor radius of 68\% confidence region, deg, three decimal places}
#' \item{Conf_68_PosAng}{Position angle of 68\% confidence region, deg. east of north, 0 decimal places}
#' \item{Conf_95_SemiMajor}{Semimajor radius of 95\% confidence region, deg, three decimal places}
#' \item{Conf_95_SemiMinor}{Semiminor radius of 95\% confidence region, deg, three decimal places}
#' \item{Conf_95_PosAng}{Position angle of 95\% confidence region, deg. east of north, 0 decimal places}
#' \item{Signif_Avg}{Significance derived from likelihood TS for 100 MeV\342\200\223100 GeV analysis, one decimal place}
#' \item{Pivot_Energy}{Energy at which error on differential flux is minimal, in MeV}
#' \item{Flux_density}{Differential flux at Pivot_Energy, in cm^{-2} MeV^{-1} s^{-1}}
#' \item{Unc_Flux_Density}{1 sigma error on differential flux at Pivot_Energy, in cm^{-2} MeV^{-1} s^{-1}}
#' \item{Spectral_Index}{Best-fit photon number power-law index. For LogParabola spectra, index at Pivot_Energy; for PLExpCutoff spectra, low-energy index.}
#' \item{Unc_Spectral_Index}{1 sigma error on Spectral_Index}
#' \item{Flux1000}{Integral flux from 1 to 100 GeV, in cm^{-2} s^{-1}}
#' \item{Unc_Flux1000}{1 sigma error on integral flux from 1 to 100 GeV, in cm^{-2} s^{-1}}
#' \item{Energy_Flux100}{Energy flux from 100 MeV to 100 GeV obtained by spectral fitting, in erg cm^{-2} s^{-1}}
#' \item{Unc_Energy_Flux}{1 sigma error on energy flux from 100 MeV to 100 GeV, in erg cm^{-2} s^{-1}}
#' \item{Signif_Curve}{Significance (in sigma units) of the fit improvement between power-law and either LogParabola (for ordinary sources) or PLExpCutoff (for pulsars). A value greater than 4 indicates significant curvature.}
#' \item{SpectrumType}{Spectral type (PowerLaw, LogParabola, PLExpCutoff)}
#' \item{beta}{Curvature parameter (Beta) for LogParabola. NULL for other spectral types}
#' \item{Unc_beta}{1 sigma error on Beta for LogParabola. NULL for other spectral types}
#' \item{Cutoff}{Cutoff energy as exp(-E/Cutoff) for PLExpCutoff, in MeV. NULL for other spectral types.}
#' \item{Unc_Cutoff}{1 sigma error on cutoff energy for PLExpCutoff, in MeV. NULL for other spectral types.}
#' \item{PowerLaw_Index}{Best-fit power-law index. Equal to Spectral_Index if SpectrumType is PowerLaw.}
#' \item{Flux30_100}{Integral flux from 30 to 100 MeV (not filled)}
#' \item{Unc_Flux30_100}{1 sigma error on integral flux from 30 to 100 MeV (not filled)}
#' \item{Sqrt_TS30_100}{Square root of the TS between 30 and 100 MeV (not filled)}
#' \item{Flux100_300}{Integral flux from 100 to 300 MeV, in cm^{-2} s^{-1}}
#' \item{Unc_Flux100_300}{1 sigma error on integral flux from 100 to 300 MeV, in cm^{-2} s^{-1}}
#' \item{Sqrt_TS100_300}{Square root of the TS between 100 to 300 MeV}
#' \item{Flux300_1000}{Integral flux from 100 to 300 MeV, in cm^{-2} s^{-1}}
#' \item{Unc_Flux300_1000}{1 sigma error on integral flux from 300 MeV to 1 GeV, in cm^{-2} s^{-1}}
#' \item{Sqrt_TS300_1000}{Square root of the TS between 300 MeV to 1 GeV}
#' \item{Flux1000_3000}{Integral flux from 1 to 3 GeV, in cm^{-2} s^{-1}}
#' \item{Unc_Flux1000_3000}{1 sigma error on integral flux from 1 to 3 GeV, in cm^{-2} s^{-1}}
#' \item{Sqrt_TS1000_3000}{Square root of the TS between 1 to 3 GeV}
#' \item{Flux3000_10000}{Integral flux from 3 to 10 GeV, in cm^{-2} s^{-1}}
#' \item{Unc_Flux3000_10000}{1 sigma error on integral flux from 3 to 10 GeV, in cm^{-2} s^{-1}}
#' \item{Sqrt_TS3000_10000}{Square root of the TS between 3 to 10 GeV}
#' \item{Flux10000_100000}{Integral flux from 10 to 100 GeV, in cm^{-2} s^{-1}}
#' \item{Unc_Flux10000_100000}{1 sigma error on integral flux from 10 to 100 GeV, in cm^{-2} s^{-1}}
#' \item{Sqrt_TS10000_100000}{Square root of the TS between 10 to 100 GeV}
#' \item{Variability_Index}{Sum of 2xLog(Likelihood) comparison between the flux fitted in 24 time segments and a flat light curve over the full two-year catalog interval. A value greater than 41.64 indicates < 1\% chance of being a steady source. }
#' \item{Signif_Peak}{Source significance in peak interval in sigma units}
#' \item{Flux_Peak}{Peak integral flux from 100 MeV to 100 GeV, in cm^{-2} s^{-1}}
#' \item{Unc_Flux_Peak}{1 sigma error on peak integral flux, in cm^{-2} s^{-1}}
#' \item{Time_Peak}{Time of center of interval in which peak flux was measured}
#' \item{Peak_Interval}{Length of interval in which peak flux was measured}
#' \item{Flux_History.1 ... Flux_History.24}{Integral flux from 100 MeV to 100 GeV in time interval 1 ... 24, in cm^{-2} s^{-1}}
#' \item{Unc_Flux_History.1 ... Unc_Flux_History.24}{Error on the integral flux from 100 MeV to 100 GeV in time interval 1 ... 24, in cm^{-2} s^{-1}, using the method indicated in Unc_Flag_History column and added in quatrature with 3\% systematic component.}
#' \item{Unc_Flag_History.1 ... Unc_Flag_History.24}{1 if it is half of the difference between the 2 sigma upper limit and the maximum likelihood value given in Flux_History; 0 if it is the 1 sigma uncertainty derived from a significant detection in the interval.}
#' \item{Extended_Source_Name}{Cross-reference to the ExtendedSources extension for extended sources, if any.}
#' \item{0FGL_Name}{Name of the corresponding 0FGL source, if any.}
#' \item{1FGL Name}{Name of the corresponding 1FGL source, if any.}
#' \item{ASSOC_GAM1}{Identification or positional associations with AGILE (1AGL)source}
#' \item{ASSOC_GAM2}{Identification or positional associations with 3EG source}
#' \item{ASSOC_GAM3}{Identification or positional associations with EGR source}
#' \item{TEVCAT_FLAG}{Positional association with a TeVCat source, P for angular size < 40', E for extended, N if no TeV association}
#' \item{ASSOC_TEV}{Name of likely corresponding TeV source from TevCat.}
#' \item{CLASS1}{Class designation for most likely association. Capital letters indicate firm identifications; lower-case letters indicate associations:
#' Pulsar, identified by pulsations (PSR), Pulsar, no pulsations seen in LAT yet (psr), Pulsar wind nebula (PWN), Supernova remnant (SNR), Supernova remnant/pulsar wind nebula (spp),
#' Globular cluster (glc), High-mass binary (HMB), Nova (NOV), Blazar of the BL Lac type (BZB), Blazar of the FSRQ type (BZQ), Non-blazar active galaxy (AGN), Radio galaxy (RDG),
#' Seyfert galaxy (SEY), Active galaxy of uncertain type (AGU), Normal galaxy (GAL), Starburst galaxy (sbg), Unassociated source (  ).}
#' \item{CLASS2}{2nd class designation for associated source.}
#' \item{ASSOC1}{Name of identified or likely associated source.}
#' \item{ASSOC2}{Alternate name of identified or likely associated source.}
#' \item{Flags}{Binary coding. See Table 3 of 2FGL paper for the definition of the various Analysis Flags.}
#' }
#' @source \url{http://fermi.gsfc.nasa.gov/ssc/data/access/lat/2yr_catalog/}
"FGL2"

#' 3FGL Catalog (Fermi Large Area Telescope Third Source Catalog)
#'
#' Fermi Large Area Telescope Second Source Catalog (3FGL).
#' Acero, F. et al., The Astrophysical Journal Supplement Series, 218, 23 (2015).
#'
#'  Initial Release: 9 January 2015
#'  Latest Release: gll_psc_v16.fit (18 May 2015)
#'
#' @format A data frame with 224 variables on 3034 gamma-ray sources.
#' @section Fields:
#' \describe{
#' \item{Source_Name}{3FGL JHHMM.m+DDMM[c/e], constructed according to IAU Specifications for Nomenclature;
#' m is decimal minutes of R.A.; in the name R.A. and decl. are truncated at 0.1 decimal minutes and 1' ,
#' respectively; 'c' indicates that based on the region of the sky the source is considered to be potentially confused with
#' Galactic diffuse emission; e indicates a source that was modeled as spatially extended (see Section 3.4 of 2FGL paper)}
#' \item{RAJ2000}{Right Ascension, J2000, deg, three decimal places}
#' \item{DEJ2000}{Declination, J2000, deg, three decimal places}
#' \item{GLON}{Galactic longitude, deg, three decimal places}
#' \item{GLAT}{Galactic latitude, deg, three decimal places}
#' \item{Conf_68_SemiMajor}{Semimajor radius of 68\% confidence region, deg, three decimal places}
#' \item{Conf_68_SemiMinor}{Semiminor radius of 68\% confidence region, deg, three decimal places}
#' \item{Conf_68_PosAng}{Position angle of 68\% confidence region, deg. east of north, 0 decimal places}
#' \item{Conf_95_SemiMajor}{Semimajor radius of 95\% confidence region, deg, three decimal places}
#' \item{Conf_95_SemiMinor}{Semiminor radius of 95\% confidence region, deg, three decimal places}
#' \item{Conf_95_PosAng}{Position angle of 95\% confidence region, deg. east of north, 0 decimal places}
#' \item{ROI_num}{ROI number (cross-reference to ROIs extension)}
#' \item{Signif_Avg}{Source significance (in sigma units) derived from likelihood TS for 100 MeV\342\200\223300 GeV analysis, one decimal place}
#' \item{Pivot_Energy}{Energy at which error on differential flux is minimal, in MeV}
#' \item{Flux_density}{Differential flux at Pivot_Energy, in cm^{-2} MeV^{-1} s^{-1}}
#' \item{Unc_Flux_Density}{1 sigma error on differential flux at Pivot_Energy, in cm^{-2} MeV^{-1} s^{-1}}
#' \item{Spectral_Index}{Best-fit photon number power-law index: For LogParabola spectra, index at Pivot_Energy; for PLExpCutoff spectra, low-energy index.}
#' \item{Unc_Spectral_Index}{1 sigma error on Spectral_Index}
#' \item{Flux1000}{Integral flux from 1 to 100 GeV, in cm^{-2} s^{-1}}
#' \item{Unc_Flux1000}{1 sigma error on integral flux from 1 to 100 GeV, in cm^{-2} s^{-1}}
#' \item{Energy_Flux100}{Energy flux from 100 MeV to 100 GeV obtained by spectral fitting, in erg cm^{-2} s^{-1}}
#' \item{Unc_Energy_Flux}{1 sigma error on energy flux from 100 MeV to 100 GeV, in erg cm^{-2} s^{-1}}
#' \item{Signif_Curve}{Significance (in sigma units) of the fit improvement between power-law and either LogParabola (for ordinary sources) or PLExpCutoff (for pulsars). A value greater than 4 indicates significant curvature.}
#' \item{SpectrumType}{Spectral type (PowerLaw, LogParabola, PLExpCutoff, PLSuperExpCutoff)}
#' \item{beta}{Curvature parameter (Beta) for LogParabola. NULL for other spectral types}
#' \item{Unc_beta}{1 sigma error on Beta for LogParabola. NULL for other spectral types}
#' \item{Cutoff}{Cutoff energy (E_c for equation 2 of 3FGL paper) for PL(Super)ExpCutoff, in MeV. NULL for other spectral types.}
#' \item{Unc_Cutoff}{1 sigma error on cutoff energy for PLExpCutoff, in MeV. NULL for other spectral types.}
#' \item{Exp_Index}{Exponential index (b of Equation 2 of 3FGL paper) for PLSuperExpCutoff. NULL for other spectral types}
#' \item{PowerLaw_Index}{Best-fit power-law index. Equal to Spectral_Index if SpectrumType is PowerLaw.}
#' \item{Flux30_100}{Integral flux from 30 to 100 MeV (not filled)}
#' \item{Unc_Flux30_100}{1 sigma error on integral flux from 30 to 100 MeV (not filled)}
#' \item{nuFnu30_100}{Spectral energy distribution between 30 and 100 MeV (not filled)}
#' \item{Sqrt_TS30_100}{Square root of the TS between 30 and 100 MeV (not filled)}
#' \item{Flux100_300}{Integral flux from 100 to 300 MeV, in cm^{-2} s^{-1}}
#' \item{Unc_Flux100_300}{1 sigma error on integral flux from 100 to 300 MeV, in cm^{-2} s^{-1}}
#' \item{nuFnu100_300}{Spectral energy distribution between 100 and 300 MeV, in erg cm^{-2} s^{-1}}
#' \item{Sqrt_TS100_300}{Square root of the TS between 100 to 300 MeV}
#' \item{Flux300_1000}{Integral flux from 100 to 300 MeV, in cm^{-2} s^{-1}}
#' \item{Unc_Flux300_1000}{1 sigma error on integral flux from 300 MeV to 1 GeV, in cm^{-2} s^{-1}}
#' \item{nuFnu300_1000}{Spectral energy distribution between 300 and 1 GeV, in erg cm^{-2} s^{-1}}
#' \item{Sqrt_TS300_1000}{Square root of the TS between 300 MeV to 1 GeV}
#' \item{Flux1000_3000}{Integral flux from 1 to 3 GeV, in cm^{-2} s^{-1}}
#' \item{Unc_Flux1000_3000}{1 sigma error on integral flux from 1 to 3 GeV, in cm^{-2} s^{-1}}
#' \item{nuFnu1000_3000}{Spectral energy distribution between 1 and 3 GeV, in erg cm^{-2} s^{-1}}
#' \item{Sqrt_TS1000_3000}{Square root of the TS between 1 to 3 GeV}
#' \item{Flux3000_10000}{Integral flux from 3 to 10 GeV, in cm^{-2} s^{-1}}
#' \item{Unc_Flux3000_10000}{1 sigma error on integral flux from 3 to 10 GeV, in cm^{-2} s^{-1}}
#' \item{nuFnu3000_10000}{Spectral energy distribution between 3 and 10 GeV, in erg cm^{-2} s^{-1}}
#' \item{Sqrt_TS3000_10000}{Square root of the TS between 3 to 10 GeV}
#' \item{Flux10000_100000}{Integral flux from 10 to 100 GeV, in cm^{-2} s^{-1}}
#' \item{Unc_Flux10000_100000}{1 sigma error on integral flux from 10 to 100 GeV, in cm^{-2} s^{-1}}
#' \item{nuFnu10000_100000}{Spectral energy distribution between 10 and 100 GeV, in erg cm^{-2} s^{-1}}
#' \item{Sqrt_TS10000_100000}{Square root of the TS between 10 to 100 GeV}
#' \item{Variability_Index}{Sum of 2xLog(Likelihood) comparison between the flux fitted in 48 time segments and the average flux over the full catalog interval. A value greater than 72.44 over 48 intervals indicates < 1\% chance of being a steady source. }
#' \item{Signif_Peak}{Source significance in peak interval in sigma units}
#' \item{Flux_Peak}{Peak integral flux from 100 MeV to 100 GeV, in cm^{-2} s^{-1}}
#' \item{Unc_Flux_Peak}{1 sigma error on peak integral flux, in cm^{-2} s^{-1}}
#' \item{Time_Peak}{Time of center of interval in which peak flux was measured, in MET s}
#' \item{Peak_Interval}{Length of interval in which peak flux was measured}
#' \item{Flux_History.1 ... Flux_History.48}{Integral flux from 100 MeV to 100 GeV in time interval 1 ... 48, in cm^{-2} s^{-1}}
#' \item{Unc_Flux_History.1 ... Unc_Flux_History.48}{Error on the integral flux from 100 MeV to 100 GeV in time interval 1 ... 48, in cm^{-2} s^{-1}, using the method indicated in Unc_Flag_History column and added in quatrature with 3\% systematic component.}
#' \item{Unc_Flag_History.1 ... Unc_Flag_History.48}{1 if it is half of the difference between the 2 sigma upper limit and the maximum likelihood value given in Flux_History; 0 if it is the 1 sigma uncertainty derived from a significant detection in the interval.}
#' \item{Extended_Source_Name}{Cross-reference to the ExtendedSources extension for extended sources, if any.}
#' \item{X0FGL_Name}{Name of the corresponding 0FGL source, if any.}
#' \item{X1FGL Name}{Name of the corresponding 1FGL source, if any.}
#' \item{X2FGL Name}{Name of the corresponding 2FGL source, if any.}
#' \item{X1FHL Name}{Name of the corresponding 1FHL source, if any.}
#' \item{ASSOC_GAM1}{Identification or positional associations with AGILE (1AGL)source}
#' \item{ASSOC_GAM2}{Identification or positional associations with 3EG source}
#' \item{ASSOC_GAM3}{Identification or positional associations with EGR source}
#' \item{TEVCAT_FLAG}{Positional association with a TeVCat source, P for angular size < 40', E for extended, N if no TeV association}
#' \item{ASSOC_TEV}{Name of likely corresponding TeV source from TevCat.}
#' \item{CLASS1}{Class designation for most likely association. Capital letters indicate firm identifications; lower-case letters indicate associations:
#' Pulsar, identified by pulsations (PSR), Pulsar, no pulsations seen in LAT yet (psr), Pulsar wind nebula (PWN), Supernova remnant (SNR), Supernova remnant/pulsar wind nebula (spp),
#' Globular cluster (glc), High-mass binary (HMB), Binary (BIN), Nova (NOV), Star-forming region (SFR), Compact Steep Spectrum Quasar (css), Blazar of the BL Lac type (BLL), Blazar of the FSRQ type (FSRQ), Non-blazar active galaxy (AGN),
#' Radio galaxy (RDG), Seyfert galaxy (SEY), Blazar candidate of uncertain type (BCU), Normal galaxy (GAL), Starburst galaxy (sbg),
#' Narrow line Seyfert 1 (NLSY1), Soft spectrum radio quasar (ssrq), Unassociated source (  ).}
#' \item{CLASS2}{2nd class designation for associated source.}
#' \item{ASSOC1}{Name of identified or likely associated source.}
#' \item{ASSOC2}{Alternate name of identified or likely associated source.}
#' \item{Flags}{Binary coding. See Table 3 of 3FGL paper for the definition of the various Analysis Flags.}
#' }
#' @source \url{http://fermi.gsfc.nasa.gov/ssc/data/access/lat/4yr_catalog/}
"FGL3"

#' 4FGL Catalog (Fourth Fermi Large Area Telescope Source Catalog)
#'
#' Fermi Large Area Telescope Source Catalog (4FGL).
#' Abdollahi, S. et al., The Astrophysical Journal Supplement Series, 247, 33 (2020).
#'
#'  Initial Release: 25 February 2019
#'  Latest Release: gll_psc_v22.fit (27 May 2020)
#'
#' @format A data frame with 333 variables on 5065 gamma-ray sources.
#' @section Fields:
#' \describe{
#' \item{Source_Name}{4FGL JHHMM.m+DDMM[c/e], constructed according to IAU Specifications for Nomenclature;
#' m is decimal minutes of R.A.; in the name R.A. and decl. are truncated at 0.1 decimal minutes and 1' ,
#' respectively; 'c' indicates that based on the region of the sky the source is considered to be potentially confused with
#' Galactic diffuse emission; e indicates a source that was modeled as spatially extended (see Table 12 of 4FGL paper)}
#' \item{RAJ2000}{Right Ascension, J2000, deg}
#' \item{DEJ2000}{Declination, J2000, deg}
#' \item{GLON}{Galactic longitude, deg}
#' \item{GLAT}{Galactic latitude, deg}
#' \item{Conf_68_SemiMajor}{Long radius of error ellipse at 68\% confidence, deg}
#' \item{Conf_68_SemiMinor}{Short radius of error ellipse at 68\% confidence, deg}
#' \item{Conf_68_PosAng}{Position angle of the 68\% confidence ellipse, deg east of north}
#' \item{Conf_95_SemiMajor}{Long radius of error ellipse at 95\% confidence, deg}
#' \item{Conf_95_SemiMinor}{Short radius of error ellipse at 95\% confidence, deg}
#' \item{Conf_95_PosAng}{Position angle of (eastward) of the long axis from celestial North, deg}
#' \item{ROI_num}{ROI number (cross-reference to ROIs extension)}
#' \item{Extended_Source_Name}{Cross-reference to the ExtendedSources extension}
#' \item{Signif_Avg}{Source significance (in sigma units) derived from likelihood TS for 100 MeV\342\200\223300 GeV analysis, one decimal place}
#' \item{Pivot_Energy}{Energy at which error on differential flux is minimal, MeV}
#' \item{Flux1000}{Integral flux from 1 to 100 GeV, cm^{-2} s^{-1}}
#' \item{Unc_Flux1000}{1 sigma error on integral flux from 1 to 100 GeV, cm^{-2} s^{-1}}
#' \item{Energy_Flux100}{Energy flux from 100 MeV to 100 GeV obtained by spectral fitting, erg cm^{-2} s^{-1}}
#' \item{Unc_Energy_Flux100}{1 sigma error on energy flux from 100 MeV to 100 GeV, erg cm^{-2} s^{-1}}
#' \item{SpectrumType}{Spectral type (PowerLaw, LogParabola, PLExpCutoff, PLSuperExpCutoff)}
#' \item{PL_Flux_Density}{Differential flux at Pivot_Energy in PowerLaw fit, cm^{-2} MeV^{-1} s^{-1}}
#' \item{Unc_PL_Flux_Density}{1 sigma error on PL_Flux_Density, cm^{-2} MeV^{-1} s^{-1}}
#' \item{PL_Index}{Photon index when fitting with PowerLaw}
#' \item{Unc_PL_Index}{1 sigma error on PL_Index}
#' \item{LP_Flux_Density}{Differential flux at Pivot_Energy in LogParabola fit, cm^{-2} MeV^{-1} s^{-1}}
#' \item{Unc_LP_Flux_Density}{1 sigma error on LP_Flux_Density, cm^{-2} MeV^{-1} s^{-1}}
#' \item{LP_Index}{Photon index at Pivot_Energy (alpha of Eq. 2) when fitting with LogParabola}
#' \item{Unc_LP_Index}{1 sigma error on LP_Index}
#' \item{LP_beta}{Curvature parameter (beta of Eq. 2) when fitting with LogParabola}
#' \item{Unc_LP_beta}{1 sigma error on LP_beta}
#' \item{LP_SigCurv}{Significance (in sigma units) of the fit improvement between PowerLaw and LogParabola. A value greater than 4 indicates significant curvature}
#' \item{PLEC_Flux_Density}{Differential flux at Pivot_Energy in PLSuperExpCutoff fit, cm^{-2} MeV^{-1} s^{-1}}
#' \item{Unc_PLEC_Flux_Density}{1 sigma error on PLEC_Flux_Density, cm^{-2} MeV^{-1} s^{-1}}
#' \item{PLEC_Index}{Low-energy photon index (gamma of Eq. 4) when fitting with PLSuperExpCutoff}
#' \item{Unc_PLEC_Index}{1 sigma error on PLEC_Index}
#' \item{PLEC_Expfactor}{Exponential factor (a of Eq. 4) when fitting with PLSuperExpCutoff}
#' \item{Unc_PLEC_Expfactor}{1 sigma error on PLEC_Expfactor}
#' \item{PLEC_Exp_Index}{Exponential index (b of Eq. 4) when fitting with PLSuperExpCutoff}
#' \item{Unc_PLEC_Exp_Index}{1 sigma error on PLEC_Exp_Index}
#' \item{PLEC_SigCurv}{Same as LP_SigCurv for PLSuperExpCutoff model}
#' \item{Npred}{Predicted number of events in the model}
#' \item{Flux_Band}{Integral photon flux in each spectral band, cm^{-2} s^{-1}}
#' \item{Unc_Flux_Band}{1 sigma lower and upper error on Flux_Band, cm^{-2} s^{-1}}
#' \item{nuFnu_Band}{Spectral energy distribution over each spectral band, erg cm^{-2} s^{-1}}
#' \item{Sqrt_TS_Band}{Square root of the Test Statistic in each spectral band}
#' \item{Variability_Index}{Sum of 2*log(Likelihood) difference between the flux fitted in each time interval and the average flux over the full catalog interval; a value greater than 18.48 over 12 intervals indicates <1\% chance of being a steady source}
#' \item{Frac_Variability}{Fractional variability computed from the fluxes in each year}
#' \item{Unc_Frac_Variability}{1 sigma error on fractional variability}
#' \item{Signif_Peak}{Source significance in peak interval in sigma units}
#' \item{Flux_Peak}{Peak integral photon flux from 100 MeV to 100 GeV, cm^{-2} s^{-1}}
#' \item{Unc_Flux_Peak}{1 sigma error on peak integral photon flux, cm^{-2} s^{-1}}
#' \item{Time_Peak}{Time of center of interval in which peak flux was measured, s (MET)}
#' \item{Peak_Interval}{Length of interval in which peak flux was measured, s}
#' \item{Flux_History}{Integral photon flux from 100 MeV to 100 GeV in each year (best fit from likelihood analysis with spectral shape fixed to that obtained over full interval), cm^{-2} s^{-1}}
#' \item{Unc_Flux_History}{1 sigma lower and upper error on integral photon flux in each year, cm^{-2} s^{-1}}
#' \item{Sqrt_TS_History}{Square root of the Test Statistic in each year}
#' \item{Variability2_Index}{Variability_Index over two-month intervals; a value greater than 72.44 over 48 intervals indicates <1% chance of being a steady source}
#' \item{Frac2_Variability}{Fractional variability computed from the fluxes every two months}
#' \item{Unc_Frac2_Variability}{1 sigma error on Frac2_Variability}
#' \item{Signif2_Peak}{Source significance in peak interval in sigma units}
#' \item{Flux2_Peak}{Peak integral photon flux from 100 MeV to 100 GeV, cm^{-2} s^{-1}}
#' \item{Unc_Flux2_Peak}{1 sigma error on peak integral photon flux, cm^{-2} s^{-1}}
#' \item{Time2_Peak}{Time of center of interval in which peak flux was measured, s (MET)}
#' \item{Peak2_Interval}{Length of interval in which peak flux was measured, s}
#' \item{Flux2_History}{Integral photon flux from 100 MeV to 100 GeV in each two-month interval, cm^{-2} s^{-1}}
#' \item{Unc_Flux2_History}{1 sigma lower and upper error on Flux2_History, cm^{-2} s^{-1}}
#' \item{Sqrt_TS2_History}{Square root of the Test Statistic in each two-month interval}
#' \item{ASSOC_FGL}{Most recent correspondence to previous FGL source catalogs, if any}
#' \item{ASSOC_FHL}{Most recent correspondence to previous FHL source catalogs, if any}
#' \item{ASSOC_GAM1}{Name of likely corresponding 2AGL source, if any}
#' \item{ASSOC_GAM2}{Name of likely corresponding 3EG source, if any}
#' \item{ASSOC_GAM3}{Name of likely corresponding EGR source, if any}
#' \item{TEVCAT_FLAG}{P if positional association with non-extended source in TeVCat, E if associated with an extended source in TeVCat, N if no TeV association}
#' \item{ASSOC_TEV}{Name of likely corresponding TeV source from TeVCat, if any}
#' \item{CLASS1}{Class designation for associated source; see Table 7}
#' \item{CLASS2}{Class designation for low-confidence association}
#' \item{ASSOC1}{Name of identified or likely associated source}
#' \item{ASSOC2}{Name of low-confidence association or of enclosing extended source}
#' \item{ASSOC_PROB_BAY}{Probability of association according to the Bayesian method}
#' \item{ASSOC_PROB_LR}{Probability of association according to the Likelihood Ratio method}
#' \item{RA_Counterpart}{Right Ascension of the counterpart ASSOC1, deg}
#' \item{DEC_Counterpart}{Declination of the counterpart ASSOC1, deg}
#' \item{Unc_Counterpart}{95\% precision of the counterpart localization, deg}
#' \item{Flags}{Source flags (binary coding as in Table 5)}
#' }
#' @source \url{http://fermi.gsfc.nasa.gov/ssc/data/access/lat/8yr_catalog/}
"FGL4"

#' 4FGLDR2 Catalog (Fourth Fermi Large Area Telescope Source Catalog, Second Data Release)
#'
#' Fermi Large Area Telescope Source Catalog Second Data Release (4FGLDR2).
#' Ballet, J. et al., arXiv, 2005.11208v1, (2020).
#'
#'  Initial Release: 22 May 2020
#'  Latest Release: gll_psc_v23.fit (22 May 2020)
#'
#' @format A data frame with 142 variables on 5788 gamma-ray sources.
#' @section Fields:
#' \describe{
#' \item{Source_Name}{4FGL JHHMM.m+DDMM[c/e], constructed according to IAU Specifications for Nomenclature;
#' m is decimal minutes of R.A.; in the name R.A. and decl. are truncated at 0.1 decimal minutes and 1' ,
#' respectively; 'c' indicates that based on the region of the sky the source is considered to be potentially confused with
#' Galactic diffuse emission; e indicates a source that was modeled as spatially extended (see Table 12 of 4FGL paper)}
#' \item{RAJ2000}{Right Ascension, J2000, deg}
#' \item{DEJ2000}{Declination, J2000, deg}
#' \item{GLON}{Galactic longitude, deg}
#' \item{GLAT}{Galactic latitude, deg}
#' \item{Conf_68_SemiMajor}{Long radius of error ellipse at 68\% confidence, deg}
#' \item{Conf_68_SemiMinor}{Short radius of error ellipse at 68\% confidence, deg}
#' \item{Conf_68_PosAng}{Position angle of the 68\% confidence ellipse, deg east of north}
#' \item{Conf_95_SemiMajor}{Long radius of error ellipse at 95\% confidence, deg}
#' \item{Conf_95_SemiMinor}{Short radius of error ellipse at 95\% confidence, deg}
#' \item{Conf_95_PosAng}{Position angle of (eastward) of the long axis from celestial North, deg}
#' \item{ROI_num}{ROI number (cross-reference to ROIs extension)}
#' \item{Extended_Source_Name}{Cross-reference to the ExtendedSources extension}
#' \item{Signif_Avg}{Source significance (in sigma units) derived from likelihood TS for 100 MeV\342\200\223300 GeV analysis, one decimal place}
#' \item{Pivot_Energy}{Energy at which error on differential flux is minimal, MeV}
#' \item{Flux1000}{Integral flux from 1 to 100 GeV, cm^{-2} s^{-1}}
#' \item{Unc_Flux1000}{1 sigma error on integral flux from 1 to 100 GeV, cm^{-2} s^{-1}}
#' \item{Energy_Flux100}{Energy flux from 100 MeV to 100 GeV obtained by spectral fitting, erg cm^{-2} s^{-1}}
#' \item{Unc_Energy_Flux100}{1 sigma error on energy flux from 100 MeV to 100 GeV, erg cm^{-2} s^{-1}}
#' \item{SpectrumType}{Spectral type (PowerLaw, LogParabola, PLExpCutoff, PLSuperExpCutoff)}
#' \item{PL_Flux_Density}{Differential flux at Pivot_Energy in PowerLaw fit, cm^{-2} MeV^{-1} s^{-1}}
#' \item{Unc_PL_Flux_Density}{1 sigma error on PL_Flux_Density, cm^{-2} MeV^{-1} s^{-1}}
#' \item{PL_Index}{Photon index when fitting with PowerLaw}
#' \item{Unc_PL_Index}{1 sigma error on PL_Index}
#' \item{LP_Flux_Density}{Differential flux at Pivot_Energy in LogParabola fit, cm^{-2} MeV^{-1} s^{-1}}
#' \item{Unc_LP_Flux_Density}{1 sigma error on LP_Flux_Density, cm^{-2} MeV^{-1} s^{-1}}
#' \item{LP_Index}{Photon index at Pivot_Energy (alpha of Eq. 2) when fitting with LogParabola}
#' \item{Unc_LP_Index}{1 sigma error on LP_Index}
#' \item{LP_beta}{Curvature parameter (beta of Eq. 2) when fitting with LogParabola}
#' \item{Unc_LP_beta}{1 sigma error on LP_beta}
#' \item{LP_SigCurv}{Significance (in sigma units) of the fit improvement between PowerLaw and LogParabola. A value greater than 4 indicates significant curvature}
#' \item{PLEC_Flux_Density}{Differential flux at Pivot_Energy in PLSuperExpCutoff fit, cm^{-2} MeV^{-1} s^{-1}}
#' \item{Unc_PLEC_Flux_Density}{1 sigma error on PLEC_Flux_Density, cm^{-2} MeV^{-1} s^{-1}}
#' \item{PLEC_Index}{Low-energy photon index (gamma of Eq. 4) when fitting with PLSuperExpCutoff}
#' \item{Unc_PLEC_Index}{1 sigma error on PLEC_Index}
#' \item{PLEC_Expfactor}{Exponential factor (a of Eq. 4) when fitting with PLSuperExpCutoff}
#' \item{Unc_PLEC_Expfactor}{1 sigma error on PLEC_Expfactor}
#' \item{PLEC_Exp_Index}{Exponential index (b of Eq. 4) when fitting with PLSuperExpCutoff}
#' \item{Unc_PLEC_Exp_Index}{1 sigma error on PLEC_Exp_Index}
#' \item{PLEC_SigCurv}{Same as LP_SigCurv for PLSuperExpCutoff model}
#' \item{Npred}{Predicted number of events in the model}
#' \item{Flux_Band}{Integral photon flux in each spectral band, cm^{-2} s^{-1}}
#' \item{Unc_Flux_Band}{1 sigma lower and upper error on Flux_Band, cm^{-2} s^{-1}}
#' \item{nuFnu_Band}{Spectral energy distribution over each spectral band, erg cm^{-2} s^{-1}}
#' \item{Sqrt_TS_Band}{Square root of the Test Statistic in each spectral band}
#' \item{Variability_Index}{Sum of 2*log(Likelihood) difference between the flux fitted in each time interval and the average flux over the full catalog interval; a value greater than 18.48 over 12 intervals indicates <1\% chance of being a steady source}
#' \item{Frac_Variability}{Fractional variability computed from the fluxes in each year}
#' \item{Unc_Frac_Variability}{1 sigma error on fractional variability}
#' \item{Signif_Peak}{Source significance in peak interval in sigma units}
#' \item{Flux_Peak}{Peak integral photon flux from 100 MeV to 100 GeV, cm^{-2} s^{-1}}
#' \item{Unc_Flux_Peak}{1 sigma error on peak integral photon flux, cm^{-2} s^{-1}}
#' \item{Time_Peak}{Time of center of interval in which peak flux was measured, s (MET)}
#' \item{Peak_Interval}{Length of interval in which peak flux was measured, s}
#' \item{Flux_History}{Integral photon flux from 100 MeV to 100 GeV in each year (best fit from likelihood analysis with spectral shape fixed to that obtained over full interval), cm^{-2} s^{-1}}
#' \item{Unc_Flux_History}{1 sigma lower and upper error on integral photon flux in each year, cm^{-2} s^{-1}}
#' \item{Sqrt_TS_History}{Square root of the Test Statistic in each year}
#' \item{ASSOC_FGL}{Most recent correspondence to previous FGL source catalogs, if any}
#' \item{ASSOC_FHL}{Most recent correspondence to previous FHL source catalogs, if any}
#' \item{ASSOC_GAM1}{Name of likely corresponding 2AGL source, if any}
#' \item{ASSOC_GAM2}{Name of likely corresponding 3EG source, if any}
#' \item{ASSOC_GAM3}{Name of likely corresponding EGR source, if any}
#' \item{TEVCAT_FLAG}{P if positional association with non-extended source in TeVCat, E if associated with an extended source in TeVCat, N if no TeV association}
#' \item{ASSOC_TEV}{Name of likely corresponding TeV source from TeVCat, if any}
#' \item{CLASS1}{Class designation for associated source; see Table 7}
#' \item{CLASS2}{Class designation for low-confidence association}
#' \item{ASSOC1}{Name of identified or likely associated source}
#' \item{ASSOC2}{Name of low-confidence association or of enclosing extended source}
#' \item{ASSOC_PROB_BAY}{Probability of association according to the Bayesian method}
#' \item{ASSOC_PROB_LR}{Probability of association according to the Likelihood Ratio method}
#' \item{RA_Counterpart}{Right Ascension of the counterpart ASSOC1, deg}
#' \item{DEC_Counterpart}{Declination of the counterpart ASSOC1, deg}
#' \item{Unc_Counterpart}{95\% precision of the counterpart localization, deg}
#' \item{Flags}{Source flags (binary coding as in Table 5)}
#' }
#' @source \url{http://fermi.gsfc.nasa.gov/ssc/data/access/lat/10yr_catalog/}
"FGL4DR2"

#' 1FHL Catalog (First Fermi-LAT Catalog of Sources Above 10 GeV)
#'
#' The First Fermi-LAT Catalog of Sources Above 10 GeV (1FHL).
#' Ackermann, M. et al., The Astrophysical Journal Supplement Series, 209, 34 (2013).
#' FITS Filename: gll_psch_v07.fit, released 29 July 2013.
#'
#' @format A data frame with 39 variables on 514 sources.
#' @section Fields:
#' \describe{
#' \item{Source_Name}{1FHL JHHMM.m+DDMM, constructed according to IAU Specifications for Nomenclature;
#' m is decimal minutes of R.A.; in the name R.A. and decl. are truncated at 0.1 decimal minutes and 1' , respectively}
#' \item{RAJ2000}{Right Ascension, J2000}
#' \item{DEJ2000}{Declination, J2000}
#' \item{GLON}{Galactic longitude, deg.}
#' \item{GLAT}{Galactic latitude, deg.}
#' \item{Conf_95_SemiMajor}{Long radius of error ellipse at 95\% confidence level}
#' \item{Conf_95_SemiMinor}{Short radius of error ellipse at 95\% confidence level}
#' \item{Conf_95_PosAng}{Position angle of the 95\% long axis from celestial north, positive toward increasing RA (eastward)}
#' \item{Signif_Avg}{Source significance in sigma units (derived from TS)}
#' \item{Pivot_Energy}{Energy at which error on differential flux is minimal, in GeV}
#' \item{Flux_Density}{Differential flux at Pivot_Energy, cm^{-2} GeV^{-1} s^{-1}}
#' \item{Unc_Flux_Density}{1 sigma error on differential flux at Pivot_Energy, cm^{-2} GeV^{-1} s^{-1}}
#' \item{Spectral_Index}{Best fit photon number power-law index}
#' \item{Unc_Spectral_Index}{1 sigma error on Spectral_Index}
#' \item{Flux}{Integral photon flux from 10 to 500 GeV, cm^{-2} s^{-1}}
#' \item{Unc_Flux}{1 sigma error on integral photon flux from 10 to 500 GeV, cm^{-2} s^{-1}}
#' \item{Energy_Flux}{Energy flux from 10 to 500 GeV obtained by spectral fitting, erg cm^{-2} s^{-1}}
#' \item{Unc_Energy_Flux}{1 sigma error on energy flux from 10 to 500 GeV, erg cm^{-2} s^{-1}}
#' \item{Flux10_30GeV}{Integral flux from 10 to 30 GeV, cm^{-2} s^{-1}}
#' \item{Unc_Flux10_30GeV.1}{(lower) 1 sigma error on integral flux from 10 to 30 GeV, cm^{-2} s^{-1}, set to NaN if 1 sigma interval contains 0}
#' \item{Unc_Flux10_30GeV.2}{(upper) 1 sigma error on integral flux from 10 to 30 GeV, cm^{-2} s^{-1}}
#' \item{Sqrt_TS10_30GeV}{Square root of Test Statistic between 10 and 30 GeV}
#' \item{Flux30_100GeV}{Integral flux from 30 to 100 GeV, cm^{-2} s^{-1}}
#' \item{Unc_Flux30_100GeV.1}{(lower) 1 sigma error on integral flux from 30 to 100 GeV, cm^{-2} s^{-1}, set to NaN if 1 sigma interval contains 0}
#' \item{Unc_Flux30_100GeV.2}{(upper) 1 sigma error on integral flux from 30 to 100 GeV, cm^{-2} s^{-1}}
#' \item{Sqrt_TS30_100GeV}{Square root of Test Statistic between 30 and 100 GeV}
#' \item{Flux100_500GeV}{Integral flux from 100 to 500 GeV, cm^{-2} s^{-1}}
#' \item{Unc_Flux100_500GeV.1}{(lower) 1 sigma error on integral flux from 100 to 500 GeV, cm^{-2} s^{-1}, set to NaN if 1 sigma interval contains 0}
#' \item{Unc_Flux100_500GeV.2}{(upper) 1 sigma error on integral flux from 100 to 500 GeV, cm^{-2} s^{-1}}
#' \item{Sqrt_TS100_500GeV}{Square root of Test Statistic between 100 and 500 GeV}
#' \item{Variability_BayesBlocks}{Number of Bayesian Blocks found (1 for non-variable)}
#' \item{Extended_Source_Name}{Cross-reference to the Extended Sources extension for extended sources, if any}
#' \item{ASSOC_GAM}{Name of corresponding source in gamma-ray catalog, if any}
#' \item{TEVCAT_FLAG}{P if positional association with non-extended source in TeVCat, E if associated with an extended source in TeVCat,
#' N if no TeV association}
#' \item{ASSOC_TEV}{Name of TeV association, if any}
#' \item{CLASS1}{Class designation for most likely association. Capital letters indicate firm identifications;
#' lower-case letters indicate associations: Blazar of the BL Lac type (BZB), Blazar of the FSRQ type (BZQ),
#' Active galaxy of uncertain type (AGU), Pulsar, identified by pulsations above 10 GeV (HPSR),
#' Pulsar, identified by pulsations in LAT, excluding HPSR (PSR), Pulsar, no pulsations seen in LAT yet (psr),
#' Supernova remnant (SNR), Pulsar wind nebula (PWN), Unclear whether SNR or PWN (spp), Radio galaxy (RDG),
#' High-mass binary (HMB), Normal galaxy (GAL), Star forming region (SFR), LBV star (lbv), Unassociated source (  ).}
#' \item{CLASS2}{Class designation for alternate association, if any}
#' \item{ASSOC1}{Name of identified or most likely associated source}
#' \item{ASSOC2}{Name of alternate association, if any}
#' }
#' @source \url{http://fermi.gsfc.nasa.gov/ssc/data/access/lat/1FHL/}
"FHL1"

#' 2FHL Catalog (Second Catalog of Hard Fermi-LAT Sources)
#'
#' The Second Catalog of Hard Fermi-LAT Sources (2FHL).
#' Ackermann, M. et al., The Astrophysical Journal Supplement Series, 222, 5 (2016).
#' FITS Filename: gll_psch_v09.fit, released 22 Apr 2016.
#'
#' @format A data frame with 43 variables on 360 sources.
#' @section Fields:
#' \describe{
#' \item{Source_Name}{2FHL JHHMM.m+DDMM, constructed according to IAU Specifications for Nomenclature;
#' m is decimal minutes of R.A.; in the name R.A. and decl. are truncated at 0.1 decimal minutes and 1' , respectively. A Source_Name ending with "e" indicates an extended source.}
#' \item{RAJ2000}{Right Ascension, J2000}
#' \item{DEJ2000}{Declination, J2000}
#' \item{GLON}{Galactic longitude, deg.}
#' \item{GLAT}{Galactic latitude, deg.}
#' \item{Pos_err_68}{Position uncertainty at 68\% confidence level}
#' \item{Pos_err_95}{Position uncertainty at 95\% confidence level}
#' \item{TS}{Test Statistic}
#' \item{Spectral_Index}{Best fit photon number power-law index}
#' \item{Unc_Spectral_Index}{1 sigma error on Spectral_Index}
#' \item{Intr_Spectral_Index_D11}{Intrinsic spectral index computed using the Dominguez et al. (2011b) EBL model}
#' \item{Unc_Intr_Spectral_Index_D11}{1 sigma uncertainty on the intrinsic spectral index computed using the Dominguez et al. (2011b) EBL model}
#' \item{Intr_Spectral_Index_G12}{Intrinsic spectral index computed using the Gilmore et al. (2012) EBL model}
#' \item{Unc_Intr_Spectral_Index_G12}{1 sigma uncertainty on the intrinsic spectral index computed using the Gilmore et al. (2012) EBL model}
#' \item{Flux50}{Integral photon flux from 50 GeV to 2 TeV, photon cm^{-2} s^{-1}}
#' \item{Unc_Flux50}{1 sigma uncertainty on integral flux from 50 GeV to 2 TeV, photon cm^{-2} s^{-1}}
#' \item{Energy_Flux50}{Energy flux from 50 GeV to 2 TeV, erg cm^{-2} s^{-1}}
#' \item{Unc_Energy_Flux50}{1 sigma error on energy flux from 50 GeV to 2 TeV, erg cm^{-2} s^{-1}}
#' \item{Flux50_171GeV}{Integral photon flux from 50 to 171 GeV, cm^{-2} s^{-1}}
#' \item{Unc_Flux50_171GeV.1}{(lower) 1 sigma error on integral photon flux from 50 to 171 GeV, cm^{-2} s^{-1}, set to NaN if 1 sigma interval contains 0}
#' \item{Unc_Flux50_171GeV.2}{(upper) 1 sigma error on integral photon flux from 50 to 171 GeV, cm^{-2} s^{-1}}
#' \item{Sqrt_TS50_171GeV}{Square root of Test Statistic between 50 and 171 GeV}
#' \item{Flux171_585GeV}{Integral photon flux from 171 to 585 GeV, cm^{-2} s^{-1}}
#' \item{Unc_Flux171_585GeV.1}{(lower) 1 sigma error on integral photon flux from 171 to 585 GeV, cm^{-2} s^{-1}, set to NaN if 1 sigma interval contains 0}
#' \item{Unc_Flux171_585GeV.2}{(upper) 1 sigma error on integral photon flux from 171 to 585 GeV, cm^{-2} s^{-1}}
#' \item{Sqrt_TS171_585GeV}{Square root of Test Statistic between 171 and 585 GeV}
#' \item{Flux585_2000GeV}{Integral photon flux from 585 GeV to 2 TeV, cm^{-2} s^{-1}}
#' \item{Unc_Flux585_2000GeV.1}{(lower) 1 sigma error on integral photon flux from 585 GeV to 2 TeV, cm^{-2} s^{-1}, set to NaN if 1 sigma interval contains 0}
#' \item{Unc_Flux585_2000GeV.2}{(upper) 1 sigma error on integral photon flux from 585 GeV to 2 TeV, cm^{-2} s^{-1}}
#' \item{Sqrt_TS585_2000GeV}{Square root of Test Statistic between 585 GeV and 2 TeV}
#' \item{Npred}{Predicted number of photons from the source}
#' \item{HEP_Energy}{Highest photon energy, GeV}
#' \item{HEP_Prob}{Probability that the HEP is coming from the source, >=0.85}
#' \item{ROI}{Region of interest number}
#' \item{ASSOC}{Name of the most likely associated source}
#' \item{ASSOC_PROB_BAY}{Probability of association from the Bayesian method}
#' \item{ASSOC_PROB_LR}{Probability of association from the likelihood ratio method}
#' \item{CLASS}{Class designation for most likely association. Capital letters indicate firm identifications;
#' lower-case letters indicate associations: Pulsar (psr), Pulsar wind nebula (pwn), Supernova remnant (snr),
#' Supernova remnant/Pulsar wind nebula (spp), High-mass binary (hmb), Binary (bin), Star-forming region (sfr),
#' BL Lac type of blazar (bll), BL Lac type of blazar with prominent galaxy emission (bll-g), FSRQ type of blazar (fsrq),
#' Non-blazar active galaxy (agn), Radio galaxy (rdg), Radio galaxy/BL Lac (rdg/bll), Blazar candidate of uncertain type I (bcu I),
#' Blazar candidate of uncertain type II (bcu II), Blazar candidate of uncertain type III (bcu III), Normal galaxy, or part (gal),
#' Galaxy cluster (galclu), Unassociated source (  ).}
#' \item{Redshift}{Redshift (when available) of the most likely associated source}
#' \item{NuPeak_obs}{Observed Synchrotron peak frequency, Hz}
#' \item{X3FGL_Name}{Name of the most likely associated source in 3FGL}
#' \item{X1FHL_Name}{Name of the most likely associated source in the 1FHL}
#' \item{TeVCat_Name}{Name of the most likely associated source in the TeVCat}
#' }
#' @source \url{http://fermi.gsfc.nasa.gov/ssc/data/access/lat/2FHL/}
"FHL2"

#' 3FHL Catalog (Third Catalog of Hard Fermi-LAT Sources)
#'
#' The Third Catalog of Hard Fermi-LAT Sources (3FHL).
#' Ajello, M. et al., The Astrophysical Journal Supplement Series, 232, 18 (2017).
#' FITS Filename: gll_psch_v13.fit, released 19 Jul 2017.
#'
#' @format A data frame with 65 variables on 1556 sources.
#' @section Fields:
#' \describe{
#' \item{Source_Name}{3FHL JHHMM.m+DDMM, constructed according to IAU Specifications for Nomenclature;
#' m is decimal minutes of R.A.; in the name R.A. and decl. are truncated at 0.1 decimal minutes and 1' , respectively. A Source_Name ending with "e" indicates an extended source.}
#' \item{RAJ2000}{Right Ascension, J2000}
#' \item{DEJ2000}{Declination, J2000}
#' \item{GLON}{Galactic longitude, deg.}
#' \item{GLAT}{Galactic latitude, deg.}
#' \item{Conf_95_SemiMajor}{Error radius at 95\% confidence, deg.}
#' \item{Conf_95_SemiMinor}{=Conf_95_SemiMajor in 3FHL, deg.}
#' \item{Conf_95_PosAng}{NULL in 3FHL (error circles), deg.}
#' \item{ROI_num}{ROI number (cross-reference to ROIs extension)}
#' \item{Signif_Avg}{Source significance in sigma units over the 10 GeV to 2 TeV band}
#' \item{Pivot_Energy}{Energy at which error on differential flux is minimal, GeV}
#' \item{Flux_Density}{Differential flux at Pivot_Energy, cm^{-2} GeV^{-1} s^{-1}}
#' \item{Unc_Flux_Density}{1 sigma error on differential flux at Pivot_Energy, cm^{-2} GeV^{-1} s^{-1}}
#' \item{Flux}{Integral photon flux from 10 GeV to 1 TeV obtained by spectral fitting, cm^{-2} s^{-1}}
#' \item{Unc_Flux}{1 sigma error on integral photon flux from 10 GeV to 1 TeV, cm^{-2} s^{-1}}
#' \item{Energy_Flux}{Energy flux from 10 GeV to 1 TeV obtained by spectral fitting, erg cm^{-2} s^{-1}}
#' \item{Unc_Energy_Flux}{1 sigma error on energy flux from 10 GeV to 1 TeV, erg cm^{-2} s^{-1}}
#' \item{Signif_Curve}{Significance (in sigma units) of the fit improvement between power-law and LogParabola. A value greater than 3 indicates significant curvature}
#' \item{SpectrumType}{Spectral type (PowerLaw or LogParabola)}
#' \item{Spectral_Index}{Best-fit photon number index at Pivot_Energy when fitting with LogParabola}
#' \item{Unc_Spectral_Index}{1 sigma error on Spectral_Index}
#' \item{beta}{Curvature parameter beta when fitting with LogParabola}
#' \item{Unc_beta}{1 sigma error on beta}
#' \item{PowerLaw_Index}{Best-fit photon number index when fitting with power law}
#' \item{Unc_PowerLaw_Index}{1 sigma error on PowerLaw_Index}
#' \item{Flux_Band}{Integral photon flux in each spectral band, cm^{-2} s^{-1}}
#' \item{Unc_Flux_Band}{1 sigma lower and upper error on Flux_Band, cm^{-2} s^{-1}}
#' \item{nuFnu}{Spectral energy distribution over each spectral band, erg cm^{-2} s^{-1}}
#' \item{Sqrt_TS_Band}{Square root of the Test Statistic in each spectral band}
#' \item{Npred}{Predicted number of events in the model}
#' \item{HEP_Energy}{Highest energy among events probably coming from the source, GeV}
#' \item{HEP_Prob}{Probability of that event to come from the source}
#' \item{Variability_BayesBlocks}{Number of Bayesian blocks from variability analysis; 1 if not variable, −1 if could not be tested}
#' \item{Extended_Source_Name}{Cross-reference to the ExtendedSources extension}
#' \item{ASSOC_GAM}{Correspondence to previous gamma-ray source catalog}
#' \item{TEVCAT_FLAG}{P if positional association with non-extended source in TeVCat, E if associated with an extended source in TeVCat, N if no TeV association, C if TeV source candidate as defined in Section 3.4}
#' \item{ASSOC_TEV}{Name of likely corresponding TeV source from TeVCat, if any}
#' \item{CLASS}{Class designation for associated source; see Table 2}
#' \item{ASSOC1}{Name of identified or likely associated source}
#' \item{ASSOC2}{Alternate name or indicates whether the source is inside an extended source}
#' \item{ASSOC_PROB_BAY}{Probability of association according to the Bayesian method}
#' \item{ASSOC_PROB_LR}{Probability of association according to the Likelihood-Ratio method}
#' \item{Redshift}{Redshift of counterpart, if known}
#' \item{NuPeak_obs}{Frequency of the synchrotron peak of counterpart, if known, Hz}
#' }
#' @source \url{http://fermi.gsfc.nasa.gov/ssc/data/access/lat/3FHL/}
"FHL3"

#' 3LAC_LO (Third Catalog of Active Galactic Nuclei Detected by the Fermi Large Area Telescope - Low Galactic Latitude)
#'
#' Third Catalog of Active Galactic Nuclei (3LAC).
#' Ackermann, M. et al., The Astrophysical Journal, 810, 14 (2015).
#'
#' Low Galactic Latitude (|GLAT| < 10 deg.) Sources.
#'
#' @format A data frame with 20 variables on 182 gamma-ray sources.
#' @section Fields:
#' \describe{
#' \item{GLON}{Galactic Longitude, degrees}
#' \item{GLAT}{Galactic Latitude, degrees}
#' \item{ASSOC_3FGL}{3FGL Source Name (JHHMM.m+DDMM)}
#' \item{VHE}{Display this very-high-energy AGN data (table10)}
#' \item{CName}{Name of the counterpart source}
#' \item{RAJ2000}{Radio counterpart right Ascension (J2000)}
#' \item{DEJ2000}{Radio counterpart declination (J2000)}
#' \item{Sep}{Angular separation with counterpart source, deg.}
#' \item{PosErr}{95\% error radius, deg.}
#' \item{SpCl}{Optical class (G1)}
#' \item{SEDCl}{SED class}
#' \item{lognu}{Log frequency of observer-frame position of synchrotron peak (NupSyn-Meas)}
#' \item{lognuRf}{Log frequency of rest-frame position of synchrotron peak (NupSyn-Rf)}
#' \item{z}{Redshift}
#' \item{Prob}{Bayesian probability}
#' \item{LR.RG}{Likelihood Ratio reliability for Radio-gamma-ray association}
#' \item{FRad}{Radio flux}
#' \item{n_FRad}{Flag on FRad}
#' \item{FX}{X-ray flux; units of 1e-13erg/cm2/s}
#' \item{LR.XG}{Likelihood Ratio reliability for X-ray-gamma-ray association}
#' }
#' @source \url{http://adsabs.harvard.edu/abs/2015ApJ...810...14A}
"LAC3_LO"

#' 3LAC_HI (Third Catalog of Active Galactic Nuclei Detected by the Fermi Large Area Telescope - High Galactic Latitude)
#'
#' Third Catalog of Active Galactic Nuclei (3LAC).
#' Ackermann, M. et al., The Astrophysical Journal, 810, 14 (2015).
#'
#' High Galactic Latitude (|GLAT| > 10 deg.) Sources.
#'
#' @format A data frame with 26 variables on 1591 gamma-ray sources.
#' @section Fields:
#' \describe{
#' \item{\code{Source_Name}}{1FIG JHHMM.m+DDMM, constructed according to IAU Specifications for Nomenclature;
#' m is decimal minutes of R.A.; in the name R.A. and decl. are truncated at 0.1 decimal minutes and 1' , respectively}
#' \item{GLON}{Galactic Longitude, degrees}
#' \item{GLAT}{Galactic Latitude, degrees}
#' \item{ASSOC_3FGL}{3FGL Source Name (JHHMM.m+DDMM)}
#' \item{VHE}{Display this very-high-energy AGN data (table10)}
#' \item{Cln}{Source in Clean sample: Y=Yes, N=No}
#' \item{CName}{Name of the counterpart source}
#' \item{RAJ2000}{Radio counterpart right Ascension (J2000)}
#' \item{DEJ2000}{Radio counterpart declination (J2000)}
#' \item{Sep}{Angular separation with counterpart source, deg.}
#' \item{PosErr}{95\% error radius, deg.}
#' \item{SpCl}{Optical class (G1)}
#' \item{SEDCl}{SED class}
#' \item{lognu}{Log frequency of observer-frame position of synchrotron peak (NupSyn-Meas)}
#' \item{lognuRf}{Log frequency of rest-frame position of synchrotron peak (NupSyn-Rf)}
#' \item{z}{Redshift}
#' \item{Prob}{Bayesian probability}
#' \item{LR.RG}{Likelihood Ratio reliability for Radio-gamma-ray association}
#' \item{LR.XGP}{Likelihood Ratio reliability for X-ray-gamma-ray association}
#' \item{logCpt}{Compton Dominance in log scale}
#' \item{FRad}{Radio flux}
#' \item{n_FRad}{Flag on FRad}
#' \item{FX}{X-ray flux; units of 1e-13erg/cm2/s}
#' \item{Vmag1}{USNO V band magnitude}
#' \item{Vmag2}{SDSS V band magnitude}
#' \item{ARO}{Rest frame, broadband radio-optical spectral index}
#' \item{AOX}{Rest frame, broadband optical-X-ray spectral index}
#' }
#' @source \url{http://adsabs.harvard.edu/abs/2015ApJ...810...14A}
"LAC3_HI"

#' 4LAC_LO (Fourth Catalog of Active Galactic Nuclei Detected by the Fermi Large Area Telescope - Low Galactic Latitude)
#'
#' Fourth Catalog of Active Galactic Nuclei (4LAC).
#' Ajello, M. et al., The Astrophysical Journal, 892, 105 (2020).
#'
#' Low Galactic Latitude (|GLAT| < 10 deg.) Sources.
#'
#' @format A data frame with 38 variables on 344 gamma-ray sources.
#' @section Fields:
#' \describe{
#' \item{Source_Name}{Source name 4FGL JHHMM.m+DDMMa}
#' \item{RAJ2000}{R.A., deg}
#' \item{DEJ2000}{Decl., deg}
#' \item{GLON}{Galactic Longitude, deg}
#' \item{GLAT}{Galactic Latitude, deg}
#' \item{Signif_Avg}{Source significance in sigma units over the 50 MeV–1 TeV band}
#' \item{Flux1000}{Integral photon flux from 1 to 100 GeV, cm^{−2} s^{−1}}
#' \item{Unc_Flux1000}{1 sigma error on integral photon flux from 1 to 100 GeV, cm^{−2} s^{−1}}
#' \item{Energy_Flux100}{Energy flux from 100 MeV to 100 GeV obtained by spectral fitting, erg cm^{−2} s^{−1}}
#' \item{Unc_Energy_Flux100}{1 sigma error on energy flux from 100 MeV to 100 GeV, erg cm^{−2} s^{−1}}
#' \item{SpectrumType}{Spectral type in the global model (PowerLaw, LogParabola, PLSuperExpCutoff)}
#' \item{PL_Index}{Photon index when fitting with PowerLaw}
#' \item{Unc_PL_Index}{1 sigma error on PL_Index}
#' \item{Pivot_Energy}{Pivot Energy, MeV}
#' \item{LP_Index}{Photon index at Pivot_Energy (alpha) when fitting with LogParabola}
#' \item{Unc_LP_Index}{1 sigma error on LP_Index}
#' \item{LP_beta}{Curvature parameter (beta) when fitting with LogParabola}
#' \item{Unc_LP_beta}{1 sigma error on LP_beta}
#' \item{Flags}{Analysis flags}
#' \item{CLASS}{Class designation for associated source}
#' \item{ASSOC1}{Name of identified or likely associated source}
#' \item{ASSOC_PROB_BAY}{Probability of association according to the Bayesian method}
#' \item{ASSOC_PROB_LR}{Probability of association according to the Likelihood Ratio method}
#' \item{Counterpart_Catalog}{Counterpart catalog driving the association}
#' \item{RA_Counterpart}{R.A. of the counterpart ASSOC1, deg}
#' \item{DEC_Counterpart}{Decl. of the counterpart ASSOC1, deg}
#' \item{Unc_Counterpart}{95\% precision of the counterpart localization, deg}
#' \item{VLBI_Counterpart}{Name of the VLBI counterpart}
#' \item{Gaia_Counterpart}{Name of the Gaia counterpart established via the VLBI position}
#' \item{Gaia_G_Magnitude}{Gaia Magnitude at the G band}
#' \item{Redshift}{Redshift}
#' \item{SED_class}{SED-based class}
#' \item{nu_syn}{Synchrotron-peak frequency in observer frame, Hz}
#' \item{nuFnu_syn}{Spectral energy distribution at synchrotron-peak frequency, erg cm^{−2} s^{−1}}
#' \item{Variability_Index}{Variability index}
#' \item{Frac_Variability}{Fractional variability}
#' \item{Unc_Frac_Variability}{1 sigma error on fractional variability}
#' \item{Highest_energy}{Energy of the highest-energy ULTRACLEANVETO photon with association probability P>0.95, GeV}
#' }
#' @source \url{https://ui.adsabs.harvard.edu/abs/2020ApJ...892..105A/abstract}
"LAC4_LO"

#' 4LAC_HI (Fourth Catalog of Active Galactic Nuclei Detected by the Fermi Large Area Telescope - High Galactic Latitude)
#'
#' Fourth Catalog of Active Galactic Nuclei (4LAC).
#' Ajello, M. et al., The Astrophysical Journal, 892, 105 (2020).
#'
#' High Galactic Latitude (|GLAT| > 10 deg.) Sources.
#'
#' @format A data frame with 38 variables on 2863 gamma-ray sources.
#' @section Fields:
#' \describe{
#' \item{Source_Name}{Source name 4FGL JHHMM.m+DDMMa}
#' \item{RAJ2000}{R.A., deg}
#' \item{DEJ2000}{Decl., deg}
#' \item{GLON}{Galactic Longitude, deg}
#' \item{GLAT}{Galactic Latitude, deg}
#' \item{Signif_Avg}{Source significance in sigma units over the 50 MeV–1 TeV band}
#' \item{Flux1000}{Integral photon flux from 1 to 100 GeV, cm^{−2} s^{−1}}
#' \item{Unc_Flux1000}{1 sigma error on integral photon flux from 1 to 100 GeV, cm^{−2} s^{−1}}
#' \item{Energy_Flux100}{Energy flux from 100 MeV to 100 GeV obtained by spectral fitting, erg cm^{−2} s^{−1}}
#' \item{Unc_Energy_Flux100}{1 sigma error on energy flux from 100 MeV to 100 GeV, erg cm^{−2} s^{−1}}
#' \item{SpectrumType}{Spectral type in the global model (PowerLaw, LogParabola, PLSuperExpCutoff)}
#' \item{PL_Index}{Photon index when fitting with PowerLaw}
#' \item{Unc_PL_Index}{1 sigma error on PL_Index}
#' \item{Pivot_Energy}{Pivot Energy, MeV}
#' \item{LP_Index}{Photon index at Pivot_Energy (alpha) when fitting with LogParabola}
#' \item{Unc_LP_Index}{1 sigma error on LP_Index}
#' \item{LP_beta}{Curvature parameter (beta) when fitting with LogParabola}
#' \item{Unc_LP_beta}{1 sigma error on LP_beta}
#' \item{Flags}{Analysis flags}
#' \item{CLASS}{Class designation for associated source}
#' \item{ASSOC1}{Name of identified or likely associated source}
#' \item{ASSOC_PROB_BAY}{Probability of association according to the Bayesian method}
#' \item{ASSOC_PROB_LR}{Probability of association according to the Likelihood Ratio method}
#' \item{Counterpart_Catalog}{Counterpart catalog driving the association}
#' \item{RA_Counterpart}{R.A. of the counterpart ASSOC1, deg}
#' \item{DEC_Counterpart}{Decl. of the counterpart ASSOC1, deg}
#' \item{Unc_Counterpart}{95\% precision of the counterpart localization, deg}
#' \item{VLBI_Counterpart}{Name of the VLBI counterpart}
#' \item{Gaia_Counterpart}{Name of the Gaia counterpart established via the VLBI position}
#' \item{Gaia_G_Magnitude}{Gaia Magnitude at the G band}
#' \item{Redshift}{Redshift}
#' \item{SED_class}{SED-based class}
#' \item{nu_syn}{Synchrotron-peak frequency in observer frame, Hz}
#' \item{nuFnu_syn}{Spectral energy distribution at synchrotron-peak frequency, erg cm^{−2} s^{−1}}
#' \item{Variability_Index}{Variability index}
#' \item{Frac_Variability}{Fractional variability}
#' \item{Unc_Frac_Variability}{1 sigma error on fractional variability}
#' \item{Highest_energy}{Energy of the highest-energy ULTRACLEANVETO photon with association probability P>0.95, GeV}
#' }
#' @source \url{https://ui.adsabs.harvard.edu/abs/2020ApJ...892..105A/abstract}
"LAC4_HI"

#' 1FIG (First Fermi-LAT Inner Galaxy point source Catalog)
#'
#' First Fermi-LAT Inner Galaxy point source Catalog (1FIG).
#' Ajello, M. et al., The Astrophysical Journal, 819, 44 (2016).
#'
#' Results from Table 3 and Table 7 of the journal article.
#'
#' @format A data frame with 31 variables on 48 gamma-ray sources.
#' @section Fields:
#' \describe{
#' \item{\code{Source_Name}}{1FIG JHHMM.m+DDMM, constructed according to IAU Specifications for Nomenclature;
#' m is decimal minutes of R.A.; in the name R.A. and decl. are truncated at 0.1 decimal minutes and 1' , respectively}
#' \item{GLON}{Galactic Longitude, degrees}
#' \item{GLAT}{Galactic Latitude, degrees}
#' \item{dTH}{Deltatheta, 95\% confidence region, deg}
#' \item{TS}{Test Statistic}
#' \item{F_PSR_INT}{1-100 GeV flux, Pulsars Intensity-scaled, 10^{-9} ph cm^{-2} s^{-1}}
#' \item{F_PSR_IND}{1-100 GeV flux, Pulsars Index-scaled, 10^{-9} ph cm^{-2} s^{-1}}
#' \item{F_PSR_INT}{1-100 GeV flux, OBstars Intensity-scaled, 10^{-9} ph cm^{-2} s^{-1}}
#' \item{F_PSR_INT}{1-100 GeV flux, OBstars Index-scaled, 10^{-9} ph cm^{-2} s^{-1}}
#' \item{TYPE}{Spectral type, PowerLaw (PL) or LogParabola (LP)}
#' \item{A_PSR_INT}{alpha, Pulsars Intensity-scaled, for spectral model dN/dE ~ (E/Eb)^{-alpha -beta*log(E/Eb)}}
#' \item{UNC_A_PSR_INT}{uncertainty in alpha, Pulsars Intensity-scaled}
#' \item{B_PSR_INT}{beta, Pulsars Intensity-scaled, for spectral model dN/dE ~ (E/Eb)^{-alpha -beta*log(E/Eb)}}
#' \item{UNC_B_PSR_INT}{uncertainty in beta, Pulsars Intensity-scaled}
#' \item{EB_PSR_INT}{Eb, Pulsars Intensity-scaled, for spectral model dN/dE ~ (E/Eb)^{-alpha -beta*log(E/Eb)}}
#' \item{A_PSR_IND}{alpha, Pulsars Index-scaled, for spectral model dN/dE ~ (E/Eb)^{-alpha -beta*log(E/Eb)}}
#' \item{UNC_A_PSR_IND}{uncertainty in alpha, Pulsars Index-scaled}
#' \item{B_PSR_IND}{beta, Pulsars Index-scaled, for spectral model dN/dE ~ (E/Eb)^{-alpha -beta*log(E/Eb)}}
#' \item{UNC_B_PSR_IND}{uncertainty in beta, Pulsars Index-scaled}
#' \item{EB_PSR_IND}{Eb, Pulsars Index-scaled, for spectral model dN/dE ~ (E/Eb)^{-alpha -beta*log(E/Eb)}}
#' \item{A_OB_INT}{alpha, OBstars Intensity-scaled, for spectral model dN/dE ~ (E/Eb)^{-alpha -beta*log(E/Eb)}}
#' \item{UNC_A_OB_INT}{uncertainty in alpha, OBstars Intensity-scaled}
#' \item{B_OB_INT}{beta, OBstars Intensity-scaled, for spectral model dN/dE ~ (E/Eb)^{-alpha -beta*log(E/Eb)}}
#' \item{UNC_B_OB_INT}{uncertainty in beta, OBstars Intensity-scaled}
#' \item{EB_OB_INT}{Eb, OBstars Intensity-scaled, for spectral model dN/dE ~ (E/Eb)^{-alpha -beta*log(E/Eb)}}
#' \item{A_OB_IND}{alpha, OBstars Index-scaled, for spectral model dN/dE ~ (E/Eb)^{-alpha -beta*log(E/Eb)}}
#' \item{UNC_A_OB_IND}{uncertainty in alpha, OBstars Index-scaled}
#' \item{B_OB_IND}{beta, OBstars Index-scaled, for spectral model dN/dE ~ (E/Eb)^{-alpha -beta*log(E/Eb)}}
#' \item{UNC_B_OB_IND}{uncertainty in beta, OBstars Index-scaled}
#' \item{EB_OB_IND}{Eb, OBstars Index-scaled, for spectral model dN/dE ~ (E/Eb)^{-alpha -beta*log(E/Eb)}}
#' \item{ASSOC_3FGL}{3FGL association}
#' }
#' @source \url{http://adsabs.harvard.edu/abs/2016ApJ...819...44A}
"FIG1"

#' 1DF Catalog (First D3PO Fermi catalog of gamma-ray source candidates)
#'
#' The Denoised, Deconvolved, and Decomposed Fermi Gamma-ray Sky: An application of the D3PO algorithm
#' Selig, M. et al., Astronomy and Astrophysics, 581, 126 (2015).
#'
#'FITS Filename: catalog_1.fits
#'
#' @format A data frame with 48 variables on 3106 gamma-ray sources.
#' @section Fields:
#' \describe{
#' \item{CandidateName}{Candidate Name}
#' \item{GLON}{Galactic Longitude, deg.}
#' \item{GLAT}{Galactic Latitude, deg.}
#' \item{Flux}{Total flux between 1-100 GeV, photon cm^{-2} s^{-1}}
#' \item{Emid1}{Contributing energy band 1, T/F, Emin=0.60 GeV, Emid=0.85 GeV, Max=1.20 GeV}
#' \item{Emid2}{Contributing energy band 2, T/F, Emin=1.20 GeV, Emid=1.70 GeV, Max=2.40 GeV}
#' \item{Emid3}{Contributing energy band 3, T/F, Emin=2.40 GeV, Emid=3.40 GeV, Max=4.80 GeV}
#' \item{Emid4}{Contributing energy band 4, T/F, Emin=4.80 GeV, Emid=6.79 GeV, Max=9.60 GeV}
#' \item{Emid5}{Contributing energy band 5, T/F, Emin=9.60 GeV, Emid=13.58 GeV, Max=19.20 GeV}
#' \item{Emid6}{Contributing energy band 6, T/F, Emin=19.20 GeV, Emid=27.15 GeV, Max=38.40 GeV}
#' \item{Emid7}{Contributing energy band 7, T/F, Emin=38.40 GeV, Emid=54.31 GeV, Max=76.80 GeV}
#' \item{Emid8}{Contributing energy band 8, T/F, Emin=76.80 GeV, Emid=108.61 GeV, Max=153.60 GeV}
#' \item{Emid9}{Contributing energy band 9, T/F, Emin=153.60 GeV, Emid=217.22 GeV, Max=307.20 GeV}
#' \item{Distance1}{Distance1, deg.}
#' \item{Association1a}{Primary association}
#' \item{Association1b}{Association1b}
#' \item{Association1c}{Association1c}
#' \item{Distance2}{Distance2, deg.}
#' \item{Association2a}{Association2a}
#' \item{Association2b}{Association2b}
#' \item{Association2c}{Association2c}
#' \item{Distance3}{Distance3, deg.}
#' \item{Association3a}{Association3a}
#' \item{Association3b}{Association3b}
#' \item{Association3c}{Association3c}
#' \item{Distance4}{Distance4, deg.}
#' \item{Association4a}{Association4a}
#' \item{Association4b}{Association4b}
#' \item{Association4c}{Association4c}
#' \item{Chi2_PL}{Chi-squared (power-law fit), See Equation (2) of Selig et al. (2015)}
#' \item{Chi2_LP}{Chi-squared (log-parabola fit), See Equation (3) of Selig et al. (2015)}
#' \item{Chi2_EXP}{Chi-squared (exponential cut-off fit), See Equation (4) of Selig et al. (2015)}
#' \item{Gamma_PL}{Spectral index (power-law fit), See Equation (2) of Selig et al. (2015)}
#' \item{Unc_Gamma_PL}{Uncertainty in the spectral index (power-law fit), See Equation (2) of Selig et al. (2015)}
#' \item{Gamma_LP}{Spectral index (log-parabola fit), See Equation (3) of Selig et al. (2015)}
#' \item{Unc_Gamma_LP}{Uncertainty in the spectral index (log-parabola fit), See Equation (3) of Selig et al. (2015)}
#' \item{Gamma_EXP}{Spectral index (exponential cut-off fit), See Equation (4) of Selig et al. (2015)}
#' \item{Unc_Gamma_EXP}{Uncertainty in the spectral index (exponential cut-off fit), See Equation (4) of Selig et al. (2015)}
#' \item{K_PL}{Normalization (power-law fit), See Equation (2) of Selig et al. (2015)}
#' \item{Unc_K_PL}{Uncertainty in the normalization (power-law fit), See Equation (2) of Selig et al. (2015)}
#' \item{K_LP}{Normalization (log-parabola fit), See Equation (3) of Selig et al. (2015)}
#' \item{Unc_K_LP}{Uncertainty in the normalization (log-parabola fit), See Equation (3) of Selig et al. (2015)}
#' \item{K_EXP}{Normalization (exponential cut-off fit), See Equation (4) of Selig et al. (2015)}
#' \item{Unc_K_EXP}{Uncertainty in the normalization (exponential cut-off fit), See Equation (4) of Selig et al. (2015)}
#' \item{Beta_LP}{Beta index (log-parabola fit), See Equation (3) of Selig et al. (2015)}
#' \item{Unc_Beta_LP}{Uncertainty in the Beta index (log-parabola fit), See Equation (3) of Selig et al. (2015)}
#' \item{Ec_EXP}{Energy cut-off (exponential cut-off fit), See Equation (4) of Selig et al. (2015)}
#' \item{Unc_Ec_EXP}{Uncertainty in the energy cut-off (exponential cut-off fit), See Equation (4) of Selig et al. (2015)}
#' }
#' @source \url{http://wwwmpa.mpa-garching.mpg.de/ift/fermi/}
"DF1"

#' pulsars (Public List of LAT-Detected Gamma-Ray Pulsars)
#'
#' Fermi Large Area Telescope List of Detected Pulsars
#' https://confluence.slac.stanford.edu/display/GLAMCOG/Public+List+of+LAT-Detected+Gamma-Ray+Pulsars
#'
#' Last Updated: 2020-04-16
#'
#' @format A data frame with 8 variables on 253 gamma-ray pulsars:
#' @section Fields:
#' \describe{
#' \item{PSR}{Pulsar name, PSR JHHMM+DDMM, constructed using the RA and Dec}
#' \item{RAJ_deg}{Right Ascension, J2000, degrees}
#' \item{DECJ_deg}{Declination, J2000, degrees}
#' \item{P_ms}{Period, milliseconds}
#' \item{Edot}{Spin-down luminosity, erg/s}
#' \item{Codes}{b=Pulsar is in a binary system,
#' e=Pulsar was detected in gamma rays by EGRET/COMPTEL,
#' g=Discovered in LAT gamma-ray data,
#' m=Millisecond pulsar,
#' p=Pulsar was discovered by the PSC,
#' r=Discovered in the radio and/or Gamma-ray pulsations detected using the radio ephemeris,
#' u=Discovered using a Fermi-LAT seed position,
#' x=Discovered in the x-ray and/or Gamma-ray pulsations detected using the X-ray ephemeris.}
#' \item{Refs}{References (see web page for details)}
#' \item{date_public}{Date made public}
#' }
#' @source \url{https://confluence.slac.stanford.edu/display/GLAMCOG/Public+List+of+LAT-Detected+Gamma-Ray+Pulsars}
"pulsars"
