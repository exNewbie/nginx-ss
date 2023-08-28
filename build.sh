#!/bin/bash

docker build . -t exnewbie/nginx-ss --build-arg cert_age=3650

docker push exnewbie/nginx-ss
