library(dplyr)

# will creat an error message, as the package has similar named functions as another package
# by default the function of the last package will be run
# if the function from another package should be run, use package::funtion (e.g. stats::filter)

gapminder <- read.csv("data/gapminder_data.csv", 
                      stringsAsFactors = FALSE)

# %<% is used as a pipe, select is used to only select specific variables from our data
gdp_pop <- gapminder %>% select(gdpPercap, pop)
head(gdp_pop)

# filter is used to only select rows with a certain value (e.g. only europe)
only_europe <- gapminder %>% filter(continent == "Europe") %>%
  select(gdpPercap, pop)

head(only_europe)

# changing the dataframe to group rows that share a specific value (e.g. have the same continent)
grouped_by_continent <- gapminder %>% group_by(continent)

# example usage
grouped_by_continent %>% summarize(mean_gdpPercap = mean(gdpPercap))

grouped_by_continent %>% summarize(mean_pop=mean(pop))


# Calculate the mean population by continent and year

grouped_by_year_and_continent <- grouped_by_continent %>% group_by(continent, year)
grouped_by_year_and_continent %>% summarize(mean_pop=mean(pop))


# or from the beginning:
grouped_by_continent_year <- gapminder %>% group_by(continent,year)
grouped_by_continent_year %>% dplyr::summarise(mean_pop = mean(pop))


# How many countries have data in year 2002?
gapminder %>%
