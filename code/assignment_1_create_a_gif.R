# Note: The working directory should be set to source code directory
# in order for the code to generate the output correctly.
library(gganimate)
library(gifski)
library(ExPanDaR)
library(tidyverse)
library(animation)
library(transformr)

data(worldbank)
data(worldbank_data_def)
data(worldbank_var_def)
data(ExPanD_config_worldbank)

output_dir <- "../output/"
file_name <- "assigment_1.gif"

# CO2 emissions (metric tons per capita) vs GNI per capita in terms of 2010 USD
worldbank %>%
  mutate(year = as.integer(as.character(year))) %>%
  ggplot(mapping = aes(x = NY.GNP.PCAP.KD, y = EN.ATM.CO2E.PC)) +
  geom_smooth(se = FALSE) +
  theme_minimal() +
  labs(title = 'Year: {frame_time}', x = "GNI per capita (2010 US$)", y = "CO2 emissions (metric tons per capita)") +
  transition_time(year) +
  scale_x_continuous(labels = scales::comma)

anim_save("assigment_1.gif", path = output_dir, animation = last_animation())
