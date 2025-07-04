library(httr)
library(digest)
library(lubridate)
library(jsonlite)

# perform HMAC encoding
create_hmac_auth <- function(apiRoute, publicKey, privateKey, method) {
  # Create GMT timestamp
  dateStamp <- format(Sys.time(), "%a, %d %b %Y %H:%M:%S GMT", tz = "GMT")
  
  # Create message for HMAC
  msg <- paste0(method, apiRoute, dateStamp, publicKey)
  
  # Generate HMAC-SHA256 signature
  signature <- hmac(privateKey, msg, algo = "sha256")
  
  # Return headers
  list(
    "Request-Date" = dateStamp,
    "Authorization" = paste0("hmac ", publicKey, ":", signature),
    "Accept" = "application/json"
  )
}
