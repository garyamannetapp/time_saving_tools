#!/usr/bin/env expect

set branchName [lindex $argv 0];
set skipPush [lindex $argv 1];
if {[llength $argv] == 0} {
  puts stderr "Usage: $argv0 file"
  puts "Some or all of the parameters are empty";
  puts "Usage: $argv0 <your branch name> <skippush>"
  exit 1
}

spawn git checkout master
interact

spawn git pull
interact

spawn git checkout $branchName
interact

spawn git rebase -i master
#expect "Already up to date."
send ":wq\r"
#interact
#expect {
 #   "# Rebase" { send ":wq\r"}
#    timeout {puts "timeout happened"}
#    eof {puts "eof received"}
#} 
if {[llength $skipPush] == 0} {
    spawn git push -f
    interact
}

puts "Congratulations!! You have saved 30s"