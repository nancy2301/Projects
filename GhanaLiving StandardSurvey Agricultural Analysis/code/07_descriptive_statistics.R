
# Summary for our model
summary(base)

# Correlation between agricultural profit and Education of head of household
cor(base$hh_highest_educ, base$agriculture_profit)

# Correlation between agricultural profit and farm land area
cor(base$farm_area_acres, base$agriculture_profit)

cor(base)