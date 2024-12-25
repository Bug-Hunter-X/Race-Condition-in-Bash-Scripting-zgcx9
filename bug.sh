#!/bin/bash

# This script demonstrates a race condition.

# Create two files
touch file1.txt
touch file2.txt

# Start two background processes that write to the files concurrently
(while true; do echo "Process 1" >> file1.txt; sleep 0.1; done) &
(while true; do echo "Process 2" >> file2.txt; sleep 0.1; done) &

# Wait for a few seconds
sleep 3

# Kill the background processes
kill %1
kill %2

# The problem: Depending on scheduling, file1.txt and file2.txt may contain incomplete data.
# Interleaving of I/O operations can lead to data corruption or unexpected results
# This is a classic race condition.