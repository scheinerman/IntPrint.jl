# IntPrint


[![Build Status](https://travis-ci.org/scheinerman/IntPrint.jl.svg?branch=master)](https://travis-ci.org/scheinerman/IntPrint.jl)

[![codecov.io](http://codecov.io/github/scheinerman/IntPrint.jl/coverage.svg?branch=master)](http://codecov.io/github/scheinerman/IntPrint.jl?branch=master)

The module `IntPrint` defines the function `intprint` used to convert
integers into strings with commas separating triples of digits and the
`flush_print` function to print right (or left) justified values in a
string of given length.

## Using `intprint`

```
julia> using IntPrint

julia> intprint(12345678)
"12,345,678"

julia> intprint(-4391024)
"-4,391,024"
```

### Optional arguments

#### Four-digit numbers

Users might prefer four-digit numbers to print without a separator.
The optional argument `except4` can be set to `true` to suppress the
comma in this case.
```
julia> intprint(1234)
"1,234"

julia> intprint(1234,except4=true)
"1234"
```

#### Alternate separator

The default separator is a comma, but this can be changed
to another character (or characters) with the optional `sep`
argument:
```
julia> intprint(-1234567)
"-1,234,567"

julia> intprint(-1234567,sep="_")
"-1_234_567"
```

## Using `flush_print`

```
julia> flush_print("hello", 10)
"     hello"

julia> flush_print("hello", 10, false)
"hello     "

julia> flush_print(sqrt(10),30)
"            3.1622776601683795"

julia> flush_print(sqrt(10),8)
┌ Warning: Trunctated to fit width
└ @ IntPrint ~/.julia/dev/IntPrint/src/IntPrint.jl:68
"3.162277"
```

## Not Todo List

If I started over again, I suppose I could make the
base selectable to something other than 10
and the grouping set to something other than triplets,
but why?
