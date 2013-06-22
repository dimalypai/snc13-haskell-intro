import Interpreter (scl)
import System.IO
import System.Exit (exitSuccess)

main :: IO ()
main = do
  hSetBuffering stdout NoBuffering
  putStr "scl> "
  input <- getLine
  case input of
    ":q" -> exitSuccess
    _    -> do print $ scl input
               main

