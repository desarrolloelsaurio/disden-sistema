********************************************************************************
*-- Programa: busrem.prg
*-- Fecha   : 05-01-92 06:06pm
*-- Version : G. REINER
*-- Notas   : ANULA REMITOS EMITIDOS Y NO FACTURADOS
*-- Modificaci¢n 05-01-92 06:06pm
*-- VERSION BALCALA
*-- Modificaci¢n 07-22-92 07:51pm GOYO marca->empresa
********************************************************************************
FUNCTION BUSREM
parameter hayemp
private hayemp
=MOVEWIN(iremr,iremc,iremr+6,iremc+50,'WIN'," Datos del Remito ")
STOR 25 TO COL
@ 1,2 SAY "NUMERO DE REMITO" COLO SCHE 3
@ 2,2 SAY "EMPRESA         " COLO SCHE 3
@ 3,2 say "TIPO            " COLO SCHE 3
if hayemp
   @ 2,col get janname
   nada=iif(ulpr='QUERYRIM',UPPER(BIAJAS),'CLIENTES')
   @ 3,col get NADA
   CLEA GETS
endif
@ 1,COL GET nurem PICT "9999999999";
  MESS "Ingrese N§ de Remito - [ENTER] para Men£"
READ
IF !EMPTY(nurem)
   if hayemp
      SELE REM
      =RELEWIN("WIN")
      RETURN SEEK(NUREM)
   else
      STORE SPACE(20) TO nada
      @ 2,COL GET nada ;
        MESS "Ingrese la Marca - [ESC] para Men£"
      CLEAR GETS
      STORE NUL TO respuesta
      t1="EL REMITO Nro. "+ALLTRIM(STR(nurem))
      IF !EMPTY(ELIEMP(" del Remito",2,COL))
         NADA=MIX.TEXTO1
         @ 2,COL GET nada
         STORE 'CLIENTES' TO NADA
         CLEAR GETS
         @ 3,COL GET NADA PICT '@M CLIENTES,'+UPPER(BIAJAS)
         if ulpr="FACR"
            CLEA GETS
         ELSE
            READ
         ENDIF
         IF LAST()#27
            IF LEFT(NADA,1)='C'
               DO OPREM WITH JANNRO
               =OPMER() WITH JANNRO
               TIPO='C'
            ELSE
               DO OPREI WITH JANNRO
               =OPMER() WITH JANNRO
               TIPO='V'
            ENDIF
            SELE REM
            =RELEWIN("WIN")
            RETURN SEEK(NUREM)
         ELSE
            =relewin("win")
            RETURN .F.
         ENDIF
      ELSE
         =relewin("WIN")
         RETURN(.F.)
      ENDIF
   endif
ELSE
   =relewin("WIN")
   RETURN(.F.)
ENDIF
RETURN .F.
