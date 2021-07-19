dfA <- eventReactive(c(input$selectYear), {   
  project <- "https://data.world/swarnapuri-sude/s18-edv-final-project"   
  data.world::set_config(cfg_env("DW_API"))   
  paramQuery <- data.world::qry_sql(  
    "   
    select year, pc_abortions, pc_violent
    from abortions_and_violent2
    order by year
    ")  
  paramQuery$params <- c(input$selectYear[1], input$selectYear[2])  
  data.world::query(paramQuery, dataset = project)  
})  

dfA1 <- eventReactive(c(input$selectYear, input$yDataMin__1_,   input$yDataMax__1_), {   
  if( ! is.na(input$yDataMin__1_) & ! is.na(input$yDataMax__1_)) {  
    dfA() %>% dplyr::filter(between(year, input$yDataMin__1_, input$yDataMax__1_))  
  }  
  else {  
    dfA()  
  }  
})  