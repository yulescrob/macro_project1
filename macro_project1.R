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

#creating growth rate graphs for all countries
library(ggplot2)
growth_plot <- ggplot(data, aes(x = time, y = growth_rate, color = country)) +
  geom_line(linewidth = 1) +
  geom_point(size = 3) +
  labs(title = "GDP Per Capita Growth Rates",
    x = "Year",
    y = "Growth Rate (%)",
    color = "Country"
  ) +
  theme_minimal()
growth_plot


#Part3
#create subset of data for BGD
bgd_data<- data %>%
  filter(country == "Bangladesh")

#adding a period column for pre-2008, 2008-2019, and 2020 onward
bgd_data<- bgd_data%>%
  mutate(period = case_when(time<2008 ~ "pre-2008", 
                            time<2020 ~ "pre-2020",
                            time<2024 ~ "post-2020") )

#Average GDP growth rate for each period
avg_growth<- bgd_data%>%
  group_by(period)%>%
  summarise(avg_growth_rate = mean(growth_rate,na.rm = TRUE))
avg_growth


#Part4
#Analyzing Bangladesh
plot(bgd_data$growth_rate, bgd_data$popgrowth,#Growth rate vs population growth
     main= "Bangladesh", xlab="Growth rate", ylab = "Population growth")
plot(bgd_data$growth_rate, bgd_data$gni_growth,#growth rate vs GNI growth
     main= "Bangladesh", xlab="Growth rate", ylab = "GNI growth")
plot(bgd_data$growth_rate, bgd_data$cpi, #growth rate vs CPI
     main= "Bangladesh", xlab="Growth rate", ylab = "CPI")
plot(bgd_data$growth_rate, bgd_data$laborforcert, #growth rate vs labor force participation rate
     main= "Bangladesh", xlab="Growth rate", ylab = "Labor force participation rate")


#Analyzing Norway
#create data subset
nor_data<- data %>%
  filter(country == "Norway")

plot(nor_data$growth_rate, nor_data$popgrowth,
     main= "Norway", xlab="Growth rate", ylab = "Population growth")#Growth rate vs population growth
plot(nor_data$growth_rate, nor_data$gni_growth,
     main= "Norway", xlab="Growth rate", ylab = "GNI growth")#growth rate vs GNI growth
plot(nor_data$growth_rate, nor_data$cpi,
     main= "Norway", xlab="Growth rate", ylab = "CPI") #growth rate vs CPI
plot(nor_data$growth_rate, nor_data$laborforcert,
     main= "Norway", xlab="Growth rate", ylab = "Labor force participation rate") #growth rate vs labor force participation rate

#Analyzing Brazil
#create data subset for Brazil
bra_data<- data %>%
  filter(country == "Brazil")

plot(bra_data$growth_rate, bra_data$popgrowth, #Growth rate vs population growth
     main= "Brazil", xlab="Growth rate", ylab = "Population growth")
plot(bra_data$growth_rate, bra_data$gni_growth,#growth rate vs GNI growth
     main= "Brazil", xlab="Growth rate", ylab = "GNI growth")
plot(bra_data$growth_rate, bra_data$cpi, #growth rate vs CPI
     main= "Brazil", xlab="Growth rate", ylab = "CPI")
plot(bra_data$growth_rate, bra_data$laborforcert, #growth rate vs labor force participation rate
     main= "Brazil", xlab="Growth rate", ylab = "Labor force participation rate")
