
# initilizing libraries 
library(tidyverse)
library(ggplot2)
library(janitor)
library(GGally)
library(explore)

# importing data

Titanic_df <- as.tibble(Titanic)

# cleaning data

# checking for missing values
sum(is.na(Titanic_df))

# checking for duplicates
get_dupes(Titanic_df)

# there is no missing or duplicates values, therefor no further cleaning is required


# EDA

# lets take a look at our data first

glimpse(Titanic_df)


# we can see that our data has two numeric (doubles) variables, Weight and Time
# and two factors, Chick with with 50 levels, and Diet with 4 levels

# check the summary

summary(Titanic_df)


# we see that our data has 4 factors and 1 numeric variables

# EDA

Titanic_df %>%
  explore(Class, target = Survived, n = n, split = FALSE)
  
# here we see the distribution of passengers and how many of them survived by class


# lets also check for survival by sex

Titanic_df %>% explore(Sex, target = Survived, n = n)

# we can see that females have a very high survival percentage than males

# lets also check for survival by age

Titanic_df %>% explore(Age, target = Survived, n = n)

# it looks like children have better survival chance than adults


# now lets check for class by age

Titanic_df %>% explore(Age, target = Class, n = n)

# we can see that very few childrens are first class, and all crew members are adults


# now lets check for class by sex

Titanic_df %>% explore(Sex, target = Class, n = n)

# there are very few female crew members, and females tend to have better Class, which might explain their high survival rate
