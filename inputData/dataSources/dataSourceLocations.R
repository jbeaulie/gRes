#this script reads in the sources from each data file that was used to input
#data into G-res

install.packages("tm")
install.packages("pdftools")
install.packages("stringr")
library(tm)
library(pdftools)
library(stringr)
library(tidyr)
library(dplyr)

####TEMPERATURE DATA#########
#The temeprature data came from NOAA:
#https://gis.ncdc.noaa.gov/maps/clim/
#the following comments contain the paths to the temperature data that was inputted into G-res,
#as well as the paths to the G-res input .mer files

#path to Acton Lake temperature data file (PDF):
#"C:/Users/esilve02/RProjects/gRes/inputData/dataSources/airTemperature/actonTempDataNOAA.pdf"

#path to Acton Lake G-res .mer file:

#path to Allatoona Lake temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\allatoonaTempDataNOAA.pdf"

#path to Allatoon Lake G-res .mer file:

#path to Alum Creek Lake temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\alumCreekLakeTempDataNOAA.pdf"

#path to Alum Creek Lake G-res .mer file:

#path to Apple Valley Lake temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\appleValleyLakeTempDataNOAA.pdf"

#path to Apple Valley Lake G-res .mer file:

#path to Atwood Lake temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\atwoodTempDataNOAA.pdf"

#path to Atwood Lake G-res .mer file:

#path to Brookville Lake temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\brookvilleTempDataNOAA.pdf"

#path to Brookville lake G-res .mer file:

#path to Buckhorn Lake temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\buckhornTempDataNOAA.pdf"

#path to Buckhorn Lake G-res .mer file:

#path to Burr Oak Lake temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\burrOakTempDataNOAA.pdf"

#path to Burr Oak Lake G-res .mer file:










####ATTEMPT AT READING IN A PDF#########

# ##This commented code reads in a PDF file- the problem is that it puts the entire pdf into one column/row
# ##I broke the pdf up by page but did not figure out how to break it up by line
# #Acton lake temperature data file
# read <- readPDF(control = list(text = "-layout"))
# document <- Corpus(URISource("C:/Users/esilve02/RProjects/gRes/inputData/dataSources/airTemperature/actonTempDataNOAA.pdf"), 
#                    readerControl = list(reader = read))
# doc <- content(document[[1]])
# head(doc)
# 
# #the 2017 data is on page 2; this makes doc only contain page 2 info
# page_breaks <- grep("\r\n", doc)
# doc <- doc[page_breaks[2]]
# head(doc)
# df.doc <- as.data.frame(doc)
# head(df.doc)





