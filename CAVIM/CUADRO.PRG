function cuadro
parameter CU_TEX,CU_MASLIN
private CU_TEX,CU_MAT,r,c,a,b,c,d,e,CU_CAN,CU_POS
IF CU_TEX='?' .OR. CU_TEX='H' .OR. CU_TEX='HELP'
CLEA
TEXT
******************************************************************
* AUTOR     : G. REINER
* FECHA     : FEBRERO DE 1992
******************************************************************
* FUNCION   : CUADRO
* PARAMETROS: NUMEROS SEPARADOS POR ESPACIOS
* EJEMPLO   : =CUADRO("2 10 10 20 1 10 30")
* SALIDA    : EL STRING COMPUESTO POR  '|'
******************************************************************
* DESCRIPCION DE LOS PARAMETROS
******************************************************************
* el 1� indica la cantidad de columnas que tendr� la planilla
* el 2� indica la linea inicial de impresi�n
* el 3� indica la linea final de impresi�n
* el 4� indica la columna inicial de impresion
* el 5� indica el tipo de l�nea que tendr� el cuadro
*        1-> �
*        2-> �
*        3-> �
*        4-> �
*        5-> �
* desde el 6� la CU_CAN de espacios
*****************************************************************
ENDTEXT
C=.T.
ELSE
M.CU_CAN=val(left(M.CU_TEX,at(" ",M.CU_TEX)-1))+5
dime CU_MAT[M.CU_CAN]
M.CU_TEX=M.CU_TEX+' '
for a=1 to M.CU_CAN
M.CU_POS=at(" ",M.CU_TEX)
CU_MAT[a]=val(left(M.CU_TEX,M.CU_POS-1))
M.CU_TEX=substr(M.CU_TEX,M.CU_POS+1)
endfor
b=iif(CU_MAT[5]=1,'�',iif(CU_MAT[5]=2,'�',iif(CU_MAT[5]=3,'�',iif(CU_MAT[5]=4,'�','�'))))
c=iif(CU_MAT[5]=2 .or. CU_MAT[5]=4,'�',iif(CU_MAT[5]=5,'�','�'))
d=iif(CU_MAT[5]=1,'�',iif(CU_MAT[5]=2,'�',iif(CU_MAT[5]=3,'�',iif(CU_MAT[5]=4,'�','�'))))
e=iif(CU_MAT[5]=1,'�',iif(CU_MAT[5]=2,'�',iif(CU_MAT[5]=3,'�',iif(CU_MAT[5]=4,'�','�'))))
for a=1 to CU_MAT[1]
b=b+repl(iif(CU_MAT[5]=1 .or. CU_MAT[5]=4,'�',iif(CU_MAT[5]=5,'�','�')),CU_MAT[5+a])+iif(CU_MAT[5]=1,'�',iif(CU_MAT[5]=2,'�',iif(CU_MAT[5]=3,'�',iif(CU_MAT[5]=4,'�','�'))))
c=c+space(CU_MAT[a+5])+iif(CU_MAT[5]=2 .or. CU_MAT[5]=4,'�',iif(CU_MAT[5]=5,'�','�'))
d=d+repl(iif(CU_MAT[5]=1 .or. CU_MAT[5]=4,'�',iif(CU_MAT[5]=5,'�','�')),CU_MAT[5+a])+iif(CU_MAT[5]=1,'�',iif(CU_MAT[5]=2,'�',iif(CU_MAT[5]=3,'�',iif(CU_MAT[5]=4,'�','�'))))
e=e+repl(iif(CU_MAT[5]=1 .or. CU_MAT[5]=4,'�',iif(CU_MAT[5]=5,'�','�')),CU_MAT[5+a])+iif(CU_MAT[5]=1,'�',iif(CU_MAT[5]=2,'�',iif(CU_MAT[5]=3,'�',iif(CU_MAT[5]=4,'�','�'))))
endfor
b=sinult(b)+iif(CU_MAT[5]=1,'�',iif(CU_MAT[5]=2,'�',iif(CU_MAT[5]=3,'�',iif(CU_MAT[5]=4,'�','�'))))
d=sinult(d)+iif(CU_MAT[5]=1,'�',iif(CU_MAT[5]=2,'�',iif(CU_MAT[5]=3,'�',iif(CU_MAT[5]=4,'�','�'))))
e=sinult(e)+iif(CU_MAT[5]=1,'�',iif(CU_MAT[5]=2,'�',iif(CU_MAT[5]=3,'�',iif(CU_MAT[5]=4,'�','�'))))
@ CU_MAT[2],CU_MAT[4] say b
@ CU_MAT[2]+1,CU_MAT[4] say c
@ CU_MAT[2]+2,CU_MAT[4] say d
for a=CU_MAT[2]+3 to CU_MAT[3]-IIF(CU_MASLIN,3,1)
@ a,CU_MAT[4] say c
next
IF CU_MASLIN
@ a,CU_MAT[4] say D
A=A+1
@ a,CU_MAT[4] say c
A=A+1
ENDIF
@ a,CU_MAT[4] say e
ENDIF
return c
