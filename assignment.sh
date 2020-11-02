#!/bin/bash

#a function to create a repository
makeRepository () {
	echo "What is the name of the directory?"
	read -p "Enter directory name: " dirname
	mkdir $dirname
	
}

#a function to add files to the repositorty
addingFiles () {
	echo "What is the name of the repository to add the file to?" 
	read -p "Enter repository name: " dirname
	cd $dirname
	echo "What is the name of the file?"
	read -p "File name: " filename
	touch $filename.txt
}

checkingFile () {
	echo "What is the name of the repository you want to go to?"
	read -p "Enter repository name: " dirname
	cd $dirname
	echo "What is the name of the file you want to check?"
	read -p "Enter file name: " filename
	cat $filename
}



	echo "Which action would you like to perform?"
	select action in Make Add Check Quit
	do
	case $action in
		Make)
			makeRepository
			break
			;;
		Add)
			addingFiles
			break
			;;
			Check)
			checkingFile
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

