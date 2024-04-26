function eliven
return ''
	=opven()
	do while .T.
		STOR '' TO respuesta
		DO infic1 WITH "INGRESE CODIGO VENDEDOR", 2
		IF !EMPTY(respuesta)
			IF  SEEK(padr(respuesta,2),"VEN")
				EXIT
			ELSE
				wait "CODIGO EQUIVOCADO !!, REINGRESE" nowa wind
			ENDIF
		ENDIF
	ENDDO
RETURN ven.nombre
