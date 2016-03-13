#!/bin/bash

#author Pratik Anand <pratik.anand@mobiliya.com>
#Shell script to copy the changes done in git within the povided date  
#date format mm-dd 
#year value is 2016 

log_location=definel # difine location of file where  you want to store it  !! Mandatory 
count=0 

#set -e 
afterDate() {
		echo -n "Enter the date after which you want (format mm-dd) :  "
			read ad
			if [[ $ad == +([0-1][0-9]-[0-3][0-9]) ]]; then echo "";elif [[ -z $ad ]]; then echo "please Enter value "; afterDate ; else echo "invalid format"; afterDate ;fi 
	}
afterDate # calling function to collect after date 
after_date=2016-$ad

beforeDate(){
	echo -n "Enter the date before which you want (format mm-dd) :  "
	read bd 
	if [[ $bd == +([0-1][0-9]-[0-3][0-9]) ]]; then echo "";elif [[ -z $bd ]]; then echo "please Enter value "; afterDate ; else echo "invalid format"; beforeDate ;fi
	}
beforeDate # calling function to collect before date 
before_date=2016-$bd

git log --name-only --after "$after_date" --before="$before_date" --pretty=format=%h  |sed 's|format=.*||g' > $log_location
sed -i '/^$/d' $log_location # Removing extra line 


cat $log_location | while read LINE

	do
	put_location=/tmp/DA
	let count++
	word=`echo $LINE |grep -o "/" |wc -w`
	i=1
	word=`expr $word + 2`

	while [ $i -lt $word ]
		do  
		dir=`echo $LINE |cut -d / -f $i`
		if [[ $i == 1 ]]; then
			dircheck=$dir
		else 
			dircheck=$dircheck/$dir
		fi

		let i++
		if [[  -d $dircheck ]]; then
			if [[ ! -d $put_location/$dir ]]; then
				#echo creating $dir	
				mkdir $put_location/$dir
			fi
		elif [[  -f $dircheck ]]; then
			if [[ -x $dircheck ]] ;then chmod +x $put_location/$dir ;  fi 
			cp -r $dircheck $put_location
		else 
			rm $put_location/$dir
		fi
		put_location=$put_location/$dir

		done
	done
echo Done