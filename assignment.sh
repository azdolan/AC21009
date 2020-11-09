#!/bin/bash
(

#a function to create a repository
makeRepository () {
	echo "What is the name of the directory?"
	read -p "Enter directory name: " dirname
	
	
	echo "directory selected: $dirname"
	mkdir $dirname
	cd $dirname
	echo "dirctory created" 
	
	
}

displayrep() {

 	echo "current repostires"
  	echo "--------------------"
	echo
	test -z "$1" || cd "$1"  #if parameter exists, use as base folder
	pwd
	ls -R | grep "^[.]/" | sed -e "s/:$//" -e "s/[^\/]*\//--/g" -e "s/^/   |/"
	# grep:    select folders (filter out files)
	# 1st sed: remove trailing colon
	# 2nd sed: replace higher level folder names with dashes
	# 3rd sed: indent graph and add leading vertical bar
	topFolders=$(ls -F -1 | grep "/" | wc -l)
	test $topFolders -ne 0 || echo "   --> no subfolders"
	echo





}


#a function to add files to the repositorty
addingFiles () {
	echo "What is the name of the file?"
	read -p "File name: " filename
	
	touch $filename.txt
	echo "file: $filename.txt created" 
	

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
	echo "file checked" 
	
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
	echo "file edited" 
	
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
  	echo "current repostires"
  	echo "--------------------"
	echo
	test -z "$1" || cd "$1"  #if parameter exists, use as base folder
	pwd
	ls -R | grep "^[.]/" | sed -e "s/:$//" -e "s/[^\/]*\//--/g" -e "s/^/   |/"
	# grep:    select folders (filter out files)
	# 1st sed: remove trailing colon
	# 2nd sed: replace higher level folder names with dashes
	# 3rd sed: indent graph and add leading vertical bar
	topFolders=$(ls -F -1 | grep "/" | wc -l)
	test $topFolders -ne 0 || echo "   --> no subfolders"
	echo

  	select opt in "Make" "Add" "Check" "Edit" "ZIP" "Quit" "Display"
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
		  Display)
		  displayrep
		  break
		  ;;
          "Quit")
              echo "Thank you for using"
              exit
              ;;
          *) echo invalid option: ;;
      esac
  done

  

  done


) 2>&1 | tee log.out
