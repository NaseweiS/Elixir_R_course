# calculate average gdpPercap for each continent

library(plyr)

gapminder <- read.csv("data/gapminder_data.csv", stringsAsFactors = FALSE)

# in case the file wouldn't have comma as delimiter and . as decimal point
# these things can be read in by read.delim and then specified


# calculating the gdpPercap on every continent and saving the outcome
gdp_per_continent <- ddply(.data = gapminder,
      . = "continent", 
      .fun = function(x) mean(x$gdpPercap))

write.csv(gdp_per_continent, file = "gdp_PC.csv", row.names = FALSE)


# calculating the population on every continent and saving the outcome
pop_per_continent <- ddply(.data = gapminder,
                           . = "continent", 
                           .fun = function(x) mean(x$pop))

write.csv(pop_per_continent, file = "pop_PC.csv", row.names = FALSE)

# to devide pop per continent in different years, create new variable

pop_per_continent_and_year <- ddply(.data = gapminder,
                                    .variables = c("year", "continent"),
                                    .fun = function(x) mean(x$pop))

# to change the order - wether first continents or first years, simply switch the two variables
pop_per_continent_and_year <- ddply(.data = gapminder,
                                    .variables = c("continent", "year"),
                                    .fun = function(x) mean(x$pop))
pop_per_continent_and_year


