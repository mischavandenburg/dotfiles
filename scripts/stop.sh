#!/bin/bash

# Small script made to stop and remove all running containers on the dockerserver. 
# For dev / testing purposes

ssh ds@ds "sudo docker stop nginx php mysql phpmyadmin; sudo docker rm nginx php mysql phpmyadmin"
