* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : CTRL2_CA.PRG                                             บ
* บ COMENTARIO    : CARGA DATOS DESDE LAS BASES CORRESPONDIENTES             บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 10-19-93                                                    บ
* บ HORA       : 11:19:57pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION CTRL2_CA
PARAMETER C_UNO
DO CASE
CASE WEXIST("MER")
   =YAGRL("MER",.F.,C_UNO)
   IF XMER
      =YAGRL("MER",.F.,.F.,"XMER")
   ENDIF
   #IF "PROD" $ CURDIR()
   CASE WEXIST("TMA")
      IF "HIJO" $ UPPER(WTIT())
      =YAGRL("THI",.F.,C_UNO)      
      ELSE
      =YAGRL("TMA",.F.,C_UNO)
      ENDIF
   CASE WEXIST("AVIS")
      =YAGRL("AVIS",.F.,C_UNO)
      IF XAVIS
         =YAGRL("AVIS",.F.,.F.,"XAVIS")
      ENDIF
   CASE WEXIST("COMS")
      =YAGRL("COMS",.F.,C_UNO)
      IF XCOMS
         =YAGRL("COMS",.F.,.F.,"XCOMS")
      ENDIF
   CASE WEXIST("OTRS")
      =YAGRL("OTRS",.F.,C_UNO)
      IF XOTRS
         =YAGRL("OTRS",.F.,.F.,"XOTRS")
      ENDIF
   CASE WEXIST("TELS")
      =YAGRL("TELS",.F.,C_UNO)
      IF XTELS
         =YAGRL("TELS",.F.,.F.,"XTELS")
      ENDIF
   CASE WEXIST("INGPRS")
      M.CODPRO=ELCOD()
      M.XXXTEXTO=ELTEX()
      =YAGRL("PRS",.F.,C_UNO,"INGPRS")
   #ENDIF
   CASE WEXIST("REQ")
      =YAGRL("REQ",.F.,C_UNO)
      IF XREQ
         =YAGRL("REQ",.F.,.F.,"XREQ")
      ENDIF
CASE WEXIST("LIQ")
   =YAGRL("MUT",.F.,.F.,"LIQ")
   =YAGRL("PER",.F.,.F.,"LIQ")
   =YAGRL("LIQ",.F.,C_UNO)
CASE WEXIST("PRC")
   =YAGRL("PRC",.F.,C_UNO,"PRC")
CASE WEXIST("MIX")
   =YAMIX(.F.,C_UNO)
CASE WEXIST("MUT")
   =YAGRL("MUT",.F.,C_UNO)
CASE WEXIST("MI1")
   =YAMI1(.F.,C_UNO)
CASE WEXIST("ARA")
   =YAMIX(.F.,C_UNO,"ARA")
CASE WEXIST("RUB")
   =YAGRL("RUB",.F.,C_UNO)
   #IF "PROD" $ CURDIR()
   CASE WEXIST("TAL")
      =YAGRL("TAL",.F.,C_UNO)
   #ENDIF
   #IF "ALQUI" $ CURDIR()
   CASE WEXIST("INM")
      =YAINM(.F.,C_UNO,"INM")
      IF XINM
         IF XALQ
            =YAALQ(.F.,C_UNO,"XINM")
         ELSE
            ACTI WIND XINM
            SHOW GETS WIND XINM
         ENDIF
      ENDIF
   #ENDIF
   #IF "LABORA" $ CURDIR()
   CASE WEXIST("PRA")
      IF XPRA.AND. !EMPTY(I_ALIAS)
         =YAGRL("PRX",.F.,C_UNO,"XPRA")
         SELE PRA
         SCAT MEMO MEMV
         =SGET("PRA")
      ELSE
         =YAGRL("PRA",.F.,C_UNO)
      ENDIF
   #ENDIF
CASE ULPR="SUC" .OR. ULPR="GNT"
   C_DOS='YA'+LEFT(ULPR,3)+'(.F.,C_UNO)'
   =EVAL(C_DOS)
   IF TYPE("I_ALIAS")="C"
      =SGET("XINM")
   ENDIF
CASE WEXIST("IDATOTAL")
   =XSEEK(DTT.CODCLI,"PER","PROCOD")
   =YAGRL("PER",.F.,C_UNO,"PER")
   =YAGRL("DTT",.F.,C_UNO,'IDATOTAL')
CASE WEXIST("INGPRS1")
   =XSEEK(PRS.CODCLI,"PER","PROCOD")
   =YAGRL("PER",.F.,C_UNO,"PER")
   =YAGRL("PRS",.F.,C_UNO,'INGPRS1')
OTHERWISE
   =YAPER(.F.,C_UNO)
   IF WEXIST("XPER")
      =SGET("XPER",.F.,.T.)
   ENDIF
ENDCASE
RETURN .T.
