library(shiny)

richter <-function(amp,time) {
  if (amp==0 | time==0) return(NA)
  else return (log10(10*amp) + 3*log10(10*(8*time-2.92)))
}

classEQK<-function(richter) {
  if (is.na(richter)) return ("")
  else {
    if (richter<2) return("Micro")
    if (richter>=2 & richter<4) return("Minor")
    if (richter>=4 & richter<5) return("Light")
    if (richter>=5 & richter<6) return("Moderate")
    if (richter>=6 & richter<7) return("Strong")
    if (richter>=7 & richter<8) return("Major")    
    if (richter>=8) return("Great")
  }
}

shinyServer(
  function(input, output) {
    output$inputValue1 <- renderPrint({input$amp})
    output$inputValue2 <- renderPrint({input$time})
    
    output$richter <- renderPrint({
      input$goButton
      isolate(richter(input$amp,input$time))
    })
    output$EQKclass<-renderText({
      input$goButton
      isolate(classEQK(richter(input$amp,input$time)))
    })
    
    
  }
)
