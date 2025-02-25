#/bin/bash

set -euo pipefail

root_branch=main
base_ref="test-0001-base-ref"
head_ref="test-0001-head-ref"

git checkout $root_branch
git checkout -b $base_ref
touch dummy.txt && git add dummy.txt;
echo "base 1" > dummy.txt && git commit -a -m "base 1";
echo "base 2" > dummy.txt && git commit -a -m "base 2";
echo "base 3" > dummy.txt && git commit -a -m "base 3";
echo "base 4" > dummy.txt && git commit -a -m "base 4";
echo "base 5" > dummy.txt && echo -e "\nThis contains five additional commits versus main" && git commit -a -m "base 5";
git push origin $base_ref

git checkout $root_branch
git checkout -b $head_ref
touch dummy.txt && git add dummy.txt;
echo "head 1" > dummy.txt && git commit -a -m "head 1";
echo "head 2" > dummy.txt && git commit -a -m "head 2";
echo "head 3" > dummy.txt && git commit -a -m "head 3";
echo "head 4" > dummy.txt && echo -e "\nThis contains four additional commits versus main" && git commit -a -m "head 4";
git push origin $head_ref

