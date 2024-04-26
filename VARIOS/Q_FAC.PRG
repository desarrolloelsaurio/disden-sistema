********************************************************************************
*-- Programa: Q_FAC.PRG
*-- Fecha   : 07-07-92 01:55am
*-- Version : G. REINER
*-- Notas   : DEVUELVE LA DENOMINACION COMPLETA DE UNA FACTURA
*-- Modif GOYO 07-07-92 01:56am (si hay letra adelante, devuelve la letra)
*-- Modif GOYO 12-26-92 08:20am
*-- Modif GOYO ABR/94
********************************************************************************
FUNCTION Q_FAC
PARAMETER Q_FAC,Q_CAMPO,Q_LETRA,Q_SUCU,FUERZA_CHAR
PRIVATE Q_FAC,F_A,F_B,F_C,F_D,Q_CAMPO,Q_LETRA,Q_SUCU,Q_PARAM
IF TYPE("Q_FAC")="C" .AND. Q_FAC='?'
   CLEA
   TEXT
   *-- Par 1 : N§ de Factura
   *-- Par 2 : Nombre del campo de la Base para Guardar la Factura
   *-- Par 3 : Letra Inicial de la Factura
   *-- Par 4 : Numero de Sucursal
   *-- Par 5 : Fuerza la salida en caracteres
   ENDTEXT
ENDIF
Q_param=PARAMETER()
IF TYPE("Q_FAC")="C"
   IF !EMPTY(AT(LEFT(Q_FAC,1),'ABCDRMXPQabcdrmxpq'))
      F_D=LEFT(Q_FAC,1)
      Q_FAC=SUBSTR(Q_FAC,2)
   ELSE
      F_D=IIF(EMPTY(Q_LETRA),' ',Q_LETRA)
   ENDIF
   F_C=AT('-',Q_FAC)
   F_A=IIF(EMPTY(F_C),IIF(EMPTY(Q_SUCU),0,VAL(Q_SUCU)),VAL(LEFT(Q_FAC,F_C-1)))
   F_B=IIF(EMPTY(F_C),VAL(Q_FAC),VAL(SUBSTR(Q_FAC,F_C+1)))
   Q_SALIDA=F_D+ZERO(F_A,4)+'-'+ZERO(F_B,8)
ELSE
   Q_LETRA=UPPER(IIF(!EMPTY(Q_LETRA),Q_LETRA,' '))
   Q_SUCU=IIF(!EMPTY(Q_SUCU),Q_SUCU,IIF(TYPE("SUCU")#"U",LEFT(SUCU,4),"0000"))
   Q_SALIDA=Q_LETRA+Q_SUCU+"-"+ZERO(Q_FAC,8)
ENDIF
Q_SALIDA=IIF(q_PARAM=1,;
Q_SALIDA,;
IIF(TYPE((Q_CAMPO))="C",Q_SALIDA,iif(fuerza_char,Q_salida,VAL(RIGHT(Q_SALIDA,8)))))
RETURN Q_SALIDA
