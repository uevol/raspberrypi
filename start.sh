#!/bin/sh

#start  dht22
cd /home/pi/dht22
sudo ruby dht22.rb &

#start web service
cd /home/pi/temphumi
rails s &
