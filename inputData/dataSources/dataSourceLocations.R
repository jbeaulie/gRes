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

####PUBLICLY AVAILABLE DATA#########
#Publicly available data includes: mean global horizontal irradiance, temperature, and wind

########MEAN GLOBAL HORIZONTAL IRRADIANCE#########
#The mean global horizontal irradiance data came from:
#https://www.nrel.gov/gis/data.html
#it is organized by zip code, so I found the zip code closest to the lake
  #and used the value associated with the zip code for the lake
#This factor is mainly important for ebullition calculations
#the path is:
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\meanGlobalHorizontalIrradiance\meanGlobalHorizontalIrradiance.xlsx"



####TEMPERATURE DATA#########
#The temeprature data came from NOAA:
#https://gis.ncdc.noaa.gov/maps/clim/
#the following comments contain the paths to the temperature data that was inputted into G-res


#path to Acton Lake temperature data file (PDF):
#"C:/Users/esilve02/RProjects/gRes/inputData/dataSources/airTemperature/actonTempDataNOAA.pdf"

#path to Allatoona Lake temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\allatoonaTempDataNOAA.pdf"

#path to Alum Creek Lake temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\alumCreekLakeTempDataNOAA.pdf"

#path to Apple Valley Lake temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\appleValleyLakeTempDataNOAA.pdf"

#path to Atwood Lake temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\atwoodTempDataNOAA.pdf"

#path to Brookville Lake temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\brookvilleTempDataNOAA.pdf"

#path to Buckhorn Lake temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\buckhornTempDataNOAA.pdf"

#path to Burr Oak Lake temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\burrOakTempDataNOAA.pdf"

#path to Caesar Creek Lake temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\caesarCreekTempDataNOAA.pdf"

#path to Carr Fork Lake temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\carrForkTempDataNOAA.pdf"

#path to Cave Run Lake temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\caveRunTempDataNOAA.pdf"

#path to Charles Mill Lake temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\charlesMillTempDataNOAA.pdf"

#path to Cowan Lake temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\cowanTempDataNOAA.pdf"

#path to Delaware Lake temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\delawareTempDataNOAA.pdf"

#path to Dillon Lake temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\dillonTempDataNOAA.pdf"

#path to Douglas Lake temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\douglasTempDataNOAA.pdf"

#path to Fontana Lake temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\fontanaTempDataNOAA.pdf"

#path to Guntersville Lake temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\guntersvilleTempDataNOAA.pdf"

#path to Hartwell Lake temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\hartwellTempDataNOAA.pdf"

#path to Hocking County Lake temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\hockingCountyTempDataNOAA.pdf"

#path to Kiser Lake temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\kiserTempDataNOAA.pdf"

#path to Knox Lake temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\knoxTempDataNOAA.pdf"

#path to La Due Reservoir temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\laDueResTempDataNOAA.pdf"

#path to Lake Loramie temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\lakeLoramieTempDataNOAA.pdf"

#path to Lake Milton temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\lakeMiltonTempDataNOAA.pdf"

#path to Lake Mohawk temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\lakeMohawkTempDataNOAA.pdf"

#path to Lake Roaming Rock temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\lakeRoamingRockTempDataNOAA.pdf"

#path to Lake Waynoka temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\lakeWaynokaTempDataNOAA.pdf"

#path to Michael J. Kirwan Reservoir temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\michaelJKirwanResTempDataNOAA.pdf"

#path to Paint Creek Lake temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\paintCreekTempDataNOAA.pdf"

#path to Piedmont Lake temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\piedmontTempDataNOAA.pdf"

#path to Pleasant Hill Lake temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\pleasantHillTempDataNOAA.pdf"

#path to Rocky Fork Lake temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\rockyForkTempDataNOAA.pdf"

#path to Senecaville Lake temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\senecavilleTempDataNOAA.pdf"

#path to Tappan Lake temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\tappanTempDataNOAA.pdf"

#path to Watts Bar Lake temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\wattsBarTempDataNOAA.pdf"

#path to Wiliam H. Harsha Lake temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\williamHarshaTempDataNOAA.pdf"

