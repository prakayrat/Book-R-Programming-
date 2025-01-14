# หนังสือ R Programming สำหรับการวิเคราะห์และแสดงข้อมูลด้วยภาพ
# ผศ.ประกายรัตน์ วิเศษสงวน และ อ.อมรวิทย์ วิเศษสงวน
# พิมพ์ครั้งที่ 2 กันยายน 2566

# บทที่ 4  โต้ตอบกับผู้ใช้ด้วย Shiny 

library(shiny)

ui <- fluidPage(
  titlePanel("Generate Random Numbers from Uniform Distribution"),
  
  sliderInput(inputId = "number",
              label = "Select a number",
              value = 345, min = 10, max = 1000),
  plotOutput("hist"),
  
  textOutput("mean"), 
  textOutput("sd")
)

server <- function(input, output) {
  histdata <- reactive({
    runif(input$number, min = 0, max = 1)
  })
  
  output$hist <- renderPlot({
    hist(histdata(),
         xlab = "Value",
         main = paste("random number : ", input$number, " values"))
  })
  
  output$mean <- renderText({paste("Mean =",
                                   round(mean(histdata()), 2))})
  output$sd <- renderText({paste("Standard Deviation =", 
                                 round(sd(histdata()), 3))})
}

shinyApp(ui = ui, server = server)
