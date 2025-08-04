## Workforce Insights: Translating Employee Data into Scalable People Solutions R
# # General Data Preparation
# Viewing the number of rows (observations)
nrow (ifd)
# Viewing  the number of columns (variables)
ncol(ifd)
# Viewing dimensions (rows and columns together)
dim(ifd) 
# Viewing structure of the dataset (shows variable types and example values)
str(ifd)
# Viewing summary statistics (min, max, mean, etc.)
summary(ifd) 
# Checking no. of NAs
sum(is.na(ifd))
# Creating new dataframe with data only for stores as we need only that
store_only <- ifd[ifd$site.type == "store", ]
# Checking summary of new dataframe
summary(store_only)
# Checking no. of rows in new dataframe
nrow(store_only)
# Checking no. of columns in new dataframe
ncol(store_only)
# Checking structure (data type) of new dataframe
str(store_only)
# Checking if any NAs are there in new dataframe
sum(is.na(store_only)) 

A) INCREASE IN TURNOVER RATES
# 1) Data Preparation
# No additional data prep required as all of it has been done above already

# 2) Exploratory Analysis
# Correlation analysis between turnover and probable key predictors i.w Engagement, Satisfaction, Hourly Pay Rate, Tenure, Training Hours

# Turnover vs Engagement
cor(store_only$annualized.turnover.percent.by.site.number, store_only$avg.engagement)

# Turnover vs Satisfaction
cor(store_only$annualized.turnover.percent.by.site.number, store_only$avg.satisfaction)

# Turnover vs Hourly Pay Rate
cor(store_only$annualized.turnover.percent.by.site.number, store_only$hourly.pay.rate)

# Turnover vs Tenure
cor(store_only$annualized.turnover.percent.by.site.number, store_only$tenure.months)

# Turnover vs Training Hours
cor(store_only$annualized.turnover.percent.by.site.number, store_only$avg.hrs.annual.training.per.employee.by.site)

# Results: # Analysis revealed strong negative relationships 
# between turnover and engagement (r = –0.77), satisfaction (r = –0.78), tenure (r = –0.76), and training hours (r = –0.80)
# These findings suggest that lower morale, shorter tenure, and reduced investment in employee development 
# are associated with higher turnover rates. Hourly pay showed a very weak correlation (r = –0.01), 
# indicating compensation may not be a major factor in explaining turnover

# B) DECREASE IN SALES

# 1) Data Preparation
# Changing Region's data type to factor
store_only$region <- as.factor(store_only$region)
#Confirming ti is factor 
str(store_only$region)
# Results: It is now a factor with 4 levels

# 2) Exploratory Analysis

# Correlation between monthly sales and corporate visits
cor(store_only$avg.monthly.sales.by.site, store_only$avg.corp.visits.to.site.each.year)

# Scatterplot for monthly sales and corporate visits
plot(store_only$avg.corp.visits.to.site.each.year,
     store_only$avg.monthly.sales.by.site)


# Correlation between monthly sales and annual training hours
cor(store_only$avg.monthly.sales.by.site, store_only$avg.hrs.annual.training.per.employee.by.site)

# Scatterplot for monthly sales and corporate visits
plot(store_only$avg.hrs.annual.training.per.employee.by.site,
     store_only$avg.monthly.sales.by.site)


# Results: # Correlation between monthly sales and two probable predictors:
# - Corporate Visits (r = 0.68)
# - Annual Training Hours (r = 0.74)
# showed strong positive linear associations, indicating that increased leadership engagement 
# and employee development are correlated with higher sales performance at stores
