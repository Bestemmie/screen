#!/bin/bash

if [[ $1 = "" ]]
then
	echo "[LSU] Error: no argument inserted, aborting ..."
else
	if [[ $1 = "help" ]]
	then
		echo "Welcome to the LSU, Leo's screen utility"
		echo ""
		echo "	This script was made to simplify the interaction with the screen command."
		echo ""
		echo "How to navigate inside a screen:"
		echo "	To create various screens, we use the omonimous utility provided by most linux-based system, screen."
		echo "	That said, in order to correctly use the screens, we need to learn a few basic hotkeys:"
		echo "		- Ctrl + A + D		| this allows use to detach from the current screen we're into"
		echo "		- Ctrl + C		| this allows use to terminate a certain screen that is CURRENTLY RUNNING A PROCESS"
		echo "		- \"exit\" command	| typing the exit keyword in a screen prompt closes the screen, something that Ctrl + C"
		echo "					| wouldn't be able to do if there were no process running in the foreground"
		echo ""
		echo "Installation tips"
		echo "	I personally suggest to alias the script with something easy to type, like s or sc, it's up to you"
		echo ""
		echo "Usage \"./s <argument>\":"
		echo ""
		echo "	- ./s list 		| it lists all the screens available"
		echo "	- ./s help		| it shows the help menù"
		echo "	- ./s c <screen name>	| it connects to the screen you've specified"
		echo "	- ./s <any other word>	| it creates a screen with that word"
		echo ""
		echo "CREDITS:"
		echo "	- creator: https://github.com/bestemmie"
		echo "	- collaborators and testers:"
		echo "		- https://github.com/lolimpo-development"
		echo "		- https://github.com/stocazzo-development"
	else
		if [[ $1 = "list" ]]
		then
			/usr/bin/screen -list
		else
			if [[ $1 = "c" ]]
			then
				if [[ $2 = "" ]]
				then
					echo "[LSU] Error: the screen's name is empty, aborting ..."
				else
					/usr/bin/screen -r $2
				fi
			else
				echo "[LSU] Starting screen instance ..."
				/usr/bin/screen -dmS $1

				echo "[LSU] Connect? (N to reject)"
				read opt

				if [[ $opt = "n" ]] || [[ $opt = "N" ]];
				then
					echo "[LSU] Screen named \"$1\" created successfully!"
				else
					/usr/bin/screen -r $1
				fi
			fi
		fi
	fi
fi
