## ----setup, echo = F-----------------------------------------------------
knitr::opts_chunk$set(warning = F, message = F)

## ------------------------------------------------------------------------
# load 'gapminder' package containing demographic data
library(gapminder)

# load 'dplyr' package for manipulating data 
library(dplyr)


## ------------------------------------------------------------------------
#look at gapminder
gapminder

## ------------------------------------------------------------------------
gapminder %>%
  filter(year == 2007)

## ------------------------------------------------------------------------
gapminder %>%
  filter(country == "United States")

## ------------------------------------------------------------------------
gapminder %>%
  filter(year == 2007, country == "United States")

## ------------------------------------------------------------------------
gapminder %>%
  arrange(gdpPercap)

## ------------------------------------------------------------------------
gapminder %>%
  arrange(desc(gdpPercap))

## ------------------------------------------------------------------------
gapminder %>%
  filter(year == 2007) %>%
  arrange(desc(gdpPercap))

## ------------------------------------------------------------------------
gapminder %>%
  mutate(pop = pop / 1000000)

## ------------------------------------------------------------------------
gapminder %>%
  mutate(gdp = gdpPercap * pop)

## ------------------------------------------------------------------------
gapminder %>%
  mutate(gdp = gdpPercap * pop) %>% # create gdp column
  filter(year == 2007) %>% # filter by year
  arrange(desc(gdp)) # sort by gdp

## ------------------------------------------------------------------------
gapminder %>%
  summarize(meanLifeExp = mean(lifeExp))

## ------------------------------------------------------------------------
gapminder %>%
  filter(year == 2007) %>%
  summarize(meanLifeExp = mean(lifeExp))

## ------------------------------------------------------------------------
gapminder %>%
  filter(year == 2007) %>%
  summarize(meanLifeExp = mean(lifeExp),
            totalPop = sum(pop)) #<<

## ------------------------------------------------------------------------
gapminder %>%
  group_by(year) %>% #<<
  summarize(meanLifeExp = mean(lifeExp),
            totalPop = sum(pop)) 

## ------------------------------------------------------------------------
gapminder %>%
  group_by(continent) %>% #<<
  summarize(meanLifeExp = mean(lifeExp),
            totalPop = sum(pop))

## ------------------------------------------------------------------------
gapminder %>%
  group_by(year, continent) %>% #<<
  summarize(meanLifeExp = mean(lifeExp),
            totalPop = sum(pop))

