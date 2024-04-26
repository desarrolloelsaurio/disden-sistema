FUNCTION GRLOK
DO CASE
CASE M.OPCION=3 .OR. LAST()=27
   UNLO IN (G_ALIAS)
   =EVAL(G_CARGA)
   RETURN 1
CASE M.OPCION=1
   IF LAST()#27
      IF CHKCPO()
         IF TYPE("G_GRABA")="C"
            =EVAL(G_GRABA)
         ELSE
            IF M.INGRESO
               IF TYPE("I_ALIAS")="C" .AND. I_ALIAS#G_ALIAS
                  SELE (I_ALIAS)
                  =AGRABAR((I_ALIAS))
               ELSE
                  =AGRABAR((G_ALIAS))
               ENDIF
               =IAUD('Ing '+G_AUDI)
            ELSE
               IF M.CAMBIO
                  GRL_ALIAS=IIF(TYPE("I_ALIAS")="C",I_ALIAS,G_ALIAS)
                  SELE (GRL_ALIAS)
                  GO FF
                  =AGRABAR1((GRL_ALIAS))
                  =IAUD('Cor '+G_AUDI)
               ENDIF
            ENDIF
         ENDIF
         =EVAL(G_CARGA)
      ELSE
         =FALTADAT(G_FALTA)
      ENDIF
   ENDIF
   UNLO IN (G_ALIAS)
   _CUROBJ=M.PRIOBJ
CASE M.OPCION=2
   UNLO IN (G_ALIAS)
   =EVAL(G_CARGA)
   _CUROBJ=M.PRIOBJ
ENDCASE
UNLO IN (G_ALIAS)
RETURN 0
