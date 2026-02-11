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





# 5. $Report

$Report =  "==============================`n" 
$Report += "        SYSTEM REPORT         `n" 
$Report += "==============================`n" 


$Report+= "Generated on   :   $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')`n" 
$Report+= "Computer Name  :   $env:COMPUTERNAME `n"
$Report+= "User Name      :   $env:USERNAME `n"
$Report+= "OS Info        :   $($os.Caption) `n"
$Report+= "------------------------------`n" 


$Report+= "CPU Load       :  $($cpu.LoadPercentage)%`n" 
$Report+= "Total Memory   :  {0:N2} GB`n" -f ($os.TotalVisibleMemorySize / 1mb)
$Report+= "Free Memory    :  {0:N2} GB`n" -f ($os.FreePhysicalMemory / 1mb)
$Report+= "Disk Total     :  {0:N2} GB`n" -f ($disk.Size / 1gb)
$Report+= "Disk Free      :  {0:N2} GB`n" -f ($disk.FreeSpace / 1gb)

$Report+= "==============================`n" 

$Report | Out-File C:\Users\$env:USERNAME\desktop\SystemInfoReport.txt