# picom
A Fork of Pijulius picom published by Allusive.

## Announcements
WE NOW HAVE A WIKI!
[Check It Out Here](https://github.com/allusive-dev/picom-allusive/wiki)

### Have An Issue? Open one and I will try to help

## What Is This?
This is a fork of picom-pijulius which is avaliable on the AUR. This repository/package aims to improve upon and maintain this version of picom.

## Guides

[Wiki](https://github.com/allusive-dev/picom-allusive/wiki)

```
$ man picom
```

## Installation

### Building Manually
```
$ meson setup --buildtype=release . build
$ ninja -C build
$ ninja -C build install
```

### Arch Linux or other Arch based distros
```
paru -S picom-allusive
```
or
```
yay -S picom-allusive
```

For those on Crystal Linux

```
ame -S picom-allusive
```
