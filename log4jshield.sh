#! /usr/bin/env bash
RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"
BOLD="\033[1m"
ENDBOLD="\033[0m"
JNDI_LOOKUP_CLASS_PATH="org/apache/logging/log4j/core/lookup/JndiLookup.class"
INFACTED=()
SAFE=()
SECONDS=0
TIMESTAMP=$(date +'LOG4J-SHIELD-%d-%m-%Y_%H-%M-%S')
echo -e "\n  _             _  _   _     _     _      _     _ \n | | ___   __ _| || | (_)___| |__ (_) ___| | __| |\n | |/ _ \ / _\` | || |_| / __| '_ \| |/ _ \ |/ _\` |\n | | (_) | (_| |__   _| \__ \ | | | |  __/ | (_| |\n |_|\___/ \__, |  |_|_/ |___/_| |_|_|\___|_|\__,_|\n          |___/     |__/                     1.0\n\n"
function fixJARs(){
	eval file=$1
	if [[ -f "$file" ]]; then
		cp -p $file "${file}.bak"
		if ${file#*.} == 'war';
			$(zip -q -r $file WEB-INF/lib/log4j-core-*.jar)
		else
			$(zip -q -d $file ${JNDI_LOOKUP_CLASS_PATH})
		fi
		if [ $? -eq 0 ]; then
			echo -e "${BOLD}[+] ${GREEN}[PATCHED] $file ${ENDBOLD}${ENDCOLOR}"
			echo -e "${BOLD}[+] ${RED}[INFO] created a backup of the patched jar under $file.bak${ENDCOLOR}${ENDBOLD}\n"
		fi
	else
		echo -e "${BOLD}[+]${ENDBOLD} ${RED}${BOLD}$file does not exist!!!${ENDBOLD}${ENDCOLOR}\n"
	fi
}

if [[ $(find . -type d -name "^LOG4J-SHIELD-*") ]];then
	read -p "It seems you have ran the analysis process already, if you would like to continue patching the vulnerable JARs please type [y] or [n] to start a new analysis: " -n 1 -r
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		echo -e "\n\n${BOLD}${RED}[+]${ENDCOLOR} Please type the choice number for the analysis which you want to use to preform the patching against:${ENDBOLD}\n"
		FOLDERS=(LOG4J-SHIELD-*/)
		select d in ${FOLDERS[@]}; do test -n "$d" && break; echo ">>> Invalid selection"; done
			vulnerableJARS=$(cat $d/VULNERABLE-JARs.txt)
			for jarFile in ${vulnerableJARS[@]}
				do
					echo ${jarFile}
					fixJARs $jarFile
				done
		exit
	fi
fi

echo -e "\n${BOLD}[+]${ENDBOLD} Gathering JAR files within your system"
FILES=($(find ~+ -type f -name '*.jar' -o -name '*.war' -o -name '*.ear' -o -name '*.aar'  2>/dev/null));
echo -e "${BOLD}[+]${ENDBOLD} Done gathering JAR files\n\n"

for file in ${FILES[@]}
	do
		isFileVulnerable=$(strings $file | grep "${JNDI_LOOKUP_CLASS_PATH}$")
		if [ $? -eq 0 ]; then
			echo -e "${RED}${BOLD}[VULNERABLE] $file ${ENDBOLD}${ENDCOLOR}"
			echo -e "\t ${isFileVulnerable}\n"
			INFACTED[${#INFACTED[@]}]=$file
		else
			echo -e "${BOLD}[SAFE]${ENDBOLD} $file"
			SAFE[${#SAFE[@]}]=$file
		fi
	done

echo -e "\n\n${BOLD}--------------------------- SUMMARY ---------------------------${ENDBOLD}"
echo -e "\t${BOLD}     ELAPSED TIME: $(($SECONDS/3600)) hrs $(($SECONDS/60)) mins $(($SECONDS%60)) secs${ENDBOLD}"
echo -e "\t\t${BOLD}$(date) ${ENDBOLD}\n"
echo -e "\t${BOLD}THE TOTAL NUMBER OF SEARCHED FILES: \t ${#FILES[@]} ${ENDBOLD}"
echo -e "\t${BOLD}${RED}THE TOTAL NUMBER OF VULNERABLE FILES: \t ${#INFACTED[@]} ${ENDCOLOR}${ENDBOLD}"
echo -e "\t${BOLD}${GREEN}THE TOTAL NUMBER OF SAFE FILES: \t ${#SAFE[@]} ${ENDCOLOR}${ENDBOLD}"
echo -e "\n${BOLD}-------------------------- STAY SAFE --------------------------${ENDBOLD}"
mkdir -p $TIMESTAMP
printf "%s\n" "${INFACTED[@]}" > "$TIMESTAMP"/VULNERABLE-JARs.txt
printf "%s\n" "${SAFE[@]}" > "$TIMESTAMP"/SAFE-JARs.txt
echo -e "\n\n${GREEN}${BOLD}[+] REPORTS ARE SAVED UNDER $(pwd)/${TIMESTAMP}${ENDBOLD} ${ENDCOLOR}\n\n"
