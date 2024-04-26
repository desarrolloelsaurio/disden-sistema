********************************************************************************
*-- Programa: PRO.prg
*-- Fecha   : 03-31-92 11:06am
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE PROVEEDORES
*-- Modificaci¢n GOYO 09-10-92 06:33pm (probes)
********************************************************************************
ulpr=PROGRAM()
=cabpan1()
sele pro
SCAT TO AGX BLAN
LARGO=ALEN(AGX,1)
RELE ARX
DIME ARX[LARGO,18]
COL1=24
for xa = 1 to 15
   arx[xa,1]=xa
   arx[xa,2]=col1
next
* campo PROCOD       C   (10)
ARX[1,4]='@!'
ARX[1,5]=.t.
ARX[1,7]="CODIGO EXISTENTE"
ARX[1,8]='C¢digo de Proveedor - [ESC] para Men£ - [Ctrl+F3] para Informaci¢n'
ARX[1,9]=.t.
ARX[1,13]="last()=27 .or. empty(agx[1])"
* campo PROVEEDOR    C    (30)
ARX[2,4]='@X'
ARX[2,5]=.t.
ARX[2,7]="PROVEEDOR EXISTE"
ARX[2,8]="Nombre o Raz¢n Social del Proveedor"
ARX[2,9]=.t.
ARX[2,13]="last()=27 .or. empty(agx[2])"
* campo ENCVENTAS    C    (30)
ARX[3,4]="@X"
ARX[3,8]="Encargado o Gerente de Ventas"
* campo VIAJANTE     C    (30)
ARX[4,4]="@X"
ARX[4,8]="Viajante o Agente de Ventas"
* campo DOMICILIO    C    (40)
ARX[5,4]="@X"
ARX[5,8]="Viajante o Agente de Ventas"
ARX[5,9]=.T.
* campo LOCALIDAD    N    (4)
ARX[6,4]="MIX.TEXTO1"
ARX[6,6]="XSEEK(AGX[6],'MIX','CIUCOD')"
ARX[6,8]='Ciudad -'+tecmod
ARX[6,11]="ELICIU('',AGX[6,1],AGX[6,2])"
ARX[6,12]="MIX.NU1"
ARX[6,15]=.T.
* campo PAIS         C    (2)
ARX[7,4]="MIX.TEXTO1"
ARX[7,6]="XSEEK(AGX[7],'MIX','PAICOD')"
ARX[7,8]='Pa¡s -'+tecmod
ARX[7,11]="ELIPAI('',AGX[7,1],AGX[7,2])"
ARX[7,12]="LEFT(MIX.TEXTO2,2)"
ARX[7,15]=.T.
* campo TELEFONO     C    (30)
ARX[8,4]="@X"
ARX[8,8]="Tel‚fonos del Proveedor"
* campo FAX          C    (12)
ARX[9,4]="@X"
ARX[9,8]="Fax del Proveedor"
* campo DETALLE      C    (30)
ARX[10,4]="@X"
ARX[10,8]="Detalle del Proveedor"
ARX[10,9]=.T.
* campo CONDIVA      n    (2)
ARX[11,4]="xaciva[agx[11],1]"
ARX[11,6]=".T."
ARX[11,8]='Condicion de I.V.A. -'+tecmod
ARX[11,11]="!EMPTY(ELIiva('',ARX[11,1],ARX[11,2]))"
ARX[11,12]="respuesta"
ARX[11,15]=.T.
* campo NROIVA       C    (15)
ARX[12,4]="@X"
ARX[12,8]="N§ de C.U.I.T."
* campo COEF         N    (12,6)
ARX[13,4]="99999.999999"
ARX[13,8]="Coeficiente del Proveedor"
* campo DESC         C    (20)
ARX[14,4]="@X"
ARX[14,8]="Coeficiente del Proveedor"
ARX[14,9]=.T.
* campo COEFRES      N    (12,06)
ARX[15,4]="99999.999999"
ARX[15,5]=.T.
ARX[15,12]="qdes(agx[14])*agx[13]"
ARX[15,18]=.t.
FOR XA=15 TO 18
   ARX[XA,16]=.T.
NEXT
DO CASE
CASE BAR()=1
   ulpr='IPRO'
   ARX[1,6]="!yaestaba(agx[1],'pro','procod')"
   ARX[2,6]="!yaestaba(agx[2],'pro','proveedor')"
   ON KEY LABEL Ctrl+F3 DO THELAST WITH 'PRO','Base de Proveedores',50,'procod','CODIGO PROVEEDOR','PROCOD','PROVEEDOR','DENOMINACION PROVEEDOR','PROVEEDOR'
   DO INGRESO WITH 'PRO',IPROR,IPROC,IPROR+IPROLA,IPROC+IPROAN,'Ingreso Proveedores','MPRO()'
   ON KEY LABEL Ctrl+F3
CASE BAR()=2
	RESPUESTA='nada#6#40#Tipo de Correcci¢n#3#\<Todo el Registro#\<I.V.A.#\<Descuentos'
	=DEFPOP()
	ON SELE popu nada DO cpro
	ACTI popu nada
	rele popu nada
CASE BAR()=4
   stor nul TO respuesta
   IF !EMPTY(elipro(" a Borrar",-1,1))
   ULPR='BPRO'
      DO BORRA WITH 'PRO',MPROR,MPROC,MPROR+MPROLA,MPROC+MPROAN,'Borra Proveedores','MPRO(.T.,COL1)','Proveedor'
   ENDIF
CASE BAR()=5
   SET DELE OFF
   SET FILTER TO DELETED()
   GOTO TOP
   IF !EOF()
      stor propop TO anterior
      stor .T. TO propop
      =OPPRO()
      stor nul TO respuesta
      IF !EMPTY(elIPRO(" a Recuperar",-1,1))
      ULPR='LLPRO'
      DO RECUPERA WITH 'PRO',MPROR,MPROC,MPROR+MPROLA,MPROC+MPROAN,'Recupera Proveedores','MPRO(.T.,COL1)','Proveedor'
      ENDIF
      stor anterior TO propop
   ENDIF
   SET DELE ON
   SELE pro
   SET FILTER TO
CASE BAR()=8
   DO progrl WITH 12,20,'L¡mites del Listado'
   ON SELE POPU progrl DO lpro
   ACTI POPU progrl
   RELE POPU progrl
CASE BAR()=9
   DO progrl WITH 10,30,'L¡mites del Listado',.t.
   ON SELE POPU progrl DO lpro with .t.
   ACTI POPU progrl
   RELE POPU progrl
CASE BAR()=11
   =vgrl("PRO"," "+upper(probe)," DE "+upper(probes))
CASE BAR()=13
   ulpr='XPRO'
   DO rndx WITH 16,20
   ON SELE POPU rndx DO xpro
   ACTI POPU rndx
   RELE POPU rndx
ENDCASE
ulpr=PROGRAM()
=men_lin(botom)
UNLO ALL
RETURN