#path to Wingfoot Lake temperature data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\airTemperature\wingfootTempDataNOAA.pdf"


########END OF TEMPERATURE DATA##########################

############WIND DATA#######################
#Wind data is important in G-res for calculating the thermocline
#The thermocline is important for calculating Degassing
#As this appears to be the main function of the wind factor, and we do not want degassing data included,
  #the wind data was not inputted into G-res
#Wind data was not collected for all of the lakes (I stopped when we figured out it wasn't important)
#Since we have the data I figured I would put the paths here in case anyone wanted to look at it
#Wind data was collected from NOAA:
#https://gis.ncdc.noaa.gov/maps/ncei/lcd 


#path to Acton Lake wind data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\windSpeed\actonWindDataNOAAPDF.pdf"

#path to Alum Creek Lake wind data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\windSpeed\alumCreekWindDataNOAA.pdf"

#path to Apple Valley Lake wind data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\windSpeed\appleValleyWindDataNOAA.pdf"

#path to Atwood Lake wind data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\windSpeed\atwoodWindDataNOAA.pdf"

#path to Brookville Lake wind data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\windSpeed\brookvilleWindDataNOAA.pdf"

#path to Buckhorn Lake wind data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\windSpeed\buckhornWindDataNOAA.pdf"

#path to Burr Oak Lake wind data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\windSpeed\burrOakWindDataNOAA.pdf"

#path to Caesar Creek Lake wind data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\windSpeed\caesarCreekWindDataNOAA.pdf"

#path to Carr Fork Lake wind data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\windSpeed\carrForkWindDataNOAA.pdf"

#path to Cave Run Lake wind data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\windSpeed\caveRunWindDataNOAA.pdf"

#path to Charles Mill Lake wind data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\windSpeed\charlesMillWindDataNOAA.pdf"

#path to Cowan Lake wind data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\windSpeed\cowanWindDataNOAA.pdf"

#path to Delaware Lake wind data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\windSpeed\delawareWindDataNOAA.pdf"

#path to Dillon Lake wind data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\windSpeed\dillonWindDataNOAA.pdf"

#path to Hocking County Lake wind data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\windSpeed\hockingCountyWindDataNOAA.pdf"

#path to Kiser Lake wind data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\windSpeed\kiserWindDataNOAA.pdf"

#path to Knox Lake wind data file (PDF):
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\windSpeed\knoxWindDataNOAA.pdf"


###########END OF WIND DATA############

#######BASIC DATA################
#Basic data includes reservoir area, maximum depth, 
  #reservoir volume, mean depth, and litoral area
#This data can be found on the following excel sheet that Jake put together:
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\dataForGres.xlsx"

###########LAND USE DATA##############
#used in level 2 G-res .mer files
#Land use data includes the percentage of land in the water shed that is:
  #Wetlands, forest, settlements, croplands, water bodies, or grassland/shrubland
#it also includes the catchment area and the latitude and longitude
#this file does not have data for the 6 Bevelhimer lakes
#this information all comes from an excel file Jake put together using GIS:
#"L:\Priv\Cin\NRMRL\ReservoirEbullitionStudy\multiResSurvey2016\siteDataForAdam\ohio2016SampleFrameTable.xls"

#The variables in the excel file are not intuitive, so a translation is below:
#percent_we = percent wetland = Wetlands in G-res
#percent_fo = percent forest = Forest in G-res
#percent_ur = percent urban = Settlements in G-res
#percent ag = percent agriculture (which is percent_pa (pasture) + percent_cu (cultivated))
  #=Croplands in G-res
#percent_op = percent open water = Water Bodies in G-res
#percent_gr = percent grassland - Grassland/Shrubland in G-res
#watershed_ = catchment area in m^2

#This information does not seem to affect the methane output
#it appears to be used in calculating phosphorus load
#phosphorus is used in calculating gross annual CO2 emission


##########OTHER VARIABLE NOTES################

# I think that when G-res said that age of reservoir was important for 
  #diffusive emissions, it didn't mean year of impoundment. 
  #G-res assumes that the lifetime of a reservoir is 100 years and uses 
  #the assumption that emissions decrease as the reservoir ages to 
  #calculate lifetime diffusive emissions rather than the actual age of the reservoir

