#!/usr/bin/env expect

set componentName [lindex $argv 0];
set commitMessage [lindex $argv 1];

if {[llength $argv] != 2} {
  puts stderr "Usage: $argv0 file"
  puts "Some or all of the parameters are empty";
  puts "Usage: $argv0 <component name e.g cvs/cvn> <your commit message>"
  exit 1
}

#spawn git add app/database app/orchestration app/pkg/cvi app/pkg/sdk app/pkg/serviceproviders predefined-models/ app/api/server/ app/utils/ app/api/ app/pkg/switches app/model/
spawn git add .
interact

if {[string match "*cvn*" $componentName]} {
    spawn git restore --staged build-tools
    interact
}


spawn git commit -S -m $commitMessage
interact

spawn git push
interact

puts "Congratulations!! You have saved 20s"