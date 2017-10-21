module Main where

import System.Environment

main = do
  -- "x" ++ "y"
  -- 'x' : "y"
  -- 'x' : 'y' : []
  -- 
  -- [x*2 | x <- [1..5]] 
  -- [x/2 | x <- [1..5]] 

  let doubleMe x = x + x

  print (doubleMe 20)

  putStrLn "hello, world"  

  args <- getArgs
  putStrLn $ "hello, " ++ head args
