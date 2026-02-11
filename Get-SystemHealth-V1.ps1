# 1. Get the data
$os = Get-CimInstance Win32_OperatingSystem
$cpu = Get-CimInstance Win32_Processor
$disk = Get-CimInstance Win32_LogicalDisk | Where-Object DeviceID -eq 'C:'

# 2. Print the Header
Write-Host "==============================" -ForegroundColor Cyan
Write-Host "        SYSTEM REPORT         " -ForegroundColor Cyan 
Write-Host "==============================" -ForegroundColor Cyan

# 3. Print Basic Info (Yellow Labels)
Write-Host "Generated on   : " -NoNewline; Write-Host "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')" -ForegroundColor White
Write-Host "Computer Name  : " -NoNewline; Write-Host $env:COMPUTERNAME -ForegroundColor Green
Write-Host "User Name      : " -NoNewline; Write-Host $env:USERNAME -ForegroundColor Green
Write-Host "OS Info        : " -NoNewline; Write-Host $os.Caption -ForegroundColor Green
Write-Host "------------------------------" -ForegroundColor Gray

# 4. Print Performance (Red/Cyan)
Write-Host "CPU Load       : " -NoNewline; Write-Host "$($cpu.LoadPercentage)%" -ForegroundColor Red
Write-Host "Total Memory   : " -NoNewline; Write-Host ("{0:N2} GB" -f ($os.TotalVisibleMemorySize / 1mb)) -ForegroundColor Cyan
Write-Host "Free Memory    : " -NoNewline; Write-Host ("{0:N2} GB" -f ($os.FreePhysicalMemory / 1mb)) -ForegroundColor Cyan
Write-Host "Disk Total     : " -NoNewline; Write-Host ("{0:N2} GB" -f ($disk.Size / 1gb)) -ForegroundColor Magenta
Write-Host "Disk Free      : " -NoNewline; Write-Host ("{0:N2} GB" -f ($disk.FreeSpace / 1gb)) -ForegroundColor Magenta

Write-Host "==============================" -ForegroundColor Cyan