*:*********************************************************************
*:
*:        Program: PGH3.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: GMIN.PRG                      
*:
*:      Documented 04/23/91 at 20:56               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: PGH3.PRG
*-- Fecha   : 03/25/91 05:03pm
*-- Version : G. REINER
*-- Notas   : TITULOS DE GMIN
********************************************************************************
? linea
? B
?? '    '
?? B
?? 'TRANSPORTE          |'
?? STR(debep,acdigi,2)
?? '|'
?? STR(debe,acdigi,2)
?? '|'
?? STR(haberp,acdigi,2)
?? '|'
?? STR(haber,acdigi,2)
?? '|'
EJECT PAGE
?
??? CHR(18)
_RMARGIN=largoim
? 'PROGRAMA :GMIN'
?? SPACE(47)
? 'FECHA    :'
?? DATE()
?? SPACE(13)
?? 'HORA     :'
?? TIME()
?? SPACE(13)
?? 'P g N§   :'
?? STR(_PAGENO,5)
?
IF largo>largoim
   IF largoim>80
      _RMARGIN=233
   ELSE
      _RMARGIN=132
   ENDIF
   ??? CHR(15)
ENDIF
? tt+' - Continuaci¢n' STYLE 'u'
? ALLTRIM(janname) STYLE 'u'
? ALLTRIM(m->peraliq) STYLE 'U'
?
?linea
? acla
? linea
?
RETURN
*: EOF: PGH3.PRG
