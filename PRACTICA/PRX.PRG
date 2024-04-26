*****************************************************************************
*-- Programa: PRX
*-- Fecha   : 10-21-92 00:46am
*-- Version : G. REINER
*-- Notas   : PRACTICAS - gestion DE COMPONENTES
********************************************************************************
=cabpan1()
SELE PRX
SCAT TO AGX BLAN
LARGO=ALEN(AGX,1)

RELE ARX,TPO,respuesta
DIME ARX[LARGO,18],TPO[4],PRX[4]
publ respuesta
*
TPO[1]="Unidades"
TPO[2]="Material Radiactivo"
TPO[3]="Material Descartable"
TPO[4]="Medicamentos"
*
PRX[1]="U"
PRX[2]="R"
PRX[3]="D"
PRX[4]="M"

FOR A=1 TO LARGO
	ARX[A,1]=A
	ARX[A,2]=20
	ARX[A,3]=''
NEXT

* CAMPO PRACOD
ARX[1,4]='PRA.PRACTICABR'
ARX[1,6]="XSEEK(AGX[1],'PRA','PRACOD')"
ARX[1,11]="ELIPRA('',ARX[1,1],ARX[1,2])"
ARX[1,12]="PRA.PRACOD"
ARX[1,13]="LAST()=27"

* CAMPO PRXCOD
ARX[2,4]='!!'
ARX[2,8]="C¢digo Interno de la Pr ctica"
ARX[2,9]=.T.
ARX[2,13]="LAST()=27 .OR. EMPTY(AGX[2])"
ARX[2,15]=.T.

* CAMPO TIPO
ARX[3,4]="TPO[RESPUESTA]"
ARX[3,11]="!EMPTY(POP_LIST(ARX[3,1],ARX[3,2],@TPO,'',.T.))"
ARX[3,12]="PRX[RESPUESTA]"
ARX[3,13]="LAST()=27"
ARX[3,15]=.T.

* CAMPO UNIDAD
ARX[4,4]="MIX.TEXTO1"
ARX[4,6]="XSEEK(AGX[4],'MIX',IIF(AGX[3]='U','UNICOD',IIF(AGX[3]='R','RADCOD',IIF(AGX[3]='D','DESCOD','REMCOD')))"
ARX[4,11]="IIF(AGX[3]='U',;
           ELIUNI('',ARX[3,1],ARX[3,2]),;
	       IIF(AGX[3]='R',;
		       ELIRAD('',ARX[3,1],ARX[3,2]),;
		       IIF(AGX[3]='D',;
  				   ELIDES('',ARX[3,1],ARX[3,2]),;
				   ELIREM('',ARX[3,1],ARX[3,2]))))"
ARX[4,12]="LEFT(MIX.TEXTO2,2)"
ARX[4,13]="LAST()=27 .OR. XSEEK(AGX[1]+AGX[2]+AGX[3]+AGX[4],'PRX','PRXUNI')"
ARX[4,14]="COMBINACION PRACTICA-UNIDAD EXISTE"
ARX[4,15]=.T.

* CANTIDAD
ARX[5,4]='99999.99'
ARX[5,8]="Cantidad"
ARX[5,9]=.t.
ARX[5,13]="last()=27 .or. agx[5]<=0"
ARX[5,15]=.t.

* MONTO
ARX[6,12]="AGX[5]*MIX.NU1"
ARX[6,16]=.T.
ARX[6,18]=.T.

**
ARX[7,16]=.T.
ARX[8,16]=.T.

DO CASE
CASE BAR()=1
	STORE NUL TO RESPUESTA
	ULPR='IPRX'
	DO INGRESO WITH 'PRX',IPRAR,IPRAC,IPRAR+IPRALA,IPRAC+IPRAAN,'Ingreso Pr cticas (Unidades)','MPRX()'
CASE BAR()=2
	stor nul TO respuesta
	IF ELIPRX(" a Corregir",-1,1)
		ULPR='CPRX'
		ARX[1,6]="!YAESTABA(AGX[1],'PRX','CODPRX',.F.,.T.)"
		ARX[1,17]=.T.
		ARX[3,6]="!YAESTABA(AGX[2]+AGX[3],'PRX','MEDICOS',.T.,.T.)"
		DO CORRIGE WITH 'PRX',CPRXR,CPRXC,CPRXR+CPRXLA,CPRXC+CPRXAN,'Correcci¢n Pr cticas','MPRX(.T.,15)'
	ENDIF
CASE BAR()=4
	stor nul TO respuesta
	IF ELIPRX(" a Borrar",-1,1)
		ULPR='BPRX'
		DO BORRA WITH 'PRX',MPRXR,MPRXC,MPRXR+MPRXLA,MPRXC+MPRXAN,'Borra Pr cticas','MPRX(.T.,15)','Pr ctica'
	ENDIF
CASE BAR()=5
	SET DELE OFF
	SET FILTER TO DELETED()
	GOTO TOP
	IF !EOF()
		stor PRXpop TO anterior
		stor .T. TO PRXpop
		DO opPRX
		stor nul TO respuesta
		IF ELIPRX(" a Recuperar",-1,1)
			ULPR="LLPRX"
			DO RECUPERA WITH 'PRX',MPRXR,MPRXC,MPRXR+MPRXLA,MPRXC+MPRXAN,'Recupera Pr ctica','MPRX(.T.,20)','Pr ctica'
		ENDIF
		stor anterior TO PRXpop
		DO opPRX
	ENDIF
	SET DELE ON
	SELE PRX
	SET FILTER TO
CASE BAR()=11
	=VGRL("PRX"," PRXCTICAS"," DE PRXCTICAS")
CASE BAR()=13
	DO rndx1 WITH 16,20
	ON SELE POPU rndx DO XPRA
	ACTI POPU rndx
	RELE POPU rndx
ENDCASE
rele respuesta
RETURN
