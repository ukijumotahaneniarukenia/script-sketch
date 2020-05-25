```
cd /usr/local/src

curl -LO https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh

chmod 700 Anaconda3-2019.10-Linux-x86_64.sh

bash Anaconda3-2019.10-Linux-x86_64.sh
```

```
Please, press ENTER to continue
>>>


Do you accept the license terms? [yes|no]
[no] >>> yes

Anaconda3 will now be installed into this location:
/root/anaconda3

  - Press ENTER to confirm the location
  - Press CTRL-C to abort the installation
  - Or specify a different location below

[/root/anaconda3] >>>

Do you wish the installer to initialize Anaconda3
by running conda init? [yes|no]
[no] >>>

You have chosen to not have conda modify your shell scripts at all.
To activate conda's base environment in your current shell session:

eval "$(/root/anaconda3/bin/conda shell.YOUR_SHELL_NAME hook)"

To install conda's shell functions for easier access, first activate, then:

conda init

If you'd prefer that conda's base environment not be activated on startup,
   set the auto_activate_base parameter to false:

conda config --set auto_activate_base false

Thank you for installing Anaconda3!

===========================================================================

Anaconda and JetBrains are working together to bring you Anaconda-powered
environments tightly integrated in the PyCharm IDE.

PyCharm for Anaconda is available at:
https://www.anaconda.com/pycharm
```


```
root@centos-7-6-18-10-anaconda-vim ~$conda --version
conda 4.7.12
```
