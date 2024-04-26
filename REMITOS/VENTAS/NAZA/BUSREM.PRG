*-- Modificaci¢n 07-22-92 07:51pm GOYO marca->empresa
FUNCTION BUSREM
PARAMETER NADA
SELE rex
STOR 25 TO COL
=MOVEwin(iremr,iremc,iremr+5,iremc+50,'WIN'," Datos del Remito ")
ACTI WIND win
@ 1,2 SAY "NUMERO DE REMITO" COLO SCHE 3
@ 2,2 SAY "EMPRESA         " COLO SCHE 3
@ 1,COL GET nurem PICT "9999999999";
  MESS "Ingrese N§ de Remito - [ENTER] para Men£"
READ
IF !EMPTY(nurem)
   STORE SPACE(20) TO nada
   @ 2,COL GET nada ;
     MESS "Ingrese la Marca - [ESC] para Men£"
   CLEAR GETS
   STORE 0 TO respuesta
   t1="EL REMITO Nro. "+ALLTRIM(STR(nurem))
   IF !EMPTY(ELIEMP(" del Remito",2,COL))
      numarca=1
      nada=mix.texto1
      ACTI WIND win
      @ 2,COL GET nada
      CLEAR GETS
      =RELEWIN("WIN")
      RETURN XSEEK(M.NUREM,'REM','REMITO') .AND. EMPTY(REM.FACTURADO)
   ELSE
      =relewin("WIN")
      RETURN .F.
   ENDIF
ELSE
   =relewin("WIN")
   RETURN .F.
ENDIF
RETURN .F.
