#!/bin/bash
# Using the fixer.io API for real time currency conversion

ACCESS_KEY="Enter Access key here."
curl -s "http://data.fixer.io/api/latest?access_key=$ACCESS_KEY&base=EUR&symbols=INR"
echo ""
