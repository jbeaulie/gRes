#this script reads in the sources from each data file that was used to input
#data into G-res

##########VARIABLE NOTES################

#####Year of Impoundment/Age of Reservoir#######
  # I think that when G-res said that age of reservoir was important for 
  #diffusive emissions, it didn't mean year of impoundment. 
#G-res assumes that the lifetime of a reservoir is 100 years and uses 
  #the assumption that emissions decrease as the reservoir ages to 
  #calculate lifetime diffusive emissions rather than the actual age of the reservoir
# 7/18/18 After going through the documentation with Jake, we are still unsure
  #about year of impoundment. It appears that it does not affect the methane emission 
  #output, but it is unclear what it's purpose is.
#It is unclear wheather the G-res emission output is a 100 year integration
  #output, or if it is for the current year. G-res does a 100 year
  #integration calculation for diffusive emissions, but not for ebullition.
  #The 100 year integration also seems to be important in gross annual CO2 emissions.
# When calculating the 100 year integration of diffusive emissions, G-res
  #uses a lnZ term, where Z is not defined. This Z variable should be further investigated

#######Land Use#######
#Land use is involved in phosphorus load calculations, and phosphorus 
#concentration is used in calculating CO2

####WRT#########
#water residence time is used in calculating degassing and phosphorus concentration

#######Annual Standardization##########
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

############END OF VARIABLE NOTES####################

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

###########END OF LEVEL 1 INPUT FILES##############



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

############END OF LEVEL 2 INPUT FILES############

##############LEVEL 1 G-RES OUPUT .HTML FILES############
#the paths below lead to the saved outputs that resulted from the level 1
  #G-res input .mer files
#they are all saved as .html because saving as .csv resulted in complicated formatting errors
#to save G-res outputs as a csv, click on the "export to txt" button in the 
  #top right hand corner of G-res, and save the file name as a .csv
#to save G-res outputs as .html, click on the printable report button on
  #the top right corner and then click on output report, then command save once it loads
#the information in these files includes output methane emission data

#path to Acton Lake level 1 output file:
#"C:\Users\esilve02\RProjects\gRes\outputData\gresOutputBasicPublic\htmlFiles\actonOutput1.html"

#path to Allatoona Lake level 1 output file:
#"C:\Users\esilve02\RProjects\gRes\outputData\gresOutputBasicPublic\htmlFiles\allatoonaOutput1.html"

#path to Alum Creek lake level 1 output file:
#"C:\Users\esilve02\RProjects\gRes\outputData\gresOutputBasicPublic\htmlFiles\alumCreekOutput1.html"

#path to Apple Valley Lake level 1 output file:
#"C:\Users\esilve02\RProjects\gRes\outputData\gresOutputBasicPublic\htmlFiles\appleValleyOutput1.html"

#path to Atwood lake level 1 output file:
#"C:\Users\esilve02\RProjects\gRes\outputData\gresOutputBasicPublic\htmlFiles\atwoodOutput1.html"

#path to Brookville Lake level 1 output file:
#"C:\Users\esilve02\RProjects\gRes\outputData\gresOutputBasicPublic\htmlFiles\brookvilleOutput1.html"

#path to Buckhorn Lake level 1 output file:
#"C:\Users\esilve02\RProjects\gRes\outputData\gresOutputBasicPublic\htmlFiles\buckhornOutput1.html"

#path to Burr Oak Lake level 1 output file:
#"C:\Users\esilve02\RProjects\gRes\outputData\gresOutputBasicPublic\htmlFiles\burrOakOutput1.html"

#path to Caesar Creek Lake level 1 output file:
#"C:\Users\esilve02\RProjects\gRes\outputData\gresOutputBasicPublic\htmlFiles\caesarCreekOutput1.html"

#path to Carr Fork Lake level 1 output file:
#"C:\Users\esilve02\RProjects\gRes\outputData\gresOutputBasicPublic\htmlFiles\carrForkOutput1.html"

#path to Cave Run Lake level 1 output file:
#"C:\Users\esilve02\RProjects\gRes\outputData\gresOutputBasicPublic\htmlFiles\caveRunOutput1.html"

#path to Charles Mill Lake level 1 output file:
#"C:\Users\esilve02\RProjects\gRes\outputData\gresOutputBasicPublic\htmlFiles\charlesMillOutput1.html"

#path to Cowan Lake level 1 output file:
#"C:\Users\esilve02\RProjects\gRes\outputData\gresOutputBasicPublic\htmlFiles\cowanOutput1.html"

#path to Delaware Lake level 1 output file:
#"C:\Users\esilve02\RProjects\gRes\outputData\gresOutputBasicPublic\htmlFiles\delawareOutput1.html"

#path to Dillon Lake level 1 output file:
#"C:\Users\esilve02\RProjects\gRes\outputData\gresOutputBasicPublic\htmlFiles\dillonOutput1.html"

#path to Douglas Lake level 1 output file:
#"C:\Users\esilve02\RProjects\gRes\outputData\gresOutputBasicPublic\htmlFiles\douglasOutput1.html"

