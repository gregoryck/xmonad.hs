import XMonad

main = xmonad $ defaultConfig
    { borderWidth = 2
    ,
    terminal = "gnome-terminal"
    }