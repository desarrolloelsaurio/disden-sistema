****************************************************************************
*-- Programa: mer.prg
*-- Fecha   : 06/05/91 03:21pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE PROCESOS DE FABRICACION
********************************************************************************
ulpr=PROGRAM()
=cabpan1()
SELE mer
SCAT TO AGX BLAN
LARGO=ALEN(AGX,1)

RELE ARX
DIME ARX[LARGO,18]

COL1=20

* CAMPO RUBRO
ARX[1,1]=1
ARX[1,2]=COL1
ARX[1,4]="RUB.RUBRO+'-'+ZERO(RUB.CODRUB,3)"
ARX[1,6]='XSEEK(STR(VAL(AGX[1])),"RUB","CODRUB")'
ARX[1,11]="ELIRUB('DEL PRODUCTO',1,COL1)"
ARX[1,12]="ZERO(RUB.CODRUB,3)"
ARX[1,13]="LAST()=27"

* CAMPO SUBRUBRO
ARX[2,1]=2
ARX[2,2]=COL1
ARX[2,4]="RUB.RUBRO+'-'+ZERO(RUB.CODSRUB,3)"
ARX[2,6]='XSEEK(STR(VAL(AGX[1]))+STR(VAL(AGX[2])),"RUB","TODOS")'
ARX[2,11]="!EMPTY(ELISRU1('DEL PRODUCTO',1,COL1,VAL(AGX[1])))"
ARX[2,12]="ZERO(RUB.CODSRUB,3)"
ARX[2,13]="LAST()=27"

* CAMPO ARTICULO
ARX[3,1]=3
ARX[3,2]=COL1
ARX[3,4]='@!'
ARX[3,5]=.T.
ARX[3,7]="CODIGO ARTICULO EXISTE"
ARX[3,8]="Ingrese C¢digo de Art¡culo"
ARX[3,9]=.t.
ARX[3,13]="last()=27 .or. empty(agx[3])"

* CAMPO MERCA (DESCRIPCION)
ARX[4,1]=4
ARX[4,2]=COL1
ARX[4,4]="@X"
ARX[4,5]=.T.
ARX[4,7]="DESCRIPCION EXISTENTE"
ARX[4,8]="Ingrese Descripci¢n del Producto"
ARX[4,9]=.t.
ARX[4,13]="last()=27 .or. empty(agx[4])"
ARX[4,15]=.t.

* CAMPO COLOR
ARX[5,1]=5
ARX[5,2]=COL1
ARX[5,4]="MIX.TEXTO1"
ARX[5,6]="XSEEK(AGX[5],'MIX','COLCOD')"
ARX[5,11]="ELICOL('',ARX[5,1],ARX[5,2])"
ARX[5,12]="LEFT(MIX.TEXTO2,2)"
ARX[5,13]="LAST()=27"
ARX[5,15]=.T.

* CAMPO MARCA
ARX[6,1]=6
ARX[6,2]=COL1
ARX[6,4]="MI1.TEXTO1"
ARX[6,6]="XSEEK(AGX[6],'MI1','MARCOD')"
ARX[6,11]="ELIMAR('',ARX[6,1],ARX[6,2])"
ARX[6,12]="LEFT(MI1.TEXTO2,2)"
ARX[6,13]="LAST()=27"
ARX[6,15]=.T.

* CAMPO LINEA
ARX[7,1]=7
ARX[7,2]=COL1
ARX[7,4]="MIX.TEXTO1"
ARX[7,6]="XSEEK(AGX[7],'MIX','LINCOD')"
ARX[7,11]="ELILIN('',ARX[5,1],ARX[5,2])"
ARX[7,12]="LEFT(MIX.TEXTO2,2)"
ARX[7,13]="LAST()=27"
ARX[7,15]=.T.

* CAMPO PROVEEDOR1
ARX[8,1]=9
ARX[8,2]=COL1
ARX[8,4]="PRO.PROVEEDOR"
ARX[8,6]="XSEEK(AGX[8],'PRO','PROCOD')"
ARX[8,11]="ELIPRO('',ARX[8,1],ARX[8,2])"
ARX[8,12]="PRO.PROCOD"
ARX[8,13]="LAST()=27"
ARX[8,15]=.T.

