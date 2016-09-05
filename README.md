#This project is still in progress

Estimated Completion Date: soon...ish

Here's the plan. We create a way to automate doing the sticky keys windows hack from a bootable USB.

Then, we automate getting as many saved passwords as possible, drop a listener, and delete all traces that we were there.

All without being detected by antivirus

we should add a mimikittenz option if the computer was found running and unlocked, otherwise we can just run it later remotely


#How to Use
Requirements: a linux bootable USB, this repo on the USB (not in the OS, just put it in the root directory)  
1) shutdown windows  (make sure not hibernating by holding shift while pressing shut down)  
2) hit F12 and select USB  
3) ```sudo -i```   
4) ```fdisk -l```  (note: if you're on Kali Linux, run ```parted -l```)  
5) ```mkdir /media/windows```  
6) ```mount /dev/WHATEVERTHEWINDOWSPARTITIONWASCALLED /media/windows -t ntfs```  
7) run sticky keys.sh  
8) restart and boot to Windows  
9) hit Shift 5 times fast, a command prompt will appear  
10) cd to the USB and run WinPirate.bat

#Current Issues
1) The chrome passwords grabber that I made is still a .py    For it to work, I need to convert it to exe so it doesn't require python to be installed on the system.  
You can run it with ```python chromepasswords.py -csv``` and it will decrypt the Chrome saved passwords database and export it as a CSV

2) The sticky keys automation doesn't speed the process up as much as I previously thought, as evident by the lengthy "How to Use" section

3) I haven't been able to write any tools that grab passwords for IE or Firefox