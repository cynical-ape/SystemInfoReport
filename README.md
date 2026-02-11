# SystemInfoReport
This project is a collection of PowerShell scripts designed to monitor system health, specifically optimized for Windows Server and Hyper-V Virtual Machines. It tracks CPU load, RAM usage, and Disk space in real-time.

The project is organized into four stages, showing the evolution from a simple data collector to a professional, color-coded dashboard:

The Foundation (SystemInfoApp.ps1): Focuses on accurate data gathering and unit conversion (Bytes to GB) with a simple text-to-file export.

The Hybrid (SystemInfoReportWithtxt.ps1): Introduces a console UI with colors while maintaining a plain-text log for documentation.

The Visualizer (Get-SystemHealth-V1.ps1): A streamlined version focused on clear, high-contrast console output for live monitoring.

The Professional Dashboard (Get-SystemHealth.ps1): The final version featuring advanced formatting, smart color logic (warnings for high CPU usage), and a polished design.

1. SystemInfoApp.ps1
Purpose: Focuses on data export.

Description: This script collects basic system data and exports it to a .txt file on the desktop. It includes the logic to convert raw Bytes and Kilobytes into readable Gigabytes (GB).

Best for: Users who need a simple text log without any colors.

2. SystemInfoReportWithtxt.ps1
Purpose: Dual-output (Screen + File).

Description: This version displays a colorful report in the PowerShell console while simultaneously saving a plain-text version to the desktop.

Best for: Checking stats live while keeping a permanent record.

3. Get-SystemHealth-V1.ps1
Purpose: Visual Console Dashboard.

Description: A streamlined version that removes the file export to focus entirely on the console UI. It uses colored labels (Cyan, Green, Red, Magenta) to make the data stand out.

Best for: Quick system checks during live sessions.

4. Get-SystemHealth.ps1 (The Pro Version)
Purpose: Intelligent Monitoring.

Description: The most advanced version of the script. It features a professional header with background colors and smart logic that turns the CPU Load Red if it exceeds 80%. It is optimized for Hyper-V Virtual Machines.

Best for: Professional environments and system administrators.
