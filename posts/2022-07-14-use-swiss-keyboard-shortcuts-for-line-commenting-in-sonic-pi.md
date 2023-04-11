Date: 2022-07-14
Title: Use Swiss keyboard shortcuts for line commenting in Sonic Pi
Tags: Sonic Pi, Karabiner-Elements

Every now and then after a day at work I enjoy toying around with [Sonic Pi](https://sonic-pi.net/), an amazing application for making music with code.

There are a lot of great talks by [Sam Aaron](http://sam.aaron.name/) the creator of Sonic Pi on Youtube but I like this one quite a bit.

<iframe width="560" height="315" src="https://www.youtube.com/embed/OLLwG_SN8oo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

So while I was sitting there with my glass of Port working through the [Sonic Pi Tutorial](https://sonic-pi.net/tutorial.html) I had the urge to gain back my text editing fluency I'm used to from my day job. Luckily Sonic Pi supports a lot of [keyboard shortcuts](https://sonic-pi.net/tutorial.html#section-B-1) however as of now they're optimised for a keyboard layout of the english language.

After a bit of tinkering and the help of [Karabiner-Elements](https://karabiner-elements.pqrs.org/) I managed to re-map my line-commenting shortcut of `CMD+Shift+7` (I'm working on a MacBook with a Swiss German keyboard) to the shortcut defined by Sonic Pi `M-/`.

The configuration you'll want is:

```json
{
  "title": "Remap CH comment combo to EN comment combo",
  "rules": [
    {
      "description": "Remap CH comment combo to EN comment combo",
      "manipulators": [
        {
          "conditions": [
            {
              "bundle_identifiers": [
                "net\\.sonic\\-pi\\.app"
              ],
              "type": "frontmost_application_if"
            }
          ],
          "from": {
            "key_code": "7",
            "modifiers": {
              "mandatory": [
                "left_command",
                "left_shift"
              ]
            }
          },
          "to": {
            "key_code": "keypad_slash",
            "modifiers": [
              "left_command"
            ]
          },
          "type": "basic"
        }
      ]
    }
  ]
}
```

If you also got this need then following these steps should set you up.

1. Install [Karabiner-Elements](https://karabiner-elements.pqrs.org/)
2. In your terminal go to `~/.config/karabiner/assets/complex_modifications`
3. In there create a file `remap_ch_comment_combo_to_en_comment_combo.json` and fill it with the configuration above.
4. Then start Karabiner Elements, go to the Complex Modifications tab ![Complex Modifications tab](/assets/images/2022-07-14-1.png) and there click the Enable button for the new configuration ![Enable button](/assets/images/2022-07-14-2.png).
