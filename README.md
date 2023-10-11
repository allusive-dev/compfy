# picom
A Fork of Pijulius picom published by Allusive.

Want to support my work? DM me and [let's chat](https://github.com/allusive-dev/allusive-dev#contact-me).

## Documentation can now be found live on my website!

https://docs.allusive.dev

Can't find what you need in the docs or have an problem? Open an Issue.

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

picom-allusive has merged!
You can check when it reaches `nixos-unstable` [here](https://nixpk.gs/pr-tracker.html?pr=258711).
The package will not be avaliable on NixOS 23.05 You will have to wait until the next stable update if you are on the stable branch.

If you still want to use picom and you are on 23.05 you can use this custom package in either `environment.systemPackages` or `home.packages` for home-manager users. Keep in mind this is considerably unstable so expect possible issues. 

```
      (picom.overrideAttrs (oldAttrs: rec {
        pname = "picom-allusive";
        version = "0.3.1";
        src = pkgs.fetchFromGitHub {
          owner = "allusive-dev";
          repo = "picom-allusive";
          rev = version;
          hash = "sha256-lk4Ll0mi9h3BAqwgOzFQw4WYKnSW9XTl3PjoK2E4WKg=";
        };
        postInstall =
          ''
            chmod +x $out/bin/picom-trans
          ''
          + oldAttrs.postInstall;
      }))
```

Thank you for your patience.
