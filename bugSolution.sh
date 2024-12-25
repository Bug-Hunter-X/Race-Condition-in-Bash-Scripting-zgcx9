#!/bin/bash

# This script demonstrates a solution to the race condition using file locking.

# Create two files
touch file1.txt
touch file2.txt

# Function to write to a file with locking
write_to_file() {
  local file=$1
  local message=$2
  flock -n 9 "$file" || exit 1
  echo "$message" >> "$file"
  flock -u 9 "$file"
}

# Start two processes that write to the files concurrently with locking
(while true; do write_to_file file1.txt "Process 1"; sleep 0.1; done) &
(while true; do write_to_file file2.txt "Process 2"; sleep 0.1; done) &

# Wait for a few seconds
sleep 3

# Kill the background processes
kill %1
kill %2

# The solution:  file locking prevents interleaved writes, ensuring data integrity
# The output files will now be more consistent and less prone to data corruption.