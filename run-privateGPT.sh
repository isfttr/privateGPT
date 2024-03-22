#!/bin/bash

# Change directory to the desired folder
cd $HOME/privateGPT

# Start the server using "ollama serve" command
echo "Starting Ollama server..."
ollama serve &

# Background the server process with PID $server_pid
server_pid=$!

# Start the build and run process using "PGPT_PROFILES=ollama make run" command
echo "Starting build and run process..."
 PGPT_PROFILES=ollama make run &

# Start the server  on localhost:8001
open http://127.0.0.1:8001/ &

# Store the PID of the build and run process in a variable named $process_pid
process_pid=$!

# Wait for both processes to finish before exiting the script
wait $server_pid $process_pid
