% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/f7-update-inputs.R
\name{updateF7DatePicker}
\alias{updateF7DatePicker}
\title{Change the value of a date picker input on the client}
\usage{
updateF7DatePicker(
  inputId,
  value = NULL,
  ...,
  session = shiny::getDefaultReactiveDomain()
)
}
\arguments{
\item{inputId}{The id of the input object.}

\item{value}{The new value for the input.}

\item{...}{Parameters used to update the date picker,
use same arguments as in \code{\link{f7DatePicker}}.}

\item{session}{The Shiny session object, usually the default value will suffice.}
}
\description{
Change the value of a date picker input on the client
}
\examples{
if (interactive()) {
  library(shiny)
  library(shinyMobile)

  shinyApp(
    ui = f7Page(
      title = "My app",
      f7SingleLayout(
        navbar = f7Navbar(title = "Update date picker"),
        f7Card(
          f7Button(inputId = "selectToday", label = "Select today"),
          f7Button(inputId = "rmToolbar", label = "Remove toolbar"),
          f7Button(inputId = "addToolbar", label = "Add toolbar"),
          f7DatePicker(
            inputId = "mypicker",
            label = "Choose a date",
            value = Sys.Date() - 7,
            openIn = "auto",
            direction = "horizontal"
          ),
          verbatimTextOutput("pickerval")
        )
      )
    ),
    server = function(input, output, session) {

      output$pickerval <- renderPrint(input$mypicker)

      observeEvent(input$selectToday, {
        updateF7DatePicker(
          inputId = "mypicker",
          value = Sys.Date()
        )
      })

      observeEvent(input$rmToolbar, {
        updateF7DatePicker(
          inputId = "mypicker",
          toolbar = FALSE,
          dateFormat = "yyyy-mm-dd" # preserve date format
        )
      })

      observeEvent(input$addToolbar, {
        updateF7DatePicker(
          inputId = "mypicker",
          toolbar = TRUE,
          dateFormat = "yyyy-mm-dd" # preserve date format
        )
      })

    }
  )
}
}
