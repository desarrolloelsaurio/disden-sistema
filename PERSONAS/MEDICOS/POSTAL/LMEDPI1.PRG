********************************************************************************
*-- Programa: LMEDPI1.PRG
*-- Fecha   : 06/28/91
*-- Version : G. REINER
*-- Notas   : IMPRESION DE DOMICILIO POSTAL MEDICOS
********************************************************************************
ff=RECNO()
ulpr=HORA_ulp(PROGRAM())
acla=repl('-',80)
=CABPRI()
_PCOPIES=1
PRINTJOB
   SCAN FOR &fisc
    if !empty(MED.postal)
      _PAGENO=1
      prx=64
      =CABPRI1()
      ? iif(med.sexo='M','Dr,:','Dra:')
      ? alltrim(med.apellido)
      ?? ' '
      ?? proper(med.nombre)
      ?? ' ('
      ?? alltrim(med.codmed)
      ?? ')'
      ? med.postal
      ?
      ? acla
      ?
      ENDIF
   ENDSCAN
   EJECT PAGE
   ?
ENDP
=FINIMP()
=men_lin(botom)
RETURN
