library(shiny)
library(lubridate)

# Define UI for application that calculate the future value of annuity payments
shinyUI(fluidPage(
  headerPanel("Annuity Future Value Calculator"),
  titlePanel("What will my payments be worth?"),
  tabsetPanel(
    tabPanel("Calculator",
             sidebarPanel(
               h3("Annuity value inputs"),
               sliderInput("MPmpt","Monthly Payment" ,min = 0, max = 20000, value = 10000, step = 1),
               dateInput("start_date", "First month end the annuity payment is made:", value=Sys.Date()),
               dateInput("end_date", "Last month end the annuity payment is made:", value=(Sys.Date() + years(10))),
               sliderInput("AInt","Annual Interest Rate in percentage", value = 6, min = 0, max = 20, step = 0.05, post = "%")
             ),
             mainPanel(
               h3('Annuity value outputs'),
               h4('Number of monthly payments to be made'),
               textOutput("NumMonths"),
               h4('Effective Monthly Interest Rate in percentage'),
               textOutput("MonthInt"),
               h4('Sum of payments to be made'),
               textOutput("SumPayment"),      
               h4('Future Value of the Annuity'),
               textOutput("FutureValue"),
               h4('Cumulative Interest to be Earned'),
               textOutput("IntEarned"),
               h4('Comment'),
               textOutput("txtComment")
               )
    ),
    tabPanel("Instructions",
             p("This is a simple application to calculate the future value of monthly annuity payments.  Adjust the four default input values given and see how you can expect your future annuity value adjust dynamically."), 
             hr(),
             h3("Annuity value Inputs:"),
             p("The input values are given default values for you to adjust."),
             p("1.	Monthly payment: on the slider you can adjust your monthly payments between 0 and 20,000 in increments of 1.  The default is 10,000"),
             p("2.	First month: You can select the first month you will be doing the payment (default to the current date)"),
             p("3.	Last month: You can also select the last month you will be doing a payment (default to 10 years from today)."),
             p("4.	Annual interest rate: Lastly you need to give the annual interest rate you expect to earn.  The default is 6% which you can adjust between 0% and 20% in increments of 0.05%"),
             hr(),             
             h3("Annuity value Outputs:"),
             p("The goal of the calculator is to give you the total future value of all your payments with the interest earned, but a few other related numbers are also available."),
             p("1.	The number of monthly payments derived from the start and end date given."),
             p("2.	The effective monthly interest rate derived from the annual interest rate given."),
             p("3.	The sum of the payments made over the period from start to end date."),
             p("4.	The future value of the annuity which is a combination of the payments made and the cumulative interest earned.  This is calculated using a classical future value formula applied to the input values given."),
             p("5.	The cumulative interest earned with is the difference between the sum of the payments made and the future value of the annuity."),br(),
             p(em("This application is a building block for a more extensive investment advice application plotting investment outcome scenario."))
    )
  )
))
