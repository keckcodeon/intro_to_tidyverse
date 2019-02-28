#' ---
#' title: "Introduction to dplyr"
#' author: "Kevin Stachelek"
#' date: "2019/03/06 (updated: `r Sys.Date()`)"
#' output:
#'   xaringan::moon_reader:
#'     lib_dir: libs
#'     nature:
#'       highlightStyle: github
#'       highlightLines: true
#'       countIncrementalSlides: false
#' ---
#' 
## ----setup, echo = F-----------------------------------------------------
knitr::opts_chunk$set(warning = F, message = F)

#' 
#' # Resources
#' 
#' [R for Data Science](https://r4ds.had.co.nz/)
#' 
#' [rstudio cheat sheets](https://www.rstudio.com/resources/cheatsheets/)
#' 
#' ---
#' 
#' # Load Packages
#' 
## ------------------------------------------------------------------------
# load 'gapminder' package containing demographic data
library(gapminder)

# load 'dplyr' package for manipulating data 
library(dplyr)


#' 
#' ---
#' 
#' # Look at the data
#' 
## ------------------------------------------------------------------------
#look at gapminder
gapminder

#' 
#' --
#' 
#' ## How many observations are in the gapminder dataset?
#' 
#' ---
#' 
#' # The Filter Verb
#' 
#' ![](filter_verb.png)
#' 
#' --
#' 
#' # The Pipe
#' 
#' ![](pipe.png)
#' 
#' ---
#' 
#' # Filtering
#' 
## ------------------------------------------------------------------------
gapminder %>%
  filter(year == 2007)

#' 
#' ---
#' 
#' # Let's Review
#' 
#' + '%>%' is a pipe
#' 
#' --
#' 
#' + '==' means 'is this equal?' (test)
#' 
#' --
#' 
#' + '=' means 'set this equal' (assignment)
#' 
#' --
#' ## How many rows are in the filtered data?
#' 
#' ---
#' 
#' # Filtering by string
#' 
## ------------------------------------------------------------------------
gapminder %>%
  filter(country == "United States")

#' --
#' + It's important to use quotes around this filter
#' 
#' ---
#' 
#' # Filtering by Two Variables
#' 
## ------------------------------------------------------------------------
gapminder %>%
  filter(year == 2007, country == "United States")

#' --
#' * each statement within '()' separated by comma is called an argument
#' 
#' ---
#' 
#' #  The Arrange verb
#' 
#' ![](arrange_verb.png)
#' 
#' ---
#' 
#' # Arrange by Variable
#' 
## ------------------------------------------------------------------------
gapminder %>%
  arrange(gdpPercap)

#' 
#' * you can use `desc` to sort in reverse order
#' 
#' ---
#' 
#' # Filter and Arrange
#' 
## ------------------------------------------------------------------------
gapminder %>%
  filter(year == 2007) %>%
  arrange(desc(gdpPercap))

#' 
#' * The pipe `%>%` is useful for combining operations together
#' 
#' ---
#' 
#' # The Mutate Verb
#' 
#' ![](mutate_verb.png)
#' 
#' * used to add a new variable
#' * or change a variable based on the value of another
#' 
#' ---
#' 
#' # Change an existing variable
#' 
## ------------------------------------------------------------------------
gapminder %>%
  mutate(pop = pop / 1000000)

#' 
#' ---
#' 
#' # Add a new variable
#' 
## ------------------------------------------------------------------------
gapminder %>%
  mutate(gdp = gdpPercap * pop)

#' 
#' * column names need to be one word (no spaces!)
#' 
#' ---
#' 
#' #  Combining Verbs
#' 
#' Which countries had the highest gdp in 2007?
#' 
## ------------------------------------------------------------------------
gapminder %>%
  mutate(gdp = gdpPercap * pop) %>% # create gdp column
  filter(year == 2007) %>% # filter by year
  arrange(desc(gdp)) # sort by gdp

#' 
#' ---
#' 
#' # The Summarize verb
#' 
#' ![](summarize_verb.png)
#' 
#' ---
#' 
#' What is the average life expectancy across all countries and years?
#' 
#' --
#' 
## ------------------------------------------------------------------------
gapminder %>%
  summarize(meanLifeExp = mean(lifeExp))

#' 
#' ---
#' 
#' What is the average life expectancy across all countries in 2007?
#' 
#' --
#' 
#' combine with `filter`!
#' 
#' --
#' 
## ------------------------------------------------------------------------
gapminder %>%
  filter(year == 2007) %>%
  summarize(meanLifeExp = mean(lifeExp))

#' 
#' ---
#' 
#' What is the average life expectancy and total population across all countries in 2007?
#' 
#' --
#' 
#' 
#' add another summary using a different function, `sum`
#' 
#' --
#' 
## ------------------------------------------------------------------------
gapminder %>%
  filter(year == 2007) %>%
  summarize(meanLifeExp = mean(lifeExp),
            totalPop = sum(pop)) #<<

#' 
#' ---
#' 
#' # Functions you can use for summarizing
#' 
#' + mean
#' 
#' + sum
#' 
#' + median
#' 
#' + min
#' 
#' + max
#' 
#' ---
#' 
#' # The group_by verb
#' 
#' What is the average life expectancy and total population across all countries in each year?
#' 
#' --
#' 
#' How do we tell R to __iterate__ by year?
#' 
#' --
#' 
#' Use `group_by`!
#' 
#' --
#' 
#' ![](group_by_verb.png)
#' ---
#' 
#' 
## ------------------------------------------------------------------------
gapminder %>%
  group_by(year) %>% #<<
  summarize(meanLifeExp = mean(lifeExp),
            totalPop = sum(pop)) 

#' 
#' ---
#' 
#' What is the average life expectancy and total population __for each continent__ across all years?
#' 
#' --
#' 
## ------------------------------------------------------------------------
gapminder %>%
  group_by(continent) %>% #<<
  summarize(meanLifeExp = mean(lifeExp),
            totalPop = sum(pop))

#' 
#' ---
#' 
#' What is the average life expectancy and total population for each continent __for each year__?
#' 
#' --
#' 
## ------------------------------------------------------------------------
gapminder %>%
  group_by(year, continent) %>% #<<
  summarize(meanLifeExp = mean(lifeExp),
            totalPop = sum(pop))

#' 
#' 
