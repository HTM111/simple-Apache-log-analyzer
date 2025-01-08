
# apache log analyser

It's a simple script that analyzes Apache logs and reports back to the user.




## installation
```
git clone https://github.com/HTM111/simple-Apache-log-analyzer

cd simple-Apache-log-analyzer

chmod +x analyzer.sh
```
## usage
```
./analyser.sh -i file.txt -p CLF
```
-p : is the file format CLF is the only one supported currently 

-i the name of the log file 

### output 

output should be something like this : 
```

======================================================
[+] Total request are : 81
[+] Total unique visitors are : 24
[+] Total Failed request are : 2
[+] Total Successfull request are : 79
========================================================
```


