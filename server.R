library(shiny)
library(lubridate)

# Define server logic 
shinyServer(function(input, output) {
  startD <- reactive({(input$start_date)})
  endD <- reactive({(input$end_date)})
  nMonths <- reactive({abs(interval(ymd(startD()),ymd(endD())) %/% months(1))})
  mInt <- reactive({(input$AInt/12)})
  sumPmt <- reactive({(input$MPmpt*nMonths())})
  futureVal<-reactive({(input$MPmpt*((1+(mInt()/100))^nMonths()-1))/(mInt()/100)})
  
  output$NumMonths = renderText(nMonths())
  output$MonthInt = renderText({paste(mInt(),"%")})
  output$FutureValue = renderText({formatC(futureVal(), big.mark = ",", format="f", digits=2)})
  output$SumPayment = renderText({formatC(sumPmt(), big.mark = ",", format="f", digits=2)})
  output$IntEarned = renderText({formatC(futureVal()-sumPmt(), big.mark = ",", format="f", digits=2)})
  output$txtComment = renderText({
    tComment = "Calculation complete"
    if (startD()>endD()) {tComment = "Start date after end date.  Switched dates around for the calculation."}
    paste(tComment)
  })
})