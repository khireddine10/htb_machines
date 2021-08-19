#!/bin/sh
echo $1

# brute force web server directory
if [ $1 = "dir" ] 
then
	wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/directory-list-2.3-medium.txt -O dir.txt
	ffuf -u http://$2/fuzz -w dir.txt:fuzz > dirs.out
	rm dir.txt
	exit 1;
fi

if [ $1 = "files" ] 
then
# brute force files 
	wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/raft-medium-files.txt -O files.txt
	ffuf -u http://$2/fuzz -w files.txt:fuzz > files.out
	rm files.txt
	exit 1;
fi

if [ $1 = "sub" ] 
then
	# brute force web app subdomains
	wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/DNS/subdomains-top1million-110000.txt -O sub.txt
	ffuf -u http://fuzz.$2 -w sub.txt:fuzz > sub.out
	rm sub.txt
	exit 1;
fi

if [ $1 = "extension" ]
then
	# brute force extensions
	wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/raft-medium-extensions.txt -O extension.txt
	ffuf -u http://$2/index.fuzz -w extension.txt:fuzz > extensions.out
	rm extension.txt
	exit 1;
fi


if [ $1 = "backup" ]
then
	# brute force common backups files
	wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/Common-DB-Backups.txt -O backups.txt
	ffuf -u http://$2/fuzz -w backups.txt:fuzz > backups.out
	rm backups.txt
	exit 1;
fi

if [ $1 = "php" ]
then
	# brute force php common files
	wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/Common-PHP-Filenames.txt -O php.txt
	ffuf -u http://$2/fuzz -w php.txt:fuzz > php.out
	rm php.txt

	# brute force php common folders and extentions
	wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/PHP.fuzz.txt -O php1.txt
	ffuf -u http://$2/fuzz -w php1.txt:fuzz > php1.out
	rm php1.txt
	exit 1;
fi

if [ $1 = "apache" ]
then
	# brute force apache files
	wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/apache.txt -O apache.txt
	ffuf -u http://$2/fuzz -w apache.txt:fuzz > apache.out
	rm apache.txt
	exit 1;
fi

if [ $1 = "nginx" ]
then
	# brute force nginx files
	wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/nginx.txt -O nginx.txt
	ffuf -u http://$2/fuzz -w nginx.txt:fuz > nginx.out
	rm nginx.txt
	exit 1; 
fi

