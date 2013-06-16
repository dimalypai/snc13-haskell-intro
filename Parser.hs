module Parser (parseSCL) where

import Expr
import Text.ParserCombinators.Parsec

parseSCL :: String -> Expr
parseSCL input =
  case parse parseExpr "SCLParser" input of
    Left err   -> error $ show err
    Right expr -> expr

parseExpr :: Parser Expr
parseExpr = try parseAdd
        <|> try parseApp
        <|> try parseLambda
        <|> parens parseExpr

parseNumber = do
  numStr <- many1 digit
  return $ EInt (read numStr)

parseVar = do
  varStr <- many1 letter
  return $ EVar varStr

parseAdd = parseTerm `chainl1` addOp

parseTerm = try parseApp
        <|> parseNumber
        <|> parseVar
        <|> parens parseAdd

addOp = do
  spaces
  char '+'
  spaces
  return EAdd

parens p = do
  char '('
  res <- p
  char ')'
  return res

parseLambda = do
  char '('
  char '\\'
  varStr <- many1 letter
  spaces
  string "->"
  spaces
  expr <- parseExpr
  char ')'
  return $ ELambda varStr expr

parseApp = do
  e1 <- parseLambda
  many1 space
  e2 <- parseExpr
  return $ EApp e1 e2

