********************************************************************************
*-- Programa: Mrem.prg
*-- Fecha   : 07/25/91 07:56pm
*-- Version : G. REINER
*-- Notas   : muestra remito
********************************************************************************
ACCION=ON("KEY","TAB")
ON KEY LABEL TAB
STORE HORA_ulp(program()) to ulpr
if cheqseg()
   =MOVEWIN(4,1,21,79,"WIN3",' Datos de Env║o y Recepci╒n ')
   @ 1,1 SAY "REMITO" COLO SCHE 3
   @ 1,40 SAY "O CORTE" COLO SCHE 3   
   @ 2,1 SAY "FECHA" COLO SCHE 3
   @ 3,1 SAY "TALLER" COLO SCHE 3
   @ 2,40 SAY "PROCESO" COLO SCHE 3
   @ 1,15 get rem.remito
   @ 1,50 get rem.NUMOT
   @ 2,15 get rem.fechaop
   @ 3,15 get PER.CLIENTE
   clea gets
   SELE FAX
   SET ORDER TO TAG REMITO
   IF SEEK(REM.REMITO)
      @ 2,50 SAY LEFT(SAYGRL(FAX.PRC,"PRC","PRCCOD","PRC.PROCFAB"),25)            
      SCAT MEMV
      @ 4,0 say  "        здддддддддддддддддддддддддддддддддбддддддддддддддддддддддддддддддддд©"
      @ 5,0 say  "        Ё         ENTRADA A TALLER        Ё        SALIDA DE TALLER         Ё"
      @ 6,0 say  "        цдддддддддддддддддддддддддддддддддеддддддддддддддддддддддддддддддддд╢"
      @ 7,0 say  "        ЁFECHA         :                  ЁFECHA         :                  Ё"
      @ 8,0 say  "        ЁHORA          :                  ЁHORA          :                  Ё"
      @ 9,0 say  "        цдддддддддддддддбдддддддддддддддддедддддддддддддддбддддддддддддддддд╢"
      @ 10,0 say "        Ё    ENTREGA    Ё     RECIBE      Ё    ENTREGA    Ё     RECIBE      Ё"
      @ 11,0 say "здддддддедддддддддддддддедддддддддддддддддедддддддддддддддеддддддддддддддддд╢"
      @ 12,0 say "ЁCANTID:Ё               Ё                 Ё               Ё                 Ё"
      @ 13,0 say "цдддддддедддддддддддддддедддддддддддддддддедддддддддддддддеддддддддддддддддд╢"
      @ 14,0 say "ЁRESPONSЁ               Ё                 Ё               Ё                 Ё"
      @ 15,0 say "юдддддддадддддддддддддддадддддддддддддддддадддддддддддддддаддддддддддддддддды"
      @ 7,26 GET M.EF
      @ 8,26 GET M.EH pict '99:99'
      @ 12,12 GET M.EEC pict '99999999'
      @ 14,12 GET M.EER  pict "@!"
      @ 12,28 GET M.ESC pict '99999999'
      @ 14,28 GET M.ESR pict "@!"
      @ 7,60 GET M.SF
      @ 8,60 GET M.SH pict '99:99'
      @ 12,44 GET M.SEC pict '99999999'
      @ 14,44 GET M.SER pict "@!"
      @ 12,62 GET M.SSC pict '99999999'
      @ 14,62 GET M.SSR pict "@!"
      CLEA GETS
      =INKEY(NUL,'HM')
   ENDIF
   =RELEWIN("WIN3")
ELSE
   =IAUDI()
ENDIF
ON KEY LABEL TAB &ACCION
RETURN
