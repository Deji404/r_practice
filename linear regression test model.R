#checking for correct loading of the data
summary(income.data)

#checking for normality using a histogram
hist(income.data$happiness)

#checking for linearity using a plot
plot(happiness ~ income, data = income.data)

#creating a linear regression model
income.happiness.lm <- lm(happiness ~ income, data = income.data)
summary(income.happiness.lm)

# checking for homoscedasticity 
par(mfrow=c(2,2))
plot(income.happiness.lm)
par(mfrow=c(1,1))

#plotting the data in a scatterplot using ggplot2
income.graph <- ggplot(income.data, aes(x= income, y= happiness)) +
  geom_point()
income.graph

#adding a linear regression line
income.graph <- income.graph + geom_smooth(method = "lm", col = "black")
income.graph

#adding an equation for the graph
income.graph <- income.graph +
  stat_regline_equation(label.x = 3, label.y = 7)
income.graph

#making the graph publication ready
income.graph +
  theme_bw() +
    labs(title = "Reported Happiness As a Function of Income",
         x = "Income (1 = $1000)",
         y = "Happiness Score (0 - 10)")