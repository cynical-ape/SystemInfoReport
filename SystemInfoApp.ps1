# 1. Get the data
$os = Get-CimInstance Win32_OperatingSystem
$cpu = Get-CimInstance Win32_Processor
$disk = Get-CimInstance Win32_LogicalDisk | Where-Object DeviceID -eq 'C:'

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
