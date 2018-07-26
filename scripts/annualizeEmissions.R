# Jake comments
# 1. Update based on new dataForGres.txt file.
# 2. Subset using column names, rather than position index.
# 3. Path for output data is broken.

# Our objective is to compare our observed emission rate data to Gres predicted
# values.  Gres reports an annual average flux rate (i.e. mean of the 12-monthly
# means within one year; Section 2.2.2 and Fig 4 of Technical Document).  
# Therefore we need to convert our measurements made during the summer to an 
# annual average.  We will # do this using the 2017 monthly mean CH4 emission 
# rates from Acton Lake measured with flux tower.

# This code also merges dataForGres and outputDataFromGres, applies the 
# annualization factor to the measurements in dataForGres and plots the 
# observed vs G-res predicted values

# LIBRARIES---------------------
library(tidyverse) # this loads ggplot, dplyr, and others
library(readxl)


# Read in excel file with Sarah's Acton measurements
flux <- read_excel("inputData/actonMonthlyCH4.xlsx")

# Calculate annualization factor
# mean annual = 'annualization factor' * mean summer
# 'annualization factor' = mean annual / mean summer
meanAnnual <- mean(flux$meanCh4Flux) # Mean annual flux (this is what Gres reports)

meanSummer <- flux %>% 
  filter(RDateTime < as.Date("2017-10-01"), # before Oct. 1
         RDateTime > as.Date("2017-05-31")) %>% # after May 31
  select(meanCh4Flux) %>% 
  summarize(summerMean = mean(meanCh4Flux)) %>% # mean summer months
  as.numeric() # convert to vector

annualFactor <- meanAnnual/meanSummer # 0.41



# Read in dataForGres, which has observed emission values

obsEmissions <- read.table("inputData/dataSources/dataForGres.txt", sep = " ")

# phos <- data.frame(obsEmissions$Lake_Name, obsEmissions$tp_Estimate)
# #just reservoir volume and area data
# volArea <- data.frame(obsEmissions$Lake_Name, obsEmissions$reservoir.volume.m3, obsEmissions$reservoir.area.m2)
# #just landuse data
# landuse <- data.frame(obsEmissions$Lake_Name, obsEmissions$watershed.area.m2, 
#                       obsEmissions$percent.agg.ag, obsEmissions$percent.barren,
#                       obsEmissions$percent.openwater, obsEmissions$percent.urban,
#                       obsEmissions$percent.forest, obsEmissions$percent.wetlands,
#                       obsEmissions$percent.shrub.scrub+obsEmissions$percent.grassland.herbaceous)



#add extra Harsha data from 2016 and 2017 papers to the obsEmissions df
#doesn't work with new dataForGres
# extra <- data.frame("William H Harsha Lake 2017",	"USEPA",	8.31944396,
#                     34.45121951,	11.629,	0.1552, 34.3,
#                     2,	32.3, NA, NA, NA, NA)
# colnames(extra) <- colnames(obsEmissions)
# extra2 <- data.frame("William H Harsha Lake 2016",	"USEPA",	8.31944396,
#                      34.45121951,	11.629,	0.1552, 8.3,
#                      0.6,	7.7, NA, NA, NA, NA)
# colnames(extra2) <- colnames(obsEmissions)
# extraAll <- rbind(extra, extra2)
# obsEmissions <- rbind(obsEmissions, extraAll)

#annualize total emissions by multiplying observed values by annualization factor
obsEmissions$ch4.trate.mg.h_Estimate_Annual <- obsEmissions$ch4.trate.mg.h_Estimate*annualFactor

#annualize diffusive emissions by multiplying observed values by annualization factor
obsEmissions$ch4.drate.mg.m2.h_Estimate_Annual <- obsEmissions$ch4.drate.mg.m2.h_Estimate*annualFactor

#annualize ebullition emissions by multiplying observed values by annualization factor
obsEmissions$ch4.erate.mg.h_Estimate_Annual <- obsEmissions$ch4.erate.mg.h_Estimate*annualFactor

#read in excel with G-res predicted values
#THIS DIRECTORY PATH IS BROKEN.
predEmissions <- read_excel("outputData/gresOutputBasicPublic/outputDataFromGres.xlsx")

#merge observed and G-res calculated excel files
combineEmissions <- merge(obsEmissions, predEmissions, by.obsEmissions = Lake_Name, by.predEmissions = Lake_Name)

#graph observed vs. G-res calculated values
#This code is Jakes from reservoirGhgEmissions.R, but edited to fit the new variables
#also added confidence interval bars

