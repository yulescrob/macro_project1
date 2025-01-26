# Growth Detective - Macroeconomics Project

### The purpose of this project is to visualize the economic growth trajectories across Norway, a developed country, Brazil, an emerging country, and Bangladesh, a developing country.

### Data

Data was downloaded from World Bank's World Development Indicator DataBank. Under *Variables* the three countries mentioned above, the series selected are the following:

-   GDP per capita (current US\$)

-   Consumer price index (2010 = 100)

-   Labor force participation rate, total (% of total population ages 15+) (national estimate)

-   Human capital index (HCI) (scale 0-1)

-   Population growth (annual %)

-   Population, total

-   GNI growth (annual %)

The time selected was from 2000 to 2023. Under *Layout,* the row was set to time, column to series, and page to country. After downloading the CSV file, the foot note was removed and the columns were renamed using Excel. All other data cleanning was doen in R and is under the macro_project1.R file. 

### Replicating
To replicate the project in R, make sure your data file is under your current working directory. Using file macro_project1.R, you can load and filter the data as detailed on the comments. 

