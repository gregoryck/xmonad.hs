import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Util.Run(spawnPipe)
import System.IO

main = do
    xmproc <- spawnPipe "/usr/bin/xmobar"
    xmonad $ defaultConfig {
        borderWidth = 2
        ,
        terminal = "urxvt"
        ,
        modMask = mod4Mask     -- Rebind Mod to the Windows key
        ,
        manageHook = manageDocks <+> manageHook defaultConfig
        ,
        logHook = dynamicLogWithPP xmobarPP {
            ppOutput = hPutStrLn xmproc
            , ppTitle = xmobarColor "green" "" . shorten 50
        }


    }