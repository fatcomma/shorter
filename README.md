### Commands

A URL can be shortened with the following:

    curl -X GET http://example.com/submit/?u=https://www.google.com

You will then get a response with the shortened URL.

A shortened URL can be expanded similarly:
    
    curl -X GET http://example.com/X

Which will return the full original URL. 
