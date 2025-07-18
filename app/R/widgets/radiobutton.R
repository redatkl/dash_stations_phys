# Custom Green Radio Button Widget

customRadioButtons <- function(inputId, label, choices, selected = NULL, inline = FALSE) {
  # Generate unique IDs for each radio button
  choice_names <- names(choices)
  choice_values <- unname(choices)
  
  if (is.null(choice_names)) {
    choice_names <- choice_values
  }
  
  # Create the radio button HTML
  radio_items <- lapply(seq_along(choice_values), function(i) {
    value <- choice_values[[i]]
    name <- choice_names[[i]]
    is_selected <- !is.null(selected) && value == selected
    
    tags$div(
      class = if (inline) "form-check form-check-inline custom-radio-inline" else "form-check custom-radio",
      tags$input(
        type = "radio",
        class = "form-check-input custom-radio-input",
        name = inputId,
        id = paste0(inputId, "-", i),
        value = value,
        checked = if (is_selected) NA else NULL
      ),
      tags$label(
        class = "form-check-label custom-radio-label",
        `for` = paste0(inputId, "-", i),
        name
      )
    )
  })
  
  # Custom CSS for green styling
  custom_css <- tags$style(HTML(paste0("
    .custom-radio-input {
      accent-color: #28a745 !important;
    }
    
    .custom-radio-input:checked {
      background-color: #28a745 !important;
      border-color: #28a745 !important;
    }
    
    .custom-radio-input:focus {
      border-color: #28a745 !important;
      box-shadow: 0 0 0 0.2rem rgba(40, 167, 69, 0.25) !important;
    }
    
    .custom-radio-label {
      color: #333;
      font-weight: 500;
      cursor: pointer;
      margin-left: 0.5rem !important; 
    }
    
    .custom-radio-label:hover {
      color: #28a745;
    }
    
    .custom-radio-input:checked + .custom-radio-label {
      color: #28a745;
      font-weight: bold;
    }
    
    .custom-radio {
      margin-bottom: 0.5rem;
    }
    
    .custom-radio-inline {
      margin-right: 1rem;
    }
  ")))
  
  # Create the complete widget
  div(
    class = "custom-radio-group",
    custom_css,
    if (!is.null(label)) {
      tags$label(
        class = "form-label",
        style = "font-weight: 600; color: #28a745; margin-bottom: 0.5rem; text-decoration: underline;",
        label
      )
    },
    div(
      class = "custom-radio-container",
      radio_items
    ),
    # JavaScript to handle the input binding
    tags$script(HTML(paste0("
      $(document).ready(function() {
        $('input[name=\"", inputId, "\"]').on('change', function() {
          Shiny.setInputValue('", inputId, "', this.value);
        });
      });
    ")))
  )
}
