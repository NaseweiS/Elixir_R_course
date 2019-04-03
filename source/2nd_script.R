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

# adding/changing labels on the plots
ggplot(data = gapminder,
       aes(x = gdpPercap, y = lifeExp)) + 
  geom_point(aes(color = continent), alpha = 0.5) + scale_x_log10() + 
  geom_smooth(method = "lm", color = "black", se = 0.9999, size = 2) +
  facet_wrap(~continent) +
  labs(
    x = "GDP per Capita", 
    y = "Life Expectancy", 
    title = "Figure 1",
    color = "Continent"
    ) 

# removing e.g. labels and ticks from the axis
ggplot(data = gapminder,
       aes(x = gdpPercap, y = lifeExp)) + 
  geom_point(aes(color = continent), alpha = 0.5) + scale_x_log10() + 
  geom_smooth(method = "lm", color = "black", se = 0.9999, size = 2) +
  facet_wrap(~continent) +
  labs(
    x = "GDP per Capita", 
    y = "Life Expectancy", 
    title = "Figure 1",
    color = "Continent"
    ) + theme(axis.text.x = element_blank(), axis.ticks.x = element_blank())

# to save the plot
ggsave(filename = "figure1.png", width = 12, height = 10, units = "cm", dpi = 300)

# the plot can be saved as a variable and then the fiel to save can be specified
plot_to_print <- ggplot(data = gapminder,
       aes(x = gdpPercap, y = lifeExp)) + 
  geom_point(aes(color = continent), alpha = 0.5) + scale_x_log10() + 
  geom_smooth(method = "lm", color = "black", se = 0.9999, size = 2) +
  facet_wrap(~continent) +
  labs(
    x = "GDP per Capita", 
    y = "Life Expectancy", 
    title = "Figure 1",
    color = "Continent"
  ) + theme(axis.text.x = element_blank(), axis.ticks.x = element_blank())

#if the plot isn't shown by default when asigned to a variable, the plot can be shown by calling the name of the variable
plot_to_print

ggsave(plot = plot_to_print, filename = "figure1.png", width = 12, height = 10, units = "cm", dpi = 300)

