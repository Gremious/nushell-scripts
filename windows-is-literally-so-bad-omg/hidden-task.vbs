' In Task Scheduler, run the .vbs file using wscript.exe
' by setting the 'Action' to run wscript
' and using the fully-qualified path to the .vbs file as an argument.
'
' https://serverfault.com/questions/9038/run-a-bat-file-in-a-scheduled-task-without-a-window
Dim WinScriptHost
Set WinScriptHost = CreateObject("WScript.Shell")
' Run(strCommand, [intWindowStyle], [bWaitOnReturn])
WinScriptHost.Run Chr(34) & "C:\Users\Gremious\bin\scripts\windows-is-literally-so-bad-omg\pueue-daemon.bat" & Chr(34), 0
Set WinScriptHost = Nothing
