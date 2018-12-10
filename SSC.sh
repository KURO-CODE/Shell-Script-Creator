#!/bin/bash

#***** Shell Script Creator *****

# Name: Shell Script Creator
# Version: 1.0 Beta
# Date: 12/10/2018
# Dev: Shell
# Type: Simple script creator
# Coder: Kuro-Code


Main() {
	clear
	echo -e "\n\t~ Main Menu ~\n\n\t1.Info\n\t2.Creator\n\t0.Exit\n"
	read -p " Option: " OPT 
	case $OPT in 
		1) INFO;;
		2) CREAT;;
		0) EXIT;;
	esac
}

CREAT() {
	clear
	echo -e " Welcome to Main Creator\n\n"
	echo -e " 1.Default (Main, Exit)\n 2.Medium (Main, Function, Exit)\n 3.Advenced (Main, Function, Exit, Trap Exit)\n 4.SuperMain\n 0.Back\n"
	read -p " Option: " OPT
	case $OPT in
		1)FOLDER;CREAT;;
		2)FOLDER;CREAT;;
		3)FOLDER;CREAT;;
		4)FOLDER; FUNCTION; CREAT;;
		0)Main;;
		*) clear; echo -e "ERROR"; sleep 3; Main;;
	esac
}

function FOLDER() {
	if [ "$OPT" -eq "1" ]; then
		Folder="DEF"
		if [ ! -d "$Folder" ]; then
			mkdir $Folder
			$Folder
		else
			$Folder
		fi
	fi
	if [ "$OPT" -eq "2" ]; then
		Folder="MED"
		if [ ! -d "$Folder" ]; then
			mkdir $Folder
			$Folder
		else
			$Folder
		fi
	fi
	if [ "$OPT" -eq "3" ]; then
		Folder="ADV"
		if [ ! -d "$Folder" ]; then
			mkdir $Folder
			$Folder
		else
			$Folder
		fi
	fi
	if [ "$OPT" -eq "4" ]; then
		Folder="CPLX"
		FILE="SuperMain.sh"
		if [ ! -d "$Folder" ]; then
			mkdir $Folder
			$Folder
		else
			$Folder
		fi
		if [ ! -f "$FILE" ]; then
			echo -e " Not exist"
			sleep 3
			echo "#!/bin/bash" >> $Folder/$FILE
			$FUNCTION
		else
			echo -e " File exist..."
			sleep 3
			$FUNCTION
		fi
	fi
}

function FUNCTION() {
	clear
	echo -e "Add Function...
	1.Add function
	2.Finalyz
	0.Back\n"
	read -p " Option: " OPT
	case $OPT in
		1) clear; echo -e "Enter name function...\n"; read -p " Name: " FNAME; echo "function $FNAME() {
	Place=\"$FNAME\" 
	echo \"\"
}" >> $Folder/$FILE; FUNCTION;;
		2) FINALYZ; WHILE; END; EndStart; CREAT;;
		0) CREAT;;
	esac

}

function DEF() {
	echo "#!/bin/bash

Main() {
	echo -e \" ~ Main Menu ~

	0.Exit\"

	read -p \" Option: \" OPT
	case \$OPT in
		0)EXIT;;
	esac
}

EXIT() {
	clear
	echo -e \"Exit\"
	sleep 3
	clear
	exit
}

Main" > DEF/Def.sh
}

function MED() {
	clear
	echo -e " Name for function..."
	read -p " Name: " FNAME
	echo "#!/bin/bash

Main() {
	echo -e \" ~ Main Menu ~

	1."$FNAME"
	0.Exit\"

	read -p \" Option: \" OPT
	case \$OPT in
		1)"$FNAME";;
		0)EXIT;;
	esac
}

function $FNAME() {
	echo
}

EXIT() {
	clear
	echo -e \"Exit\"
	sleep 3
	clear
	exit
}

Main" > MED/Med.sh
}

function ADV() {
	clear
	echo -e " Name for function..."
	read -p " Name: " FNAME
	echo "#!/bin/bash

Main() {
	Place=\"Main\"
	echo -e \" ~ Main Menu ~

	1.\""$FNAME\""
	0.Exit\"

	read -p \" Option: \" OPT
	case \$OPT in
		1)"$FNAME";;
		0)EXIT;;
	esac
}

function $FNAME() {
	Place=\""$FNAME\""
	echo -e \""$FNAME\""
}

EXIT() {
	clear
	echo -e \"Exit\"
	sleep 3
	clear
	exit
}

#~~~~ Hard Exit ~~~~
function cap_traps() {
	case \$Place in
		\"Main\") clear; EXIT;;
		\""$FNAME"\") clear; EXIT;;
	esac 
}

for x in SIGINT SIGHUP INT SIGTSTP; do
	trap_cmd=\"trap \\\"cap_traps \$x\\\" \\\"\$x\\\"\"
	eval \"\$trap_cmd\"
done

Main" > ADV/Adv.sh
}

function FINALYZ() {
	echo "
#~~~~ Exit ~~~~~
EXIT() {
	clear
	echo -e \"Exit\"
	sleep 3
	clear
	exit
}

#~~~~ Hard Exit ~~~~
function cap_traps() {
	case \$Place in
		" >> $Folder/$FILE
}

function END() {
	echo "	esac
}

for x in SIGINT SIGHUP INT SIGTSTP; do
	trap_cmd=\"trap \\\"cap_traps \$x\\\" \\\"\$x\\\"\"
	eval \"\$trap_cmd\"
done
" >> $Folder/$FILE
}

function EndStart() {
	a=`cat $Folder/$FILE |grep -o function |wc -l`
	b=`cat $Folder/$FILE |grep function |awk '{print $2}' |sed 's/()/-/g' > tt.txt`
	c=`cat tt.txt`
	i="1"
	ii="$i" 
	R=`echo $c |sed 's/)/-/g' |sed 's/(//g' | sed 's/ //g' |cut -f${ii} -d -`
	sleep 2
	echo "$R" >> $Folder/$FILE 
}

function WHILE() {
	a=`cat $Folder/$FILE |grep -o function |wc -l`
	b=`cat $Folder/$FILE |grep function |awk '{print $2}' |sed 's/()/:/g' > tt.txt`
	c=`cat tt.txt`
	i="1"
	while (( $i < $a )); do
		ii="$i" 
		R=`echo $c |sed 's/)/:/g' |sed 's/(//g' | sed 's/ //g' |cut -f${ii} -d :`
		sleep 2
		echo "		\"$R\") clear; EXIT;;" >> $Folder/$FILE
		i=$(($i+1))
	done
}

INFO() {
	clear
	echo -e "
    ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
    ┃                                ┃
    ┃   Name: Shell Script Creator   ┃
    ┃   Date: 12/10/2018             ┃
    ┃   Type: Script creator         ┃
    ┃   Dev: Shell                   ┃
    ┃   Ver: 1.0                     ┃
    ┃   Coder: Kuro-Code             ┃
    ┃                                ┃
    ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
  Return to Main menu, press [ENTER]."
    read -p ""
  	Main
}

EXIT() {
	clear
	echo -e " Thanks for using SSC, Bye bye"
	sleep 3
	clear
	exit
}

Main