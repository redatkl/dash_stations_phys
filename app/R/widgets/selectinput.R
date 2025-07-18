# Custom Green Select Input Widget
customSelectInput <- function(inputId, label, choices, selected = NULL, multiple = FALSE) {
  # Generate unique ID for the select
  select_id <- paste0(inputId, "-select")
  
  # Handle choices
  choice_names <- names(choices)
  choice_values <- unname(choices)
  
  if (is.null(choice_names)) {
    choice_names <- choice_values
  }
  
  # Create option elements
  options <- lapply(seq_along(choice_values), function(i) {
    value <- choice_values[[i]]
    name <- choice_names[[i]]
    is_selected <- !is.null(selected) && value %in% selected
    
    tags$option(
      value = value,
      selected = if (is_selected) NA else NULL,
      name
    )
  })
  
  # Custom CSS for green styling matching the radio buttons
  custom_css <- tags$style(HTML(paste0("
    .custom-select-", inputId, " {
      width: 100%;
      padding: 0.375rem 2.25rem 0.375rem 0.75rem;
      font-size: 1rem;
      font-weight: 400;
      line-height: 1.5;
      color: #333;
      background-color: #fff;
      background-image: url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxNiAxNiI+PHBhdGggZD0iTTcuMjQ3IDExLjE0IDIuNDUxIDUuNjU4QzEuODg1IDQuOTk2IDIuMzQ1IDQgMy4yMDQgNGg5LjU5MmMuODU5IDAgMS4zMTkuOTk2Ljc1MyAxLjY1OGwtNC43OTYgNS40ODJhMSAxIDAgMCAxLTEuNTA2IDB6Ii8+PC9zdmc+');
      background-repeat: no-repeat;
      background-position: right 0.75rem center;
      background-size: 16px 12px;
      border: 1px solid #ced4da;
      border-radius: 0.375rem;
      transition: all 0.2s ease;
      appearance: none;
      -webkit-appearance: none;
      -moz-appearance: none;
    }
    
    .custom-select-", inputId, ":focus {
      border-color: #28a745 !important;
      box-shadow: 0 0 0 0.2rem rgba(40, 167, 69, 0.25) !important;
      outline: 0;
    }
    
    .custom-select-", inputId, ":hover {
      border-color: #28a745;
    }
    
    .custom-select-", inputId, " option {
      color: #333;
      background-color: #fff;
      padding: 0.375rem 0.75rem;
    }
    
    .custom-select-", inputId, " option:hover {
      background-color: rgba(40, 167, 69, 0.1);
    }
    
    .custom-select-", inputId, " option:selected {
      background-color: #28a745;
      color: #fff;
      font-weight: bold;
    }
    
    .custom-select-group {
      margin-bottom: 1rem;
    }
  ")))
  
  # Create the complete widget
  div(
    class = "custom-select-group",
    custom_css,
    if (!is.null(label)) {
      tags$label(
        class = "form-label",
        style = "font-weight: 600; color: #28a745; margin-bottom: 0.5rem; text-decoration: underline;",
        `for` = select_id,
        label
      )
    },
    tags$select(
      id = select_id,
      class = paste0("custom-select-", inputId),
      multiple = if (multiple) NA else NULL,
      options
    ),
    # JavaScript to handle the input binding
    tags$script(HTML(paste0("
      $(document).ready(function() {
        $('#", select_id, "').on('change', function() {
          ", if (multiple) {
            paste0("
            var selectedValues = [];
            $('#", select_id, " option:selected').each(function() {
              selectedValues.push($(this).val());
            });
            Shiny.setInputValue('", inputId, "', selectedValues);
            ")
          } else {
            paste0("Shiny.setInputValue('", inputId, "', this.value);")
          }, "
        });
        
        // Set initial value
        ", if (!is.null(selected)) {
          if (multiple) {
            paste0("
            var initialValues = ", jsonlite::toJSON(selected), ";
            $('#", select_id, "').val(initialValues);
            Shiny.setInputValue('", inputId, "', initialValues);
            ")
          } else {
            paste0("
            $('#", select_id, "').val('", selected, "');
            Shiny.setInputValue('", inputId, "', '", selected, "');
            ")
          }
        }, "
      });
    ")))
  )
}
