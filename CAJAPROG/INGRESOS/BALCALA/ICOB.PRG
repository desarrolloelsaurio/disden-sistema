*******************************************************************************
*-- Programa: ICOB.PRG
*-- Fecha   : 04-12-92 11:42am
*-- Version : G. REINER
*-- Notas   : INGRESA COBROS
********************************************************************************
PARAMETER ENCUOTAS
ULPR=hora_ulp(PROGRAM())
IF CHEQSEG()
   VEZ=1
   DO WHILE .T.
      STORE NUL TO RESPUESTA
      IF !empty(ELIEMP("a Ingresar",-1,1))
         =OPCCL() WITH JANNRO
         =OPFAC() WITH JANNRO
         DO OPCAJ WITH JANNRO
         DO OPCCH WITH JANNRO
         DO WHILE .T.
            STORE NUL TO RESPUESTA
            IF ELICLI("",-1,1)
               =icob_1()
            ELSE
               EXIT
            ENDIF
         ENDDO
      ELSE
         EXIT
      ENDIF
      UNLO ALL
      IF CANT_EMPRE=1
         EXIT
      ENDIF
   ENDDO
ELSE
   =Iaudi()
ENDIF
=MEN_LIN(BOTOM)
RETURN
