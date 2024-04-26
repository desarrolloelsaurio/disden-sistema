procedure ltot1ar
=OPMER()
STORE NUL TO M.RESPUESTA
IF SEEKTECX(40,"MER","MER.MERCA","MER.ARTICULO","MERCA","MER",.F.,10,1,.T.,.t.)
	STORE {} TO M.FECINI,M.FECFIN
	IF ENTRE_FE("a Listar")
		=OPFAC()
		SELE FAC
		SET ORDER TO TAG FACTURA
		SELE FAX
		SET ORDER TO
		SET RELA TO FACTURA INTO FAC ADDI
		=DOTALK()
		=WORKING()
		sum cantidad to totcan for ;
			BETW(FAC.FECHAEM, M.FECINI, M.FECFIN) .and. ;
			fax.articulo = mer.articulo
		=UNWORK()
		=UNTALK()
		define window resulta double from 10,10 to 15,60
		acti wind resulta
		@ 1,2 say "ARTICULO :" + alltrim(mer.merca)
		@ 2,2 say "TOTAL VTA:" + str(totcan, 10, 2) + " unidades"
		wait "oprima una tecla" wind
		rele wind resulta
		set rela to
	endif
endif
return