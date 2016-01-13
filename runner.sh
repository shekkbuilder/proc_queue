#!/bin/bash
set -o errexit
set -o nounset

# create a named pipe
if [[ ! -e /tmp/queue ]]; then
  mkfifo /tmp/queue
fi

# read whatever from the named pipe.
while read job </tmp/queue
do
  if [[ $job = 'quit' ]]; then
    echo 'Done processing jobs'
    exit
  fi
  echo "running job:" $job
  (eval "$job")
done
