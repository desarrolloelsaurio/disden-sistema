*************************************************
*-- Programa: EIMPU.PRG
*-- Fecha   : 01/25/93
*-- Version : R. 'EL BATA'
*-- Notas   : ENTREGA IMPUESTOS A PROP. o INQ.
*************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
   =movewin(2,9,20,70,'win','Impuestos de '+allt(INM.domicilio))
   picu='@Z '+right('999,999,999,999.99',xacdigi)
   ON KEY LABEL TAB KEYBOARD "{CTRL+W}"
   ON KEY LABEL ENTER DO EIMPUMAR
   =MEN_LIN("[ESC] Anula - [TAB] Sale y Graba - [ENTER] Marca/Desmarca")
   sele cci
   M.INQUILINO=XSEEK(INM.CODINM,"ALQ","CODINM")
   M.CODIGO=IIF(M.INQUILINO,ALQ.CODCLI,INM.PROCOD)
   REPL REGNO WITH -1 for empty(cci.entregada) .and. cci.codcli=m.codigo
   BROW FIELD ;
     C=IIF(EMPTY(CCI.ENTREGADA)," ","û"):R,;
     numere:H='PARTIDA', ;
     fechave:H='VENCE', ;
     monto:p=picu:H='MONTO',;
     detalle:H='IMPUESTO':10,;
     b=left(perio,2)+'-'+subs(perio,3,2)+'-'+right(perio,3):H="PERIODO";
     FREE DETALLE ;
     in wind win color sche 8;
     for empty(cci.entregada) .and. cci.codcli=m.codigo
   ON KEY LABEL ENTER
   ON KEY LABEL TAB
   =relewin('win')
   if last()=27
      repl entregada with {} for ;
      cci.entregada=date() .and. ;
      cci.regno=-1 .and. ;
      cci.codcli=m.codigo
   endif
      SCAN FOR CCI.CODCLI=m.codigo .AND. CCI.REGNO=-1
         SELE CCL
         SET ORDER TO TAG CODCLI
         SEEK M.CODIGO
         D1=LEFT(SINCOSAS(CCI.DETALLE),3)+' '+ALLTRIM(CCI.PERIO)
         D2=D1+"ðGESTION DE COBROS"
         SCAN WHILE CCL.CODCLI=M.CODIGO
            IF ALLTRIM(CCL.DETALLE)==D1
               =LOCK("CCL") .OR. LOK("CCL")
               REPL CCL.NUMERO WITH DTOC(DATE())
               REPL CCL.MONTO WITH 0
               REPL CCL.EQUIVALE WITH 0
               UNLO IN CCL
            ELSE
               IF ALLTRIM(CCL.DETALLE)==D2
                  DELE
               ENDIF
            ENDIF
         ENDSCAN
      SELE CCI
      ENDSCAN
      REPL CCI.REGNO WITH 0 FOR ;
      CCI.REGNO=-1 .AND. ;
      CCI.CODCLI=M.CODIGO
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)

function eimpumar
REPLACE CCI.ENTREGADA WITH IIF(EMPTY(CCI.ENTREGADA),DATE(),{})
RETURN
