#!/bin/bash

# This script waits 20 minutes, then plays an mp3.
# It then waits 5 minutes, then plays an mp3.
# I made it to remind me to get up from my seat
# and either stand and code or do something
# while standing up, as I tend to lose track of
# time while coding and sitting for that long is
# bad for my body.

while [ 1 ]; do
    sleep 20m
    ffplay allgoldeverything.mp3 &> /dev/null &
    last_pid=$!
    disown $last_pid 
    sleep 11.2
    kill -KILL $last_pid &> /dev/null
    
    sleep 5m
    ffplay allgoldeverything.mp3 &> /dev/null &
    last_pid=$!
    disown $last_pid
    sleep 11.2
    kill -KILL $last_pid &> /dev/null
done
