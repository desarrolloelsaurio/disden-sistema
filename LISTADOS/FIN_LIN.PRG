* ÚÄ PROGRAMA ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³    File Name: FIN_LIN.PRG                                                ³
* ³       Author: G. REINER                                                  ³
* ³ Date created: 11-06-92                                                   ³
* ³ Time created: 05:09:16am                                                 ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
*-- Modificaci¢n GOYO 11-06-92 05:09am siguedelargo
*---------------------------------- Por pantalla, no espera
*---------------------------------- Por Impresora, no eject page
FUNCTION FIN_LIN
PARAMETER FI_COSA,FI_CO1,FI_COS2,SIGUEDELARGO
PRIVATE FI_COSA,FI_CO1,FI_COS2
IF LASTKEY()#27
   ? LEFT(M.LINEA,LEN(M.LINEA)-4)
   ?? IIF(FI_COSA=2 .OR. FI_COSA=4,'====','\\\\')
   IF PARAMETER()>2 .AND. TYPE("FI_COS2")#'L'
      ? FI_COS2
   ENDIF
   IF !EMPTY(FI_CO1)
      IF !SIGUEDELARGO
      _WRAP=.F.
      ENDIF
      IF TYPE("MENSAJE[10]")#'C'
         ? "Cantidad:"+alltrim(str(FI_CO1))
      ELSE
         ? ALLTRIM(MENSAJE[10])+":"+ALLTRIM(STR(FI_CO1))
      ENDIF
      IF SYS(102)#'ON'
         ON KEY LABEL F10
      ENDIF
   ENDIF
   IF FI_COSA<3
      _RMARGIN=80
      IF !SIGUEDELARGO
         _WRAP=.F.      
         =INKEY(0,'HM')
      ENDIF
   ELSE
      IF !SIGUEDELARGO
         EJECT PAGE
         IF FI_COSA=3 .AND. TYPE("M.HOJASUELTA")#"U" .AND. M.HOJASUELTA
            ON KEY
            WAIT "CAMBIE LA HOJA Y PULSE [ENTER] CUANDO ESTE LISTA LA IMPRESORA" WIND
            ON KEY DO ABPR
         ENDIF
      ENDIF
      _RMARGIN=80
      ?
   ENDIF
ENDIF
RETURN LASTKEY()#27
