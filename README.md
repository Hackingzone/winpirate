#This project is still in progess

Here's the plan. We create a way to automate doing the sticky keys windows hack from a bootable USB.

Then, we automate getting as many saved passwords as possible, drop a listener, and delete all traces that we were there.

All without being detected by antivirus


we should add a mimikittenz option if the computer was found running and unlocked, otherwise we can just run it later remotely


#INFO
Google Chrome saves it's password in an annoying sqlite databse in ``` "Appdata\Local\Google\Chrome\User Data\Default\Login Data" ```
They're encrypted with the Windows CryptProtectData function.
https://github.com/chromium/chromium/blob/trunk/chrome/browser/password_manager/encryptor_win.cc
Edit: chrome python script now creates a csv with passwords