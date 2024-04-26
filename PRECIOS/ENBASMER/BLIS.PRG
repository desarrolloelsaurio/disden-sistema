****************************************
*-- Programa: BLIS.PRG
*-- Fecha   : 13/07/93
*-- Version : G. REINER
*-- Notas   : BORRA DE LISTA DE PRECIOS
****************************************
PARAMETER B_INCLUYE
DIJO=BAR()
B_DIJO=ALLTRIM(PROMPT())
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
   B_PARAM=.T.
   IF B_DIJO="Un Producto"
      SELE MER
      stor nul TO respuesta
      IF !EMPTY(elimer("a "+PROPER(B_PREF)+"cluir",-1,1))
         SET MESS TO LEFT(BOTOM,78)
         =BLIS1(B_PARAM)
         =IAUD(MER.ARTICULO+"-"+B_PREF)
         =RELEWIN("WIN")
      ENDIF
   ELSE
      STORE "" TO TT
      FISC=QWMER(DIJO)
      IF FISC#".F." .AND. CONFIRMA(B_PREF+"CLUIR "+ALLTRIM(TT),.T.,10,0)
         IF PREGUNTA("DESEA CONFIRMAR CADA "+B_PREF+"CLUSION",.T.,10,0)="SI"
            SELE MER
            =MEN_LIN("TRABAJANDO - ESPERE POR FAVOR")
            =WORKING()
            SCAN FOR &FISC
               IF !BLIS1(B_PARAM)
                  EXIT
               ENDIF
               STORE .F. TO B_PARAM
               ACTI WIND WIN
               CLEA
            ENDS
            =UNWORK()
            =RELEWIN("WIN")
         ELSE
            =MEN_LIN("TRABAJANDO - ESPERE POR FAVOR")
            =WORKING()
            SELE MER
            =FLOCK("MER") .OR. FLOK("MER")
            =DOTALK()
            REPL ENLISTA WITH B_INCLUYE FOR EVAL(FISC)
            =UNTALK()
            =IAUD(B_PREF+"-"+ALLTRIM(TT))
            =UNWORK()
         ENDIF
      ENDIF
   ENDIF
   UNLO ALL
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)

FUNCTION BLIS1
PARAMETER Q_BLIS1
SELE MER
REGISTRO=STR(RECNO())
SCAT MEMV
IF MMER1(Q_BLIS1) .AND. CONFIRMA(B_PREF+"CLUIR EL ARTICULO",.T.,18,30)
   SELE MER
   =LOCK() .OR. LOK()
   REPL ENLISTA WITH B_INCLUYE
   UNLO ALL
ENDIF
RETURN LAST()#27
