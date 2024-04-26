********************************************************************************
*-- Programa: ACTCHE.PRG
*-- Fecha   : 05/12/91 05:05pm
*-- Version : G. REINER
*-- Notas   : ACTUALIZA DATOS DE LOS CHEQUES
********************************************************************************
ULPR=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') color i
DEFINE WINDOW win FROM 9,7 TO 17,76 TITL ' Datos de los Cheques ' DOUBLE SHAD COLOR SCHE 8
ACTI WINDOW win
STORE SPACE(30) TO CHEBA
STORE 'SI' TO CHENO
STORE 0 TO CHENU
STORE DATE() TO CHEFE
@ 1,1 SAY 'BANCO EMISOR             ' COLOR SCHE 3
@ 2,1 SAY 'NUMERO DE CHEQUE INICIAL ' COLOR SCHE 3
@ 3,1 SAY 'CHEQUES AL PORTADOR ?    ' COLOR SCHE 3
@ 4,1 SAY 'TABULADOR                ' COLOR SCHE 3
@ 5,1 SAY 'FECHA DE EMISION         ' COLOR SCHE 3
@ 1,26 GET m->CHEBA PICTURE '@M Comercial Israelita,Municipal de Rosario,Coinag,Provincial de Sta Fe' MESS 'Ingrese el Banco Correspondiente'
@ 2,26 GET m->chenu PICTURE '99999999' MESS 'Ingrese el N£mero del Pr¢ximo Cheque a Emitir'
@ 3,26 GET m->cheno PICTURE '@M SI,NO' MESS 'Emite Cheques al Portador ?'
@ 4,26 GET m->TABULA PICTURE '99999999' MESS 'Cantidad de Columnas a Correr a la Derecha'
@ 5,26 GET m->CHEFE MESS 'Fecha de Emisi¢n de los Cheques'
READ
RELE WIND win
@ 24,0 say space(80)
RETURN
