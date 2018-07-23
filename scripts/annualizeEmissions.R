####This code takes Sarah's monthly flux data measurements from Acton lake and
  #calculates a factor that we will use to annualize emmission data
#This method is different than the one G-res uses- G-res uses a temperature
  #correction coefficient to annualize the data

#This code also merges dataForGres and outputDataFromGres, applies the 
  #annualization factor to the measurements in dataForGres and plots the 
  #observed vs G-res predicted values

library(base)
library(readxl)
library(tidyverse)
library(ggplot2)
library(utils)

#read in excel file with Sarah's Acton measurements
flux <- read_excel("C:/Users/esilve02/RProjects/gRes/inputData/actonMonthlyCH4.xlsx")

#sum all the monthly flux rates
#this represents the total emissions over one year
fluxSum <- sum(flux$meanCh4Flux)

#take the average of the June-September fluxes
#These are the months when the 32 reservoirs were sampled
#This is to represent the summer season because we can't assume
  #a specific monthly pattern will always directly apply:
  #Sarah's data from 2018 shows a different temporal pattern than 2017, so
  #this means that a specific pattern in 2017 data may not apply directly to 
  #2016 when the lakeswere sampled

summerFluxSum <- sum(flux[6:9, 2])
summerFluxAvg <- summerFluxSum / 4

#divide summerFluxAvg by fluxSum
#this reflects the fraction of annual emissions that occur during summer: 
  #June 1- September 1, which is when the 32 lakes were sampled
#the resulting number is the factor we will use to annualize the emission data

annualFactor <- summerFluxAvg/fluxSum

###read in dataForGres, which has observed emission values
#dataForGres <- read_excel("C:/Users/esilve02/RProjects/gRes/inputData/dataSources/dataForGres.xlsx")

obsEmissions <- read.table("C:/Users/esilve02/RProjects/gRes/inputData/dataSources/dataForGres.txt", sep = " ")
phos <- data.frame(obsEmissions$Lake_Name, obsEmissions$tp_Estimate)
#reorder the columns and delete some
#NOTE: dataForGres excel file includes reservoir volume, but obsEmissions does not
  #if you need reservoir volume, uncomment the line above that reads in dataForGres
obsEmissions <- obsEmissions[, c(29, 28, 24, 30, 18, 19, 2:7, 16)]

#add extra Harsha data from 2016 and 2017 papers to the obsEmissions df
extra <- data.frame("William H Harsha Lake 2017",	"USEPA",	8.31944396,
                    34.45121951,	11.629,	0.1552, 34.3,
                    2,	32.3, NA, NA, NA, NA)
colnames(extra) <- colnames(obsEmissions)
extra2 <- data.frame("William H Harsha Lake 2016",	"USEPA",	8.31944396,
                     34.45121951,	11.629,	0.1552, 8.3,
                     0.6,	7.7, NA, NA, NA, NA)
colnames(extra2) <- colnames(obsEmissions)
extraAll <- rbind(extra, extra2)
obsEmissions <- rbind(obsEmissions, extraAll)

#annualize total emissions by multiplying observed values by annualization factor
obsEmissions$ch4.trate.mg.h_Estimate_Annual <- obsEmissions$ch4.trate.mg.h_Estimate*annualFactor

#annualize diffusive emissions by multiplying observed values by annualization factor
obsEmissions$ch4.drate.mg.m2.h_Estimate_Annual <- obsEmissions$ch4.drate.mg.m2.h_Estimate*annualFactor

#annualize ebullition emissions by multiplying observed values by annualization factor
obsEmissions$ch4.erate.mg.h_Estimate_Annual <- obsEmissions$ch4.erate.mg.h_Estimate*annualFactor

#read in excel with G-res predicted values
predEmissions <- read_excel("C:/Users/esilve02/RProjects/gRes/outputData/gresOutputBasicPublic/outputDataFromGres.xlsx")

#merge observed and G-res calculated excel files
combineEmissions <- merge(obsEmissions, predEmissions, by.obsEmissions = Lake_Name, by.predEmissions = Lake_Name)

#graph observed vs. G-res calculated values
#This code is Jakes from reservoirGhgEmissions.R, but edited to fit the new variables

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


