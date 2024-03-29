#!/usr/bin/env expect


set count [lindex $argv 0];
set commitMessage [lindex $argv 1];


if {[llength $argv] == 0} {
  puts stderr "Usage: $argv0 file"
  puts "Some or all of the parameters are empty";
  puts "Usage: $argv0 2 \"your commit message\""
  exit 1
}

spawn git reset --soft HEAD~$count
interact

spawn git commit -S -m $commitMessage
interact

spawn git push -f
interact

puts "Congratulations!! You have saved 20s"
