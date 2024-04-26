********************************************************************************
*-- Programa: IMPRESOR.PRG
*-- Fecha   : 4/10/89
*-- Version : G. REINER
*-- Notas   : AVISA ENCENDER LA IMPRESORA
********************************************************************************
FUNCTION IMPRESOR
PARAMETER I_LPT
IF TYPE("ENASCII")="U" .OR. !ENASCII
#DEFINE ENTERCON "PULSE [ENTER] PARA CONTINUAR"  && ENTERCON
   if getenv("EQUIPO")#"MICASA"
      IF !EMPTY(I_LPT)
        IF UPPER(I_LPT)#"LPT1"
            WAIT "LA IMPRESION SALDRA POR "+I_LPT+" - "+ENTERCON WIND
         ENDIF
         SET PRIN TO (I_LPT)
      ENDIF
      DO WHIL !PRIN()
         =BEEP(2)
         =mensaj1("ENCIENDA LA IMPRESORA Y UBIQUE EL PAPEL - LUEGO [ENTER] / [ESC] PARA MENU")
         =BEEP(5)
         IF LASTKEY()=27
            DEAC WIND ALL
            DO ERROR WITH .T.
         ENDIF
      ENDDO
      WAIT "IMPRESORA PREPARADA" WIND NOWA
   ENDIF
ENDIF
RETURN .T.
