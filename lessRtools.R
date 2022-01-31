## Less R tools ##

##Start by importing our gss & world bank data
## Load tools all at once w/ library()
library (summarytools)
library(lessR)
library(expss)
library(ggplot2)
##Question One
##freq/percentage table for 3 variables
classVar <- freq(gss$class)
education <- freq(gss$educ)
piety <- freq(gss$attend)

##These frequency tables help categorize data by occurrence and show what
## cumulative percentile ranges for the sample

##Question Two
##pie chart for degree var

PieChart(degree,
         data = gss,
         main = "Highest Degree")
##Question Three
##Bar Graph For Health

BarChart(health,
         data = gss,
         fill ="terrain",
         main = "Health Conditions Across Racial Subgroups",
         by = race,
         beside=TRUE,
         values_position = "out") 

        
## Condition of Health across racial subgroups
## Interpret the graph

## White people make up the majority of the sample group
## All health distribution trends %deltaY (+/-) are equal across racial subgroups


##Question Four
Histogram(educ,
          data = gss,
          fill ="terrain",
          main = "Education Years by Class",
          by1 = class,
          values_position = "out")

##This graph shows that the majority of people with higher years of education
## are represented in the upper, middle, and working class, 
## but less in lower classes

##World Bank##

##Question Five##
## Life Expectancy Histogram by income
Histogram(lifeexpect,
          data = wb,
          fill ="terrain",
          main = "Life Expectancy by Income ",
          by1 = highincome,
          values_position = "out")

#Higher Income Individuals have much more closely grouped high life expectancy

##Question Six##

incomecat <- data.frame(wb$gdppc)
##Import gdppc variable
incomecat$wb.gdppc[incomecat$wb.gdppc < 2037] = 1
incomecat$wb.gdppc[incomecat$wb.gdppc >= 2037 & incomecat$wb.gdppc <= 6434] = 2
incomecat$wb.gdppc[incomecat$wb.gdppc > 6434 & incomecat$wb.gdppc <= 19745] = 3
incomecat$wb.gdppc[incomecat$wb.gdppc > 19745] = 4

incomecatDf <- data.frame(incomecat$wb.gdppc,wb$co2tot)
##Question Seven##
Histogram(wb.co2tot,
          data = incomecatDf,
          fill ="terrain",
          main = "C02 Emissions Across Income ",
          by1 = incomecat.wb.gdppc)

#This shows countries in group 3 produces the most C02 emissions