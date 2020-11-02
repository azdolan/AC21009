#!/bin/bash

mkdir Mdirectory

#a function to create a repository
makeRepository () {
	echo "What is the name of the directory?"
	read -p "Enter directory name: " dirname
	mkdir $dirname
	echo "dirctory created" | tee -a out.log
	mv $dirname Mdirectory

	
}

#a function to add files to the repositorty
addingFiles () {
	echo "What is the name of the repository to add the file to?" 
	read -p "Enter repository name: " dirname
	cd Mdirectory | cd $dirname
	
	echo "What is the name of the file?"
	read -p "File name: " filename
	touch $filename.txt
	echo "file created" | tee -a out.log
}

checkingFile () {
	echo "What is the name of the repository you want to go to?"
	read -p "Enter repository name: " dirname
	cd Mdirectory 
	cd $dirname
	echo "What is the name of the file you want to check?"
	read -p "Enter file name: " filename
	cat $filename
}

while :
do

	echo "Which action would you like to perform?: hit [CTRL+C] to stop"
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
done

