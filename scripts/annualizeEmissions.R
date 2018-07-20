####This code takes Sarah's monthly flux data measurements from Acton lake and
  #calculates a factor that we will use to annualize emmission data
#This method is different than the one G-res uses- G-res uses a temperature
  #correction coefficient to annualize the data

library(base)
library(readxl)

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

