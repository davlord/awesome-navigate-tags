# awesome-navigate-tags
Additional functions to navigate between tags in AwesomeWM using filters. 

## Features

* Build a set of tag navigation functions (`viewnext`, `viewprev` and `viewidx`) similar to native ones from AwesomeWM but using a tag filter.
* You can build multiple set of navigation functions with different filters.
* Allows to enable dynamic tags easily.

Differences with https://github.com/guotsuan/eminent :
- No monkey patching (prevent from breaking native AwesomeWM stuff).
- Add navigation features next to native ones. 

## Install & setup

1.Clone in your config directory (`~/.config/awesome/`)
```bash
cd ~/.config/awesome/
git clone https://github.com/davlord/awesome-navigate-tags.git
```
2.Generate functions based on a filter (`~/.config/awesome/rc.lua`)
```lua
local noempty_tag_nav = require("awesome-navigate-tags").navigator(awful.widget.taglist.filter.noempty)
```

3.Use it to navigate (using keymaps, mouse or whatever)(`~/.config/awesome/rc.lua`)
```lua
awful.key({ modkey,  "Control" }, "Left",   noempty_tag_nav.viewprev, {description = "view previous tag", group = "tag"}),
awful.key({ modkey,  "Control" }, "Right",  noempty_tag_nav.viewnext, {description = "view next tag", group = "tag"}),
```

## Dynamic tags
To enable dynamic tags you just need two steps.

1.Hide non empty tags in your wibar (native AwesomeWM setup) using `awful.widget.taglist.filter.noempty` filter (`~/.config/awesome/rc.lua`)
```lua
-- Create a taglist widget
s.mytaglist = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.noempty,
    buttons = taglist_buttons
}
```
2.Pass the same filter to get a tag navigator which navigates between non empty tags (`~/.config/awesome/rc.lua`)
```lua
local noempty_tag_nav = require("awesome-navigate-tags").navigator(awful.widget.taglist.filter.noempty)
-- ...
awful.key({ modkey,  "Control" }, "Left",   noempty_tag_nav.viewprev, {description = "view previous tag", group = "tag"}),
awful.key({ modkey,  "Control" }, "Right",  noempty_tag_nav.viewnext, {description = "view next tag", group = "tag"}),
```

