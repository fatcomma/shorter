# Shorter

This is a simple URL shortening service. It can be remotely deployed and run on a target host with a single command.

Automated deployment and starting of services is handled by Chef Solo (https://docs.getchef.com/chef_solo.html).

The application is written in Django, served with Gunicorn and nginx, all data is persisted using SQLite (`./shorter/db.sqlite`).

## API

### Shortening

A URL can be shortened with the following:

    curl -X GET http://example.com/submit/?u=https://www.google.com

Which will return a shortened URL:
    
    http://example.com/X
    
### Unshortening

To get the full URL of a shortened URL:
    
    curl -X GET http://example.com/X

Which will return the full, original URL:

    https://www.google.com

## Deploying

### Setup

Key-based access is required to access the target host.

No further setup should be necessary. The only prerequisites are Bash and `ssh`, both of which should be installed if you did the step above.

### How to Deploy

Edit the deploy.sh file to point at the SSH key needed to access the target host.

Deploy the application with the following commands:

    cd deploy/
    ./deploy.sh user@hostname.com
    
