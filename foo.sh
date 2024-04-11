#!/bin/bash

cmd1() {
    /script.exp && su oracle && /home/oracle/bin/manage-xe.sh -o start
}
cmd2() {
    su oracle
}
cmd3() {
    /home/oracle/bin/manage-xe.sh -o start
}

#/script.exp #&& su oracle && /home/oracle/bin/manage-xe.sh -o start
# cmd2
# cmd3
# Execute script.exp in the root directory
/script.exp

# Change user to oracle
su - oracle

# Execute /home/oracle/bin/manage-xe.sh with the "start" option
/home/oracle/bin/manage-xe.sh -o start