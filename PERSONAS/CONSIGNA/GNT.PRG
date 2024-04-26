************************************************
*-- Programa: GNT.PRG
*-- Fecha   : 03-31-92 11:06am
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE CONSIGNARIOS
*-- Modificaci¢n GOYO 09-10-92 06:33pm (probes)
************************************************
ulpr=PROGRAM()
=cabpan1()
sele PER
SCAT TO AGX BLAN
LARGO=ALEN(AGX,1)
RELE ARX
DIME ARX[LARGO,18]
STORE 24 TO COL1,COL
for xa = 1 to LARGO
	arx[xa,1]=xa-1
	arx[xa,2]=col1
next

* CAMPO FILTRO
ARX[1,12]="'S'"
ARX[1,16]=.T.
ARX[1,18]=.T.

* campo CODIGO       C   (10)
ARX[2,4]='@!'
ARX[2,5]=.t.
ARX[2,7]="CODIGO EXISTENTE"
ARX[2,8]='C¢digo de Service - [ESC] para Men£ - [Ctrl+F3] para Informaci¢n'
ARX[2,9]=.t.
ARX[2,13]="last()=27 .or. empty(agx[2])"

* campo PERSONA      C    (30)
ARX[3,4]='@!'
ARX[3,5]=.t.
ARX[3,7]="SERVICE EXISTE"
ARX[3,8]="Nombre o Raz¢n Social del Service"
ARX[3,9]=.t.
ARX[3,13]="last()=27 .or. empty(agx[3])"

* CAMPO DOMICILIO
ARX[4,4]="@!"
ARX[4,8]="Domicilio del Service"
ARX[4,9]=.t.

* CAMPO CIUDAD
ARX[5,4]='MIX.TEXTO1'
ARX[5,6]='XSEEK(AGX[5],"MIX","CIUCOD")'
ARX[5,11]='ELICIU("del Service",arx[5,1],arx[5,2])'
ARX[5,12]='mix.nu1'
ARX[5,13]='last()=27'
ARX[5,15]=.t.

* CAMPO telefono
ARX[6,4]="@!"
ARX[6,8]="Tel‚fono del Service"

* CAMPO fax
ARX[7,4]="@!"
ARX[7,8]="Fax del Service"

* CAMPO detalle
ARX[8,4]="@!"
ARX[8,8]="Detalle"
ARX[8,9]=.t.

arx[9,16]=.t.
arx[10,16]=.t.

DO CASE
CASE BAR()=1
	ulpr='ISER'
	DO IGNT.SPR
        ARX[2,16]=.F.
	ARX[2,6]="!yaestaba(agx[2],'PER','SERCOD')"
	ARX[3,6]="!yaestaba(agx[3],'PER','SERVICE')"
	ON KEY LABEL Ctrl+F3 DO THELAST WITH 'PER','Base de Services',50,'SERCOD','CODIGO SERVICE','PROCOD','PROVEEDOR','DENOMINACION PROVEEDOR','PROVEEDOR'
	DO INGRESO WITH 'PER',ISERR,ISERC,ISERR+ISERLA,ISERC+ISERAN,'Ingreso Services','MSER()'
	ON KEY LABEL Ctrl+F3
CASE BAR()=2
STORE NUL TO RESPUESTA
IF ELISER("Service a Corregir",-1,1)
	ulpr='CSER'
        ARX[2,16]=.T.
	ARX[2,6]="!yaestaba(agx[2],'PER','SERCOD',.F.,.T.)"
	ARX[3,6]="!yaestaba(agx[3],'PER','SERVICE',.F.,.T.)"
	ON KEY LABEL Ctrl+F3 DO THELAST WITH 'PER','Base de Services',50,'SERCOD','CODIGO SERVICE','PROCOD','PROVEEDOR','DENOMINACION PROVEEDOR','PROVEEDOR'
	DO CORRIGE WITH 'PER',ISERR,ISERC,ISERR+ISERLA,ISERC+ISERAN,'Ingreso Services','MSER(.T.,24)'
	ON KEY LABEL Ctrl+F3
ENDIF	
CASE BAR()=4
	stor nul TO respuesta
	IF !EMPTY(eliSER(" a Borrar",-1,1))
		ULPR='BSER'
		DO BORRA WITH 'PER',MSERR,MSERC,MSERR+MSERLA,MSERC+MSERAN,'Borra SERveedores','MSER(.T.,COL1)','SERVICE'
	ENDIF
CASE BAR()=5
	SET DELE OFF
	SET FILTER TO DELETED()
	GOTO TOP
	IF !EOF()
		stor SERpop TO anterior
		stor .T. TO SERpop
		DO opSER
		stor nul TO respuesta
		IF !EMPTY(elISER(" a Recuperar",-1,1))
			ULPR='LLSER'
			DO RECUPERA WITH 'PER',MSERR,MSERC,MSERR+MSERLA,MSERC+MSERAN,'Recupera SERveedores','MSER(.T.,COL1)','SERVICE'
		ENDIF
		stor anterior TO SERpop
	ENDIF
	SET DELE ON
	SELE SER
	SET FILTER TO
CASE BAR()=8
	DO SERgrl WITH 12,20,'L¡mites del Listado'
	ON SELE POPU SERgrl DO lSER
	ACTI POPU SERgrl
	RELE POPU SERgrl
CASE BAR()=9
	DO SERgrl WITH 10,30,'L¡mites del Listado',.t.
	ON SELE POPU SERgrl DO lSER with .t.
	ACTI POPU SERgrl
	RELE POPU SERgrl
CASE BAR()=11
	=vgrl("SER"," SERVICES"," DE SERVICES")
CASE BAR()=13
	ulpr='XSER'
	DO rndx WITH 16,20
	ON SELE POPU rndx DO xSER
	ACTI POPU rndx
	RELE POPU rndx
ENDCASE
ulpr=PROGRAM()
=men_lin(botom)
UNLO ALL
RETURN
