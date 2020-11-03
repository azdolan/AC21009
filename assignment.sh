#!/bin/bash

#a function to create a repository
makeRepository () {
	echo "What is the name of the directory?"
	read -p "Enter directory name: " dirname
	mkdir $dirname
	cd $dirname
	echo "dirctory created" | tee -a out.log
	
}

#a function to add files to the repositorty
addingFiles () {
	echo "What is the name of the file?"
	read -p "File name: " filename
	touch $filename.txt
	echo "file created" | tee -a out.log
}

checkingFile () {
	ls
	echo "What is the name of the file you want to check?"
	read -p "Enter file name: " filename
	cat $filename.txt
	echo "file checked" | tee -a out.log
}

editingFile () {
	ls
	echo "What is the name of the file you want to edit: " 
	read -p "Enter file name " filename
	nano $filename.txt
	echo "file edited" | tee -a out.log
}

creatingZip (){
	echo "What is the name of the repository you want to Zip?"
	read -p "Enter directory name: " dirname
	zip -r $dirname.zip $dirname
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


