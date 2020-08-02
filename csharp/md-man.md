csharp

vscode使う

https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csharp

csharpコード補完

- https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csharp

```
code --install-extension ms-dotnettools.csharp

```

csharpフォーマッタ

- https://marketplace.visualstudio.com/items?itemName=Leopotam.csharpfixformat

```
code --install-extension Leopotam.csharpfixformat
```

installログ

```
Installing C# dependencies...
Platform: linux, x86_64, name=ubuntu, version=18.04

Downloading package 'OmniSharp for Linux (x64)' (45172 KB).................... Done!
Validating download...
Integrity Check succeeded.
Installing package 'OmniSharp for Linux (x64)'

Downloading package '.NET Core Debugger (linux / x64)' (54671 KB).................... Done!
Validating download...
Integrity Check succeeded.
Installing package '.NET Core Debugger (linux / x64)'

Downloading package 'Razor Language Server (Linux / x64)' (52467 KB).................... Done!
Installing package 'Razor Language Server (Linux / x64)'

Finished

Failed to spawn 'dotnet --info'
```

core sdkが必要だと怒られるので、以下のサイトで取得

https://dotnet.microsoft.com/download/dotnet-core/sdk-for-vs-code?utm_source=vs-code&amp;utm_medium=referral&amp;utm_campaign=sdk-install

https://docs.microsoft.com/ja-jp/dotnet/core/install/linux-ubuntu#2004-


インストール後、再インストール

```
code --uninstall-extension ms-dotnettools.csharp
code --install-extension ms-dotnettools.csharp
```

reinstallログ

```
Installing C# dependencies...
Platform: linux, x86_64, name=ubuntu, version=18.04

Downloading package 'OmniSharp for Linux (x64)' (45172 KB).................... Done!
Validating download...
Integrity Check succeeded.
Installing package 'OmniSharp for Linux (x64)'

Downloading package '.NET Core Debugger (linux / x64)' (54671 KB).................... Done!
Validating download...
Integrity Check succeeded.
Installing package '.NET Core Debugger (linux / x64)'

Downloading package 'Razor Language Server (Linux / x64)' (52467 KB).................... Done!
Installing package 'Razor Language Server (Linux / x64)'

Finished
```

リンタが走っているみたい

異常検知されているみたいこのプロジェクト
00008-csharp-monodevelopでのプロジェクト作成

