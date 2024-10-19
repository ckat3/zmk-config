[def_sfb]: ## "Same Finger Bigram, i.e. pressing two successive keys in the same column."
[def_mod]: ## "Shift, Ctrl, Alt, and Windows key."

# The Zé Quoia 34-key layout

I'm a coder as well as a translator of English, French and Portuguese, so I made this layout which is highly optimized for all these usages. It also performs very well in Spanish, and can find its way to ß for the occasional Notstandsmaßnahme. I find it a joy to use, so that it's sure to be my endgame.

Its ergonomics are lightly premised on the [A. Dux](https://github.com/tapioki/cephalopoda/tree/main/Architeuthis%20dux)'s aggressive column stagger and pinky splay, but it should work fine on any 34-key board. 

The ZMK source was written to be used on top of [Bépo](https://bépo.fr), as QWERTY's need to recur to certain ASCII alt-sequences would mean trouble for my cross-platform usage.

## Features

 * Lower row favored instead of the upper.
 * Low on [SFB][def_sfb] and redirects and high on alternation, but
 * Still features some very enjoyable rolls (`'s`, `you`, `which`…).
 * Easy combo for `qu`, which is much more frequent than a loose q.
 * Combos for bothersome common sequences (`bj`, `ão`, `õe`, `ãe`, `ção`, `ções`).
 * RH navigation layer for efficient darting through text, including Vim-style homerow arrows but with `^←` and `^→` on the sides. 
 * LH conceived to be used alongside a mouse on RH (sorry, lefties).
 * Modified LH numpad leaves homerow for `0123`, which account for some 75% of all typed digits.
 * Utility layer on LH home row featuring unlimited alt-tab or ctrl-tab in both ways, history navigation, and full mouse control with three cursor/wheel speeds.
 * Promptly accessible one-shot layers to insert symbols and accented vowels with only two key taps.
 * Automatic placement of narrow non-breaking space for French punctuation.
 * Manually implemented capsword.
 
### Integrations

#### Dedicated scripts included for
 * [AutoHotKey](https://www.autohotkey.com/): mouse control, dark mode toggle, and double/single display toggle
 * [ControlMyMonitor](https://www.nirsoft.net/utils/control_my_monitor.html): change brightness and other settings of external displays
 
#### Suggested shortcuts for
 * [PowerToys](https://learn.microsoft.com/windows/powertoys/) launch and clipboard history, both from base layer
 * [Everything](https://www.voidtools.com/) search from home row

## Layout
The outer home row keys act as [modifiers][def_mod] when held.

Each thumb key activates a certain layer while held. The thumbs sit on their outer keys by default; the inner ones, when pressed, are one-shot switches. This works great for symbols and accents, which are less often used in sequence.

Here's a rough outline of the main layers:

### Base
    q - y . ?    k c h w j
    u o i a f    g t r s n
    z é p , x    v d m l b
            e   spc
			
### Accents (inner right thumb)
    û ô î â ¿      ç ' " bj
    ú ó í á ã      ^ ` ´ ñ 
    ù õ ï à        ¨   ß ~ 
			          
### Numbers (hold outer left thumb)
     | 7 8 9 ?    $ [ ] # %       
    0 1 2 3 ;    : + - * /          
      4 5 6 ,    . < > = \          
	             _ spc         

### Symbols (outer left thumb)
    | @ æ œu !      $ [ ] & ~			  
	{ } (  ) ;      : ^ `   /		  
	— − «  » ,      . < > = \		  
	             _ spc

## Performance
On the benchmarks I ran this layout scores very near the top, right next to the (English-focused) likes of [RSTHD](https://xsznix.wordpress.com/2021/01/13/rsthd-today/) and [MTGAP](https://mathematicalmulticore.wordpress.com/the-keyboard-layout-project/). But Zé Quoia depends so heavily on combos and layers that any complete mechanical analysis of it would have to be highly opinionated in its parametrization.