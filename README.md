Script'n'Code Language
======================

Script'n'Code Language (SCL) is a toy functional (expression) language created
as an example for Haskell Introduction talk at Script'n'Code meet-up.

Syntax
------

Syntax is a very small subset of Haskell. There are expressions of the
following forms:

* Integer literals
* Names (variables)
* Arithmetic addition
* Lambda abstraction
* Function application

Evaluation
----------

To evaluate SCL expression with empty environment for variable bindings
evaluate the following in ghci (load Interpreter.hs):

`scl "(\\x -> x) 1"`

It is possible to supply environment (mapping of names to integer values) to
function eval:

`eval (Map.fromList [("x", 1)]) (parseSCL "x")`

