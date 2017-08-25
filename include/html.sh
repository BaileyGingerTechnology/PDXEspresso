#!/bin/bash

# Script to generate output HTML files to end off service.

##### Constants

TITLE="System Information for $HOSTNAME"
RIGHT_NOW=$(date +"%x %r %Z")
TIME_STAMP="Updated on $RIGHT_NOW by $USER"

##### Functions

show_uptime()
{
	echo "<h2>System uptime</h2>"
	echo "<pre>"
	uptime
	echo "</pre>"
}

drive_space()
{
	echo "<h2>Filesystem space</h2>"
	echo "<pre>"
	df
	echo "</pre>"
}

home_space()
{
	echo "<h2>Home directory space by user</h2>"
	echo "<pre>"
	format="%8s%10s%10s   %-s\n"
	printf "$format" "Dirs" "Files" "Blocks" "Directory"
	printf "$format" "----" "-----" "------" "---------"
	if [ $(id -u) = "0" ]; then
		dir_list="/home/*"
	else
		dir_list=$HOME
	fi
	for home_dir in $dir_list; do
		total_dirs=$(find $home_dir -type d | wc -l)
		total_files=$(find $home_dir -type f | wc -l)
		total_blocks=$(du -s $home_dir)
		printf "$format" $total_dirs $total_files $total_blocks
	done
	echo "</pre>"
}

process_list()
{
	echo "<h2>Running Services</h2>"
	echo "<pre>"
		service --status-all | less -P "Running Services"
	echo "</pre>"
}

user_groups()
{
	echo "<h2>Users in Special Groups</h2>"
	echo "<pre>"
	echo "Members of group 'adm':"
    grep adm /etc/group | cut -d ':' -f 4
    echo "Members of group 'root':"
    grep root /etc/group | cut -d ':' -f 4
    echo "Members of group 'sudo':"
    grep sudo /etc/group | cut -d ':' -f 4
	echo "</pre>"
}

write_page()
{
	cat <<- _EOF_
	<html>
		<head>
		<title>$TITLE</title>
		</head>

		<body>
		<h1>$TITLE</h1>
		<p>$TIME_STAMP</p>
		$(show_uptime)
		$(drive_space)
		$(home_space)
		$(user_groups)
		$(process_list)
		</body>
	</html>
_EOF_
}

# Generate file into var/www/html
write_page > /var/www/html/diag.html
echo "$(tput setaf 2)File generated in /var/www/html${reset}"
