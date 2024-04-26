* ษออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : CTRL2_EL.PRG         บ
* ฬออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER             บ
* บ FECHA      : 10-29-93                บ
* บ HORA       : 01:24:33am              บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER บ
* ศออออออออออออออออออออออออออออออออออออออผ
FUNCTION CTRL2_EL
DO CASE

CASE WEXIST("REQ")
   =YAGRL("REQ")
CASE WEXIST("MIX")
   C_VAR='ELI'+ULPR+"('',-1,1)"
   IF EVAL(C_VAR)
      =YAMIX()
   ENDIF
CASE WEXIST("MI1")
   C_VAR='ELI'+ULPR+"('',-1,1)"
   IF EVAL(C_VAR)
      =YAMI1()
   ENDIF
CASE WEXIST("MER")
   IF !EMPTY(ELIMER("",-1,1))
     =YAGRL("MER")
   ENDIF
CASE WEXIST("PER")
   C_VAR='ELI'+ULPR+"('',-1,1)"
   IF EVAL(C_VAR)
      =YAPER()
   ENDIF
   #IF "LABO" $ CURDIR()
   CASE WEXIST("PRA")
      IF ELIPRA("",-1,1)
         =YAGRL("PRA")
      ENDIF
   #ENDIF
   #IF "LABO" $ CURDIR()
   CASE WEXIST("MUT")
      IF ELIMUT("",-1,1)
         =YAGRL("MUT")
      ENDIF
   #ENDIF
   #IF "EXPE" $ CURDIR() .OR. "ALQU" $ CURDIR()
   CASE WEXIST("INM")
      IF ELIINM("",-1,1)
         =YAINM()
         IF TYPE("I_ALIAS")="C"
            =YAALQ()
         ENDIF
      ENDIF
   #ENDIF
   #IF "PROD" $ CURDIR()
   CASE WEXIST("TMA")
      IF !EMPTY(ELITMA("",-1,1))
         =YAGRL("TMA")
      ENDIF
   CASE WEXIST("AVIS")
      IF !EMPTY(ELIAVIS("",-1,1))
         =YAGRL("AVIS")
      ENDIF
   CASE WEXIST("TELS")
      IF !EMPTY(ELITELS("",-1,1))
         =YAGRL("TELS")
      ENDIF
   CASE WEXIST("COMS")
      IF !EMPTY(ELICOMS("",-1,1))
         =YAGRL("COMS")
      ENDIF
   CASE WEXIST("OTRS")
      IF !EMPTY(ELIOTRS("",-1,1))
         =YAGRL("OTRS")
      ENDIF
   #ENDIF
OTHERWISE
   C_VAR='ELI'+LEFT(ULPR,3)+'("",-1,1)'
   IF EVAL(C_VAR)
      =YAGRL(LEFT(ULPR,3))
   ENDIF
ENDCASE
RETURN .T.
