* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LKAR.PRG                                                 �
* � COMENTARIO    : DERIVA A LISTADOS DE KARDEX                              �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 08-15-93                                                    �
* � HORA       : 09:38:47pm                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
PARAMETER PORPAN
KA_DIJO=ALLTRIM(PROMPT())
ulpr=HORA_ULP(PROGRAM())
DO CASE
CASE KA_DIJO="Stock a Fecha"
     M.FECINI=INFEC("WIN","Fecha Tope del Listado de Stock")
     IF LAST()#27 .AND. !EMPTY(M.FECINI)
        DO LKARF
     ENDIF
CASE BAR()=1
	store 0 to respuesta
	IF !EMPTY(ELIAVIS(" a Listar",-1,1))
		fsc='tipo="'+left(abio,1)+'" .and. articulo="'+aviS.avicodPRO+'"'
		t1='Listado de Kardex - '+abio+':'+alltrim(aviS.avio)
		respuesta='nada2#11#47#Taller a Listar#3#T\<odos los Talleres#\<Dep�sito F�brica#\<Un Taller'
		=DEFPOP()
		ON SELE POPU nada2 DO LKAR1
		ACTI POPU nada2
		RELE POPU nada2
	endif
CASE BAR()=2
	store 0 to respuesta
	if !EMPTY(ELITEL(" a Listar",-1,1))
		fsc='tipo="'+left(tella,1)+'" .and. articulo="'+tel.telcod+'"'
		t1='Listado de Kardex - '+tella+':'+alltrim(tel.tela)
		respuesta='nada2#11#47#Taller a Listar#3#T\<odos los Talleres#\<Dep�sito F�brica#\<Un Taller'
		=DEFPOP()
		ON SELE POPU nada2 DO LKAR1
		ACTI POPU nada2
		RELE POPU nada2
	endif
CASE BAR()=3
	store 0 to respuesta
	if !EMPTY(elital(" a Listar",-1,1))
		fIsc='tALLER="'+TAL.TALCOD+'"'
		tT='Listado de Kardex - Taller:'+alltrim(tal.talleres)
		IF PORPAN
			DO LKARPTAL
		ELSE
			DO LKARITAL
		ENDIF
	endif
CASE BAR()=4
	fIsc='EMPTY(tALLER)'
	tT='Listado de Kardex - Dep�sito Propio'
	IF PORPAN
		DO LKARPTAL
	ELSE
		DO LKARITAL
	ENDIF
CASE BAR()=5
	STORE NUL TO respuesta
	DO infic1 WITH 'INGRESE N� ORDEN DE '+UPPER(favri)+" a Listar",10
	respuesta=VAL(respuesta)
	IF !EMPTY(respuesta) .OR. LASTKEY()=27
		fIsc='numero='+ALLTRIM(STR(RESPUESTA))
		tT='Listado de Kardex - Orden de '+favri+' N�:'+alltrim(str(RESPUESTA))
		IF PORPAN
			DO LKARPFAB
		ELSE
			DO LKARIFAB
		ENDIF
	ENDIF
ENDCASE
ulpr=PROGRAM()
RETURN MEN_lin(botom)