#Land use is involved in phosphorus load calculations, and phosphorus 
  #concentration is used in calculating CO2

#water residence time is used in calculating degassing and phosphorus concentration

#To annually standardize the emission values, they use a temperature 
  #correction coefficient, which takes into account the annual variation 
  #in temperature together with a factor describing the temperature 
  #dependence of GHG production. So  there are different numbers for the 
  #relationship between CH4 and temperature and CO2 and temperature
  #the equation for the CH4 coefficient is:
  #10^((temp/month)*0.052)
  #So this calculation needs to be done for every month and they got the 
  #0.052 number from the slope of temperature vs. CH4 flux function in 
  #their database and if the temperature is lower than 4 degrees C, they 
  #use 4 degrees C



######G-RES INPUT .MER FILES#######
#the following comments give the path to the files that can be inported into G-res
#and include all of the input variables

#########LEVEL 1, BASIC AND PUBLICLY AVAILABLE######

#path to Acton Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublic\G-resTool_Acton Lake (1).mer"

#path to Allatoona Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublic\G-resTool_Allatoona (1).mer"

#path to Alum Creek Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublic\G-resTool_Alum Creek Lake (1).mer"

#path to Apple Valley Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublic\G-resTool_Apple Valley Lake (1).mer"

#path to Atwood Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublic\G-resTool_Atwood Lake (1).mer"

#path to Brookville lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublic\G-resTool_Brookville Lake (1).mer"

#path to Buckhorn Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublic\G-resTool_Buckhorn Lake (1).mer"

#path to Burr Oak Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublic\G-resTool_Burr Oak Reservoir (1).mer"

#path to Caesar Creek Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublic\G-resTool_Caesar Creek Lake (1).mer"

#path to Carr Fork Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublic\G-resTool_Carr Fork Lake (1).mer"

#path to Cave Run Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublic\G-resTool_Cave Run Lake (1).mer"

#path to Charles Mill Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublic\G-resTool_Charles Mill Lake (1).mer"

#path to Cowan Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublic\G-resTool_Cowan Lake (1).mer"

#path to Delaware Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublic\G-resTool_Delaware Reservoir (1).mer"

#path to Dillon Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublic\G-resTool_Dillon Lake (1).mer"

#path to Douglas Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublic\G-resTool_Douglas (1).mer"

#path to Fontana Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublic\G-resTool_Fontana (1).mer"

#path to Guntersville Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublic\G-resTool_Guntersville (1).mer"

#path to Hartwell Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublic\G-resTool_Hartwell (1).mer"

#path to Hocking County Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublic\G-resTool_Hocking County Lake (1).mer"

#path to Kiser Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublic\G-resTool_Kiser Lake (1).mer"

#path to Knox Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublic\G-resTool_Knox Lake (1).mer"

#path to La Due Reservoir G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublic\G-resTool_La Due Reservoir (1).mer"

#path to Lake Loramie G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublic\G-resTool_Lake Loramie (1).mer"

#path to Lake Milton G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublic\G-resTool_Lake Milton (1).mer"

#path to Lake Mohawk G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublic\G-resTool_Lake Mohawk (1).mer"

#path to Lake Roaming Rock G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublic\G-resTool_Lake Roaming Rock (1).mer"

#path to Lake Waynoka G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublic\G-resTool_Lake Waynoka (1).mer"

#path to Michael J. Kirwan Reservoir G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublic\G-resTool_Michael J Kirwan Reservoir (1).mer"

#path to Paint Creek Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublic\G-resTool_Paint Creek Lake (1).mer"

#path to Piedmont Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublic\G-resTool_Piedmont Lake (1).mer"

#path to Pleasant Hill Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublic\G-resTool_Pleasant Hill Lake (1).mer"

#path to Rocky Fork Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublic\G-resTool_Rocky Fork Lake (1).mer"

#path to Senecaville Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublic\G-resTool_Senecaville Lake (1).mer"

#path to Tappan Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublic\G-resTool_Tappan Lake (1).mer"

#path to Watts Bar Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublic\G-resTool_Watts Bar (1).mer"

#path to William H. Harsha Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublic\G-resTool_William H Harsha Lake (1).mer"

