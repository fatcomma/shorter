#!/bin/bash

# This gets run as root by deploy.sh

# Set path to chef (if it exists)
TEST_CHEF=$(which chef-solo)
# If TEST_CHEF variable does not exist, install chef requirements
if ! test -x "$TEST_CHEF"; then
    # Set as dumb terminal
    export DEBIAN_FRONTEND=noninteractive
    # Make sure packages are up to date
    aptitude --quiet --assume-yes update &&
    # Get some necessary packages for chef
    aptitude install -y build-essential build-dep curl git-core ruby1.9.1 ruby1.9.1-dev &&
    # Then install chef as well
    gem install chef --no-rdoc --no-ri 
    gem install ohai --no-rdoc --no-ri
fi &&

# Set path to chef executable
CHEF=$(which chef-solo)
# Run chef with our config and attributes (-j)
"${CHEF}" -c solo.rb -j solo.json
