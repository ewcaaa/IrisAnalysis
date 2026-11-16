
# create a project-specific package library
renv::init() 

library(tidyverse)

data(iris)
head(iris)
summary(iris)

# data manipulation
# calculate average measurements for each species
iris_summary <- iris %>%
  group_by(Species) %>%
  summarise(
    avg_sepal_length = mean(Sepal.Length),
    avg_sepal_width = mean(Sepal.Width),
    avg_petal_length = mean(Petal.Length),
    avg_petal_width = mean(Petal.Width)
  )

# display the results
iris_summary

# filter the dataset
iris_filtered <- iris %>%
  filter(Petal.Length > 4)

head(iris_filtered)

# create a new variable
iris <- iris %>%
  mutate(Petal_Ratio = Petal.Length / Petal.Width)

head(iris)

# scatterplot
ggplot(iris, aes(x = Petal.Length,
                 y = Petal.Width,
                 color = Species)) +
  geom_point(size = 3) +
  labs(
    title = "Petal Length vs Petal Width",
    x = "Petal Length (cm)",
    y = "Petal Width (cm)",
    color = "Species"
  ) +
  theme_minimal()

# boxplot
ggplot(iris, aes(x = Species,
                 y = Petal.Length,
                 fill = Species)) +
  geom_boxplot() +
  labs(
    title = "Petal Length by Species",
    x = "Flower Species",
    y = "Petal Length (cm)"
  ) +
  theme_minimal()

# save the packages
renv::snapshot()











