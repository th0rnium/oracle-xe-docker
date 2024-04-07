#!/usr/bin/expect -f

spawn /etc/init.d/oracle-xe-18c configure

expect "Specify a password to be used for database accounts. Oracle recommends that the password entered should be at least 8 characters in length, contain at least 1 uppercase character, 1 lower case character and 1 digit \\\[0-9\\\]. Note that the same password will be used for SYS, SYSTEM and PDBADMIN accounts:\r"
#expect -re {Specify a password to be used for database $}
send "oracle\r"

expect "Confirm the password:\r"
#expect -re {Confirm the password $}
send "oracle\r"

#expect -re {Specify a password to be used}
echo "End setup_oracle.sh"
expect eof