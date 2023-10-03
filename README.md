# picom
A Fork of Pijulius picom published by Allusive.

Want to support my work? DM me and [let's chat](https://github.com/allusive-dev/allusive-dev#contact-me).

## [Wiki](https://github.com/allusive-dev/picom-allusive/wiki)

Can't find what you need in the wiki or have an problem? Open an Issue.

## What Is This?
This is a fork of picom-pijulius which is avaliable on the AUR. This repository/package aims to improve upon and maintain this version of picom.

Currently this revised package has had its code cleaned up and manpages updated to be functional.

## Guides

[Wiki](https://github.com/allusive-dev/picom-allusive/wiki)

```
$ man picom

// Above command only works if the package is installed.
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

#### Note For NixOS Users

picom-allusive has been approved on nixpkgs and is wating to be merged. 
I do not know how long it will take before it is avaliable but in the meantime you may have to wait considering that building picom manually on NixOS is difficult.

Thank you for your patience.
