#!/bin/sh

#start dht22
cd /home/pi/raspberrypi/dht22
sudo ruby dht22.rb &

#start web service
cd /home/pi/raspberrypi/temphumi
rails s &
