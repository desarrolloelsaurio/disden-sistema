   =XSEEK(M.CODCLI,"PER","CODCLI")
   =OPCCL()
   SELE CCL
   TMP=GENTMP()
   SORT ON FECHAOP TO (TMP) FOR CODCLI=PER.CODCLI
   =PRXAREA(.T.)
   USE IN CCL
   USE (TMP) ALIAS CCL EXCL
   IF !empty(recc())
   		WAIT "3" WIND
   		ACTI SCREE
   		BROW
      repo form LCCLU2 TO PRIN PROMPT 
   ELSE
      WAIT "EL CLIENTE "+ALLTRIM(PER.CLIENTE)+" NO PRESENTA MOVIMIENTOS" WIND
   ENDIF
   =off_tmp()
