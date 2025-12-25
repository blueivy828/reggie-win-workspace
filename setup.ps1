# setup.ps1
# Run with: irm https://raw.githubusercontent.com/blueivy828/reggie-win-workspace/refs/heads/main/setup.ps1 | iex

$ErrorActionPreference = "Stop"

# Configuration
$taskName = "ReggieWorkspace"
$taskPath = "\REGGIE_WORKFLOW_TABS\"
$batFileName = "reggie-workspace.bat"
$batDestination = "$env:USERPROFILE\Desktop\$batFileName"
$repoUrl = "https://raw.githubusercontent.com/blueivy828/reggie-win-workspace/refs/heads/main/$batFileName"

Write-Host "Setting up Reggie Workspace automation..." -ForegroundColor Cyan

# Download the .bat file
Write-Host "Downloading $batFileName..." -ForegroundColor Yellow
Invoke-WebRequest -Uri $repoUrl -OutFile $batDestination
Write-Host "✓ Downloaded to $batDestination" -ForegroundColor Green

# Check if task already exists and remove it
Write-Host "Setting up scheduled task..." -ForegroundColor Yellow
$existingTask = Get-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue

if ($existingTask) {
    Write-Host "Removing existing task..." -ForegroundColor Yellow
    Unregister-ScheduledTask -TaskName $taskName -Confirm:$false
}

# Create the scheduled task components
$action = New-ScheduledTaskAction -Execute $batDestination
$trigger = New-ScheduledTaskTrigger -AtLogOn -User $env:USERNAME
$principal = New-ScheduledTaskPrincipal -UserId $env:USERNAME -LogonType Interactive -RunLevel Limited
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -ExecutionTimeLimit (New-TimeSpan -Minutes 5)

# Register the task in the custom folder
Register-ScheduledTask -TaskName $taskName -TaskPath $taskPath -Action $action -Trigger $trigger -Principal $principal -Settings $settings -Force | Out-Null

Write-Host "✓ Scheduled task created: $taskPath$taskName" -ForegroundColor Green
Write-Host "`n✅ Setup complete!" -ForegroundColor Cyan
Write-Host "Your browser tabs will open automatically on next login." -ForegroundColor White
Write-Host "`nTo test now, run: schtasks /run /tn `"$taskPath$taskName`"" -ForegroundColor Gray
