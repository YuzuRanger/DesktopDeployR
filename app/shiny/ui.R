library(shiny)
library(shinyjs)
library(magick)
library(EBImage)
library(pdftools)
library(collapse)
library(stringr)

# Define UI for data upload app ----
ui <- fluidPage(
  useShinyjs(),
  # App title ----
  titlePanel("Upload Files"),

  # Sidebar layout with input and output definitions ----
  sidebarLayout(

    # Sidebar panel for inputs ----
    sidebarPanel(

      # Input: Select a file ----
      fileInput("scanned_pdf", "Select .pdf file that holds scans of forms:",
                multiple = FALSE,
                accept = c(".pdf")),
    
      # Input: Enter an integer ----
      numericInput(
                inputId = "num_questions", 
                label = "Enter number of questions on the exam, must be 120 or less:",
                value = 10, 
                min = 1, 
                max = 120, 
                step = 1
            ),

          # Input: Enter an integer ----
      numericInput(
                inputId = "num_versions", 
                label = "Enter the number of test versions:",
                value = 1, 
                min = 1, 
                max = 10, 
                step = 1
            ),
    
          # Input: Select a file ----
      fileInput("answer_key", "Select .csv file that holds answer key for exam:",
                multiple = FALSE,
                accept = c(".csv")),

      # Horizontal line ----
      tags$hr(),
      

      # Button
      actionButton("processData", "Process Data")

    ),

    # Main panel for displaying outputs ----
    mainPanel(
      verbatimTextOutput("updates"),
      textOutput("fail_list"),
      shinyjs::hidden(downloadButton("downloadData", "Download Processed Student Answers")),
      shinyjs::hidden(downloadButton("downloadScores", "Download Processed Student Scores")),
      shinyjs::hidden(downloadButton("downloadAlerts", "Download Alerts/Irregularities in Student Responses"))

    )

  )
)