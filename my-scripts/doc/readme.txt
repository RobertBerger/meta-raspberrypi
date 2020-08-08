1) create a new repo on github

2) git clone git@github.com:RobertBerger/meta-raspberrypi.git

3) add my-scripts dir

cd meta-raspberrypi

echo "# meta-raspberrypi fork" >> README.md

git add .

git commit -m "first commit"

#git remote add origin git@github.com:RobertBerger/meta-tensorflow.git

git push -u origin master

3) use my repo

mv meta-tensorflow meta-tensorflow.ori
git clone git@github.com:RobertBerger/meta-tensorflow.git

4) add upstream

cd meta-tensorflow

git remote add official-upstream git://git.yoctoproject.org/meta-tensorflow

git fetch official-upstream

git branch -a

5) use specific upstream branch/commit and make own branch

syntax: git fetch url-to-repo branchname:refs/remotes/origin/branchname

git fetch git://git.yoctoproject.org/meta-tensorflow master:refs/remotes/origin/2020-05-10-master-as-dunfell

6) Update from upstream:
git co master
>> git remote -v

official-upstream       git://git.openembedded.org/meta-tensorflow (fetch)
official-upstream       git://git.openembedded.org/meta-tensorflow (push)
origin  git@github.com:RobertBerger/meta-tensorflow.git (fetch)
origin  git@github.com:RobertBerger/meta-tensorflow.git (push)

>> git fetch official-upstream
official-upstream       git://git.yoctoproject.org/meta-tensorflow (fetch)
official-upstream       git://git.yoctoproject.org/meta-tensorflow (push)
origin  git@github.com:RobertBerger/meta-tensorflow.git (fetch)
origin  git@github.com:RobertBerger/meta-tensorflow.git (push)
---

7) My own branch:
git co master
git co official-upstream/warrior
git checkout -b 2019-09-09-warrior-2.7+
git co master
cd my-scripts
./push-all-to-github.sh

8) apply patches

cd meta-virtualization

git co 2019-09-09-warrior-2.7+ 

stg init

stg series

stg import --mail ../meta-virtualization-patches/2019-09-09-warrior-2.7+/0001-use-systemd-as-cgroup-manager-for-docker-While-it-s-.patch

import all patches

...

stg series 

stg commit --all

git log

git co master

9) push to my upstream

my-scripts/push-all-to-github.sh

