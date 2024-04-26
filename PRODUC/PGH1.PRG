*:*********************************************************************
*:        Program: PGH1.PRG
*:         System: SYSTEMA DE CONTROL DE PRODUCCION
*:         Author: G. REINER
*:      Copyright (c) 1991, SISTEMAS INFORMATICOS S.R.L.
*:  Last modified: 07/25/91     19:43
*:      Called by: LREMI1.PRG
*:      Documented 08/05/91 at 19:46               FoxDoc  version 2.01
*:*********************************************************************
?
?? CHR(18)
?? REPL("-",80)
EJECT PAGE
? 'PROGRAMA :LREMI1'
?? SPACE(46)
??'Usuario  :'
??usador
? 'FECHA    :'
?? DATE()
?? SPACE(13)
?? 'HORA     :'
?? TIME()
?? SPACE(13)
?? 'P g N§   :'
?? STR(_PAGENO,5)
? REPL("-",80)
? 'IMPRESION DE ORDEN DE '
?? UPPER(favri)
?? ' - CONDICION:'
?? cosa
?? ' - '
?? kops[VEZ]
? REPL("-",80)
?
RETURN
