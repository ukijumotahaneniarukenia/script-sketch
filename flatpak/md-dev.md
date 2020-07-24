- https://flatpak.org/setup/Ubuntu/

- https://flathub.org/apps/details/com.uploadedlobster.peek

レコーデングアプリをインストールしてみる

```
$ flatpak install --help

Note that the directories 

'/var/lib/flatpak/exports/share'
'/home/aine/.local/share/flatpak/exports/share'

are not in the search path set by the XDG_DATA_DIRS environment variable, so
applications installed by Flatpak may not appear on your desktop until the
session is restarted.

Usage:
  flatpak install [OPTION…] [LOCATION/REMOTE] [REF…] - Install applications or runtimes

Help Options:
  -h, --help               Show help options

Application Options:
  --user                   Work on the user installation
  --system                 Work on the system-wide installation (default)
  --installation=NAME      Work on a non-default system-wide installation
  --arch=ARCH              Arch to install for
  --no-pull                Don't pull, only install from local cache
  --no-deploy              Don't deploy, only download to local cache
  --no-related             Don't install related refs
  --no-deps                Don't verify/install runtime dependencies
  --no-static-deltas       Don't use static deltas
  --runtime                Look for runtime with the specified name
  --app                    Look for app with the specified name
  --bundle                 Assume LOCATION is a .flatpak single-file bundle
  --from                   Assume LOCATION is a .flatpakref application description
  --gpg-file=FILE          Check bundle signatures with GPG key from FILE (- for stdin)
  --subpath=PATH           Only install this subpath
  -y, --assumeyes          Automatically answer yes for all questions
  --reinstall              Uninstall first if already installed
  --noninteractive         Produce minimal output and don't ask questions
  --or-update              Update install if already installed
  --sideload-repo=PATH     Use this local repo for sideloads
  -v, --verbose            Show debug information, -vv for more detail
  --ostree-verbose         Show OSTree debug information
```


```
$ ls -lh /home/aine/Downloads/software/com.uploadedlobster.peek.flatpakref 
-rw-rw-r-- 1 aine aine 4.0K  7月 25 05:04 /home/aine/Downloads/software/com.uploadedlobster.peek.flatpakref

$ sudo flatpak install -y /home/aine/Downloads/software/com.uploadedlobster.peek.flatpakref
Required runtime for com.uploadedlobster.peek/x86_64/stable (runtime/org.gnome.Platform/x86_64/3.36) found in remote flathub

com.uploadedlobster.peek permissions:
    ipc    wayland    x11    file access [1]    dbus access [2]

    [1] home
    [2] org.freedesktop.FileManager1, org.gnome.Shell.Screencast


        ID                                              Branch            Op           Remote            Download
 1. [✓] com.uploadedlobster.peek.Locale                 stable            i            flathub             9.4 kB / 119.3 kB
 2. [✓] org.freedesktop.Platform.GL.default             19.08             i            flathub            88.6 MB / 89.1 MB
 3. [✓] org.freedesktop.Platform.VAAPI.Intel            19.08             i            flathub             8.6 MB / 8.7 MB
 4. [✓] org.freedesktop.Platform.openh264               2.0               i            flathub           266.5 kB / 1.5 MB
 5. [✓] org.gnome.Platform.Locale                       3.36              i            flathub             1.7 MB / 323.0 MB
 6. [✓] org.gnome.Platform                              3.36              i            flathub           273.6 MB / 324.5 MB
 7. [✓] com.uploadedlobster.peek                        stable            i            flathub             2.4 MB / 2.7 MB

Installation complete.
```



```
$ find / -name "*peek*" 2>/dev/null | grep flatpak | xargs file | grep exe



$ find / -name "*peek*" 2>/dev/null | grep flatpak | xargs file | grep exe
/var/lib/flatpak/app/com.uploadedlobster.peek/x86_64/stable/4f105ad88b3d23dbada6191657b641684d0f82f429a8ae0f2ad32f3ab6e675dc/export/bin/com.uploadedlobster.peek:                                            POSIX shell script, ASCII text executable

$ ls -lh /var/lib/flatpak/app/com.uploadedlobster.peek/x86_64/stable/4f105ad88b3d23dbada6191657b641684d0f82f429a8ae0f2ad32f3ab6e675dc/export/bin/com.uploadedlobster.peek
-rwxr-xr-x 1 root root 96  7月 25 05:09 /var/lib/flatpak/app/com.uploadedlobster.peek/x86_64/stable/4f105ad88b3d23dbada6191657b641684d0f82f429a8ae0f2ad32f3ab6e675dc/export/bin/com.uploadedlobster.peek*

$ /var/lib/flatpak/app/com.uploadedlobster.peek/x86_64/stable/4f105ad88b3d23dbada6191657b641684d0f82f429a8ae0f2ad32f3ab6e675dc/export/bin/com.uploadedlobster.peek

Note that the directories 

'/var/lib/flatpak/exports/share'
'/home/aine/.local/share/flatpak/exports/share'

are not in the search path set by the XDG_DATA_DIRS environment variable, so
applications installed by Flatpak may not appear on your desktop until the
session is restarted.

Using screen recorder backend gnome-shell
```



ユーザーホームディレクトリ配下のVideoに保存できた。

```
$ /var/lib/flatpak/app/com.uploadedlobster.peek/x86_64/stable/4f105ad88b3d23dbada6191657b641684d0f82f429a8ae0f2ad32f3ab6e675dc/export/bin/com.uploadedlobster.peek

Note that the directories 

'/var/lib/flatpak/exports/share'
'/home/aine/.local/share/flatpak/exports/share'

are not in the search path set by the XDG_DATA_DIRS environment variable, so
applications installed by Flatpak may not appear on your desktop until the
session is restarted.

Using screen recorder backend gnome-shell

(peek:2): GLib-GIO-CRITICAL **: 05:14:52.568: g_dbus_proxy_new: assertion 'G_IS_DBUS_CONNECTION (connection)' failed

(peek:2): GLib-GIO-CRITICAL **: 05:14:52.568: g_dbus_proxy_new: assertion 'G_IS_DBUS_CONNECTION (connection)' failed

(peek:2): GLib-GIO-CRITICAL **: 05:14:52.568: g_dbus_proxy_new: assertion 'G_IS_DBUS_CONNECTION (connection)' failed
Recording to file /home/aine/.var/app/com.uploadedlobster.peek/cache/peek/peekJ7J3N0.webm

$ ls ~/Videos/Peek\ 2020-07-25\ 05-15.gif 
'/home/aine/Videos/Peek 2020-07-25 05-15.gif'


これで見れる
$ eog ~/Videos/Peek\ 2020-07-25\ 05-15.gif 

```
