* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : BALANCE4.PRG                                             บ
* บ COMENTARIO    : BALANCE GENERAL POR IMPRESORA                            บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 10-16-93                                                    บ
* บ HORA       : 07:59:33pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
STORE "BALANCE POR IMPRESORA" TO TITULO
IF HAYCUE()
   STORE 0 TO MNIV,MES,MES2,INICIO,FINAL,PERINI,PERFIN
   STORE " " TO AP,TR,FISC,FISC1
   STORE 1 TO ARRASANIO,ARRASMES,MLIM
   IF LISBAL("BALANCE POR IMPRESORA",.T.,.T.,.T.)
      RELEASE PAR, TTL, TTR
      DECLARE PAR[8], TTL[8] , TTR[8]
      STORE 0 TO TTL, TTR
      ********** NUMERO DE PAGINA - SETEO Y TESTEO IMPRESORA
      STORE 1 TO NPAG
      STORE " " TO RES
      IF CONFIRM1("El Listado")
         SET CONSOLE OFF
         DO TEST_IMP
				 DO CABPRI
         STORE 1 TO C,NPAG
         STORE 0 TO DPAR,HPAR,DFIN,HFIN,T1,T2,T3,T4
         STORE .F. TO IMPRIMIR,ACUMULO
         STORE 0 TO ANTERIOR,MAXNIV
         IF MAXNIV(INICIO,FINAL)>4
            DO BALANC48
         ELSE
            DO BALANC41
         ENDIF
      ENDIF
   ENDIF
ENDIF
=MEN_LIN(SYSNOMBRE)
RETURN
