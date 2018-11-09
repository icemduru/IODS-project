# Name: Ilhan Cem Duru
# Date: 09.11.2018
# file description: this is a rscript file for the RStudio Exercise 2, data wrangling section 1.

#pulling the data and read in 
data <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header=TRUE)


#checking the data dimentions
dim(data)
#looks like there are 183 rows and 60 columns

#checking the data structure
str(data)
#looks like there are 60 variables except gender all variables are integer. gender is factor with 2 levels.