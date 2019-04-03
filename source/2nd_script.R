# load ggplot2 package into R
library("ggplot2")

gapminder <- read.csv("data/gapminder_data.csv", 
                      stringsAsFactors = FALSE)

head(gapminder)

ggplot(data = gapminder,
       aes(x = gdpPercap, y = lifeExp)) + geom_point()


ggplot(data = gapminder,
       aes(x = year, y = lifeExp)) + geom_point()

ggplot(data = gapminder,
       aes(x = year, y = lifeExp, color = continent, by = country)) + 
  geom_line()

# the geom_line gives horizontal lines, the geom_point vertical points
# different examples:
ggplot(data = gapminder,
       aes(x = year, y = lifeExp, color = continent, by = country)) + 
  geom_line() + geom_point()

ggplot(data = gapminder,
       aes(x = year, y = lifeExp, by = country)) + 
  geom_line(aes(color=continent)) + geom_point()

ggplot(data = gapminder,
       aes(x = year, y = lifeExp, by = country)) + 
  geom_line(aes(color=continent)) + geom_point(color="blue")

ggplot(data = gapminder,
       aes(x = year, y = lifeExp, by = country)) + 
   geom_point(color="blue") + geom_line(aes(color=continent))

# changing axis for gdp per capita (compare the following examples)
ggplot(data = gapminder,
       aes(x = gdpPercap, y = lifeExp, color = continent)) + 
  geom_point()

ggplot(data = gapminder,
       aes(x = gdpPercap, y = lifeExp, color = continent)) + 
  geom_point() + scale_x_log10()

ggplot(data = gapminder,
       aes(x = gdpPercap, y = lifeExp, color = continent)) + 
  geom_point() + scale_x_log10() + 
  geom_smooth(method = "lm")

ggplot(data = gapminder,
       aes(x = gdpPercap, y = lifeExp, color = continent)) + 
  geom_point() + scale_x_log10() + 
  geom_smooth(method = "lm", color = "black")

# changing the size of something
ggplot(data = gapminder,
       aes(x = gdpPercap, y = lifeExp, color = continent)) + 
  geom_point() + scale_x_log10() + 
  geom_smooth(method = "lm", color = "black", se = 0.9999)

# same
ggplot(data = gapminder,
       aes(x = gdpPercap, y = lifeExp)) + 
  geom_point(aes(color = continent)) + scale_x_log10() + 
  geom_smooth(method = "lm", color = "black", se = 0.9999)

# making points transparent
ggplot(data = gapminder,
       aes(x = gdpPercap, y = lifeExp)) + 
  geom_point(aes(color = continent), alpha = 0.5) + scale_x_log10() + 
  geom_smooth(method = "lm", color = "black", se = 0.9999)

# changing the thickness of the line
ggplot(data = gapminder,
       aes(x = gdpPercap, y = lifeExp)) + 
  geom_point(aes(color = continent), alpha = 0.5) + scale_x_log10() + 
  geom_smooth(method = "lm", color = "black", se = 0.9999, size = 2)

# creating different plots for each continent
ggplot(data = gapminder,
       aes(x = gdpPercap, y = lifeExp)) + 
  geom_point(aes(color = continent), alpha = 0.5) + scale_x_log10() + 
  geom_smooth(method = "lm", color = "black", se = 0.9999, size = 2) +
  facet_wrap(~continent)