#path to Wingfoot Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublic\G-resTool_Wingfoot Lake (1).mer"





#########LEVEL 2, BASIC, PUBLICLY AVAILABLE, AND LAND USE######
#As of 7/17/18, ten of these reservoirs do not have data in the land use 
  #excel sheet, so they only have level 1 data. The ten reservoirs are:
  #The 6 Bevelhimer lakes:
  #Allatoona, Douglas, Fontana, Guntersville, Hartwell, and Watts Bar
  #and 4 of USEPA lakes:
  #Brookville, Buckhorn, Carr Fork Lake, Cave Run Lake (but these lakes may be in the excel file under 3 letter abreviations- make sure to check on this)

#path to Acton Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublicLanduse\G-resTool_Acton Lake (2).mer"

#path to Allatoona Lake G-res .mer file:
#

#path to Alum Creek Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublicLanduse\G-resTool_Alum Creek Lake (2).mer"

#path to Apple Valley Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublicLanduse\G-resTool_Apple Valley Lake (2).mer"

#path to Atwood Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublicLanduse\G-resTool_Atwood Lake (2).mer"

#path to Brookville lake G-res .mer file:
#

#path to Buckhorn Lake G-res .mer file:
#

#path to Burr Oak Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublicLanduse\G-resTool_Burr Oak Reservoir (2).mer"

#path to Caesar Creek Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublicLanduse\G-resTool_Caesar Creek Lake (2).mer"

#path to Carr Fork Lake G-res .mer file:
#

#path to Cave Run Lake G-res .mer file:
#

#path to Charles Mill Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublicLanduse\G-resTool_Charles Mill Lake (2).mer"

#path to Cowan Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublicLanduse\G-resTool_Cowan Lake (2).mer"

#path to Delaware Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublicLanduse\G-resTool_Delaware Reservoir (2).mer"

#path to Dillon Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublicLanduse\G-resTool_Dillon Lake (2).mer"

#path to Douglas Lake G-res .mer file:
#

#path to Fontana Lake G-res .mer file:
#

#path to Guntersville Lake G-res .mer file:
#

#path to Hartwell Lake G-res .mer file:
#

#path to Hocking County Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublicLanduse\G-resTool_Hocking County Lake (2).mer"

#path to Kiser Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublicLanduse\G-resTool_Kiser Lake (2).mer"

#path to Knox Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublicLanduse\G-resTool_Knox Lake (2).mer"

#path to La Due Reservoir G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublicLanduse\G-resTool_La Due Reservoir (2).mer"

#path to Lake Loramie G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublicLanduse\G-resTool_Lake Loramie (2).mer"

#path to Lake Milton G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublicLanduse\G-resTool_Lake Milton (2).mer"

#path to Lake Mohawk G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublicLanduse\G-resTool_Lake Mohawk (2).mer"

#path to Lake Roaming Rock G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublicLanduse\G-resTool_Lake Roaming Rock (2).mer"

#path to Lake Waynoka G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublicLanduse\G-resTool_Lake Waynoka (2).mer"

#path to Michael J. Kirwan Reservoir G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublicLanduse\G-resTool_Michael J Kirwan Reservoir (2).mer"

#path to Paint Creek Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublicLanduse\G-resTool_Paint Creek Lake (2).mer"

#path to Piedmont Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublicLanduse\G-resTool_Piedmont Lake (2).mer"

#path to Pleasant Hill Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublicLanduse\G-resTool_Pleasant Hill Lake (2).mer"

#path to Rocky Fork Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublicLanduse\G-resTool_Rocky Fork Lake (2).mer"

#path to Senecaville Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublicLanduse\G-resTool_Senecaville Lake (2).mer"

#path to Tappan Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublicLanduse\G-resTool_Tappan Lake (2).mer"

#path to Watts Bar Lake G-res .mer file:
#

#path to William H. Harsha Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublicLanduse\G-resTool_William H Harsha Lake (2).mer"

#path to Wingfoot Lake G-res .mer file:
#"C:\Users\esilve02\RProjects\gRes\inputData\gresInputDataBasicPublicLanduse\G-resTool_Wingfoot Lake (2).mer"




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