* CAMPO PROVEEDOR2
ARX[9,1]=10
ARX[9,2]=COL1
ARX[9,4]="PRO.PROVEEDOR"
ARX[9,6]="XSEEK(AGX[9],'PRO','PROCOD')"
ARX[9,11]="ELIPRO('',ARX[9,1],ARX[9,2])"
ARX[9,12]="IIF(AGX[8]#PRO.PROCOD,PRO.PROCOD,'')"

* CAMPO PROVEEDOR3
ARX[10,1]=11
ARX[10,2]=COL1
ARX[10,4]="PRO.PROVEEDOR"
ARX[10,6]="XSEEK(AGX[10],'PRO','PROCOD')"
ARX[10,11]="ELIPRO('',ARX[10,1],ARX[10,2])"
ARX[10,12]="IIF(AGX[9]#PRO.PROCOD .AND. AGX[8]#PRO.PROCOD,PRO.PROCOD,'')"

* CAMPO MATERIAL
ARX[11,1]=13
ARX[11,2]=COL1
ARX[11,4]="MIX.TEXTO1"
ARX[11,6]="XSEEK(AGX[11],'MIX','MATCOD')"
ARX[11,11]="ELIMAT('',ARX[11,1],ARX[11,2])"
ARX[11,12]="LEFT(MIX.TEXTO2,2)"
ARX[11,13]="LAST()=27"
ARX[11,15]=.T.

* CAMPO GRUPO DE COMPRAS
ARX[12,1]=14
ARX[12,2]=COL1
ARX[12,4]="MIX.TEXTO1"
ARX[12,6]="XSEEK(AGX[12],'MIX','GRUCOD')"
ARX[12,11]="ELIGRU('',ARX[11,1],ARX[11,2])"
ARX[12,12]="LEFT(MIX.TEXTO2,2)"
ARX[12,13]="LAST()=27"
ARX[12,15]=.T.

* OTROS
for xa= 13 to 27
	ARX[xa,16]=.T.
next

* CAMPO NACIONAL
ARX[14,1]=15
ARX[14,2]=COL1
ARX[14,4]="@M SI,NO"
ARX[14,8]="Mercader¡a Nacional"
ARX[14,9]=.T.
ARX[14,12]="AGX[14]='SI'"
ARX[14,13]="LAST()=27"
ARX[14,15]=.T.
ARX[14,16]=.f.

DO CASE
CASE BAR()=1
	ULPR='IMER'
    ARX[3,6]="!YAESTABA(AGX[3],'MER','ARTICULO')"
    ARX[4,6]="!YAESTABA(AGX[4],'MER','MERCA')"
   ON KEY LABEL Ctrl+F3 DO THELAST WITH 'MER','Base de Mercader¡as',30,'articulo','ARTICULO','ARTICULO'
   DO INGRESO WITH 'MER',IMERR,IMERC,IMERR+IMERLA,IMERC+IMERAN,'Ingreso Mercader¡a','MMER()'
   ON KEY LABEL Ctrl+F3
CASE BAR()=2
	RESPUESTA='nada#6#45#Tipo de Correcci¢n#3#\<Todo el Producto#\<Rubro#\<Proveedores#\<Marcas'
	=DEFPOP()
    ON SELE POPU NADA DO CMER
	ACTI popu nada
	rele popu nada
CASE BAR()=4
    ttque=''
    fisc=grl2(' L¡mites del Borrado ')
    if fisc#'.F.'
       =popcarte('Borra Mercader¡as'+ttque)
       if confirma("Borrar el Rango Seleccionado",.t.,10,10)
          do bmer
       endif
       =RELEWIN("POPCARTE")
    endif
CASE BAR()=5
    ttque=''
    fisc=grl2(' L¡mites de la Recuperaci¢n')
    if fisc#'.F.'
       =popcarte('Recupera Mercader¡as'+ttque)
       if confirma("Recuperar el Rango Seleccionado",.t.,10,10)
          do llmer
       endif
       =RELEWIN("POPCARTE")
    endif
CASE BAR()=8
  DO LMER
CASE BAR()=9
  DO LMER WITH .T.
CASE BAR()=11
   =VGRL("MER"," MERCADERIAS"," DE MERCADERIAS")
CASE BAR()=13
	ulpr='Xmer'
	DO rndx WITH 16,20
	ON SELE POPU rndx DO xmer
	ACTI POPU rndx
	RELE POPU rndx
ENDCASE
ulpr=PROGRAM()
=MEN_LIN(BOTOM)
UNLO ALL
RETURN
