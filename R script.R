
## Step 1. Let's install our packages and load libraries afterward.

install.packages("tidyverse")  
install.packages("ggplot2")  
install.packages("lubridate")  
install.packages("dplyr")  

library(tidyverse)  
library(lubridate)
library(ggplot2)
library(dplyr)
library(readr)

getwd()

setwd("C:/Users/Administrator/Documents/StudentsPerformance.csv")

stud <- read_csv("C:/Users/Administrator/Documents/StudentsPerformance.csv")

head(stud)

glimpse(stud)

View(stud)

## Step 2. Cleaning Data

#Inspecting Data incorugencies 

colnames(stud)

str(stud)

dim(stud)

is.null(stud)

# Step 3. Analysis

summary(stud)

skimr::skim_without_charts(stud)

# View unique values in the data frame 

unique(stud$`parental level of education`)

unique(stud$lunch)

unique(stud$`test preparation course`)

unique(stud$`race/ethnicity`)

#  First approach to data

install.packages("funModeling")
install.packages("Hmisc")

library(funModeling) 
library(Hmisc)

df_status(stud)

# Analyzing categorical variables 

freq(stud$gender)

freq(stud$`race/ethnicity`)  

freq(stud$`parental level of education`)

freq(stud$lunch)

freq(stud$`test preparation course`)

# Analyzing numerical variables

plot_num(stud)

data_prof = profiling_num(stud)

data_prof %>% select(variable, variation_coef, range_98)

# Plot data

-- lunch by gender

ggplot(stud)+
  geom_boxplot(aes(x=lunch, y=`math score`,fill = gender))+
  labs(title="Math Exam: Male vs Female")

ggplot(stud)+
  geom_boxplot(aes(x=lunch, y=`reading score`,fill = gender))+
  labs(title="Reading Exam: Male vs Female")

ggplot(stud)+
  geom_boxplot(aes(x=lunch, y=`writing score`,fill = gender))+
  labs(title="Writing Exam: Male vs Female")

-- test preparation course by gender

ggplot(stud)+
  geom_boxplot(aes(x=`test preparation course`, y=`math score`,fill = gender))+
  labs(title="Math Exam: Test preparation course")

ggplot(stud)+
  geom_boxplot(aes(x=`test preparation course`, y=`reading score`,fill = gender))+
  labs(title="Reading Exam: Test preparation course")

ggplot(stud)+
  geom_boxplot(aes(x=`test preparation course`, y=`writing score`,fill = gender))+
  labs(title="Writing Exam: Test preparation course")

-- parental level of education by gender

ggplot(stud)+
  geom_boxplot(aes(x=`parental level of education`, y=`math score`,fill = gender))+
  labs(title="Math Exam: Parental level of education")

ggplot(stud)+
  geom_boxplot(aes(x=`parental level of education`, y=`reading score`,fill = gender))+
  labs(title="Reading Exam: Parental level of education")

ggplot(stud)+
  geom_boxplot(aes(x=`parental level of education`, y=`writing score`,fill = gender))+
  labs(title="Writing Exam: Parental level of education")


ggplot(stud)+
  geom_col(aes(x=`test preparation course`, y=`math score`, group=stud$gender, fill = gender))+
  facet_wrap(~stud$`race/ethnicity`, ncol=3)+
  labs(title="math test score by test preparation course")

ggplot(stud)+
  geom_col(aes(x=`test preparation course`, y=`reading score`, group=stud$gender, fill = gender))+
  facet_wrap(~stud$`race/ethnicity`, ncol=3)+
  labs(title="reading test score by test preparation course")

ggplot(stud)+
  geom_col(aes(x=`test preparation course`, y=`writing score`, group=stud$gender, fill = gender))+
  facet_wrap(~stud$`race/ethnicity`, ncol=3)+
  labs(title="writing test score by test preparation course")

ggplot(stud)+
  geom_col(aes(x=`lunch`, y=`math score`, group=stud$gender, fill = gender))+
  facet_wrap(~stud$`race/ethnicity`, ncol=6)+
  labs(title="math test score by meal plan")

ggplot(stud)+
  geom_col(aes(x=`lunch`, y=`reading score`, group=stud$gender, fill = gender))+
  facet_wrap(~stud$`race/ethnicity`, ncol=6)+
  labs(title="reading test score by  meal plan")

ggplot(stud)+
  geom_col(aes(x=`lunch`, y=`math score`, group=stud$gender, fill = gender))+
  facet_wrap(~stud$`race/ethnicity`, ncol=6)+
  labs(title="writing test score by  meal plan")

# Let's find a correlation among each other.

# A correlation coefficient of 0.8 suggests a link between math vs reading score available that is reasonably strong. 
# The higher the math score the higher the writing score, although other factors may also impact such increases. 
# The same correlation coefficient of 0.8 for math vs writing score. 
# However, the correlation coefficient of 1 is for writing vs reading score which means a more strong link between them.

ggplot(data = stud, mapping = aes(x= stud$`math score`, y= stud$`writing score`))+
  geom_jitter(alpha=0.5)+geom_rug(position = "jitter", size=.08)+
  geom_smooth(linewidth=0.7)+
  labs(title = "math vs writing", x="math score", y="Writing Score")+
  theme_minimal()

ggplot(data = stud, mapping = aes(x= stud$`math score`, y= stud$`reading score` ))+
  geom_jitter(alpha=0.5)+geom_rug(position = "jitter", size=.08)+
  geom_smooth(linewidth=0.7)+
  labs(title = "math vs reading", x="math score", y="Reading Score")+
  theme_minimal()

ggplot(data = stud, mapping = aes(x= stud$`writing score`, y= stud$`reading score` ))+
  geom_jitter(alpha=0.5)+geom_rug(position = "jitter", size=.08)+
  geom_smooth(linewidth=0.7)+
  labs(title = "writing vs reading", x="writing score", y="Reading Score")+
  theme_minimal()
