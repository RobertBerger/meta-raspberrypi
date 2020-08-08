1) create a new repo on github

2) git clone git@github.com:RobertBerger/meta-raspberrypi.git

3) add my-scripts dir

cd meta-raspberrypi

echo "# meta-raspberrypi fork" >> README.md

git add .

git commit -m "first commit"

#git remote add origin git@github.com:RobertBerger/meta-tensorflow.git

#git push -u origin master

./my-scripts/push-all-to-github.sh

4) add upstream

cd meta-raspberrypi

git remote add official-upstream git://git.yoctoproject.org/meta-raspberrypi

git fetch official-upstream
warning: no common commits
remote: Enumerating objects: 7803, done.
remote: Counting objects: 100% (7803/7803), done.
remote: Compressing objects: 100% (3570/3570), done.
remote: Total 7803 (delta 4415), reused 6836 (delta 3838)
Receiving objects: 100% (7803/7803), 1.65 MiB | 1.45 MiB/s, done.
Resolving deltas: 100% (4415/4415), done.
From git://git.yoctoproject.org/meta-raspberrypi
 * [new branch]      daisy        -> official-upstream/daisy
 * [new branch]      danny        -> official-upstream/danny
 * [new branch]      denzil       -> official-upstream/denzil
 * [new branch]      dizzy        -> official-upstream/dizzy
 * [new branch]      dora         -> official-upstream/dora
 * [new branch]      dunfell      -> official-upstream/dunfell
 * [new branch]      dunfell-next -> official-upstream/dunfell-next
 * [new branch]      dylan        -> official-upstream/dylan
 * [new branch]      fido         -> official-upstream/fido
 * [new branch]      fix          -> official-upstream/fix
 * [new branch]      jethro       -> official-upstream/jethro
 * [new branch]      krogoth      -> official-upstream/krogoth
 * [new branch]      master       -> official-upstream/master
 * [new branch]      morty        -> official-upstream/morty
 * [new branch]      pyro         -> official-upstream/pyro
 * [new branch]      rocko        -> official-upstream/rocko
 * [new branch]      sumo         -> official-upstream/sumo
 * [new branch]      thud         -> official-upstream/thud
 * [new branch]      warrior      -> official-upstream/warrior
 * [new branch]      zeus         -> official-upstream/zeus

git branch -a

5) use specific upstream branch/commit and make own branch

syntax: git fetch url-to-repo branchname:refs/remotes/origin/branchname

git fetch  git://git.yoctoproject.org/meta-raspberrypi dunfell:refs/remotes/origin/dunfell

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