#path to Fontana Lake level 1 output file:
#"C:\Users\esilve02\RProjects\gRes\outputData\gresOutputBasicPublic\htmlFiles\fontanaOutput1.html"

#path to Guntersville Lake level 1 output file:
#"C:\Users\esilve02\RProjects\gRes\outputData\gresOutputBasicPublic\htmlFiles\guntersvilleOutput1.html"

#path to Hartwell Lake level 1 output file:
#"C:\Users\esilve02\RProjects\gRes\outputData\gresOutputBasicPublic\htmlFiles\hartwellOutput1.html"

#path to Hocking County Lake level 1 output file:
#"C:\Users\esilve02\RProjects\gRes\outputData\gresOutputBasicPublic\htmlFiles\hockingCountyOutput1.html"

#path to Kiser Lake level 1 output file:
#"C:\Users\esilve02\RProjects\gRes\outputData\gresOutputBasicPublic\htmlFiles\kiserOutput1.html"

#path to Knox Lake level 1 output file:
#"C:\Users\esilve02\RProjects\gRes\outputData\gresOutputBasicPublic\htmlFiles\knoxOutput1.html"

#path to La Due Reservoir level 1 output file:
#"C:\Users\esilve02\RProjects\gRes\outputData\gresOutputBasicPublic\htmlFiles\laDueResOutput1.html"

#path to Lake Loramie level 1 output file:
#"C:\Users\esilve02\RProjects\gRes\outputData\gresOutputBasicPublic\htmlFiles\lakeLoramieOutput1.html"

#path to Lake Milton level 1 output file:
#"C:\Users\esilve02\RProjects\gRes\outputData\gresOutputBasicPublic\htmlFiles\lakeMiltonOutput1.html"

#path to Lake Mohawk level 1 output file:
#"C:\Users\esilve02\RProjects\gRes\outputData\gresOutputBasicPublic\htmlFiles\lakeMohawkOutput1.html"

#path to Lake Roaming Rock level 1 output file:
#"C:\Users\esilve02\RProjects\gRes\outputData\gresOutputBasicPublic\htmlFiles\lakeRoamingRockOutput1.html"

#path to Lake Waynoka level 1 output file:
#"C:\Users\esilve02\RProjects\gRes\outputData\gresOutputBasicPublic\htmlFiles\lakeWaynokaOutput1.html"

#path to Michael J. Kirwan Reservoir level 1 output file:
#"C:\Users\esilve02\RProjects\gRes\outputData\gresOutputBasicPublic\htmlFiles\michaelJKirwanResOutput1.html"

#path to Paint Creek Lake level 1 output file:
#"C:\Users\esilve02\RProjects\gRes\outputData\gresOutputBasicPublic\htmlFiles\paintCreekOutput1.html"

#path to Piedmont Lake level 1 output file:
#"C:\Users\esilve02\RProjects\gRes\outputData\gresOutputBasicPublic\htmlFiles\piedmontOutput1.html"

#path to Pleasant Hill Lake level 1 output file:
#"C:\Users\esilve02\RProjects\gRes\outputData\gresOutputBasicPublic\htmlFiles\pleasantHillOutput1.html"

#path to Rocky Fork Lake level 1 output file:
#"C:\Users\esilve02\RProjects\gRes\outputData\gresOutputBasicPublic\htmlFiles\rockyForkOutput1.html"

#path to Senecaville Lake level 1 output file:
#"C:\Users\esilve02\RProjects\gRes\outputData\gresOutputBasicPublic\htmlFiles\senecavilleOutput1.html"

#path to Tappan Lake level 1 output file:
#"C:\Users\esilve02\RProjects\gRes\outputData\gresOutputBasicPublic\htmlFiles\tappanOutput1.html"

#path to Watts Bar Lake level 1 output file:
#"C:\Users\esilve02\RProjects\gRes\outputData\gresOutputBasicPublic\htmlFiles\wattsBarOutput1.html"

#path to William H. Harsha Lake level 1 output file:
#"C:\Users\esilve02\RProjects\gRes\outputData\gresOutputBasicPublic\htmlFiles\williamHarshaOutput1.html"

#path to Wingfoot Lake level 1 output file:
#"C:\Users\esilve02\RProjects\gRes\outputData\gresOutputBasicPublic\htmlFiles\wingfootOutput1.html"

##########END OF LEVEL 1 OUTPUT .CSV FILES#############

########LEVEL 2 G-RES OUTPUT .CSV FILES############
#the following comments are paths to output that are the result of level 2
  #G-res .mer input files
#They are all in .csv format
#The lakes that do not have paths are the same lakes that did not have land use data avaialble

#path to Acton Lake level 2 output file:
#

#path to Allatoona Lake level 2 output file:
#

#path to Alum Creek lake level 2 output file:
#

#path to Apple Valley Lake level 2 output file:
#

#path to Atwood lake level 2 output file:
#

#path to Brookville Lake level 2 output file:
#

#path to Buckhorn Lake level 2 output file:
#

#path to Burr Oak Lake level 2 output file:
#

#path to Caesar Creek Lake level 2 output file:
#

#path to Carr Fork Lake level 2 output file:
#

