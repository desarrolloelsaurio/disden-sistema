* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : IGAC.PRG                                                 บ
* บ COMENTARIO    :                                                          บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 10-26-93                                                    บ
* บ HORA       : 09:58:20am                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
* C_TEXTO : LA CUERDA CAG COMPLETA
* C_ORDER : ORDER TAG DE LOS CODIGOS DEL SUB-STRING C_TEXTO (CAGCOD)
* C_ELI   : NOMBRE DEL PROGRAMA DE SELECCION  (ELICAG)
* C_NUMERO: 1. SAYMIX  (CAG)
*           2. SAYMIX1 (MARCAS EN NOVOGAR)
*           3. SAYGRL  (VAYA UD A SABER)
* C_ALLAS : ALIAS (NO SIENDO NI MIX NI MIX1)
PARAMETER C_TEXTO,C_ORDER,C_ELI,C_NUMERO,C_ALLAS
=working()
DIME C_AG[20],C_AGTEX[20]
STORE "  " TO C_AG
STORE "" TO M.CAG_SALIDA
STORE IIF(TYPE("C_NUMERO")="U",1,C_NUMERO) TO M.C_NUMERO
STORE IIF(C_NUMERO=3,11,3) TO C_SALTO
** CARGA CONTENIDO
FOR XA=1 TO 20
   POSC=(XA-1)*C_SALTO+1
   C_AG[XA]=SUBSTR(C_TEXTO,POSC,2)
   DO CASE
   CASE C_NUMERO=1
      C_AGTEX[XA]=IIF(EMPTY(C_AG[XA]),SPACE(20),SAYMIX(C_AG[XA],C_ORDER))
   CASE C_NUMERO=2
         C_AGTEX[XA]=IIF(EMPTY(C_AG[XA]),SPACE(20),SAYMIX1(C_AG[XA],C_ORDER))
    OTHERWISE
         C_AGTEX[XA]=IIF(EMPTY(C_AG[XA]),SPACE(30),SAYGRL(C_AG[XA],C_ORDER,C_ALLAS))
     ENDCASE
NEXT
=unwork()
DEFI WIND WIN FROM 0,0 TO 24,40 NONE
ACTI WIND WIN
FOR XA=1 TO 20
   @ XA,1 SAY XA PICT "999"
   @ XA,5 SAY C_AG[XA]
   @ XA,9 SAY C_AGTEX[XA]
NEXT
 
DO WHILE .T.
   STORE 0 TO XA
   @ 22,10 SAY "SU OPCION " ;
     GET XA ;
     PICT "99" ;
     VALID XA>=0 .AND. XA<21 ;
     ERROR "LOS VALORES VAN DE 0 A 20";
     MESS "SU OPCION - [0] PARA MENU"
   READ
   IF !EMPTY(XA)
      STORE NUL TO RESPUESTA
      C_SELE=C_ELI+"('',"+ALLTRIM(STR(XA))+",5)"
      IF EVAL(C_SELE)
          DO CASE
          CASE C_NUMERO=1
              IF EMPTY(ASCAN(C_AG,LEFT(MIX.TEXTO2,2)))
                  C_AG[XA]=LEFT(MIX.TEXTO2,2)
                  C_AGTEX[XA]=saymix(C_AG[XA],C_ORDER)
               ENDIF
         CASE C_NUMERO=2
	         IF EMPTY(ASCAN(C_AG,LEFT(MI1.TEXTO2,2)))
           	      C_AG[XA]=LEFT(MI1.TEXTO2,2)
	             C_AGTEX[XA]=saymix1(C_AG[XA],C_ORDER)
	         ENDIF
        ENDCASE
  ELSE
    STORE SPACE(C_SALTO-1) TO C_AG[XA]
    STORE SPACE(30) TO C_AGTEX[XA]
  ENDIF
      @ XA,5 SAY C_AG[XA]
      @ XA,9 SAY C_AGTEX[XA]
   ELSE
      IF CONFIRMA("LAS MODIFICACIONES REALIZADAS",.T.,10,0)
         M.CAG_SALIDA=""
         FOR XA=1 TO 20
            M.CAG_SALIDA=M.CAG_SALIDA+C_AG[XA]+"/"
         NEXT
      ELSE
         M.CAG_SALIDA=C_TEXTO
      ENDIF
      EXIT
   ENDIF
ENDDO
RELE WIND WIN
RETURN M.CAG_SALIDA
