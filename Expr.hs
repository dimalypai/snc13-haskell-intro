module Expr where

data Expr = EInt Int
          | EVar String
          | EAdd Expr Expr
          | ELambda String Expr
          | EApp Expr Expr
--  deriving Show

instance Show Expr where
  show (EInt n)           = show n
  show (EVar var)         = var
  show (EAdd e1 e2)       = show e1 ++ " + " ++ show e2
  show (ELambda var expr) = "(\\" ++ var ++ " -> " ++ show expr ++ ")"
  show (EApp e1 e2)       = show e1 ++ " " ++ show e2

