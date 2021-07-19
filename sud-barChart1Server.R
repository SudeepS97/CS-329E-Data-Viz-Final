# Change all __1_s, Download information, and edit the plot and ggplotly arguments below:
# Build Download Button and Output DataTable---------------
  output$download__1_ <- downloadHandler(
    filename = function(){"sumBoxPlot.csv"}, 
    content = function(fname){
      write.csv(dfA1(), fname)
    }
  )
  output$table__1_ <- renderDataTable({
    DT::datatable(dfA1() , rownames = FALSE, extensions = list(Responsive = TRUE, FixedHeader = TRUE)
    )
  })
# ---------------------------------------------------------
# Build and Output Throughput Plot ------------------------
  output$Density__1_ <- renderPlotly({
    plot = dfA1() %>% ggplot() +
      geom_bar(mapping = aes(x=year, y=pc_abortions, fill="blue"), stat = "identity") +
      theme_bw() +
      theme(plot.title = element_text(size = input$titleFont__1_, face = "bold")) +
      theme(axis.text=element_text(size=input$textFont__1_),
            axis.title=element_text(size=input$textFont__1_, face="bold"),
            axis.text.x = element_text(angle = 45, hjust = 1))  +
      theme(plot.margin=unit(c(2,2,2,2),"cm")) +
      scale_y_continuous(labels = scales::comma) + # Disable scientific notation
      ggtitle(paste(input$title__1_)) +
      xlab(input$xLabel__1_) + ylab(input$yLabel__1_) +
      theme(axis.title.y = element_text(margin = margin(t = 10, r = 10, b = 10, l = 10))) +
      scale_color_discrete(name = input$legendTitle__1_)
    
    if( ! is.na(input$plotWidth__1_) & ! is.na(input$plotHeight__1_))
     ggplotly(plot, tooltip = c("title1"), session="knitr", width = input$plotWidth__1_, height = input$plotHeight__1_)
    else
      ggplotly(plot, tooltip = c("title2"), session="knitr") 
  })
# ---------------------------------------------------------
