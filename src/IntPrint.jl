module IntPrint

export intprint

"""
`intprint(n)` converts an integer `n` to a `String` that has commas
inserted appropriately. For example:
```
julia> intprint(1234567)
"1,234,567"
```
Two named optional arguments may be passed:
+ `sep` can be set to give the separator string (default is `","`).
  For example, `intprint(12345,sep="_")` yields `"12_345"`.
+ `except4` can be set to `true` (default is `false`) so that four-digit
  numbers print without a separator. For example,
  `intprint(1234,except4=true)` yields `"1234"`.
"""

function intprint(n::Integer;sep=",",except4=false)::String
  # hand 0 as a special case (do we need to?)
  # if n==0
  #   return "0"
  # end

  prefix = ""
  if n < 0
    prefix = "-"
    n = -n
  end

  result = ""

  if except4 && n < 10_000
    return prefix * string(n)
  end

  while n >= 1000
    digs = lead0(string(n%1000))  # next 3 digits
    result = sep * digs * result
    n = div(n,1000)
  end

  digs = string(n)
  result = prefix * digs * result

  return result
end

"""
`lead0(s::String)` adds additions 0s on the left
to make this a length-3 string.
"""
function lead0(s::String)
  n = length(s)
  if n < 3
    s = "0"^(3-n) * s
  end
  return s
end


end # end of module
