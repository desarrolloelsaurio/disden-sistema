FUNCTION RPER
PARAMETER MM
IF MM='S'
    RP="Siempre"
ELSE
   IF MM="1"
      RP="1¦ Quinc"
   ELSE
      IF MM="2"
         RP="2¦ Quinc"
       ELSE
             IF MM="A"
                RP="Aguinaldo"
             ELSE
                IF MM="R"
                   RP="Retroact"
                ELSE
                   RP="Cada Tanto"
                ENDIF
             ENDIF
          ENDIF
       ENDIF
    ENDIF
RP=IIF(LEN(RP)>11,LEFT(RP,11),RP+SPACE(11-LEN(RP)))
RETURN(RP)
