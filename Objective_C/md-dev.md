- https://askubuntu.com/questions/328343/how-to-compile-build-and-run-objective-c-program-in-ubuntu-using-terminal
- http://wwwmain.gnustep.org/resources/downloads.php?site=ftp%3A%2F%2Fftp.gnustep.org%2Fpub%2Fgnustep%2F#core/
```


$ sudo apt-get install -y gobjc
$ sudo apt-get install -y gnustep-devel


$ gcc a.m `gnustep-config --objc-flags` `gnustep-config --base-libs` -o a

$ ll
total 68K
drwxr-xr-x   2 aine aine 4.0K  8月 11 09:03 .
drwxr-xr-x 196 aine aine 4.0K  8月 11 08:49 ..
-rwxr-xr-x   1 aine aine  38K  8月 11 09:03 a
-rw-r--r--   1 aine aine  15K  8月 11 09:03 a.d
-rw-r--r--   1 aine aine  202  8月 11 08:56 a.m

$ ./a
2020-08-11 00:03:29.113 a[298612:298612] hello world

$ echo $(gnustep-config --objc-flags)
-MMD -MP -DGNUSTEP -DGNUSTEP_BASE_LIBRARY=1 -DGNU_GUI_LIBRARY=1 -DGNU_RUNTIME=1 -DGNUSTEP_BASE_LIBRARY=1 -fno-strict-aliasing -fexceptions -fobjc-exceptions -D_NATIVE_OBJC_EXCEPTIONS -pthread -fPIC -Wall -DGSWARN -DGSDIAGNOSE -Wno-import -g -O2 -fgnu-runtime -fconstant-string-class=NSConstantString -I. -I/home/aine/GNUstep/Library/Headers -I/usr/local/include/GNUstep -I/usr/include/GNUstep



$ echo $(gnustep-config --base-libs)
-rdynamic -shared-libgcc -pthread -fexceptions -fgnu-runtime -L/home/aine/GNUstep/Library/Libraries -L/usr/local/lib -L/usr/lib -lgnustep-base -lobjc -lm

$ file a
a: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 3.2.0, BuildID[sha1]=bce29474ef6c89e0e0517c8743fa6c11d7abab57, with debug_info, not stripped

$ file a.d
a.d: ASCII text

$ file a.m
a.m: Objective-C source, ASCII text

$ cat a.m
#import <Foundation/Foundation.h>

int main (int argc, const char * argv[]) {
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   NSLog (@"hello world");
   [pool drain];
   return 0;
}
```
