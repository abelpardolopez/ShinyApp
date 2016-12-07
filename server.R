#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(graphics)
library(stats)
library(ggplot2)
library(dplyr)
library(broom)

# Define server logic required 
shinyServer(function(input, output) {
# generate error data with the standard deviation from ui
        
Data    <- reactive({
        eps <- rnorm(300,mean=0,sd=input$SD)
        x<-runif(300,min=0,max=2)        
        y <- x*x+input$A*x+input$B+eps
        # Last line is the return value for Data
        data.frame(y, x,x^2,x^3)
        })

linModel  <- reactive({
                modLin <- lm(y ~ x, Data())
        })
quadModel  <- reactive({
                modLin <- lm(y ~ x+x.2, Data())
        })
cubModel  <- reactive({
                modLin <- lm(y ~ x+x.2+x.3, Data())
        })
# Resume of Models  
output$summaryLin<-renderTable({tidy(linModel())},digits=4)
output$summaryQua<-renderTable({tidy(quadModel())},digits=4)
output$summaryCub<-renderTable({tidy(cubModel())},digits=4)

resume<- reactive({
        resume <- data.frame(rbind(glance(linModel()),glance(quadModel()),glance(cubModel())))
        rownames(resume)=c("Linear","Quadratic","Cubic")
        resume %>% select(r.squared,AIC,BIC)
        })
output$resumeModels<-renderTable({ resume()},rownames=TRUE,digits=4 )

  output$distPlot3 <- renderPlot({
          # draw graph
          p<-ggplot(Data(),aes(x=x,y=y))+geom_point(size=3)
          if(input$linearModel){
                  p<-p+geom_smooth(method= "lm",color="red")
          }
          if(input$quadraticModel){
                  p<-p+geom_smooth(method= "lm",formula = y ~ poly(x, 2),color="blue")
          }
          if(input$cubicModel){
                  p<-p+geom_smooth(method= "lm",formula = y ~ poly(x, 3),color="green")
          }
          p
  })
})
