#Regression Analysis:

# This script performs a very basic linear regression analysis in R
# for the 'indy.fair.data.csv' dataset.

# Step 1: Install and load necessary packages
# 'tidyverse' is for data manipulation
if (!require("tidyverse")) install.packages("tidyverse")
library(tidyverse)

# Step 2: Load the dataset
# Make sure the 'indy.fair.data.csv' file is in your working directory.
df <- read.csv('indy.fair.data.csv')

# Step 3: Clean the data by removing rows with any missing values
# This is a simple approach for beginners.
df_cleaned <- na.omit(df)

# Step 4: Create a linear regression model
# The formula 'y ~ x1 + x2' means 'y is predicted by x1 and x2'.
# We are trying to predict 'avg.monthly.sales.by.site' using several key factors.
sales_model <- lm(
  avg.monthly.sales.by.site ~ avg.mgr.tenure.months.by.site +
    avg.hrs.annual.training.per.employee.by.site +
    avg.satisfaction +
    avg.engagement,
  data = df_cleaned
)

# Step 5: Print a summary of the model
# The summary() function provides detailed results, including:
# - Coefficients: The estimated effect of each predictor on sales.
# - R-squared: A measure of how well the model fits the data.
# - p-values (Pr(>|t|)): To check if a predictor is statistically significant.
cat("--- Linear Regression Model Summary ---\n\n")
summary(sales_model)

# How to interpret the summary:
# Look at the 'Pr(>|t|)' column. If a p-value is small (e.g., less than 0.05),
# it suggests that the corresponding predictor variable is a significant
# factor in predicting monthly sales.
