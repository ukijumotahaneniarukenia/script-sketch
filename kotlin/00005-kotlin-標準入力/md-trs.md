- 事象

実行バイナリ時、ダイナミックリンクライブラリがないと怒られる

```
doc-ubuntu-19-10-vim (kuraine)  23:46:25  00005-kotlin-標準入力  (master)  ~/.sdkman/candidates/gradle/current/bin/gradle runReleaseExecutableLinux
Starting a Gradle Daemon (subsequent builds will be faster)
<---
> Configure project :nnn
Kotlin Multiplatform Projects are an experimental feature.
<===
> Task :nnn:linkReleaseExecutableLinux
/home/kuraine/.konan/dependencies/clang-llvm-6.0.1-linux-x86-64/bin/llvm-lto: error while loading shared libraries: libtinfo.so.5: cannot open shared object file: No such file or directory
e: Compilation failed: The /home/kuraine/.konan/dependencies/clang-llvm-6.0.1-linux-x86-64/bin/llvm-lto command returned non-zero exit code: 127.

 * Source files: SampleLinux.kt
 * Compiler version info: Konan: 1.3.1 / Kotlin: 1.3.40
 * Output kind: PROGRAM

e: org.jetbrains.kotlin.konan.KonanExternalToolFailure: The /home/kuraine/.konan/dependencies/clang-llvm-6.0.1-linux-x86-64/bin/llvm-lto command returned non-zero exit code: 127.
        at org.jetbrains.kotlin.konan.exec.Command.handleExitCode(ExecuteCommand.kt:105)
        at org.jetbrains.kotlin.konan.exec.Command.execute(ExecuteCommand.kt:66)
        at org.jetbrains.kotlin.backend.konan.LinkStage.runTool(LinkStage.kt:66)
        at org.jetbrains.kotlin.backend.konan.LinkStage.runTool(LinkStage.kt:62)
        at org.jetbrains.kotlin.backend.konan.LinkStage.llvmLto(LinkStage.kt:84)
        at org.jetbrains.kotlin.backend.konan.LinkStage.makeObjectFiles(LinkStage.kt:237)
        at org.jetbrains.kotlin.backend.konan.ToplevelPhasesKt$objectFilesPhase$1.invoke(ToplevelPhases.kt:195)
        at org.jetbrains.kotlin.backend.konan.ToplevelPhasesKt$objectFilesPhase$1.invoke(ToplevelPhases.kt)
        at org.jetbrains.kotlin.backend.common.phaser.PhaseBuildersKt$namedOpUnitPhase$1.invoke(PhaseBuilders.kt:116)
        at org.jetbrains.kotlin.backend.common.phaser.PhaseBuildersKt$namedOpUnitPhase$1.invoke(PhaseBuilders.kt:114)
        at org.jetbrains.kotlin.backend.common.phaser.AbstractNamedPhaseWrapper$runBody$1.invoke(CompilerPhase.kt:113)
        at org.jetbrains.kotlin.backend.common.phaser.CompilerPhaseKt.downlevel(CompilerPhase.kt:23)
        at org.jetbrains.kotlin.backend.common.phaser.AbstractNamedPhaseWrapper.runBody(CompilerPhase.kt:112)
        at org.jetbrains.kotlin.backend.common.phaser.AbstractNamedPhaseWrapper.invoke(CompilerPhase.kt:92)
        at org.jetbrains.kotlin.backend.common.phaser.CompositePhase.invoke(PhaseBuilders.kt:28)
        at org.jetbrains.kotlin.backend.common.phaser.AbstractNamedPhaseWrapper$runBody$1.invoke(CompilerPhase.kt:113)
        at org.jetbrains.kotlin.backend.common.phaser.CompilerPhaseKt.downlevel(CompilerPhase.kt:23)
        at org.jetbrains.kotlin.backend.common.phaser.AbstractNamedPhaseWrapper.runBody(CompilerPhase.kt:112)
        at org.jetbrains.kotlin.backend.common.phaser.AbstractNamedPhaseWrapper.invoke(CompilerPhase.kt:92)
        at org.jetbrains.kotlin.backend.common.phaser.CompositePhase.invoke(PhaseBuilders.kt:28)
        at org.jetbrains.kotlin.backend.common.phaser.AbstractNamedPhaseWrapper$runBody$1.invoke(CompilerPhase.kt:113)
        at org.jetbrains.kotlin.backend.common.phaser.CompilerPhaseKt.downlevel(CompilerPhase.kt:23)
        at org.jetbrains.kotlin.backend.common.phaser.AbstractNamedPhaseWrapper.runBody(CompilerPhase.kt:112)
        at org.jetbrains.kotlin.backend.common.phaser.AbstractNamedPhaseWrapper.invoke(CompilerPhase.kt:92)
        at org.jetbrains.kotlin.backend.common.phaser.CompilerPhaseKt.invokeToplevel(CompilerPhase.kt:41)
        at org.jetbrains.kotlin.backend.konan.KonanDriverKt.runTopLevelPhases(KonanDriver.kt:27)
        at org.jetbrains.kotlin.cli.bc.K2Native.doExecute(K2Native.kt:79)
        at org.jetbrains.kotlin.cli.bc.K2Native.doExecute(K2Native.kt:34)
        at org.jetbrains.kotlin.cli.common.CLICompiler.execImpl(CLICompiler.kt:84)
        at org.jetbrains.kotlin.cli.common.CLICompiler.execImpl(CLICompiler.kt:42)
        at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:104)
        at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:82)
        at org.jetbrains.kotlin.cli.common.CLITool.exec(CLITool.kt:50)
        at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMainNoExit(CLITool.kt:215)
        at org.jetbrains.kotlin.cli.common.CLITool$Companion.doMain(CLITool.kt:207)
        at org.jetbrains.kotlin.cli.bc.K2Native$Companion$main$1.invoke(K2Native.kt:215)
        at org.jetbrains.kotlin.cli.bc.K2Native$Companion$main$1.invoke(K2Native.kt:212)
        at org.jetbrains.kotlin.konan.util.UtilKt.profileIf(Util.kt:40)
        at org.jetbrains.kotlin.konan.util.UtilKt.profile(Util.kt:34)
        at org.jetbrains.kotlin.cli.bc.K2Native$Companion.main(K2Native.kt:214)
        at org.jetbrains.kotlin.cli.bc.K2NativeKt.main(K2Native.kt:296)
        at org.jetbrains.kotlin.cli.utilities.MainKt.main(main.kt:16)


> Task :nnn:linkReleaseExecutableLinux FAILED

FAILURE: Build failed with an exception.

* What went wrong:
Execution failed for task ':nnn:linkReleaseExecutableLinux'.
> Process 'command '/usr/local/src/jdk-11/bin/java'' finished with non-zero exit value 2

* Try:
Run with --stacktrace option to get the stack trace. Run with --info or --debug option to get more log output. Run with --scan to get full insights.

* Get more help at https://help.gradle.org

BUILD FAILED in 34s
1 actionable task: 1 executed
```


- 原因

リンカが見に行く場所にパスを通していないから

```
error while loading shared libraries: libtinfo.so.5: cannot open shared object file: No such file or directory

```


- 対策

転がっているのをパスに通す

```


$ find / -name "*libtinfo.so.5*" 2>/dev/null
/usr/local/src/android-studio/bin/lldb/lib/libtinfo.so.5



$ export LD_LIBRARY_PATH=/usr/local/src/android-studio/bin/lldb/lib:$LD_LIBRARY_PATH
```


```

$ ~/.sdkman/candidates/gradle/current/bin/gradle runReleaseExecutableLinux

> Configure project :nnn
Kotlin Multiplatform Projects are an experimental feature.

> Task :nnn:runReleaseExecutableLinux
Hello, Kotlin/Native!

BUILD SUCCESSFUL in 7s
2 actionable tasks: 2 executed


```


実行できた

```

$ find | grep kexe$
./nnn/build/bin/linux/releaseExecutable/nnn.kexe

$ ./nnn/build/bin/linux/releaseExecutable/nnn.kexe
Hello, Kotlin/Native!

```
