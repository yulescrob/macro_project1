#Macroeconomics Theory Project 1

#set your working directory

#loading the data
library(readr)
project1_data <- read_csv("project1_data.csv")
View(project1_data)

#changing missing values to NA
NA->project1_data$hci[project1_data$hci == ".."] 
NA->project1_data$laborforcert[project1_data$laborforcert == ".."]


#sorting the by country and year
library(dplyr)
data <- project1_data %>%
  arrange(country, time) %>%
  group_by(country) %>%
  mutate(growth_rate = (GDP_pp/ lag(GDP_pp)-1)*100) #calculates growth rate

#creating growth rate graphs
library(ggplot2)

growth_plot <- ggplot(data, aes(x = time, y = growth_rate, color = country)) +
  geom_line(linewidth = 1) +
  geom_point(size = 3) +
  labs(title = "GDP Per Capita Growth Rates",
    x = "Year",
    y = "Growth Rate (%)",
    color = "Country"
  ) +
  theme_classic()

