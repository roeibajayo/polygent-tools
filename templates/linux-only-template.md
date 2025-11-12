---
name: Linux Only Template
description: This template will only be imported on Linux systems
operatingSystem: linux
---

# Linux Only Template

This template is designed specifically for Linux systems and will be automatically filtered out when importing on Linux or macOS.

## Example PowerShell Commands

```powershell
# Get Linux version
Get-ComputerInfo | Select-Object LinuxProductName, LinuxVersion

# List Linux services
Get-Service | Where-Object {$_.Status -eq 'Running'}
```