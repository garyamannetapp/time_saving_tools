#!/usr/bin/env expect

set branchName [lindex $argv 0];
set forcePush [lindex $argv 1];
if {[llength $argv] == 0 ||[llength $argv] == 1} {
  puts stderr "Usage: $argv0 file"
  puts "Some or all of the parameters are empty";
  puts "Usage: $argv0 <your branch name> <yes to force push, no for not for push>"
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
interact
puts "force push $forcePush"
if {[string match "*yes*" $forcePush]} {
    spawn git push -f
    interact
}

puts "Congratulations!! You have saved 30s"