#!/bin/bash
set -e
#set -x

repo=(
on-http
on-taskgraph
on-tftp
on-dhcp-proxy
on-syslog )

commit=(
578d75af5b8ff0099b6acdfdf81fa38e8977f6ea
c095ac6d0a13bb14f89db6dfd3e8edeec643ace4
8b22b4650c347a7a50befcb142d5a7fe4eda66b9
69236adfe2bcc53c443369369becb9f6ca5d8196
3f344ea73d60985b60e946b42a31f593f1014436
)

core_commit=(
2d6edc2224d33dfcd4d251d730999bc7d9a515c9
bbda16b8bbe9a5c8944b7651d7fe99b6af525ddf
8356ac2ad30a613595584f0eaf52e18711c216d6
8356ac2ad30a613595584f0eaf52e18711c216d6
8356ac2ad30a613595584f0eaf52e18711c216d6
)

tasks_commit=(
3d803dd67f18f98f1018f301a372c5f6105d168b
3127192d2692d0abbf85e7ea09c1bda0d1d19223
d5a6c4e6675f5b8205e4544f1fcb1903a8753434
d5a6c4e6675f5b8205e4544f1fcb1903a8753434
d5a6c4e6675f5b8205e4544f1fcb1903a8753434
)

#for i in "${!repo[@]}"; do
#    git clone https://github.com/RackHD/${repo[$i]}.git 
#done

for i in "${!repo[@]}"; do 
   echo ${repo[$i]}  ${commit[$i]}   ${core_commit[$i]}    ${tasks_commit[$i]}
    cd ${repo[$i]}
    git reset --hard ${commit[$i]}
    sed -i "s#on-core.git#on-core.git\#${core_commit[$i]}#" package.json
    sed -i "s#on-tasks.git#on-tasks.git\#${tasks_commit[$i]}#" package.json
    ./extra/make-deb.sh
    cd ..
done


#git reset --hard 
