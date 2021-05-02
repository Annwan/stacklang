-- convert a two argument function into one that operates on a stack
stackify2 = (f) ->
	(s) ->
		a = s\pop!
		b = s\pop!
		s\push f a, b

-- (a b -- c)
add = stackify2((a, b) -> a + b)
sub = stackify2((a, b) -> a - b)
mul = stackify2((a, b) -> a * b)
div = stackify2((a, b) -> a / b)


-- (a -- !)
put = (s) -> io.write s\pop!
-- (a -- !a)
show = (s) -> io.write s\top!

-- (a -- a a)
dup = (s) -> s\push s\top!
-- (b a --a b)
swp = (s) ->
	a = s\pop!
	b = s\pop!
	s\push a
	s\push b
-- (a b c -- b c a)	
rot = (s) ->
	c = s\pop!
	b = s\pop!
	a = s\pop!
	s\push b
	s\push c
	s\push a

{
	:add
	:sub
	:mul
	:div
	:put
	:show
	:dup
	:swp
	:rot
}
