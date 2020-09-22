#!/bin/bash

# Start up procs
${TORQHOME}/torq.sh start discovery1 stp1 rdb1

# Start up test proc
/usr/bin/rlwrap q ${TORQHOME}/torq.q \
  -proctype test -procname test1 -schemafile ${TORQHOME}/database.q \
  -test ${KDBTESTS}/stp/batching/ \
  -load ${KDBTESTS}/helperfunctions.q ${KDBTESTS}/stp/batching/settings.q \
  -debug

# Close other procs
${TORQHOME}/torq.sh stop discovery1 stp1 rdb1