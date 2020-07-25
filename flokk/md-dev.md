dockerホストで実施する

```
$ sudo apt install -y snapd
```

brave-browserでもあったが、policykit-1周りが絡んでくると、dockerコンテナではコケるイメージ

```
The following packages have unmet dependencies:
 aptdaemon : Depends: policykit-1 but it is not going to be installed
 packagekit : Depends: policykit-1 but it is not going to be installed
E: Unmet dependencies. Try 'apt --fix-broken install' with no packages (or specify a solution).
```


```
$ snap list
Name               Version                     Rev   Tracking         Publisher   Notes
core18             20200707                    1880  latest/stable    canonical✓  base
gnome-3-28-1804    3.28.0-17-gde3d74c.de3d74c  128   latest/stable    canonical✓  -
gnome-3-34-1804    0+git.3009fc7               36    latest/stable/…  canonical✓  -
gtk-common-themes  0.1-36-gc75f853             1506  latest/stable/…  canonical✓  -
snap-store         3.36.0-80-g208fd61          467   latest/stable/…  canonical✓  -
snapd              2.45.2                      8542  latest/stable    canonical✓  snapd
```


```
$ snap find flokk
Name            Version  Publisher      Notes  Summary
flokk-contacts  1.0.1    gskinner-apps  -      Flokk Contacts
```


```
$ sudo snap install flokk-contacts
flokk-contacts 1.0.1 from gskinner (gskinner-apps) installed
```


```
$ sudo snap remove flokk-contacts
flokk-contacts removed
```
日本語化けているので、様子見
