function lamer
	parameter lmr
	if filart=1
	return left(lmr,16)
else
	if filart=2
	return left(lmr,13)
else
	if filart=3
	return left(lmr,10)
else
return substr(lmr,5,6)
endif
endif
endif
return ''
