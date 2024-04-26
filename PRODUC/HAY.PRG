*********************************************************************************
*-- Programa: hay.prg
*-- Fecha   : 06/05/91 02:51pm
*-- Version : G. REINER
*-- Notas   : chequea sy hay suficientes avios y telas para fabricar
********************************************************************************
SELE fax
ctdd=fab.corte
GOTO infax
SCAN WHILE fax.numero=nfab
	IF !avio .AND. vertiente=vrtt .AND. !EMPTY(fini) .AND. !reservado ;
			.AND. !EMPTY(fax.cantsal)
		ctdd=fax.cantsal
	ENDIF
ENDSCAN
STORE .T. TO RESPUESTA
GOTO infax
SCAN WHILE fax.numero=nfab
	IF avio .AND. vertiente=vrtt .AND. fax.posic=m.posic+1 .AND. !reservado
		SELE des
		bsca=fab.articulo+IIF(SIGN(fax.prc)=1,LEFT(abio,1),LEFT(tella,1))+STR(ABS(fax.prc))
		IF SEEK(bsca)
			IF SIGN(fax.prc)=1
				SELE avi
			ELSE
				SELE tel
			ENDIF
			GOTO ABS(des.avi)
			USA=des.cantidad*ctdd/des.fraccion
			mx=IIF(SIGN(fax.prc)=1,avi.stock,tel.stock)
			IF mx<USA
				STORE .F. TO respuesta
				EXIT
			ENDIF
			SELE fax
		ELSE
			STORE .F. TO respuesta
			EXIT
		ENDIF
	ENDIF
	SELE FAX
ENDSCAN
RETURN
