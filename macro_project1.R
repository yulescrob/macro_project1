#loading the data
library(readr)
project1_data <- read_csv("~/Library/CloudStorage/OneDrive-UniversityofCincinnati/Macro/project1_data.csv")
View(project1_data)

#changing missing values to NA
NA->data_project1$hci[data_project1$hci == ".."] 
NA-> data_project1$laborforcert[data_project1$laborforcert == ".."]
