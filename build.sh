#!/bin/bash

docker build --build-arg cert_age=3650 -t exnewbie/nginx-ss:latest .

docker push exnewbie/nginx-ss
