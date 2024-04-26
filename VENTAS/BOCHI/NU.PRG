scatter memvar 
scan for comprre="RE" and fechaop>{01/01/1999}
	IF numerore<m.numerore 
	****and fechaop>m.fechaop
		wait m.numerore+dtoc(m.fechaop)+chr(13)+numerore+dtoc(fechaop) wind
	ENDIF
	scatter memvar
endscan