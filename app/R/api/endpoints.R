# retrieve the api credentias and the api route
source("config/api_config.R")
source("R/api/auth.R")

# GET stations
get_stations <- function() {
  endpoint <- '/user/stations'
  method <- 'GET'
  
  # Create authentication headers
  headers <- create_hmac_auth(endpoint, publicKey, privateKey, method)
  
  # Make GET request
  response <- GET(
    url = paste0(apiURI, endpoint),
    do.call(add_headers, headers)
  )
  
  # Parse and print JSON response
  json_object <- content(response, "parsed")
  json_formatted <- toJSON(json_object, pretty = TRUE, auto_unbox = TRUE)
  cat(json_formatted)
  
  return(json_object)
}


