[def_sfb]: ## "Same Finger Bigram, i.e. pressing two successive keys in the same column."
[def_mod]: ## "Shift, Ctrl, Alt, and Windows key."

# The Zé Quoia 34-key layout

simultaneously optimized for English, French and Portuguese. also performs very well in Spanish, and can find its way to ß for the occasional Notstandsmaßnamen.

i find this layout a joy to use for both writing and coding — despite a few quirks, and partially because of some others. the name sounds funny in Brazilian Portuguese, and you can sort of make it out on the base layer.

the ergonomics are lightly premised on the [A. Dux](https://github.com/tapioki/cephalopoda/tree/main/Architeuthis%20dux)'s aggressive column stagger and pinky splay, but it should work fine on any 34-key board. 

the one major caveat is that it was written to be used on top of Bépo [Bépo](https://bépo.fr). i haven't yet looked into how well QWERTY could handle all the non-English characters i need, but having to recur to ascii alt-sequences would be at the very least worrisome for cross-platform usage.

## Features

### Innovations

 * vim-style home row arrows, but left and right mapped to jump to previous or next word.
 * number layer with 0-3 on the home row, which is thus the most used (unlike with a traditional numpad)
 * promptly accessible one-shot layers to insert the most common symbols and accented vowels with only two key taps
 * utility layer on home row for unlimited alt-tab or ctrl-tab in both ways, history navigation, and full mouse control with three cursor/wheel speeds
 
### Integrations

#### Dedicated scripts included for
 * AutoHotKey: mouse control, dark mode toggle, and double/single display toggle
 * ControlMyMonitor: change brightness and other settings of external displays
 
#### Suggested shortcuts for
 * PowerToys launch and clipboard history, both from base layer
 * Everything search from home row
 
 # 
 * low on [SFB][def_sfb] and redirects and high on alternation, but
 * still features some very enjoyable rolls (`'s`, `you`, `which`…)
 * lower row favored to the upper (personal choice) 
 
 * left side made to optionally complement shortcuts and gestures i have on the mouse (enter, cut, copy, paste)
 * entirely mouse-independent, with mouse movement on a utilitiy layer
 * shortcuts for clipboard log, light/dark windows theme switch, and external screen controls (powered by autohotkey and controlmymonitor)

## Layout
the outer home row keys act as [modifiers][def_mod] when held.

all thumb keys change to different layers when held down. the thumbs' home are their outer keys; the inner ones, when pressed, are a one-shot switch. this works great for symbols and accents, which are less often used in sequence.

the main layers are outlined below. i'll eventually complete this by using images instead of text.

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
i ran some benchmarks out of curiosity, and it has scored close to top-ranking layouts such as [RSTHD](https://xsznix.wordpress.com/2021/01/13/rsthd-today/) and [MTGAP](https://mathematicalmulticore.wordpress.com/the-keyboard-layout-project/). however, it depends so heavily on combos and layers for non-English characters and whatnot that any mechanical analysis of it would have to be highly opinionated in its parametrization.


