*:*********************************************************************
*:
*:        Program: OPCAT.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/27/90      0:00
*:
*:      Called by: LHISI.PRG
*:
*:          Calls: RESP1.PRG
*:
*:           Uses: &A                 Alias: HIS
*:
*:        Indexes: CATEGORIA.IDX
*:
*:      Documented 04/11/91 at 11:20               FoxDoc  version 2.01
*:*********************************************************************
******************************
* ABRE ARCHIVO DE CATEGORIAS *
******************************
@ 24,0 SAY PADC('Abriendo archivo de Categor¡as',80,' ') COLO SCHE 19
SELE 4
IF ALIAS()<>'CAT'
   USE (PATH+'\CATEGORI') INDEX (PATH+'\CATEGORI') ALIAS cat
ENDIF
IF catpop
   DEFI POPU catpop FROM 0,58 PROM FIELD cat->categoria MESS ' Elija la Categor¡a ' SHAD COLOR SCHE 3
   ON SELE POPU catpop DO resp1
ENDIF
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: OPCAT.PRG
