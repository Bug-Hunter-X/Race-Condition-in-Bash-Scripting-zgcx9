# Race Condition in Shell Scripting

This repository demonstrates a race condition that can occur in shell scripts when multiple processes access and modify shared resources concurrently.  The `bug.sh` script shows the race condition, and `bugSolution.sh` provides a solution using process synchronization.

## Bug Description
The `bug.sh` script launches two background processes that simultaneously write to separate files (`file1.txt` and `file2.txt`).  Due to the non-deterministic nature of process scheduling, the output in these files may be incomplete or inconsistent, leading to data corruption.  This is a classic example of a race condition.

## Solution
The `bugSolution.sh` script addresses the race condition by using a simple locking mechanism (file locking).  This ensures that only one process can access and modify the files at a time, preventing data corruption and ensuring consistent output.

## Running the scripts
1. Clone this repository.
2. Navigate to the repository directory.
3. Make the scripts executable: `chmod +x bug.sh bugSolution.sh`
4. Run the scripts and examine the output files to observe the difference.
