{-# LANGUAGE OverloadedStrings #-}
module Main where

import           SDL
import           SDL.Primitive
import qualified Linear                        as Lin


import           Control.Monad                  ( unless )
import           Lib
import qualified Foreign.C.Types               as C

main :: IO ()
main = do
  initializeAll
  window    <- createWindow "My SDL Application" defaultWindow
  windowVec <- Lib.windowSize window
  renderer  <- createRenderer window (-1) defaultRenderer
  appLoop renderer windowVec

appLoop :: Renderer -> Lin.V2 C.CInt -> IO ()
appLoop renderer wVec = do
  events <- pollEvents
  let eventIsQPress event = case eventPayload event of
        KeyboardEvent keyboardEvent ->
          keyboardEventKeyMotion keyboardEvent
            == Pressed
            && keysymKeycode (keyboardEventKeysym keyboardEvent)
            == KeycodeQ
        _ -> False
      qPressed = any eventIsQPress events
  rendererDrawColor renderer $= Lin.V4 0 0 255 255
  clear renderer
  fillTriangle renderer
               (Lin.V2 500 250)
               (Lin.V2 600 500)
               (Lin.V2 500 600)
               (Lin.V4 255 50 50 255)
  present renderer
  unless qPressed (appLoop renderer wVec)
