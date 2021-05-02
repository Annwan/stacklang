class Stack
	new: =>
		@len = 0
		@arr = {}
	push: (val) =>
		@len += 1
		@arr[@len] = val
		val
	top: => @arr[@len]
	pop: =>
		if @len == 0
			nil
		else
			rval = @arr[@len]
			@arr[@len] = nil
			@len -= 1
			rval

{:Stack}
