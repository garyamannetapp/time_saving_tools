#!/usr/bin/env expect

set componentName [lindex $argv 0];
set forcePush [lindex $argv 1];

if {[llength $argv] != 2} {
  puts stderr "Usage: $argv0 file"
  puts "Some or all of the parameters are empty";
  puts "Usage: $argv0 <component name e.g cvs/cvn> <yes to force push, no for not for push>"
  exit 1
}

#spawn git add app/database app/orchestration app/pkg/cvi app/pkg/sdk app/pkg/serviceproviders app/api/server/ predefined-models/ app/utils/  app/pkg/switches app/model/  app/api/
spawn git add .
interact

if {[string match "*cvn*" $componentName]} {
    spwan git restore --staged build-tools
    interact
}

spawn git commit -S -m "test"
interact

spawn git rebase -i HEAD~2
# change the second "pick" to "squash"
# jump to top (if not there), down, delete word, insert 's' (for squash), Escape, save and quit
send "ggjdwis \033:wq\r"

expect "# This is a"

# skip past first commit message (assumed to be one line), delete rest of file
# down 4, delete 3 lines, save and quit
send "6j3dd:wq\r"
expect eof

puts "force push $forcePush"
if {[string match "*yes*" $forcePush]} {
    spawn git push -f
    interact
}

puts "Congratulations!! You have saved 20s"
