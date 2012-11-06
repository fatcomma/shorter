### Commands

A URL can be shortened with the following:

    curl -X GET http://example.com/submit/?u=https://www.google.com

Which will return a shortened URL:
    
    http://example.com/X

To get the full URL of a shortened URL:
    
    curl -X GET http://example.com/X

Which will return the full, original URL:

    https://www.google.com

### Deployment

Deploy the application with the following commands:

    cd deploy/
    ./deploy.sh user@hostname.com

You'll need to edit the deploy.sh file to point at the correct SSH key (~/.ssh/id_rsa.pub by default).
