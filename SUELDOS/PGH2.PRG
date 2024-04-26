*******************************************************************************
*-- Programa: PGH2.PRG
*-- Fecha   : 01/30/91 00:56am
*-- Version : G. REINER
*-- Notas   : IMPRIME PIE DE PAGINA Y CABACERAS DE LISTADO
********************************************************************************
? REPL('-',12)                     &&
?? REPL('-',31)                    &&
FOR A=1 TO veces                   &&
   ?? REPL('-',acdigi+1)           &&
NEXT                               &&
? B
?? 'SUBTOTALES'
?? SPACE(31)
?? B
STORE 0 TO tt1,nada
FOR A=1 TO RECC(fil)
   IF hthor[A]
      ?? STR(tthor[A],acdigi,2)
      ?? B
      STORE tt1+tthor[A] TO tt1
      STORE nada+tthor[A] TO nada
   ENDIF
NEXT
?? STR(nada,acdigi,2)
?? B
EJECT PAGE
?
??? CHR(18)
? 'PROGRAMA :'
?? ALLTRIM(ulpr)
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
?? jan->empresa                     &&
IF .NOT. EMPTY(jan->plusuno)       &&
   ?? ' - '                        &&
   ?? ALLTRIM(jan->plusuno)        &&
ENDIF                              &&
? jan->domicilio                   &&
IF .NOT. EMPTY(jan->plusdos)       &&
   ?? ' - '                        &&
   ?? ALLTRIM(jan->plusdos)        &&
ENDIF                              &&
? jan->localidad                   &&
IF .NOT. EMPTY(jan->plustres)      &&
   ?? ' - '                        &&
   ?? ALLTRIM(jan->plustres)       &&
ENDIF                              &&
**** TITULO ****                   &&
? 'PLANILLA DE '
?? tit                             &&
?? '-'
?? ALLTRIM(m->peraliq)
? ttl1
**** LINEA ****                    &&
IF largo>largoim
   ??? CHR(15)
ENDIF
? REPL('-',12)                     &&
?? REPL('-',31)                    &&
FOR A=1 TO veces                   &&
   ?? REPL('-',acdigi+1)           &&
NEXT                               &&
**** TEXTOS ****                   &&
? B                                &&
?? PADC("Legajo",10,' ')           &&
?? B                               &&
?? PADC("Apellido y Nombre Empleado",30," ")  &&
?? B                                          &&
FOR A=1 TO RECC(fil)                          &&
   IF hthor[A]                                &&
      GOTO A IN (fil)
      ?? PADR(&flva,acdigi,' ')
      ?? B                                         &&
   ENDIF                                           &&
NEXT A                                             &&
?? PADC("TOTALES",acdigi,' ')
?? B                                         &&
? REPL('-',12)                     &&
?? REPL('-',31)                    &&
FOR A=1 TO veces                   &&
   ?? REPL('-',acdigi+1)           &&
NEXT
?
RETURN
