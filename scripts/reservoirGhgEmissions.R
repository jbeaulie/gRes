# SCRIPT FOR PULLING TOGETHER DATA FOR R4 PRESENTATION
# SHARED WITH ELEANOR SILVER VIA GITHUB ON 6/27/2018

# LIBRARIES
library(tidyverse)
library(readxl)


# READ IN DATA COMPARING GRes ESTIMATES TO MEASURED VALUES
gres <- read_excel(path = "inputData/dataForGres.xlsx")

# PLOTS
# With 1:1 line
ggplot(gres, aes(ch4.trate.mg.h_Estimate_Annual, t.ch4.mgCH4.m2.hr.gres)) + 
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
ggplot(gres, aes(ch4.trate.mg.h_Estimate_Annual, t.ch4.mgCH4.m2.hr.gres)) + 
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
ggplot(gres, aes(ch4.trate.mg.h_Estimate_Annual, t.ch4.mgCH4.m2.hr.gres)) + 
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
co2Equiv <- read_excel(path = "inputData/deemerReservoirGwp.xlsx")
 
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

