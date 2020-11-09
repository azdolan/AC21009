#!/bin/bash

#a function to create a repository
makeRepository () {
	echo "What is the name of the directory?"
	read -p "Enter directory name: " dirname
	
	if [[ ! -d $dirname ]]; then
	echo "error: directory does not exist"
	exit 1
	
	else
	echo "directory selected: $dirname"
	mkdir $dirname
	cd $dirname
	echo "dirctory created" | tee -a out.log	
	fi
	
	
}

#a function to add files to the repositorty
addingFiles () {
	echo "What is the name of the file?"
	read -p "File name: " filename
	
	if [[ ! -f "$filename" ]]; then

	echo "error: file $filename does not exist"
	exit 1

	
	else
	
	touch $filename.txt
	echo "file: &filename.txt created" | tee -a out.log
	
	fi
}

checkingFile () {
	ls
	echo "What is the name of the file you want to check?"
	read -p "Enter file name: " filename
	if [[ ! -f "$filename" ]]; then

	echo "error: file does not exist"
	exit 1

	else
	cat $filename.txt
	echo "file checked" | tee -a out.log
	
	fi
}

editingFile () {
	ls
	echo "What is the name of the file you want to edit: " 
	read -p "Enter file name " filename
	if [[ ! -f "$filename" ]]; then

	echo "error: file does not exist"
	exit 1

	else
	nano $filename.txt
	echo "file edited" | tee -a out.log
	
	fi
}

creatingZip (){
	echo "What is the name of the repository you want to Zip?"
	read -p "Enter directory name: " dirname
	if [[ ! -d $dirname ]]; then
	echo "error: directory does not exist"
	exit 1
	else
	echo "directory selected: $dirname "
	echo "creating zip of : $dirname "
	
	zip -r $dirname.zip $dirname
	fi
}

while true
  do
  select opt in "Make" "Add" "Check" "Edit" "ZIP" "Quit"
  do
      case $opt in
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
				Edit)
				editingFile
				break
				;;
				ZIP)
				creatingZip
				break
				;;
          "Quit")
              echo "Thank you for using"
              exit
              ;;
          *) echo invalid option;;
      esac
  done
  done


