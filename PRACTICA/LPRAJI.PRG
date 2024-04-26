********************************************************************************
*-- Programa: LPRAJI
*-- Fecha   :
*-- Version : G. REINER
*-- Notas   : LISTADO DE INSTRUCCIONES PARA PACIENTES
********************************************************************************
STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
   DO OPPAC
   STORE 0 TO RESPUESTA
   IF ELIPAC("",-1,1)
      ACLA=SPACE(78)
      LINEA=REPL("=",LEN(ACLA))
      TT="INSTRUCCIONES PARA EL PACIENTE"
      =cabpri()
      _PCOPIES=1
      PRINTJOB
         =cabpri1()
         =TIT_(3)
         ?
         ? 'Sr:'
         ? PER.CLIENTE
         ? PER.DOMICILIO
         ? SAYMIX(PER.LOCALIDAD,"CIUCOD")
         ?
         =RECUADRO("PRACTICA:"+ALLTRIM(PRA.PRACTICA))
         ?
         SET MEMO TO 70
         FOR A=1 TO MEMLINES(PRA.LEGAJO)
             SALIDA=MLINE(PRA.LEGAJO,A)
            IF !EMPTY(M.SALIDA)
               ? "  "
               ?? M.SALIDA
            ENDIF
         NEXT
         ?
         =FIN_LIN(4)
         EJECT PAGE
      ENDP
      =FINIMP()
      =iaud(PRA.PRACTICA)
   ENDIF
ELSE
   =iaudI()
ENDIF
RETURN MEN_LIN(BOTOM)
