module Lib
  ( windowSize
  )
where

import qualified SDL
import qualified Linear
import qualified Foreign.C.Types               as C

windowSize :: SDL.Window -> IO (Linear.V2 C.CInt)
windowSize window = SDL.get (SDL.windowSize window)

