#!/bin/bash

kill -9 `/bin/ps -fu jenkins| grep "java" | grep -v "grep" | awk '{print $2}'`
exec /etc/init.d/jenkins start
