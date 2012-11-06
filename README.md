### Commands

A URL can be shortened with the following:

    curl -X GET http://example.com/submit/?u=https://www.google.com

Which will return a shortened URL:
    
    http://example.com/X

To get the full URL of a shortened URL:
    
    curl -X GET http://example.com/X

Which will return the full, original URL:

    https://www.google.com
