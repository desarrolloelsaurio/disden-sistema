* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : BALANC51.PRG                                             บ
* บ COMENTARIO    : MAIN IMPRESION PARA BALANCE GENERAL                      บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 10-16-93                                                    บ
* บ HORA       : 07:40:07pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION BALANC51
PARAMETER ANTERIOR,IMPRESORA,PARNUM,TOTALIN
EXTERNAL ARRAY PAR, TTL, TTR
IF !EMPTY(NIVEL)
   IF MILES#INT(CODIGO/10^7)
      MILES=INT(CODIGO/10^7)
      =BALANC52()
      IF IMPRESORA
         C=C+2
         DO EJEPAG WITH PARNUM,.T.
      ELSE
         C=TECLA(24,.F.,'<F> FIN')
         IF C=70 .OR. C=102
            RETURN .T.
         ENDIF
      store NPAG+1 to NPAG
      store 1 to C
      DO TIT5
      ENDIF
   ENDIF
   STORE 0 TO PAR
   IF ANTERIOR
      MISPAR=BAL1.DEBE0-BAL1.HABER0
   ELSE
      MISPAR=SUMPER()
   ENDIF
   IF !EMPTY(MISPAR)
      ? IIF(IMPRESORA,PAIPD,"")
      ?? STR(CODIGO,8)
      ?? IIF(IMPRESORA,PAIP2," ")
      STORE IIF(IMPUTABLE="I",5,NIVEL) TO INDICA
      IF IMPRESORA
         SPC1=INDICA-1
         SPC2=6-INDICA
         ?? SPACE(SPC1)
         ?? NOMBRE
         ?? SPACE(SPC2)
      ELSE
         ?? LEFT(NOMBRE,13)
         ?? " "
      ENDIF
      STORE MISPAR TO PAR[INDICA]
      =SAYPTR(2,.T.,!IMPRESORA)
      store C+1 to C
      if C>TOTALIN .OR. ;
				(IMPRESORA .AND. _PLINENO>66)
         IF IMPRESORA
            DO EJEPAG WITH PARNUM,.F.
         ELSE
            ? REPL("-",79)
            ? " SUBTOTALES            "
            =SAYPTR(3,.T.,.T.)
            C=TECLA(24,.F.,'<F> FIN')
            IF C=70 .OR. C=102
               RETURN .T.
            ENDIF
         STORE NPAG+1 TO NPAG
         STORE 1 TO C
         DO TIT5
         ENDIF
      ENDIF
   ENDIF
ENDIF
RETURN .F.
