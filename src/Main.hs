module Main where

import qualified Data.Text as T
import GI.Gtk
  ( buttonNew,
    mainQuit,
    onButtonClicked,
    onWidgetDestroy,
    setButtonLabel,
    setContainerBorderWidth,
    setContainerChild,
    setWindowTitle,
    widgetDestroy,
    widgetShowAll,
    windowNew,
  )
import qualified GI.Gtk as Gtk (init, main)
import GI.Gtk.Enums (WindowType (..))

main :: IO ()
main = do
  _ <- Gtk.init Nothing
  window <- windowNew WindowTypeToplevel
  _ <- onWidgetDestroy window mainQuit
  setContainerBorderWidth window 10
  setWindowTitle window (T.pack "Hello World")
  button <- buttonNew
  setButtonLabel button (T.pack "Hello haskeller!")
  _ <- onButtonClicked button $ do
    putStrLn "A \"clicked\"-handler to say \"destroy\""
    widgetDestroy window
  setContainerChild window button
  widgetShowAll window
  Gtk.main
