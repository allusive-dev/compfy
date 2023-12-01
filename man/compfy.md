# Compfy

## Guide for Configuring Compfy

#### Config can be placed at either `~/.config/compfy.conf` or `~/.config/compfy/compfy.conf`

## Basic Syntax

Variables are formatted like this

```
variable-name = value;
```
All values require a semi-colon on the end as shown above.

When declaring a animation-name you need to use double quotes like such

```
animation-for-unmap-window = "slide-down";
```

When using rule-sets there are two ways to provide windows to it.

With almost every rule-set it will follow this syntax and structure.

```
rule-set = [
  "class_g = 'foo'" # Select windows by classname
  "name = 'bar'" # Select windows by name
];
```

In the example you replace `foo` with the `WM_CLASS` which can be found using the `xprop` command provided by [xorg-xprop](https://archlinux.org/packages/extra/x86_64/xorg-xprop/) on Arch and `xorg.xprop` on NixOS.

Sometimes `xprop` will output multiple class names. If the first class name does not work, try the second one.


# Options

## corner-radius

_By default this is set to 12 in the sample config_

Adjusts the window corner rounding in pixels.

## rounded-corners-exclude []

_By default this rule-set is empty_

Here you can declare rules of what windows will not have their borders rounded. This can be good for some games that go full screen but still have rounded borders.

Here is an example

```
rounded-corners-exclude = [
  "class_g = 'Alacritty'",
];
```

## corners-rule []

_By default this rule-set is empty_

Within this rule-set you can explicitly declare the corner-radius of individual windows based on their name or class name attributes.

It functions in a similar way to `opacity-rule` in that the number you put before the window name is the amount of rounding you want applied to that window.

Currently you can only use number 1-100. This may be fixed in later updates.

```
corners-rule = [
  "20:class_g    = 'Polybar'",
  "15:class_g    = 'Dunst'",
];
```

## shadow

_By default this will be set to `false` in the sample config_

Enables shadows for windows. 

Shadows tend to be a bit finicky on some window managers, so make sure to play around with it and see what is best for you.

## shadow-radius

_By default this is set to 12_

Shadow radius/roundness in pixels.

## shadow-opacity

_By default this is set to 0.75 (0.0 ~ 1.0)_

Set the opacity of the window shadow.

## shadow-offset-x

_By default this is set to -15 (-100 ~ 100)_

Set the offset of the shadow along the x-axis.

## shadow-offset-y

_By default this is set to -15 (-100 ~ 100)_

Set the offset of the shadow along the y-axis.

## shadow-color

The color for shadows as a HEX code.

```
shadow-color = "#101010";
```

## shadow-exclude []

_By default this rule-set is empty_

Declare windows which will not render a shadow.

## fading

_By default this is set to `true` in the sample config_

_Fade windows in/out when opening/closing and when opacity changes_

Fading is required for unmap animations to work.

## fade-in-step

_By default this is set to `0.03` in the sample config_

_Opacity change between steps while fading in. (0.01 - 1.0)_

Increasing this value will result in faster fading in of windows.
Decreasing makes the fading in of windows take longer. (This does not means the animations take longer, just the fading).

## fade-out-step

_By default this is set to `0.03` in the sample config_

_Opacity change between steps while fading out. (0.01 - 1.0)_

Increasing this value will result in faster fading out AND animating out of windows.
Decreasing this makes fading and animating out take longer.

## fade-delta

_By default this is set to `5`_

_The time between steps in fade step, in milliseconds. ( > 0)_

Currently unsure what this does but it is recommended to keep it at the default.

## fade-exclude []

_Empty by default_

_Specify a list of windows that should not be faded._

```
fade-exclude = [
  "class_g = 'foo'"
]
```

## inactive-opacity

_By default this is set to 1.0 (0.0 - 1.0)_

Declares the opacity of unfocused windows.

## frame-opacity

_By default this is set to 1.0 (0.0 - 1.0)_

Declares the opacity of window borders and title-bars.

## inactive-opacity-override

_By default this is set to false (true/false)_

If this is not enabled then windows which have their opacity set in `opacity-rule` or `wintypes` will not be affected by `inactive-opacity`. Enable this to fix that.

## active-opacity

_By default this is set to 1.0 (0.0 - 1.0)_

Declares the opacity of focused windows.

## active-opacity-exclude []

_By default this rule-set is empty_

A list of windows that should never have their opacity changed by `active-opacity` when focused.

## inactive-exclude []

_By default this rule-set is empty_

A list of windows that should have their `inactive-opacity` set to whatever the `active-opacity` is. Unless the window is also in `active-opacity-exclude` then it will be set to `1.0` or if it is set in `opacity-rule` it will use the opacity set there as the `inactive-opacity`.

Also excludes inactive dimming.

## focus-exclude []

_By default this rule-set is empty_

Declare windows that should always be considered to be focused by the compositor.

## opacity-rule []

_By default this rule-set is empty_

Declare windows that should have their opacity hard set. As an example. Where 95 is can be anything between (0 - 100)

```
opacity-rule = [
  "95:class_g    = 'Alacritty'",
];
```

## blur-background

_By default this is set to false_

Toggle background blurring

## blur-method

_By default this is set to `none`_

Selects the blur method. Available options are: 

- none
- kernel
- gaussian
- box
- dual_kawase (most used)

## blur-radius

_By default this is set to 3_

Sets the radius of the blur.

## blur-strength

_By default this is set to 5_

Sets the strength/intensity of the blur.

## blur-whitelist

_Defaults to `true` (true / false)_

Toggle whether you want to use blurring on a whitelist basis(blur-include) or a blacklist basis(blur-exclude).

## blur-include

_By default this rule set is empty_

This acts a a whitelist for blurring the background of windows. See the example below.
Using a whitelist helps to reduce hardware consumption.

```
blur-rule = [
  "class_g = 'kitty'",
  "class_g = 'Emacs'",
  "class_g = 'Rofi'"
];
```

## blur-exclude

_By default this rule set is empty_

When used with `blur-whitelist = false;` this will exclude specific windows from having their background blurred.

```
blur-exclude = [
  "class_g = 'Firefox'"
];
```

The part of the wiki you have probably all come for.

## animations

_By default this option is set to `true`_(true/false)

_Toggles whether animations should be used for windows_


## animation-stiffness

_By default this is set to `100`_

_Changes the stiffness of animations_

What stiffness basically is inferring is how much the window geometry will be stretched when opening/closing windows. It's best illustrated in the video below.

With a higher stiffness the windows go to the final animation position faster resulting in a snappier looking transition.

## animation-window-mass

_By default this is set to `0.5`_

_Changes the mass of windows_

Modifying the mass of windows makes them virtually heavier and therefore slower to animate.

## animation-dampening

_By default this is set to `10`_

_Changes the dampening applied to windows during the animation_

This setting basically does what it says. It dampens the animation of windows.

The more windows are dampened, the slower/softer they come into and out of view.

## animation-clamping

_By default this is set to `false`_ (true/false)

_Toggles window clamping_

Stop the animation from making the window exceed its set geometry. Shoutout to [@thecodsman](https://github.com/thecodsman) for finding this out.

Basically if you are using a animation setting that would make the window extend larger than it would be after the animation has played then it will cut the animation off once the window reaches its physical geometry.

## animation-for-open-window

_By default this is set to `zoom`_

Options:
- `fly-in` _Newly opened windows will fly in from a random position on the edge of the screen_
- `zoom` _Newly opened windows will zoom in from the center point of wherever they were going to appear_
- `slide-up` _Newly opened windows will slide up from the bottom of screen_
- `slide-down` _Newly opened windows will slide down from the top of the screen_
- `slide-left` _Newly opened windows will slide in from the right of where they are opened_
- `slide-right` _Newly opened windows will slide in from the left of where they are opened_
- `auto` _Newly opened windows will not have an animation_

Feel free to play around with these options to see which animation you prefer.

## animation-for-unmap-window

_By default this is set to `zoom`_

_Defines the animation for when windows are closed/killed_

Options:
- `fly-in` _Newly closed windows will fly out to a random position on the edge of the screen_
- `zoom` _Newly closed windows will zoom out from the center point of the window_
- `slide-up` _Newly closed windows will slide up from where they were closed_
- `slide-down` _Newly closed windows will slide down from where they were closed_
- `slide-left` _Newly closed windows will slide out from the right of where they are opened_
- `slide-right` _Newly closed windows will slide out from the left of where they are opened_
- `auto` _Newly closed windows will not have an animation_

Feel free to play around with these options to see which animation you prefer.

## animation-open-exclude

_By default this rule-set is empty_

Define windows that will not render any open animation.

Example
```
animation-open-exclude = [
  "class_g = 'Alacritty'"
];
```

## animation-unmap-exclude

_By default this rule-set is empty_

Define windows that will not render any closing animation.

Example
```
animation-unmap-exclude = [
  "class_g = 'Alacritty'"
];
```

# Using wintypes.

In picom you can set many options on the basis of what the windows 'type' is.

Listed below are the available types.
I can't say what applications or windows all of these link to so you will have to play with them to find what works.
```
wintypes:
{
  desktop = {};
  dock = {};
  toolbar = {};
  menu = {};
  utility = {};
  splash = {};
  dialog = {};
  normal = {};
  dropdown_menu = {};
  popup_menu = {};
  tooltip = {};
  notification = {};
  combo = {};
  dnd = {};
}
```

## Wintype Options

You can pass multiple options into one window type. Below is an example:

```
wintypes:
{
  normal = { shadow = true; fade = false; animation = "slide-down"; };
}
```


Below is all the options you can pass into wintypes.

### shadow

Toggle shadows. ( true / false )

```
wintypes:
{
  popup_menu = { shadow = true; };
}
```

### fade

Toggle fading. ( true / false )

```
wintypes:
{
  popup_menu = { fade = false; };
}
```

### focus

If focus was true, then that wintype would always be considered focus and therefore not be affected by inactive-opacity or inactive-dim.
If false, it is always considered inactive/unfocused and then always applies those effects. 

( true / false )

```
wintypes:
{
  menu = { focus = true; };
}
```

### blur-background

Toggle background blurring for windows under that type. ( true / false )

Setting this to false will not actually do anything since blurring is done on a whitelist basis.

```
wintypes:
{
  desktop = { blur-background = true; };
}
```

### full-shadow

Toggle full shadow. ( true / false )

Not sure what full shadow is at the moment.

```
wintypes:
{
  dropdown_menu = { full-shadow = false; };
}
```

### redir-ignore

Toggle redirect ignoring. ( true / false )

```
wintypes:
{
  dock = { redir-ignore = true; };
}
```

### clip-shadow-above

Toggle clipping shadows above a window. ( true / false )

```
wintypes:
{
  utility = { clip-shadow-above = true; };
}
```

### opacity

Set the opacity, both inactive and active. ( 0.0 ~ 1.0 )

```
wintypes:
{
  popup_menu = { opacity = 0.5; };
}
```

### animation

Set the open animation for specific wintypes. ( See `animation-for-open-window` under the Animations page for available options )

```
wintypes:
{
  popup_menu = { animation = "slide-right"; };
}
```

### animation-unmap

Set the close animation for specific wintypes. ( See `animation-for-unmap-window` under the Animations page for available options )

```
wintypes:
{
  tooltip = { animation-unmap = "fly-in"; };
}
```
