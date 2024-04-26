********************************************************************************
*-- Programa: chliq.prg
*-- Fecha   : 01/19/91 01:40am
*-- Version : G. REINER
*-- Notas   : chequea repetici¢n de conceptos en archivo de liquidaci¢n
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
STORE .F. TO hizo
SELE liq
GOTO TOP
SCATTER TO uno
recu=RECNO()
tres=0
SCAN FOR filtcon<70
   @ 0,46 SAY RECNO()
   IF tres=1
      SCATTER TO dos
      IF uno[2]=dos[2] .AND. uno[4]=dos[4] .AND. uno[5]=dos[5]
         recd=RECNO()
         DELE RECO MIN(recu,recd)
         GOTO recd
         STORE .T. TO hizo
      ENDIF
      SCATTER TO uno
      recu=RECNO()
   ELSE
      tres=1
   ENDIF
ENDSCAN
DELE FOR registro<1
PACK
RELE uno,dos,hizo,tres,recu,recd
RETURN
