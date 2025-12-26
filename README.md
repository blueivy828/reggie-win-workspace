# Reggie Win Workspace

Automated Windows workspace setup - opens browser tabs and apps on login.

## Install

```powershell
irm https://raw.githubusercontent.com/blueivy828/reggie-win-workspace/main/setup.ps1 | iex
```

## What It Does

- Installs dev tools (Node.js, Git, pnpm, VS Code, Cursor, Antigravity)
- Downloads workspace launcher to Desktop
- Creates login task via Task Scheduler
- Sets up PowerShell aliases (git shortcuts, unix-like commands)

## Customize

Edit `reggie-workspace.bat` on your Desktop:

```batch
@echo off
start "" msedge "https://your-urls-here.com"
start "" powershell
start "" "C:\path\to\app.exe"
```

**Other browsers:** Replace `msedge` with `chrome`, `firefox`, or `brave`

## Uninstall

```powershell
Unregister-ScheduledTask -TaskName "ReggieWorkspace" -Confirm:$false
Remove-Item "$env:USERPROFILE\Desktop\reggie-workspace.bat"
```

## Troubleshooting

**Execution policy error:**
```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

**Task not running:** Open Task Scheduler > find `ReggieWorkspace` > check trigger settings

## Requirements

- Windows 10/11
- PowerShell 5.1+
PS C:\Users\PC\Desktop> ls


    Directory: C:\Users\PC\Desktop


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----        12/26/2025   7:05 AM                .claude
-a----        12/26/2025   7:05 AM            218 nul
-a----        12/17/2025   6:24 PM           2244 Obsidian.lnk
-a----        12/26/2025   8:23 AM           1137 README.md
-a----        12/26/2025   8:17 AM            165 reggie-workspace.bat
-a----        12/26/2025   8:11 AM          12273 setup.ps1
-a----        12/17/2025   5:23 PM           1395 Visual Studio Code.lnk


PS C:\Users\PC\Desktop> cat README.md
# Reggie Win Workspace

Automated Windows workspace setup - opens browser tabs and apps on login.

## Install

```powershell
irm https://raw.githubusercontent.com/blueivy828/reggie-win-workspace/main/setup.ps1 | iex
```

## What It Does

- Installs dev tools (Node.js, Git, pnpm, VS Code, Cursor, Antigravity)
- Downloads workspace launcher to Desktop
- Creates login task via Task Scheduler
- Sets up PowerShell aliases (git shortcuts, unix-like commands)

## Customize

Edit `reggie-workspace.bat` on your Desktop:

```batch
@echo off
start "" msedge "https://your-urls-here.com"
start "" powershell
start "" "C:\path\to\app.exe"
```

**Other browsers:** Replace `msedge` with `chrome`, `firefox`, or `brave`

## Uninstall

```powershell
Unregister-ScheduledTask -TaskName "ReggieWorkspace" -Confirm:$false
Remove-Item "$env:USERPROFILE\Desktop\reggie-workspace.bat"
```

## Troubleshooting

**Execution policy error:**
```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

**Task not running:** Open Task Scheduler > find `ReggieWorkspace` > check trigger settings

## Requirements

- Windows 10/11
- PowerShell 5.1+
