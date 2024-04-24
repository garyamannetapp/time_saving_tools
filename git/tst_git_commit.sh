#!/usr/bin/env expect

set commitMessage [lindex $argv 0];

if {[llength $argv] == 0} {
  puts stderr "Usage: $argv0 file"
  puts "Some or all of the parameters are empty";
  puts "Usage: $argv0 <your commit message>"
  exit 1
}

spawn git add app/database app/orchestration app/pkg/cvi app/pkg/sdk app/pkg/serviceproviders predefined-models/ app/api/server/ app/utils/ app/api/ app/pkg/switches app/model/
interact

spawn git commit -S -m $commitMessage
interact

spawn git push
interact

puts "Congratulations!! You have saved 20s"