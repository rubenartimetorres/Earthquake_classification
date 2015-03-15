library(shiny)

# Define UI for dataset viewer application
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Earthquake Classification"),
  
    sidebarPanel(
      numericInput(inputId="amp", label="Amplitude in mm", value= 0,min=0),
      numericInput(inputId="time", label="Time in seconds", value= 0,min=0),
      
      actionButton("goButton", "Calculate")
    ),
    mainPanel(
      tabsetPanel(
        tabPanel('Your results',      
          h3('Earthquake classificaton'),
          h4('With an amplitude (in mm) of:'),
          verbatimTextOutput("inputValue1"),
          h4('and a time (in seconds) of'),
          verbatimTextOutput("inputValue2"),
          h4('The Richter coefficient and earthquake classification is:'),
          verbatimTextOutput("richter"),
          
          verbatimTextOutput("EQKclass"),
          
          p(" ", a("Github repository with the code",
                          href = "https://github.com/rubenartimetorres/Earthquake_classification.git"))                  
        ),    
        tabPanel('Instructions', 
           h3('User instructions'),
           h5("Introduce the measured amplitude of waves recorded by seismographs
               and the time in seconds measured. Press the calculate button and the
               application will calculate the Richter scale"),
           
           h3('Some information about earthquakes'),
                               
           h5("Richter scale is based upon the maximum amplitude of seismic waves 
              reaching a set of seismographs. The Richter scale is not expressed 
              in terms of the seismic wave amplitude itself. Instead the Richter 
              scale is a logarithmic scale so a 6.0 earthquake on the Richter scale
              involves wave amplitudes ten times that of a 5.0 earthquake. 
              The Richter scale figure is only imperfectly correlated with the damage
              done by an earthquake. The level of damage done by an earthquake could 
              be called its intensity. To emphasize that his scale does not measure 
              intensity per se Richter adopted a term from astronomy magnitude. In 
              astronomy are star's brightness is given by a logarithmic measure, 
              magnitude. Another concept of earthquake intensity that might be used 
              instead of level of damage is the amount of energy released in an earthquake.
              Energy release as a measure of earthquake intensity has the virtue that it is, 
              in principle, more objective. Damage from an earthquake depends upon the 
              extent and type of development in an affected area. It also depends upon the 
              human assessment of the severity of the damage. The amount of energy released 
              by an earthquake of Richter magnitude n+1 is about thirty to fifty times larger
              than the amount released by an earthquake of Richter magnitude n. Again there 
              is only an imperfect correlation between Richter magnitude and energy release.
              While the Richter scale was popular with the press and the public, seismologists
              had some reservations about it and eventually replaced it with another 
              logarithmic measure based upon the seismic moment of an earthquake. 
              The term moment in the name indicates that it involves force acting over 
              a length. When this concept of earthquake magnitude was applied it turned 
              out the ratings for small scale quakes (2.0 to 7.0) did not differ significantly
              from the Richter ratings. For larger scale quakes (7.0 and above) the seismic 
              moment rating is moderately less numerically than the Richter rating."),
           
           p("Source: ", a("Richter coefficient earthquake classification",
                           href = "http://en.wikipedia.org/wiki/Richter_magnitude_scale"))
                 
        )
      )                       
    )
  )
)