```
Starting OmniSharp server at 2020/8/2 16:19:42
    Target: /home/aine/script-sketch/csharp/00008-csharp-monodevelopでのプロジェクト作成/app/app.sln

OmniSharp server started.
    Path: /home/aine/.vscode/extensions/ms-dotnettools.csharp-1.22.1/.omnisharp/1.35.3/run
    PID: 19284

[info]: OmniSharp.Stdio.Host
        Starting OmniSharp on ubuntu 18.4 (x64)
[info]: OmniSharp.Services.DotNetCliService
        DotNetPath set to dotnet
[info]: OmniSharp.MSBuild.Discovery.MSBuildLocator
        Located 1 MSBuild instance(s)
            1: StandAlone 16.4 - "/home/aine/.vscode/extensions/ms-dotnettools.csharp-1.22.1/.omnisharp/1.35.3/omnisharp/.msbuild/Current/Bin"
[info]: OmniSharp.MSBuild.Discovery.MSBuildLocator
        MSBUILD_EXE_PATH environment variable set to '/home/aine/.vscode/extensions/ms-dotnettools.csharp-1.22.1/.omnisharp/1.35.3/omnisharp/.msbuild/Current/Bin/MSBuild.dll'
[info]: OmniSharp.MSBuild.Discovery.MSBuildLocator
        Registered MSBuild instance: StandAlone 16.4 - "/home/aine/.vscode/extensions/ms-dotnettools.csharp-1.22.1/.omnisharp/1.35.3/omnisharp/.msbuild/Current/Bin"
            CscToolExe = csc.exe
            MSBuildToolsPath = /home/aine/.vscode/extensions/ms-dotnettools.csharp-1.22.1/.omnisharp/1.35.3/omnisharp/.msbuild/Current/Bin
            CscToolPath = /home/aine/.vscode/extensions/ms-dotnettools.csharp-1.22.1/.omnisharp/1.35.3/omnisharp/.msbuild/Current/Bin/Roslyn
            BypassFrameworkInstallChecks = true
            MSBuildExtensionsPath = /home/aine/.vscode/extensions/ms-dotnettools.csharp-1.22.1/.omnisharp/1.35.3/omnisharp/.msbuild
[info]: OmniSharp.Cake.CakeProjectSystem
        Detecting Cake files in '/home/aine/script-sketch/csharp/00008-csharp-monodevelopでのプロジェクト作成/app'.
[info]: OmniSharp.Cake.CakeProjectSystem
        Could not find any Cake files
[info]: OmniSharp.MSBuild.ProjectSystem
        Detecting projects in '/home/aine/script-sketch/csharp/00008-csharp-monodevelopでのプロジェクト作成/app/app.sln'.
[info]: OmniSharp.MSBuild.ProjectManager
        Queue project update for '/home/aine/script-sketch/csharp/00008-csharp-monodevelopでのプロジェクト作成/app/nnn/nnn.csproj'
[info]: OmniSharp.Script.ScriptProjectSystem
        Detecting CSX files in '/home/aine/script-sketch/csharp/00008-csharp-monodevelopでのプロジェクト作成/app'.
[info]: OmniSharp.Script.ScriptProjectSystem
        Could not find any CSX files
[info]: OmniSharp.WorkspaceInitializer
        Invoking Workspace Options Provider: OmniSharp.Roslyn.CSharp.Services.CSharpFormattingWorkspaceOptionsProvider, Order: 0
[info]: OmniSharp.MSBuild.ProjectManager
        Loading project: /home/aine/script-sketch/csharp/00008-csharp-monodevelopでのプロジェクト作成/app/nnn/nnn.csproj
[info]: OmniSharp.WorkspaceInitializer
        Invoking Workspace Options Provider: OmniSharp.Roslyn.CSharp.Services.RenameWorkspaceOptionsProvider, Order: 100
[info]: OmniSharp.WorkspaceInitializer
        Invoking Workspace Options Provider: OmniSharp.Roslyn.CSharp.Services.ImplementTypeWorkspaceOptionsProvider, Order: 110
[info]: OmniSharp.WorkspaceInitializer
        Invoking Workspace Options Provider: OmniSharp.Roslyn.CSharp.Services.BlockStructureWorkspaceOptionsProvider, Order: 140
[info]: OmniSharp.WorkspaceInitializer
        Configuration finished.
[info]: OmniSharp.Stdio.Host
        Omnisharp server running using Stdio at location '/home/aine/script-sketch/csharp/00008-csharp-monodevelopでのプロジェクト作成/app' on host 19081.
[fail]: OmniSharp.MSBuild.ProjectLoader
        The reference assemblies for .NETFramework,Version=v4.7 were not found. To resolve this, install the Developer Pack (SDK/Targeting Pack) for this framework version or retarget your application. You can download .NET Framework Developer Packs at https://aka.ms/msbuild/developerpacks
[warn]: OmniSharp.MSBuild.ProjectManager
        Failed to load project file '/home/aine/script-sketch/csharp/00008-csharp-monodevelopでのプロジェクト作成/app/nnn/nnn.csproj'.
/home/aine/script-sketch/csharp/00008-csharp-monodevelopでのプロジェクト作成/app/nnn/nnn.csproj
/home/aine/.vscode/extensions/ms-dotnettools.csharp-1.22.1/.omnisharp/1.35.3/omnisharp/.msbuild/Current/Bin/Microsoft.Common.CurrentVersion.targets(1193,5): Error: The reference assemblies for .NETFramework,Version=v4.7 were not found. To resolve this, install the Developer Pack (SDK/Targeting Pack) for this framework version or retarget your application. You can download .NET Framework Developer Packs at https://aka.ms/msbuild/developerpacks

[fail]: OmniSharp.MSBuild.ProjectManager
        Attempted to update project that is not loaded: /home/aine/script-sketch/csharp/00008-csharp-monodevelopでのプロジェクト作成/app/nnn/nnn.csproj
```
