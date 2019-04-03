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
