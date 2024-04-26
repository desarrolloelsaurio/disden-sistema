PARAMETER PORPAN
fisc=.T.
=hora_ulp()
=movewin(10,10,15,69,'win1',"Resumen de Remesas")
=OPPRO()
DO WHILE .T.
   SELE PRO
   ACTI WIND win1
   ff=""
   store 0 to naremes
   store space(10) to naprove
   @ 1,1  SAY "Proveedor:"
   @ 2,1  SAY "N§ Remesa:"
   sele pro
   set order to tag proveedor
   naprove=iif(empty(elipro(" de la Remesa a Liquidar- [ESC] para Salir ",1,12)),0,pro.procod)
   if !empty(naprove) .and. lastkey()#27         && OJO
      acti wind win1
      @ 1,12 get pro.proveedor
      napro=left(pro.proveedor,15)
      clea gets
      @ 2,12 get naremes pict "99999999" mess "Ingrese el N§ de la Remesa a Liquidar"
      read
      if !empty(naremes) .and. lastkey()#27       && OJO
         IF XSEEK(PRO.PROCOD+STR(NAREMES),'REM','REMESA')
         fisc='kar.cliente=naprove .and. kar.remesa=naremes .and. proveedor'
         =OPKAR()
         =OPMER()
         =working()
         IF PORPAN
            SELE KAR
            SET ORDER TO TAG ARTICULO IN MER
            SET RELA TO ARTICULO INTO MER ADDI
            =REPORTE("LRESP1",'kar.cliente=naprove .and. kar.remesa=naremes .and. proveedor')
         ELSE
            REPO FORM LRESI1 ;
              FOR kar.cliente=naprove .and. kar.remesa=naremes .and. proveedor ;
              TO PRIN
         ENDIF
         =REOPKAR()
         ELSE
         =CARTEL("LA REMESA N§ "+ALLTRIM(STR(NAREMES)),;
         "DE "+ALLTRIM(PRO.PROVEEDOR)+" NO EXISTE",;
         "POR FAVOR VERIFIQUE",;
         "Y REINTENTE")
         ENDIF
      endif
   ELSE
      EXIT
   endif
ENDDO
=relewin('win1')
return
