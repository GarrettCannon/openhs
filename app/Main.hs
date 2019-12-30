module Main where

import qualified Graphics.UI.GLUT as GL

(|>) :: a -> (a -> b) -> b
(|>) x f = f x

infixl 0 |>

main :: IO ()
main = do
  GL.getArgsAndInitialize
  GL.createWindow "Hello World"
  GL.displayCallback GL.$= display
  GL.mainLoop

display :: GL.DisplayCallback
display = do
  [GL.ColorBuffer] |> GL.clear
  GL.flush