#With 1:1 line
ggplot(combineEmissions, aes(ch4.trate.mg.h_Estimate_Annual, t.ch4.mgCH4.m2.hr.gres)) + 
  geom_point(aes(color = Survey)) +
  geom_abline(slope = 1, intercept = 0) +
  ylab(expression(Predicted~methane~emission~rate~(mg~CH[4]~m^{-2}~hr^{-1}))) +
  xlab(expression(Measured~methane~emission~rate~(mg~CH[4]~m^{-2}~hr^{-1}))) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),  # Eliminate major gridlines
        panel.grid.minor = element_blank(),  # Eliminate minor gridlines
        panel.border = element_rect(color = "black"),
        axis.ticks = element_line(color = "black"),
        axis.text = element_text(color = "black"),
        axis.title = element_text(size = 12)) 
  #geom_errorbar(aes (ymin = combineEmissions$ch4.trate.mg.h_Estimate_Annual - combineEmissions$ch4.trate.mg.h_LCB95Pct, ymax = combineEmissions$ch4.trate.mg.h_Estimate_Annual + combineEmissions$ch4.trate.mg.h_UCB95Pct))

ggsave('gres1_1.tiff',  # export as .tif
       units="in",  # specify units for dimensions
       width=7,   # 1 column
       height=5, # Whatever works
       dpi=1200,   # ES&T. 300-600 at PLOS One,
       compression = "lzw")

# With 1:1, and 10:1 line
ggplot(combineEmissions, aes(ch4.trate.mg.h_Estimate_Annual, t.ch4.mgCH4.m2.hr.gres)) + 
  geom_point(aes(color = Survey)) +
  geom_abline(slope = 10, intercept = 0, linetype = 2) +
  geom_abline(slope = 1, intercept = 0) +
  ylab(expression(Predicted~methane~emission~rate~(mg~CH[4]~m^{-2}~hr^{-1}))) +
  xlab(expression(Measured~methane~emission~rate~(mg~CH[4]~m^{-2}~hr^{-1}))) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),  # Eliminate major gridlines
        panel.grid.minor = element_blank(),  # Eliminate minor gridlines
        panel.border = element_rect(color = "black"),
        axis.ticks = element_line(color = "black"),
        axis.text = element_text(color = "black"),
        axis.title = element_text(size = 12))

ggsave('gres10_1.tiff',  # export as .tif
       units="in",  # specify units for dimensions
       width=7,   # 1 column
       height=5, # Whatever works
       dpi=1200,   # ES&T. 300-600 at PLOS One,
       compression = "lzw")

# With 1:1, 10:1, and 0.1:1 lines
ggplot(combineEmissions, aes(ch4.trate.mg.h_Estimate_Annual, t.ch4.mgCH4.m2.hr.gres)) + 
  geom_point(aes(color = Survey)) +
  geom_abline(slope = 10, intercept = 0, linetype = 2) +
  geom_abline(slope = 1, intercept = 0) +
  geom_abline(slope = 0.1, intercept = 0, linetype = 2) +
  ylab(expression(Predicted~methane~emission~rate~(mg~CH[4]~m^{-2}~hr^{-1}))) +
  xlab(expression(Measured~methane~emission~rate~(mg~CH[4]~m^{-2}~hr^{-1}))) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),  # Eliminate major gridlines
        panel.grid.minor = element_blank(),  # Eliminate minor gridlines
        panel.border = element_rect(color = "black"),
        axis.ticks = element_line(color = "black"),
        axis.text = element_text(color = "black"),
        axis.title = element_text(size = 12))

ggsave('gres1_0.1.tiff',  # export as .tif
       units="in",  # specify units for dimensions
       width=7,   # 1 column
       height=5, # Whatever works
       dpi=1200,   # ES&T. 300-600 at PLOS One,
       compression = "lzw")

# READ IN CO2 EQUIV EMISSION RATES FROM DEEMER ET AL.
# SEE PAGE 4
co2Equiv <- read_excel("C:/Users/esilve02/RProjects/gRes/inputData/deemerReservoirGwp.xlsx")

#PLOT
ggplot(co2Equiv, aes(gas, mg.co2.eq.m2.d)) +
  geom_col() +
  ylab(expression(GHG~emission~rate~(mg~CO[2]~equivalent~m^{-2}~d^{-1}))) +
  scale_x_discrete(labels = c(expression(CH[4]), expression(CO[2]), expression(N[2]*O))) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),  # Eliminate major gridlines
        panel.grid.minor = element_blank(),  # Eliminate minor gridlines
        panel.border = element_rect(color = "black"),
        axis.ticks = element_line(color = "black"),
        axis.text = element_text(color = "black", size = 12),
        axis.title = element_text(size = 14),
        axis.title.x = element_blank())

ggsave('reservoirEmissionsCo2equiv.tiff',  # export as .tif
       units="in",  # specify units for dimensions
       width=7,   # 1 column
       height=5, # Whatever works
       dpi=1200,   # ES&T. 300-600 at PLOS One,
       compression = "lzw")


