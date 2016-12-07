#ShinyApp
Shiny App to pass final project of Courser Data Science course in Data Products.

##Objective
The objective of this application is to show the difficulties of finding a proper statistical model.  

##Real Model
The application displays a quadratic function wich points have been obtained with a independent variable $x$ from an uniform distribution between 0 and 2, and a dependent varible $y$ through following formula:  

$y= x^{2}+K·x+B+\epsilon$  

-- **Standard deviation slider** increase or reduce the standard deviation of the error($\epsilon$ in previous formula).  
-- **K Slope slider** changes the linear constant ($K$ in the previous formula), from  -2 to 2.  
-- **Independent term slider** changes the constant fo the previous formula ($B$), from  -1 to 1.  

##Plot  
In the plot it is shown the resulting points of the function and the statistical models.  
Clicking in the different check boxes they are shown linear, quadratic and cubic statistical models.  

##Statistical Results  
-- **First table** contains typical results for regresion *r.squared*, *BIC* and *AIC*.  
  It can be noted than cubic model does not improve the results.  
-- **Following tables** show the coefficients of the regression.  
  It can be noted than *p.value* for linear models is always lower than 5 %.  
  And than sometimes the coefficients of cubic model have better *p.values* than quadratic model.  
  
##Conclusion  
With this application can be seen the difficulties to find a correct statistical model.  
And than [AIC](https://en.wikipedia.org/wiki/Akaike_information_criterion) and [BIC](https://en.wikipedia.org/wiki/Bayesian_information_criterion) are better indicators of the best model than $R^{2}$.  
