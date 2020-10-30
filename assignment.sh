#!/bin/bash

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

