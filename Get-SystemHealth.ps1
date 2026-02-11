# ==============================================================================
# Script Name: Get-SystemHealth.ps1
# Description: A colorful report for CPU, Memory, and Disk status (VM Friendly)
# ==============================================================================

# 1. Get the data objects
$os = Get-CimInstance Win32_OperatingSystem
$cpu = Get-CimInstance Win32_Processor
$disk = Get-CimInstance Win32_LogicalDisk | Where-Object DeviceID -eq 'C:'

# 2. Logic for CPU Color (Turns Red if load is high)
$cpuColor = "Green"
if ($cpu.LoadPercentage -gt 80) { $cpuColor = "Red" }

# 3. Print the Header
Write-Host "`n==============================" -ForegroundColor Cyan
Write-Host "        SYSTEM REPORT         " -ForegroundColor Cyan -BackgroundColor DarkBlue
Write-Host "==============================" -ForegroundColor Cyan

# 4. Print Basic Info (Aligned Colons)
Write-Host "Generated on   : " -NoNewline; Write-Host "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')" -ForegroundColor White
Write-Host "Computer Name  : " -NoNewline; Write-Host $env:COMPUTERNAME -ForegroundColor Green
Write-Host "User Name      : " -NoNewline; Write-Host $env:USERNAME -ForegroundColor Green
Write-Host "OS Info        : " -NoNewline; Write-Host $os.Caption -ForegroundColor Green
Write-Host "------------------------------" -ForegroundColor Gray

# 5. Print Performance Data
Write-Host "CPU Load       : " -NoNewline; Write-Host "$($cpu.LoadPercentage)%" -ForegroundColor $cpuColor
Write-Host "Total Memory   : " -NoNewline; Write-Host ("{0:N2} GB" -f ($os.TotalVisibleMemorySize / 1mb)) -ForegroundColor Cyan
Write-Host "Free Memory    : " -NoNewline; Write-Host ("{0:N2} GB" -f ($os.FreePhysicalMemory / 1mb)) -ForegroundColor Cyan
Write-Host "Disk C Total   : " -NoNewline; Write-Host ("{0:N2} GB" -f ($disk.Size / 1gb)) -ForegroundColor Magenta
Write-Host "Disk C Free    : " -NoNewline; Write-Host ("{0:N2} GB" -f ($disk.FreeSpace / 1gb)) -ForegroundColor Magenta

Write-Host "==============================`n" -ForegroundColor Cyan