#path to Cave Run Lake level 2 output file:
#

#path to Charles Mill Lake level 2 output file:
#

#path to Cowan Lake level 2 output file:
#

#path to Delaware Lake level 2 output file:
#

#path to Dillon Lake level 2 output file:
#

#path to Douglas Lake level 2 output file:
#

#path to Fontana Lake level 2 output file:
#

#path to Guntersville Lake level 2 output file:
#

#path to Hartwell Lake level 2 output file:
#

#path to Hocking County Lake level 2 output file:
#

#path to Kiser Lake level 2 output file:
#

#path to Knox Lake level 2 output file:
#

#path to La Due Reservoir level 2 output file:
#

#path to Lake Loramie level 2 output file:
#

#path to Lake Milton level 2 output file:
#

#path to Lake Mohawk level 2 output file:
#

#path to Lake Roaming Rock level 2 output file:
#

#path to Lake Waynoka level 2 output file:
#

#path to Michael J. Kirwan Reservoir level 2 output file:
#

#path to Paint Creek Lake level 2 output file:
#

#path to Piedmont Lake level 2 output file:
#

#path to Pleasant Hill Lake level 2 output file:
#

#path to Rocky Fork Lake level 2 output file:
#

#path to Senecaville Lake level 2 output file:
#

#path to Tappan Lake level 2 output file:
#

#path to Watts Bar Lake level 2 output file:
#

#path to William H. Harsha Lake level 2 output file:
#

#path to Wingfoot Lake level 2 output file:
#

#########END OF LEVEL 2 OUTPUT .csv FILES############



###############CODE FOR READING IN G-RES OUTPUT .CSV FILES################

########READING IN LEVEL 1 OUTPUT .CSV FILES###############
#THE HOPE:
#the following code reads in the G-res output .csv files from each of the lakes
#it combines them into a data frame that includes all of 
  #the output data for each of the lakes

#THE REALITY:
#I wrote this code for acton lake, assuming that all of the .csv output files
  #would be in the same format (because they all contain the same info).
  #However, for some reason the formatting is different on all of them,
  #so I downloaded the html output files and manually inputted the data 
  #into excel
#the code for reading in that excel sheet is below


# library(tidyverse)
# library(dplyr)
# 
# #read in csv file
# file <- "C:/Users/esilve02/RProjects/gRes/outputData/gresOutputBasicPublic/notUsableCsvFiles/actonOutput1.csv"
# read.csv <- read_csv(file, na = "", skip = 0)
# 
# #delete rows 2 and 3 in csv file
# read.csv <- read.csv[-c(2, 3), ]
# 
# #read in the same csv file, but skipping the first 4 rows
# read.csv2 <- read_csv(file, na = "", skip = 4)
# 
# # read.csv2 <- read_csv(file, na = "", skip = 0)
# # read.csv2 <- read.csv3[-c(1,2), ]
# 
# #add in NA columns so that the two versions of the csv line up (headings to values)
# xx = c("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", 
#        "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
#        "AA", "AB", "AC", "AD", "AE", "AF", "AG", "AH", "AI", "AJ", "AK",
#        "AL", "AM", "AN", "AO", "AP", "AQ", "AR")
# read.csv2[xx] <- NA
# read.csv2 <- read.csv2 %>% select ("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", 
#                       "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
#                       "AA", "AB", "AC", "AD", "AE", "AF", "AG", "AH", "AI", "AJ", "AK",
#                       "AL", "AM", "AN", "AO", "AP", "AQ", "AR", everything())
# 
# #rename column names in csv2 so that they are the same as csv
# colnames(read.csv2) <- colnames(read.csv)
# 
# #rbind the two files together into csv3
# read.csv3 <- rbind(read.csv, read.csv2)

######READ IN MANUALLY CREATED G-RES OUTPUT EXCEL FILE#############
#this excel file contains the output information from the G-res .html output files
#it contains the same headings/output information as Jake's dataForGres excel file
#the path for Jake's dataForGres excel file is:
#"C:\Users\esilve02\RProjects\gRes\inputData\dataSources\dataForGres.xlsx"
#the path to the output excel file is:
#"C:\Users\esilve02\RProjects\gRes\outputData\gresOutputBasicPublic\outputDataFromGres.xlsx"
#the following code reads in both files

library(readxl)

#read in dataForGres excel file
dataFile <- read_excel("C:/Users/esilve02/RProjects/gRes/inputData/dataSources/dataForGres.xlsx")

#read in outputDataFromGres
outputFile <- read_excel("C:/Users/esilve02/RProjects/gRes/outputData/gresOutputBasicPublic/outputDataFromGres.xlsx")


####ATTEMPT AT READING IN A PDF#########

# ##This commented code reads in a PDF file- the problem is that it puts the entire pdf into one column/row
# ##I broke the pdf up by page but did not figure out how to break it up by line
# #Acton lake temperature data file

# #packages needed 
# install.packages("tm")
# install.packages("pdftools")
# install.packages("stringr")
# library(tm)
# library(pdftools)
# library(stringr)
# library(tidyr)
# library(dplyr)

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





