# input Stata file


#Region
sec0a_data <- read.dta(here("raw_data/glss4","sec0a.dta"))

# Household Roster
sec1_data <- read.dta(here("raw_data/glss4","sec1.dta"))

# Education: General Education
sec2a_data <- read.dta(here("raw_data/glss4","sec2a.dta"))

# Education: Educational Career
sec2b_data <- read.dta(here("raw_data/glss4","sec2b.dta"))

# Education: Literacy /Apprenticeship
sec2c_data <- read.dta(here("raw_data/glss4","sec2c.dta"))

# Employment: Screening questions and list of occupations in past 12 months
sec4a_data <- read.dta(here("raw_data/glss4","sec4a.dta"))

# Employment: Characteristics of the main occupation
sec4b_data <- read.dta(here("raw_data/glss4","sec4b.dta"))

# Employment: Secondary occupation during the past 12 months
sec4c_data <- read.dta(here("raw_data/glss4","sec4c.dta"))

# Employment: Third occupation during the past 12 months
sec4d_data <- read.dta(here("raw_data/glss4","sec4d.dta"))

# Employment: Fourth occupation during the past 12 months
sec4e_data <- read.dta(here("raw_data/glss4","sec4e.dta"))

# Employment: Employment search in the past 12 months
sec4f_data <- read.dta(here("raw_data/glss4","sec4f.dta"))

# Employment: Activity status and employment search in the last 7 days
sec4g_data <- read.dta(here("raw_data/glss4","sec4g.dta"))

# Employment: Employment history
sec4h_data <- read.dta(here("raw_data/glss4","sec4h.dta"))

# Employment: Housekeeping
sec4j_data <- read.dta(here("raw_data/glss4","sec4j.dta"))

# Migration
sec5_data <- read.dta(here("raw_data/glss4","sec5.dta"))

# Identification of respondents for sections 8,9,and 10
sec6_data <- read.dta(here("raw_data/glss4","sec6.dta"))

# Housing
sec7_data <- read.dta(here("raw_data/glss4","sec7.dta"))

# Farm land size data
sec8b_data <- read.dta(here("raw_data/glss4","sec8b.dta"))


#Aggregates
agg2_data <- read.dta(here("raw_data/glss4/aggregates","agg2.dta"))

#income from renting out land/livestock and sharecropping at household level
agg4_data <- read.dta(here("raw_data/glss4/aggregates","agg4.dta"))

#community input file

#infrastructure data
cs2_data <- read.dta(here("raw_data/glss4/community","cs2.dta"))

#agricultural practices data
cs5b_data <- read.dta(here("raw_data/glss4/community","cs5b.dta"))

#rm(list=ls())

