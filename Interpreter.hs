module Interpreter (scl, eval) where

import Expr
import Parser
import qualified Data.Map as Map

type Env = Map.Map String Int

scl :: String -> Int
scl input = eval Map.empty (parseSCL input)

eval :: Env -> Expr -> Int
eval _   (EInt n) = n
eval env (EVar var) = lookupVar var env
eval env (EAdd e1 e2) = let e1Val = eval env e1
                            e2Val = eval env e2
                        in e1Val + e2Val
eval env (EApp (ELambda var e1) e2) = eval env' e1
  where env' = Map.insert var (eval env e2) env

lookupVar :: String -> Env -> Int
lookupVar var env =
  case Map.lookup var env of
    Just n  -> n
    Nothing -> error "Name is unbound"

