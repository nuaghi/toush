#!/bin/bash
##############################
#  Author:nuaghi             #
#  Mail: nuaghi@gmail.com    #
#  Date:2019-11-20 20:48:02  #
##############################

function writefunc(){
	touch $1
	cat  /dev/null > $1
	echo "#!/bin/bash" >> $1
	echo "##############################" >> $1
	echo "#  Author:nuaghi             #" >> $1
	echo "#  Mail: nuaghi@gmail.com    #" >> $1
	echo "#  Date:`date "+%Y-%m-%d %H:%M:%S"`  #" >> $1
	echo "##############################" >> $1
}

if [ x"$1" = x ]
then
	echo "Param does not exist."
	exit 1
elif [ -s $1 ]
then
	echo -e "This script is already existed, do you want to overwrite it?\n(Please input Y=Yes, N=No, default setting is No.)\n\c"
	read parmch
	if [ $parmch = "N" -o $parmch = "No" ]
	then
		echo -e "OK, please running the script again and put a other param then. This is a list of files in the folder.\n"`ls -A`
		exit 1
	elif [ $parmch = "Y" ]
	then
		cp $1 "$1.`date +%Y%m%d-%H%M%S`.bak"
		writefunc $1
		exit 0
	else
		echo "Please running the script again and put a other param then. This is a list of files in the folder."
		exit 1
	fi
fi

writefunc $1
exit 0

