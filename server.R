#Final Project for Developing Data Products
#
# This is the server logic of a Shiny web application. 
 

library(shiny)
library(shinyjs)


shinyServer(function(input, output) {
   
  
  
  output$greeting <- reactive({
    #output greeting
    if(input$name != "")
    {
      paste("Hello ", input$name)
    } else {
        ""
    }
    
    
  })
   
  output$showAnswer <- reactive({
    # answer to the question
    if(!is.na(input$locCount) && input$locCount ==2)
    {
      "You're right!"
      
    } else if(!is.na(input$locCount) && input$locCount !=2) {
      paste("You are off by ", abs(2 - input$locCount))
    } else {
      ""
    }
  }) 
  
  #store locations 
    df <- data.frame(lat = c(41.8605065, 45.3680225, 34.1563345, 33.9863406,
                             33.5240102, 34.408605, 34.1519562, 34.2368143,
                             34.1509837, 34.1409681, 36.8476989, 37.2306574,
                             34.4145975, 34.0630269, 37.698887, 37.6542441,
                             34.4698856, 34.1511629, 37.7029449, 34.2753271,
                             33.456134, 33.5620657,  33.6134798, 34.1264304,
                             34.1011682,34.0902545,  36.0839998, 35.2097314,
                             40.7532958, 34.2653081,
                             34.0738276, 34.2838886,
                             33.7279364, 34.0174897,
                             37.927964, 34.1748235,
                             39.4751254, 38.9543634,
                             36.2547293, 38.5634901,
                             35.3804825, 37.3838274,
                             38.976601, 39.491281,
                             39.4398384, 39.1519463,
                             34.1563262, 33.6817117,
                             47.4407062, 37.4154725,
                             34.1862759, 36.1413146,
                             36.1595213, 44.0592212,
                             45.5303808, 37.7074504,
                             36.0987307, 34.256722,
                             38.424628, 36.1372259,
                             44.5730287, 39.0383031,
                             45.3969128, 33.8008093,
                             33.8589249, 33.598511,
                             45.5341063, 45.5180121,
                             38.8884751, 39.0631389,
                             39.1148339, 38.8080871,
                             37.8951591, 37.963348,
                             34.2599415, 34.1867245,
                             45.4338074, 35.1257061,
                             34.2157212, 33.7616709,
                             45.4434434, 38.8936999,
                             39.6619802, 34.1143332,
                             38.7664916,                             45.4713947,
                             37.7986887,                             39.0344342,
                             35.3538679,                             33.61114,
                             35.3413681,                             34.2224276,
                             45.6162256,                             45.5005295,
                             45.6788223,                             45.4375191,
                             42.6226966,                             45.5050224,
                             36.1211205,                             37.2442345,
                             34.2181496,                             38.8671129,
                             38.8719398,                             44.9428137,
                             44.0674488,                             39.2972451,
                             37.7616512,                             37.657096,
                             35.4012042,                             33.8740731,
                             33.6407763,                             40.2283729,
                             33.776896,                             34.0659646,
                             38.7058235,                           39.3857052,
                             39.1807952,                             43.6146974,
                             43.6177732,                             35.9874518,
                             34.9905874,                             42.3321286,
                             40.1436209,                             45.4982998,
                             37.4669403,                             33.50876,
                             33.3195088),
                     lng = c(-87.8351127,
                             -122.8447794,
                             -118.793514,
                             -118.4401605,
                             -117.6912192,
                             -118.5749297,
                             -118.3655743,
                             -118.5369492,
                             -118.075112,
                             -118.0198212,
                             -119.7919921,
                             -121.7753419,
                             -118.4623789,
                             -118.3535864,
                             -121.7731982,
                             -120.9586659,
                             -117.3508941,
                             -118.4522043,
                             -121.064953,
                             -118.562978,
                             -117.604267,
                             -117.6571899,
                             -117.6796659,
                             -118.2637905,
                             -118.3409985,
                             -118.3447075,
                             -115.1537389,
                             -97.4454134,
                             -73.6935532,
                             -118.7955399,
                             -118.3761444,
                             -118.7192033,
                             -117.7863935,
                             -118.4084792,
                             -122.5169301,
                             -118.5969919,
                             -119.7922305,
                             -119.9433481,
                             -120.2506809,
                             -121.4281692,
                             -119.0156347,
                             -121.8945049,
                             -76.5443965,
                             -76.646508,
                             -76.626805,
                             -76.72318,
                             -118.6441744,
                             -117.8435748,
                             -122.2221485,
                             -122.1289628,
                             -118.8756707,
                             -86.8018266,
                             -115.2875996,
                             -121.302217,
                             -122.9578445,
                             -121.8728803,
                             -115.175777,
                             -118.500638,
                             -121.4173784,
                             -120.1653241,
                             -123.2632761,
                             -77.0569031,
                             -122.7443482,
                             -117.9183553,
                             -118.0900153,
                             -117.871504,
                             -122.6225648,
                             -122.5611975,
                             -77.0920374,
                             -77.1270822,
                             -77.1710356,
                             -77.0859956,
                             -122.0626503,
                             -122.0612797,
                             -119.2343005,
                             -118.6244193,
                             -122.5633108,
                             -120.5935125,
                             -119.0037749,
                             -84.3951127,
                             -122.8032498,
                             -77.1872231,
                             -75.691442,
                             -118.1500953,
                             -77.154267,
                             -122.6859425,
                             -121.9221348,
                             -94.5810367,
                             -118.9137294,
                             -114.570379,
                             -119.103607,
                             -118.235449,
                             -122.5073677,
                             -122.806834,
                             -122.6617298,
                             -122.756866,
                             -87.8211267,
                             -122.4412952,
                             -97.0684767,
                             -121.9580868,
                             -119.045334,
                             -77.3681532,
                             -77.2612208,
                             -122.9839287,
                             -123.0716731,
                             -76.5922121,
                             -121.9616559,
                             -121.8972072,
                             -119.109512,
                             -117.9026351,
                             -84.444326,
                             -74.0447218,
                             -118.0719633,
                             -117.2695825,
                             -121.1705646,
                             -77.4055736,
                             -77.2680081,
                             -116.2838074,
                             -116.3538638,
                             -119.959247,
                             -118.9417451,
                             -122.8675224,
                             -74.99037,
                             -122.9047578,
                             -121.175715,
                             -112.046798,
                             -111.9265852
                     )
    )
  
  output$distMap <-  
    
    renderLeaflet({
    # return interacive map
      
    df %>%
      leaflet() %>%
      addTiles() %>% 
      addMarkers()
     
    })
  
  observeEvent(input$showMap,{
    #show/hide markers
    if(!input$showMap)
    {
      leafletProxy("distMap") %>%
        clearMarkers()   
    } else {
       output$distMap <-  renderLeaflet({
         # return interacive map
         
         df %>%
           leaflet() %>%
           addTiles() %>% 
           addMarkers()
         
       })
    }
  })
     

      
     
})
