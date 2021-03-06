#!/bin/bash
if [ $# -ne 2 ]; then
    echo $0: usage: ./backup.sh containerId exclude
    exit 1
fi

time=$(date +"%Y-%m-%d-%H:%M:%S")
#backupName="$1.$time"
backupServerUser="backup"
backupServer="backup01.giraf.cs.aau.dk"
name=$(docker inspect -f '{{.Name}}' $1)
backupName="$name.$time"
volume=$(docker inspect -f '{{ (index .Mounts 0).Source }}' $1)
backupPath="$volume/"

echo "$backupPath"

read -p "We didn't start the fire!"

ssh backup@backup01.giraf.cs.aau.dk 'mkdir /srv/backup/web'"$name"'';
rsync -avzP --exclude "$2" "$backupPath" "$backupServerUser"@"$backupServer":/srv/backup/web"$name""$backupName";
ssh backup@backup01.giraf.cs.aau.dk 'tar cvfz /srv/backup/web'"$name""$backupName"'.tar.gz /srv/backup/web'"$name""$backupName"'/*; rm -rf /srv/backup/web'"$name"''"$backupName"'';


docker logs "$1" > /home/backup/stdout.log 2>/home/backup/stderr.log
scp /home/backup/stdout.log "$backupServerUser"@"$backupServer":/srv/backup/web"$name""$backupName".stdout.log
scp /home/backup/stderr.log "$backupServerUser"@"$backupServer":/srv/backup/web"$name""$backupName".stderr.log
rm /home/backup/stderr.log;
rm /home/backup/stdout.log;
