#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Correlation app"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("SD", "Standard Deviation:", min = 0.1, max = 1, value = 0.5),
       sliderInput("A", "K Slope:", min = -2.0, max = 2.0, value = 0.0,step = 0.1),
       sliderInput("B", "Independent term:", min = -1, max = 1, value = 0.0, step = 0.1),
       checkboxInput("linearModel","Linear Model: a*x+b",value=TRUE),
       checkboxInput("quadraticModel","Quadratic Model: a*x^2+b*x+c",value=TRUE),
       checkboxInput("cubicModel","Cubic Model: a*x^3+b*x^2+c*x+d",value=TRUE)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
            tabsetPanel(type="pills",
                        tabPanel("Main",br(),
            h3("Relationship"),
            plotOutput("distPlot3"),
            h3 ("Summary of All Models"),
            tableOutput("resumeModels"),
            h3 ("Summary Linar Model Coefficients"),
            tableOutput("summaryLin"),
            h3 ("Summary Quadratic Model Coefficients"),
            tableOutput("summaryQua"),
            h3 ("Summary Cubic Model Coefficients"),
            tableOutput("summaryCub")
            ),
            tabPanel("Instruction",br(),
                     h3("Objective"),
                     p("The objective of this application is to show the difficulties of finding a proper statistical model."),
                     h3("Real Model"),
                     p("The application displays a quadratic function wich points have been obtained with a independent variable x
                       from an uniform distribution between 0 and 2, and a dependent varible y through following formula:"),
                     p("y= x^2+K*x+B+eps"),
                     p("Standard deviation slider increase or reduce the standard deviation of the error(eps in previous formula)."),
                     p("K Slope slider changes the linear constant fo the previous formula, from  -2 to 2."),
                     p("Independent term slider changes the constant fo the previous formula (B), from  -1 to 1."),
                     h3("Plot"),
                     p("In the plot it is shown the result of the function and the statistical models."),
                     p("Clicking in the different check boxes they are shown linear, quadratic and cubic statistical models."),
                     h3("Statistical Results"),
                     p("First table contains typical results for regresion r.squared, BIC and AIC. 
                       It can be noted than cubic model does not improve the results."),
                     p("Following tables show the coefficients of the regression. 
                       It can be noted than p.value for linear models is always lower than 5 %. 
                       And than sometimes the coefficients of cubic model have better p.values than quadratic model."),
                     h3("Conclusion"),
                     p("With this application can be seen the difficulties to find a correct statistical model. 
                       And than AIC and BIC are better indicator of the best model than r.squared.")
            )
            )
    )
  )
))
