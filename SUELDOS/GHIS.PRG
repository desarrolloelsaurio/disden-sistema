********************************************************************************
*-- Programa: ghis.prg
*-- Fecha   : 01/13/91 10:31pm
*-- Version : G. REINER
*-- Notas   : genera archivo historico
********************************************************************************
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
ulpr=PROGRAM()
DEFINE WINDOW win FROM 8,0 TO 16,77 DOUBLE TITL ' Genera Archivo Hist¢rico ' SHAD COLOR SCHE 8
ACTI WINDOW win
@ 1,10 SAY "EMPRESA :" GET janname
CLEAR GETS
@ 3,10 SAY "MES     :" GET mesaliq MESS "Mes a Mandar a Hist¢rico"
@ 3,40 SAY "QUINCENA:" GET quialiq MESS "Quincena a Mandar a Hist¢rico"
READ
IF LASTKEY()<>27
   STORE "NO" TO respuesta
   @ 5,10 SAY "Confirma ? " GET respuesta PICTURE "@M NO,SI"
   READ
   IF LASTKEY()<>27 .AND. respuesta='SI'
      CLEA
      STORE SPACE(20) TO nada
      @ 4,10 SAY 'Conceptos que pasan a Hist¢rico ' GET nada PICTURE "@M Todos,S¢lo Hs. Trab"
      READ
      IF LASTKEY()<>27
         ACTI SCRE
         DO opsue
         @ 24,0 SAY PADC(" Copiando la Liquidaci¢n ",80,"*") COLOR SCHE 19
         DELE FOR mes=mesaliq .AND. quincena=quialiq
         PACK
         DO ophis
         DELE FOR QUINCENA=QUIALIQ .AND. MES=MESALIQ
         PACK
         DO opliq
         SELE liq
         SCAN FOR liq->monto<>0
            IF nada='T' .OR. archivo='THOR'
               SCATTER MEMVAR
               SELE his
               APPE BLAN
               GATHER MEMVAR
               REPL quincena WITH quialiq
               REPL mes WITH mesaliq
               REPL his->fechaliq WITH m->fechaliq
               SELE liq
            ENDIF
         ENDSCAN
      ENDIF
   ENDIF
ENDIF
RELE WIND win
RELE nada
SELE liq
REINDEX
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: GHIS.PRG
