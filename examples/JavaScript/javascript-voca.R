# Demonstrate the use of voca.js, "The ultimate JavaScript string library".
# https://vocajs.com/
#
# These examples were adapted from the Voca documentation.

library("jsr223")
engine <- ScriptEngine$new("js")

# Source the Voca library. This creates a utility object named 'v'.
engine$source(
  "https://raw.githubusercontent.com/panzerdp/voca/master/dist/voca.min.js",
  discard.return.value = TRUE
)

# 'prune' truncates string, without break words, ensuring the given length, including
# a trailing "..."
engine %~% "v.prune('A long string to prune.', 12);"

## [1] "A long..."

# Methods can be invoked from within R using parameters.
engine$invokeMethod("v", "prune", "A long string to prune.", 12)

## [1] "A long..."

# Provide a different suffix to 'prune'.
engine$invokeMethod("v", "prune", "A long string to prune.", 12, "(more)")

## [1] "A long (more)"

# Voca supports method chaining.
engine %~% "
v('Voca chaining example')
  .lowerCase()
  .words()
"

## [1] "voca"     "chaining" "example"

# Split graphemes.
engine$invokeMethod("v", "graphemes", "cafe\u0301")

## [1] "c" "a" "f" "é"

# Word wrapping.
engine %~% "v.wordWrap('A long string to wrap', {width: 10});"

## [1] "A long\nstring to\nwrap"

# Notice above, the second method parameter is a JavaScript object. We can still
# use invokeMethod as follows.
engine$invokeMethod(
  "v",
  "wordWrap",
  "A long sentence to wrap using Voca methods.",
  list(width = 20)
)

## [1] "A long\nstring to\nwrap"

# Word wrapping with custom delimiters.
engine$invokeMethod(
  "v",
  "wordWrap",
  "A long sentence to wrap using Voca methods.",
  list(width = 20, newLine = "<br>", indent="__")
)

## [1] "__A long<br/>__string to<br/>__wrap"

engine$terminate()
