#!/bin/bash

export INITIAL_GIT_TAG=v-1.0

function help() {
	echo "Select from the following options: "
	printf " %s \t %s \n" "1" "Add new feature"
	printf " %s \t %s \n" "2" "Fix the bug"
	printf " %s \t %s \n" "3" "Reset environment"
	printf " %s \t %s \n" "4" "Exit"
	
	echo "Please enter your option:"
	read OPTION

	case $OPTION in
	1 )
		echo "Feature is being added"
		add_feature
		echo "Feature added and committed"
		;;
	2 )
		echo "Feature fix is being added"
		add_feature_fix
		echo "Feature fix added and committed"		
		;;
	3 )
		echo "Resetting the branch"		
		reset
		echo "Done with branch reset"				
		;;
	4 )
		echo "Have a good day!"			
		exit 0
		;;
	esac	
}

function add_feature() {
	cp code_dump/feature/* .
	git add *
	git commit -m "Adding the feature"
	git push origin master
	help
}

function add_feature_fix() {
	cp code_dump/fix/* .
	git add *
	git commit -m "Adding the feature fix"
	git push origin master
	help
}

function reset() {
	cp code_dump/feature/* .
	git reset --hard $INITIAL_GIT_TAG
	git commit -m "Resetting post demo"
	git push origin master --force
	help
}

help				

