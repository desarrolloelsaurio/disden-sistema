FUNCTION GETJANNA
DO CASE 
CASE GETENV("EQUIPO")='NOVOGAR'
   JANNAME=chr(78)+chr(79)+chr(86)+chr(79)+chr(71)+chr(65)+chr(82)
   *** 'NOVOGAR'
   IF GETENV("VIEJO")="SI"
   SUCU='0005'
   ELSE
   SUCU='0001'
   ENDIF
CASE EMPTY(GETENV("EQUIPO")) .OR. GETENV("EQUIPO")='DESARROLLO' .OR. GETENV("EQUIPO")='MICASA'
      JANNAME="NOV DEMO"
      SUCU='0001'
*CASE GETENV("EQUIPO")="EQUIPA"
*         JANNAME=chr(69)+chr(81)+chr(85)+chr(73)+chr(80)+chr(65)+chr(72)+chr(79)+chr(71)+chr(65)+chr(82)
*         SUCU='0003'
*         *** 'EQUIPAHOGAR'
CASE GETENV("EQUIPO")="EQUIPA"
         JANNAME=chr(78)+chr(79)+chr(86)+chr(79)+chr(71)+chr(65)+chr(82)
         SUCU='0004'
         *** novogar nuevo
OTHERWISE
       IF GETENV("VIEJO")="SI"
         JANNAME=chr(65)+chr(82)+chr(82)+chr(79)+chr(89)+chr(79)+chr(71)+chr(65)+chr(82)
         *** 'ARROYOGAR'
         SUCU='0004'
       ELSE
         JANNAME=chr(65)+chr(82)+chr(82)+chr(79)+chr(89)+chr(79)+chr(71)+chr(65)+chr(82)
         *** 'ARROYOGAR'
         SUCU='0002'
         ENDIF
ENDCASE
RETURN .T.
