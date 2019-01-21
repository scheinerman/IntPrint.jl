using Test
using IntPrint

@test intprint(1) == "1"
@test intprint(-1) == "-1"
@test intprint(123456) == "123,456"
@test intprint(-123456) == "-123,456"
@test intprint(1234,except4=true) == "1234"
@test intprint(1234,sep=".") == "1.234"

@test flush_print(23,5) == "   23"
@test flush_print(23,5,false) == "23   "
