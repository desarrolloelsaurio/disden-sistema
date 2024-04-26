********************************************************************************
*-- Programa: VAR.prg
*-- Fecha   : 05-15-92 05:31pm
*-- Version : E. BANALOTTI
*-- Notas   : DERIVA A OPERACIONES DE VARIEDADES
*-- Modificaci¢n GOYO 05-25-92 04:18pm
*****************************************************************************
ulpr=PROGRAM()
=cabpan1()
SELE mix
DIME MENSAJE[9],OTROS[7],TEXTO[2,9]
MENSAJE[1]=" Ingreso Variedades - " && ME1
MENSAJE[2]=" Ingreso Variedades "   && TITULO DE LA VENTANA
MENSAJE[3]="VARIEDAD "
MENSAJE[4]="CODIGO VARIEDAD "

OTROS[1]="VARTEX" && INDICE AL COMENZAR
OTROS[2]=17
OTROS[7]='V'

TEXTO[1,1]='VARIEDAD' && SAY DEL GET
TEXTO[1,2]=3           && COLOR SCHEME
TEXTO[1,3]='@!'        && PICTURE
TEXTO[1,4]='M.TEXTO1'  && CAMPO A buscar en xseek
TEXTO[1,5]='VARTEX'    && ORDER TAG DE BUSQUEDA
TEXTO[1,9]=20          && ANCHO PARA LOS LISTADOS

TEXTO[2,1]='CODIGO   ' && SAY DEL GET
TEXTO[2,2]=3           && COLOR SCHEME
TEXTO[2,3]='!!'        && PICTURE
TEXTO[2,4]='LEFT(M.TEXTO2,2)'  && CAMPO A buscar en xseek
TEXTO[2,5]='VARCOD'    && ORDER TAG DE BUSQUEDA
TEXTO[2,9]=2           && ANCHO PARA LOS LISTADOS
DO CASE
CASE BAR()=1
ULPR='IVAR'
OTROS[3]=IVARR
OTROS[4]=IVARC
OTROS[5]=IVARR+IVARLA
OTROS[6]=IVARC+IVARAN
TEXTO[1,6]=.T.         && ISALPHA
TEXTO[1,7]=.F.        && UPDATE()
TEXTO[1,8]=.F.        && ES VACIO
TEXTO[2,6]=.F.         && ISALPHA
TEXTO[2,7]=.F.        && UPDATE()
TEXTO[2,8]=.F.        && ES VACIO
=IMIX(@MENSAJE,@TEXTO,@OTROS)
CASE BAR()=2
stor nul TO respuesta
IF !EMPTY(eliVAR(" a Corregir",-1,1))
OTROS[3]=CVARR
OTROS[4]=CVARC
OTROS[5]=CVARR+CVARLA
OTROS[6]=CVARC+CVARAN
MENSAJE[5]=" Correcci¢n Variedad - "
MENSAJE[6]=" Correcci¢n Variedad "
TEXTO[1,6]=.T.         && ISALPHA
TEXTO[1,7]=.T.        && UPDATE()
TEXTO[1,8]=.F.        && ES VACIO
TEXTO[2,6]=.F.         && ISALPHA
TEXTO[2,7]=.T.        && UPDATE()
TEXTO[2,8]=.F.        && ES VACIO
=CMIX(@MENSAJE,@TEXTO,@OTROS)
ENDIF
CASE BAR()=4
stor nul TO respuesta
IF !EMPTY(eliVAR(" a Borrar",-1,1))
      OTROS[3]=MVARR
      OTROS[4]=MVARC
      OTROS[5]=MVARR+MVARLA
      OTROS[6]=MVARC+MVARAN
      MENSAJE[5]=" Borra Variedad "
DO bmix
ENDIF
CASE BAR()=5
SET DELE OFF
SET FILTER TO DELETED()
GOTO TOP
IF !EOF()
stor VARpop TO anterior
stor .T. TO VARpop
DO opVAR
stor nul TO respuesta
IF !EMPTY(eliVAR(" a Recuperar",-1,1))
      OTROS[3]=MVARR
      OTROS[4]=MVARC
      OTROS[5]=MVARR+MVARLA
      OTROS[6]=MVARC+MVARAN
      MENSAJE[5]=" Recupera Variedad "
DO llmix
ENDIF
stor anterior TO VARpop
DO opVAR
ENDIF
SET DELE ON
SELE mix
SET FILTER TO
CASE BAR()=6
DO rmix
CASE BAR()=8
MENSAJE[7]="VARIEDAD"
MENSAJE[8]="COD VARIEDAD"
MENSAJE[9]="Listado de Variedades"
OTROS[6]='ORDVAR'
DO lmixi
CASE BAR()=9
MENSAJE[7]="VARIEDAD"
MENSAJE[8]="COD VARIEDAD"
MENSAJE[9]="Listado de Variedades"
OTROS[6]='ORDVAR'
DO lmixp
CASE BAR()=11
      OTROS[3]=VVARR
      OTROS[4]=VVARC
      OTROS[5]=VVARR+VVARLA
      OTROS[6]=VVARC+VVARAN
   MENSAJE[7]=" VARIEDAD"
   MENSAJE[8]=" DE VARIEDADES"
   MENSAJE[9]="VAR"
DO vmix
CASE BAR()=13
ulpr='XVAR'
DO rndx1 WITH 16,20
ON SELE POPU rndx DO xmix
ACTI POPU rndx
RELE POPU rndx
ENDCASE
ulpr=PROGRAM()
=MEN_LIN(BOTOM)
UNLO ALL
RETURN
*: EOF: VAR.PRG
