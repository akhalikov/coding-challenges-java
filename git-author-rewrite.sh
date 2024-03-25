#!/bin/sh

# Script for changing author info
# https://help.github.com/articles/changing-author-info/

git checkout master && git pull --ff-only

git filter-branch -f --env-filter '
OLD_EMAIL="artur.khalikov@revolut.com"
CORRECT_EMAIL="akhalikoff@gmail.com"
if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags
