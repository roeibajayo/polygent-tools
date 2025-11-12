---
name: Windows Only Template
description: This template will only be imported on Windows systems
operatingSystem: windows
---

# Windows Only Template

This template is designed specifically for Windows systems and will be automatically filtered out when importing on Linux or macOS.

## Example PowerShell Commands

```powershell
# Get Windows version
Get-ComputerInfo | Select-Object WindowsProductName, WindowsVersion

# List Windows services
Get-Service | Where-Object {$_.Status -eq 'Running'}
```

The `operatingSystem` field supports three values:
- `windows` - Only import on Windows
- `linux` - Only import on Linux/macOS
- `both` - Import on all operating systems (default if not specified)
