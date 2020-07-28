# トラシュー

- 事象

  - vsのインストーラが落ちる
```
$wine $HOME/vs_community__792809226.1575173302.exe 1>$HOME/launch-vs-installer.log 2>&1 &

$cat launch-vs-installer.log
002e:fixme:heap:RtlSetHeapInformation (nil) 1 (nil) 0 stub
002e:fixme:advapi:DecryptFileW (L"C:\\users\\kuraine\\Temp\\453ae04ebefeb368d16eab106e85\\", 00000000): stub
002e:fixme:exec:SHELL_execute flags ignored: 0x00000100
0034:fixme:mscoree:parse_supported_runtime sku=L".NETFramework,Version=v4.5" not implemented
0034:fixme:mscoree:parse_supported_runtime sku=L".NETFramework,Version=v4.5" not implemented
0034:fixme:nls:GetFileMUIPath stub: 0x10, L"C:\\windows\\system32\\tzres.dll", (null), 0x22dc30, 0x52bba0, 0x22dc38, 0x22dc28
0034:fixme:nls:GetFileMUIPath stub: 0x10, L"C:\\windows\\system32\\tzres.dll", (null), 0x22dc30, 0x52bdc0, 0x22dc38, 0x22dc28
0038:fixme:mscoree:CLRCreateInstance not implemented for class {90f1a06e-7712-4762-86b5-7a5eba6bdb02}
0039:fixme:ntdll:NtQuerySystemInformation info_class SYSTEM_PERFORMANCE_INFORMATION
0039:fixme:shcore:IsOS (OS_DOMAINMEMBER) What should we return here?
003c:fixme:heap:EnumSystemFirmwareTables (0x52534d42, 0000000000000000, 0)
0034:fixme:mscoree:CLRCreateInstance not implemented for class {90f1a06e-7712-4762-86b5-7a5eba6bdb02}
003a:fixme:mscoree:CLRCreateInstance not implemented for class {90f1a06e-7712-4762-86b5-7a5eba6bdb02}
0041:fixme:ntdll:EtwEventRegister ({74af9f20-af6a-5582-9382-f21f674fb271}, 0xfc902e0, (nil), 0x2ba4b10) stub.
0041:fixme:ntdll:EtwEventSetInformation (deadbeef, 2, 0x2ba4ac8, 37) stub
0034:fixme:ntdll:EtwEventUnregister (deadbeef) stub.
```

- 原因

  - 

- 対応

  - 

- 予防

  - 
