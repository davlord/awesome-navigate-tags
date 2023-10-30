# awesome-navigate-tags
Additional functions to navigate between tags in AwesomeWM using filters. 

## features

* Build a set of tag navigation functions (`viewnext`, `viewprev` and `viewidx`) similar to native ones from AwesomeWM but using a tag filter.
* Allows to enable dynamic tags easily.

## install

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
