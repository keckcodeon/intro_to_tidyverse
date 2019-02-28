## ----setup, echo = F-----------------------------------------------------
knitr::opts_chunk$set(warning = F, message = F, fig.height = 4)

## ------------------------------------------------------------------------
library(dplyr)
library(ggplot2)
library(gapminder)

## ------------------------------------------------------------------------
gm_2007 <- gapminder %>%
  filter(year == 2007)

gm_2007

## ------------------------------------------------------------------------
ggplot(gm_2007, aes(x = gdpPercap, y = lifeExp)) +
geom_point()

## ---- eval = F-----------------------------------------------------------
## ggplot(gm_2007, aes(x = gdpPercap, y = lifeExp)) +
## geom_point()

## ------------------------------------------------------------------------
ggplot(gm_2007, aes(x = gdpPercap, y = lifeExp)) +
  geom_point() +
  scale_x_log10()

## ------------------------------------------------------------------------
ggplot(gm_2007, aes(gdpPercap, lifeExp, color = continent)) +
  geom_point() +
  scale_x_log10()

## ------------------------------------------------------------------------
ggplot(gm_2007, 
       aes(gdpPercap, lifeExp, color = continent, size = pop)) +
  geom_point() +
  scale_x_log10()

## ------------------------------------------------------------------------
facet_plot <- ggplot(gm_2007, aes(x = gdpPercap, y = lifeExp)) +
  geom_point() +
  scale_x_log10() +
  facet_wrap(~ continent)

print(facet_plot)


## ------------------------------------------------------------------------
ggsave("test_facet_plot2.pdf")

## ------------------------------------------------------------------------
ggsave("test_facet_plot2.pdf", plot = facet_plot)

## ------------------------------------------------------------------------
 
pdf("test_facet_plot1.pdf")
facet_plot
dev.off()

## ------------------------------------------------------------------------
# can use the rstudio viewer pane
print(facet_plot)

## ------------------------------------------------------------------------
by_year <- gapminder %>%
  group_by(year) %>%
  summarize(totalPop = sum(pop, na.rm = T)) %>%
  identity()

by_year

## ------------------------------------------------------------------------
ggplot(by_year, aes(x = year, y = totalPop)) +
  geom_point()


## ------------------------------------------------------------------------
ggplot(by_year, aes(x = year, y = totalPop)) +
  geom_point() +
  expand_limits(y = 0)

## ------------------------------------------------------------------------
by_year_continent <- gapminder %>%
  group_by(year, continent) %>%
  summarize(totalPop = sum(pop),
            meanLifeExp = mean(lifeExp))

by_year_continent

## ------------------------------------------------------------------------
ggplot(by_year_continent, aes(x = year, y = totalPop, color = continent)) +
  geom_point() +
  expand_limits(y = 0)

## ------------------------------------------------------------------------
ggplot(by_year_continent, aes(x = year, y = totalPop, color = continent, height = 3)) +
  geom_line() + #<<
  expand_limits(y = 0)

## ---- echo = F-----------------------------------------------------------

by_continent <- gapminder %>%
  group_by(continent) %>%
  summarize(meanLifeExp = mean(lifeExp, na.rm = T)) %>%
  identity()


## ------------------------------------------------------------------------
ggplot(by_continent, aes(x = continent, y = meanLifeExp)) +
  geom_col() #<<


## ------------------------------------------------------------------------
ggplot(gm_2007, aes(x = lifeExp)) +
  geom_histogram() #<<

## ------------------------------------------------------------------------
ggplot(gm_2007, aes(x = lifeExp)) +
  geom_histogram(binwidth = 5) #<<

## ------------------------------------------------------------------------
ggplot(gm_2007, aes(x = continent, y = lifeExp)) +
  geom_boxplot() #<<

## ------------------------------------------------------------------------
ggplot(gm_2007, aes(x = lifeExp)) +
  geom_histogram() #<<

## ------------------------------------------------------------------------
ggplot(gm_2007, aes(x = continent, y = lifeExp)) +
  geom_boxplot() #<<

