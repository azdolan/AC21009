#!/bin/bash

exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>log.out 2>&1

# Everything below will go to the file 'log.out':


echo "Which action would you like to perform?"

select action in Make Add Quit
do
	case $action in
		Make)
		echo "What is the name of the new directory?"
		read -p "Enter directory name: " dirname
		mkdir $dirname
		cd $dirname
		break
		;;
		Add)
echo "What is the name of your file and it's extension, eg page.html?"
read -p "File name plus extension " filename
touch $filename | $dirname
break
;;

		Quit)
			break
			;;
			*)
			echo "Unknown action"
			;;
		esac
	done

