module Main where

import qualified Graphics.UI.GLUT as GL

main :: IO ()
main = do
  GL.getArgsAndInitialize
  _window <- GL.createWindow "Hello World"
  GL.displayCallback GL.$= display
  GL.mainLoop

display :: GL.DisplayCallback
display = do
  GL.clear [GL.ColorBuffer]
  GL.flush
