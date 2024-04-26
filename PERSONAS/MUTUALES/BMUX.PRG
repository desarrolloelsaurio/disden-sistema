FUNCTION BMUX
ULPR=PROGRAM()
IF CHEQSEG()
   IF CONFIRMA("Borrar porcentajes de "+;
        alltrim(m.mutualabr)+" + "+m.codplan,;
        .t.,10,1)
      =WORKING()
      SELE MUX
      SET ORDER TO TAG CODPLAN
      IF SEEK(M.CODMUT+M.CODPLAN)
         SCAN WHILE MUX.CODMUT=M.CODMUT .AND. ;
              MUX.CODPLAN=M.CODPLAN
            =LOCK("MUX") .OR. LOK("MUX")
            CODA=MUX.TIPO
            DELE
            =IAUD(M.CODA)
            UNLO IN MUX
         ENDSCAN
      ENDIF
      =UNWORK()
   ENDIF
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
