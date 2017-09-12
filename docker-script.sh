#!/bin/bash
./humans-get-sources
./humans-load
cp humans.db /result/
echo "The database is located in the given directory."
exit 0
