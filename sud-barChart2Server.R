# Change all __2_s, Download information, and edit the plot and ggplotly arguments below:
# Build Download Button and Output DataTable---------------
  output$download__2_ <- downloadHandler(
    filename = function(){"sumBoxPlot.csv"}, 
    content = function(fname){
      write.csv(dfA1(), fname)
    }
  )
  output$table__2_ <- renderDataTable({
    DT::datatable(dfA1() , rownames = FALSE, extensions = list(Responsive = TRUE, FixedHeader = TRUE)
    )
  })
# ---------------------------------------------------------
# Build and Output Throughput Plot ------------------------
  output$Density2__2_ <- renderPlotly({
    plot = dfA1() %>% ggplot() +
      geom_bar(mapping = aes(x=year, y=pc_violent, fill="orange"), stat = "identity") +
      theme_bw() +
      theme(plot.title = element_text(size = input$titleFont__2_, face = "bold")) + 
      theme(axis.text=element_text(size=input$textFont__2_),
            axis.title=element_text(size=input$textFont__2_, face="bold"),
            axis.text.x = element_text(angle = 45, hjust = 1))  +
      theme(plot.margin=unit(c(2,2,2,2),"cm")) +
      scale_y_continuous(labels = scales::comma) + # Disable scientific notation
      ggtitle(paste(input$title__2_)) +
      xlab(input$xLabel__2_) + ylab(input$yLabel__2_) +
      theme(axis.title.y = element_text(margin = margin(t = 10, r = 10, b = 10, l = 10))) +
      scale_color_discrete(name = input$legendTitle__2_)
    
    if( ! is.na(input$plotWidth__2_) & ! is.na(input$plotHeight__2_))
     ggplotly(plot, tooltip = c("title1"), session="knitr", width = input$plotWidth__2_, height = input$plotHeight__2_)
    else
      ggplotly(plot, tooltip = c("title2"), session="knitr") 
  })
# ---------------------------------------------------------
