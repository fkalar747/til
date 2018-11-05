#!/bin/bash
while [ 1 ]; do
    echo -n "puppet> "
    read input
    bash -c "$input"
done
