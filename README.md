# Kong plugin for redirecting calls

# About
A Kong 🦍 Plugin forwarding a request to another location. It us using standard http status codes and the the location header

## Configuration parameters
|FORM PARAMETER|DEFAULT|DESCRIPTION|
|:----|:------:|------:|
|config.location_url|http://example.com|The URL the call shall be forwarded to|
|config.status_code|307|The to be used http status code|
|config.forward_query_parameters|true|Defines if the original query parameters should be added to the location url|

## Known limitations

* TBD: when forwarding query parameters all urls get the & attached right now
