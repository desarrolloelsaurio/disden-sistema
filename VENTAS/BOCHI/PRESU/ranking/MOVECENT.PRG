* ษอออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : MOVECENT.PRG                บ
* บ COMENTARIO    : MUEVE UNA VENTANA AL CENTRO บ
* ศอออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION MOVECENT
PARAMETER A,B,C,D,E,F,g
PRIVATE A,B,C,D,E,F,g
IF _WINDOWS
   ALTO=C-A+1
   RESTA=(SROWS()-ALTO)/2
   A=RESTA
   C=SROWS()-RESTA
 
   ANCH=D-B+1
   RESTA=(SCOLS()-ANCH)/2
   B=RESTA
   D=SCOLS()-RESTA
   ACTI SCRE   
   DEFI WIND (e) FROM A,B TO C,D TITL f DOUB SHAD COLO SCHE 8 FONT "ARIAL",9
   ACTI WIND (E)
ELSE
   IF C>24
      RESTA=C-IIF(_WINDOWS,SROWS(),24)
      C=IIF(_WINDOWS,SROWS(),24)
      A=A-RESTA
      IF A<0
         A=0
      ENDIF
   ENDIF
   IF D>79
      RESTA=D-IIF(_WINDOWS,SCOLS(),79)
      D=IIF(_WINDOWS,SCOLS(),79)
      B=B-RESTA
      IF B<0
         B=0
      ENDIF
   ENDIF
   DEFI WIND (e) FROM A,B TO C,D TITL f DOUB SHAD COLO SCHE 8
   =CENTWIN(E)
ENDIF
RETURN .T.
