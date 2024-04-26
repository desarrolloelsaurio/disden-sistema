********************************************************************************
*-- Programa: CMERC.PRG
*-- Fecha   : 12/01/91
*-- Version : V.LEEGSTRA
*-- Notas   : CORRIGE MERCADERIA, SOLO CARACTERISTICAS
********************************************************************************
STORE hora_ulp(PROGRAM()) to ULPR
IF CHEQSEG()
   define window win from 6,5 to 19,70 titl " Correcci¢n Mercader¡a - Caracter¡sticas " doub shad color sche 8
   sele mer
   set order to TAG ARTICULO
   stor " Correcci¢n Mercader¡a - " to me1
   STOR 23 TO COL
   STOR 15 TO COL1
   define window win1 from 5,col1 to 15,70 titl " Descripci¢n Completa " shad color sche 8
   STOR NUL TO KOK,NADA
   STOR SPACE(9) TO NADA1,NADA2
   ACTI WIND WIN
   CLEA
   REGISTRO=STR(RECNO())
   =LOCK("MER") .OR. LOK("MER")
   SCAT MEMV
   DO MMER1
   SELE MI1
   STOR .F. TO CAMBIO
   RELE NADA
   DIME NADA[3],NAD[3]
   NADA[1]=CAR1
   NADA[2]=CAR2
   NADA[3]=CAR3
   FOR A=1 TO 3
      nad[a]=IIF(!EMPTY(SAYMIX1(NADA[A],'CARCOD')),LEFT(MI1.TEXTO1,20),space(20))
      @ 7+A,COL1 GET NAD[A]
   NEXT
   CLEA GETS
   FOR A=1 TO 3
      @ 7+A,COL1 GET NAD[A]
      READ
      IF LASTKEY()#27
         IF UPDATE()
            STOR NUL TO RESPUESTA
            nada[a]=IIF(empty(ELICAR(" del Producto",8+a,COL)),"",LEFT(MI1.TEXTO2,2))
            acti wind win
            xx=mi1.texto1
            @ 7+a,col1 get xx
            clea gets
            stor .t. to cambio
         endif
      ELSE
         stor .F. TO CAMBIO
         EXIT
      ENDIF
   NEXT
   m.CAR1=nada[1]
   m.CAR2=IIF(NADA[1]#nada[2],NADA[2],'')
   M.CAR3=IIF(!EMPTY(NADA[3]) .AND. NADA[3]#NADA[2] .AND. NADA[3]#NADA[1],NADA[3],'')
   RELE NADA
   IF CAMBIO
      SELE MER
      GATH MEMV
   ENDIF
   =RELEWIN("WIN")
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
