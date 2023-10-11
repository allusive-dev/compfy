# picom-allusive
A Fork of Pijulius picom by Allusive.

Want to support my work or just ask a personal question? DM me and [let's chat](https://github.com/allusive-dev/allusive-dev#contact-me).

## What Is This?
This is a fork of picom-pijulius which is avaliable on Nixpkgs and the Arch User Repository.

This is currently the best actively maintained fork of picom adding proper animations.

## Documentation can now be found live on my website!

https://docs.allusive.dev

Can't find what you need in the docs or have an problem? Open an Issue.

## Installation

### Building Manually
```
$ meson setup --buildtype=release . build
$ ninja -C build
$ ninja -C build install
```

### Arch Linux or other Arch based distros
```
$ paru -S picom-allusive
```
or
```
$ yay -S picom-allusive
```

### NixOS

picom-allusive is now avaliable on unstable(23.11)!

Simply do one of the following
``` nix
environment.systemPackages = [ pkgs.picom-allusive ];
```
or for home-manager
``` nix
home.packages = [ pkgs.picom-allusive ];
```

The package will not be avaliable on NixOS 23.05 You will have to wait until the next stable update if you are on the stable branch.

If you still want to use picom and you are on 23.05 you can use this custom package in either `environment.systemPackages` or `home.packages` for home-manager users. Keep in mind this is considerably unstable so expect possible issues. 

``` nix
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
