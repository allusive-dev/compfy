# Compfy

1. [Introduction](#introduction)
2. [Getting Started](#getting-started)
   - [Installation](#installation)
   - [Configuration](#configuration)
3. [Usage](#usage)
4. [Contacts](#contacts)
5. [Contributing](#contributing)
6. [License](#license)

![Compfy Banner](media/compfy-banner.png)

## Introduction

Compfy is a Compositor for the [X11](https://www.x.org/wiki/) platform on Linux. Compfy's main purpose is to pretty up your graphical desktop environment by letting users have features like transparency, background blurring, rounded corners, animations and way more!

Compfy was made as an alternative to [Picom](https://github.com/yshui/picom), another popular X11 compositor. Compfy is based on Picom but provides more features and active community support.

**Before we begin I want to say I massive thank you to my sponsors as they make this work possible!**

*If you are interesting in supporting this work aswell you too can sponsor me on GitHub. Even the smallest amount is much appreciated and shows me that this project is still wanted!*

[![](https://img.shields.io/static/v1?label=Sponsor&message=%E2%9D%A4&logo=GitHub&color=%23fe8e86)](https://github.com/sponsors/allusive-dev)

- [@SolninjaA](https://github.com/SolninjaA) ($5 One Time) (The First Ever Sponsor!)
- [@maclightning2](https://github.com/maclightning2) ($3 A Month) (First Ever Monthly Sponsor)

## Getting Started

Let's cover how to install Compfy on your system and breifly go over how to configure it.

### Installation

Compfy is avaliable on a few packaged platforms including on the AUR and very soon coming to [Nixpkgs](https://github.com/NixOS/nixpkgs)

| Linux Distribution | Method  | Compatibility |
| ------------------ | ------- | --------------|
| Arch Linux         | [AUR](https://aur.archlinux.org/packages/compfy) | :green_circle: |
| NixOS (Stable)     | [Custom Package](https://github.com/allusive-dev/compfy/releases/latest) | :green_circle: |
| NixOS (Unstable)   | Nixpkgs  | :orange_circle: |
| Other              | [Manually Building](#manually) | :green_circle: |

#### Manually

*Note if you want to enabled the `--check-for-updates` option (avaliable as of `1.7.0`) you will need to build with these commands instead.
(`--check-for-updates` will print out your current version and the latest release version number if you are connected to the internet)*

Without `--check-for-updates`:
```
$ meson setup . build
$ ninja -C build
$ ninja -C build install
```
With `--check-for-updates`:
```
$ meson setup -Dupdate_checks=true . build
$ ninja -C build
$ ninja -C build install
```

Dependencies:

```
libconfig
libdbus
libev
libglvnd
libx11
libxcb
libxdg-basedir
pcre2
pixman
uthash
xcb-util-image
xcb-util-renderutil
gcc (make)
git (make)
meson (make)
ninja (make)

# If you enabled -Dupdate-checks you will also need these dependencies.

'json-c' or 'json_c'
'curl' or 'libcurl'
```

### Configuration

Compfy stores its default configuration at `/etc/xdg/compfy.conf.example`(may vary depending on OS). 
The default configuration provides almost all the options you will ever need, some commented out.

It is reccomended you store your personal configuration at `~/.config/compfy.conf` or `~/.config/compfy/compfy.conf`
*You can do this by copying over the sample configuration or simply writing your own.*

For a VERY detailed guide on configurating Compfy please see the Documentation.
It is avaliable in the Wiki tab above and on [Donument](https://donument.com/d/Allusive/compfy/-/documents/) an up and coming git versioned database allows for more than just code to be versioned.

Or if you still use `man` the Documentation is also avaliable under `man compfy`.


## Usage

Compfy has very similar command line arguments to Picom.

You can view all the commands and what they do with `compfy --help` but here is a few to get you started.

```
$ compfy --version
# Print the current version

$ compfy --help
# Print all the avaliable command line options with explanations

$ compfy -b
or
$ compfy --daemon
# Run Compfy in the background, dissociating it from the terminal.
```

## Contacts

For general discussion on Compfy there is a Matrix chat room! Join everyone [here](https://matrix.to/#/#compfy-discussion:matrix.org)!

For personal enquiries you can get in contact with me here:

[![Matrix](https://img.shields.io/badge/MATRIX-012121.svg?style=for-the-badge&logo=Matrix&logoColor=white)](https://matrix.to/#/@allusive_:matrix.org)
[![Discord](https://img.shields.io/badge/DISCORD-5865F2.svg?style=for-the-badge&logo=Discord&logoColor=white)](https://discord.gg/4vaK3Wf3mM)
[![Email](https://img.shields.io/badge/EMAIL-160F33.svg?style=for-the-badge&logo=ProtonMail&logoColor=white)](mailto:jasper@allusive.dev)

## Contributing

Want to help contribute to Compfy? Here is a few ways you can contribute to the project:

- Open an Issue about a Bug or Feature.
- Open a Pull Request to fix a Bug or implement a Feature.
- Sponsor the project on GitHub!

If you are interested in supporting the project further and you have intermediate or higher knowledge with C and/or X11 please contact me and I'll see how you might be able to help out!

## License

Compfy is licensed under [MIT](LICENSES/MIT) and [MPL-2.0](LICENSES/MPL-2.0)
