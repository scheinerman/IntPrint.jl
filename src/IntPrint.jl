module IntPrint

export intprint, flush_print

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
function intprint(n::Integer;sep::String=",",except4::Bool=false)::String
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



function flush_print_string(s::String, width::Int, right::Bool)::String
    n = length(s)
    @assert n>=0 "Width must be nonnegative, got $n"

    if width<n
        @warn "Trunctated to fit width"
        return s[1:width]
    end

    spacer = " "^(width-n)
    if right
        return spacer * s
    end
    return s * spacer
end

"""
`flush_print(x,width)` returns a `String` version of `x` right justified
in a string of length `width`.

Use `flush_print(x,width,false)` for left-justified.
"""
function flush_print(x, width::Int, right::Bool=true)::String
    return flush_print_string(string(x), width, right)
end


end # end of module
