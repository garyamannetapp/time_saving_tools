# time_saving_tools
Git command automation shell scripts

# Git Commit
test@test-mac-0 time_saving_tools % git/tst_git_commit.sh 
Usage: git/tst_git_commit.sh file
Some or all of the parameters are empty
**Usage: git/tst_git_commit.sh <your commit message>**

# Git Rebase With Master
test@test-mac-0 time_saving_tools % git/tst_git_rebase_master.sh
Usage: git/tst_git_rebase_master.sh file
Some or all of the parameters are empty
**Usage: git/tst_git_rebase_master.sh <your branch name> <any input to skip the push>**

Note:- 2nd argument is to skip the push at the end to rebase, if not provided then at the end of rebase force push will happen

# Git reset soft
test@test-mac-0 time_saving_tools % git/tst_git_reset_soft.sh
Usage: git/tst_git_reset_soft.sh file
Some or all of the parameters are empty
**Usage: git/tst_git_reset_soft.sh <number of commits> <your commit message>**

Note:- git reset comes handy when you want to squash n number of commit without using rebase 

# Git Rebase
test@test-mac-0 time_saving_tools % git/tst_git_squash.sh
Usage: git/tst_git_squash.sh file
Some or all of the parameters are empty
**Usage: git/tst_git_squash.sh <skippush>**

Note:- this scrip will only squash 2 commits, 1st argument is to skip the push at the end to rebase, if not provided then at the end of rebase force push will happen






