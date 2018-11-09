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

#call the library
library(dplyr)

#Create an analysis dataset with the variables gender, age, attitude, deep, stra, surf and points

#combine questions and create new colums
# questions related to deep, surface and strategic learning
deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")

#Creating the new columns and take the average
deep_columns <- select(data, one_of(deep_questions))
data$deep <- rowMeans(deep_columns)

surface_columns <- select(data, one_of(surface_questions))
data$surf <- rowMeans(surface_columns)

strategic_columns <- select(data, one_of(strategic_questions))
data$stra <- rowMeans(strategic_columns)

#creating attitude column by dividing the values to 10.
data$attitude <- data$Attitude / 10

#creating learning2014 as results.
keep_columns <- c("gender","Age","attitude", "deep", "stra", "surf", "Points")
learning2014 <- select(data, one_of(keep_columns))

#Exclude observations where the exam points variable is zero
learning2014 <- filter(learning2014, Points > 0)

#check dimentions, structure, and summary
dim(learning2014)
str(learning2014)
summary(learning2014)


#set working directory
setwd('/home/iduru/Desktop/IODS-project/data/')
#Save the analysis dataset to the ‘data’ folder
write.csv(learning2014, file = "/home/iduru/Desktop/IODS-project/data/learning2014.csv")
write.table(learning2014, sep = ",", file = "/home/iduru/Desktop/IODS-project/data/learning2014.txt")


#Demonstrate that you can also read the data again by using read.table() or read.csv()
demo_table = read.table(file="/home/iduru/Desktop/IODS-project/data/learning2014.txt", sep=",")
dim(demo_table)
str(demo_table)
summary(demo_table)
demo_csv = read.csv(file="/home/iduru/Desktop/IODS-project/data/learning2014.csv")
dim(demo_csv)
str(demo_csv)
summary(demo_csv)
