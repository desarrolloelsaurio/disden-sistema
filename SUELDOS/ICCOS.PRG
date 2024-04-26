******************************************
*-- Programa: ICCOS.PRG
*-- Fecha   : 25/10/90 /  0:10:20
*-- Version : G. REINER - GENERADOR
*-- Notas   : INGRESA CENTROS DE COSTOS
******************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DEFINE WINDOW win FROM 6,15 TO 12,57 TITL " Ingreso Centro de Costos " SHAD COLOR SCHE 8
SELE ccos
me1=" Ingreso Centro de Costos "
DO WHILE .T.
   faund=.F.
   ACTI WIND win
   SCATTER MEMVAR BLANK
   @ 1,1 SAY "CENTRO DE COSTOS" COLOR SCHE 3
   @ 2,1 SAY "IDENTIFICACION" COLOR SCHE 3
   @ 3,1 SAY "EMPRESA" COLOR SCHE 3
   @ 1,20 GET m.cencos;
      PICTURE "XXXXXXXXXXXXXXXXXXX";
      MESS me1+"- [ENTER] para Men£"
   READ
   IF ISALPHA(ALLTRIM(m.cencos))
      m.cencos=PROPER(m.cencos)
      @ 2,1 SAY "IDENTIFICACION" COLOR SCHE 3
      @ 2,20 GET m.idcencos;
         PICTURE "XXXXXXXXXX";
         MESS me1+"- Identificaci¢n o C¢digo"
      READ
      m.idcencos=UPPER(m.idcencos)
      respuesta=0
      ACTI SCREEN
      DO WHILE elijn('Del Centro de Costos '+ALLTRIM(m.cencos))=0
      ENDDO
      GOTO respuesta
      ACTI WINDOW win
      @ 3,20 GET jan.empresa
      CLEAR GETS
      m.empresa=respuesta
      SELE ccos
      SET DELE OFF
      SEEK ALLTRIM(m.cencos)
      SET DELE ON
      IF FOUND() .AND. ccos.empresa=m.empresa
         faund=.T.
         txt=' CENTRO DE COSTOS '
      ELSE
         SCAN
            IF ccos.idcencos=m.idcencos .AND. ccos.empresa=m.empresa
               faund=.T.
               txt=' IDENTIFICACION '
               EXIT
            ENDIF
         ENDSCAN
      ENDIF
      IF .NOT. faund
         SELECT ccos
         APPEND BLANK
         GATHER MEMVAR
      ELSE
         ACTI SCREEN
         @ 24,0 SAY PADC(LTRIM(txt)+ALLTRIM(m.cencos)+' existe - Enter para continuar',80,' ')
         ACTI WIND win
         DO existe WITH RTRIM(txt)
         =INKEY(0)
         CLEA
      ENDIF
   ELSE
      EXIT
   ENDIF
   CLEAR
ENDDO
RELE WIND win
RELE cencos,idcencos,empresa,me1,faund
@ 24,0 SAY SPACE(80)
RETURN
