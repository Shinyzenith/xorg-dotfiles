curl -s "https://api.github.com/users/XelphLinux/repos?per_page=100" | jq -r ".[].git_url" | xargs -L1 git clone
count=0
for name in $(ls -d */); do
	count=$[count+1]
	cd $name
	tput setaf 1;echo "Github "$count;tput sgr0;
	git pull
	echo "#################################################"
	echo "################  "$(basename `pwd`)" done"
	echo "#################################################"
	cd ..
done
