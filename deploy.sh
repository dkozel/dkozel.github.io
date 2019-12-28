#! /bin/bash
set -e # stop at first failing command

hugo -v
cd public

git init
git config user.name "Derek Kozel"
git config user.email "derek@bitstovolts.com"

echo "www.derekkozel.com" > CNAME
git add .
git commit -m "Deploy from CircleCI"

# use --quiet to avoid printing token in build logs
git push --force --quiet "https://${GH_TOKEN}@github.com/dkozel/dkozel.github.io.git" master:master
