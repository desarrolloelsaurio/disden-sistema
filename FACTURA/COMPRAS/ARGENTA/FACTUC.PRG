*:*********************************************************************
*-- Programa: FACTUC.PRG
*-- Fecha   : 08-18-92 11:43am
*-- Version : R. 'EL BATA'
*-- Notas   : DERIVA A OPERACIONES DE FACTURAS DE PROVEEDORES
*:*********************************************************************
=cabpan1()
=OPPRO()
DO OPEMP
=OPPAG()

DO opccp
=OPMER()
DO opfar
d1=1
d2=15
d3=24
d4=30
d5=35
d6=46
d7=63
DO CASE
CASE BAR()=1
   DO ifard  WITH .f.,'FA','Fact','FACT','Factura','Facturas'
CASE BAR()=3
   IF ELIFAR()
      SELE FAR
      SCAT MEMV
      ABR=M.TIPO
      TIT_SIN=IIF(ABR='FA','Factura',iif(abr='NC',"Nota de Cr‚dito","Nota de D‚bito"))
      DO MFAR WITH .F.
      if confirma("Borrar Documento",.t.,18,40)
         =men_lin("ESPERE POR FAVOR - BORRANDO")
         SELE FAD
         =FLOCK() .OR. FLOK("FAD")
         SET ORDER TO
         DELE FOR FACTURA=FAR.FACTURA .AND. PROCOD=FAR.PROCOD
         UNLO IN FAD
         SELE CCP
         =FLOCK() .OR. FLOK("CCP")
         SET ORDER TO
         DELE FOR NUMERORE=FAR.FACTURA .AND. PROCOD=FAR.PROCOD
         UNLO IN CCP
         SELE FAR
         =FLOCK() .OR. FLOK("FAR")
         DELE
         UNLO IN FAR
      endif
   =RELEWIN("win10")
   =RELEWIN("win11")
   =RELEWIN("win2")
   ENDIF
CASE BAR()=5
   DO opfar
   STORE {} TO FECINI,FECFIN
   IF ENTRE_FE()
      fisc='fechaem>=fecini .and. fechaem<=fecfin'
      DO LIVACP
   ENDIF
CASE BAR()=6
   DO opfar
   STORE {} TO FECINI,FECFIN
   IF ENTRE_FE()
      fisc='fechaem>=fecini .and. fechaem<=fecfin'
      ttU=' entre el '+dtoc(fecini)+' y el '+dtoc(fecfin)
      STORE NUL TO RESPUESTA
      IF !EMPTY(INFIC("PAGINA INICIAL DEL LISTADO",999999))
         PAGENO=RESPUESTA
         DO LIVACI
      ENDIF
   ENDIF
CASE BAR()=8
   IF ELIFAR()
      =movewin(10,20,17,70,'win'," Corrige Numeraci¢n de Proveedor ")
      @ 1,1 SAY "Nro FACTURA : "
      M.VIEJO=FAR.FACTURA
      @ 1,15 GET M.VIEJO
      @ 2,1 SAY "PROVEEDOR   : "
      M.ELPRO=PRO.PROCOD
      @ 2,15 GET M.ELPRO
      @ 4,1 say "NUEVO NUMERO: "
      CLEA GETS
      STORE SPACE(14) TO M.NUEVO
      @ 4,15 GET M.NUEVO
      READ
      M.NUEVO=Q_FAC(M.NUEVO)
      IF LAST()#27 .AND. RIGHT(M.NUEVO,8)#'00000000'
         IF CONFIRMA("Cambiar de Numeraci¢n",.t.,18,20)
            =men_lin("ESPERE POR FAVOR - CAMBIANDO DE NUMERACION")
            SELE FAD
            M.NUEVO=ABS(EVAL(M.NUEVO))
            =FLOCK() .OR. FLOK("FAD")
            REPL FACTURA WITH M.NUEVO FOR FACTURA=M.VIEJO .AND. PROCOD=ELPRO
            UNLO IN FAD
            SELE CCP
            =FLOCK() .OR. FLOK("CCP")
            SET ORDER TO
            REPL NUMERORE WITH M.NUEVO, ;
              COMPR WITH LEFT(COMPR,3)+STR(M.NUEVO);
              FOR NUMERORE=M.VIEJO .AND. PROCOD=ELPRO
            UNLO IN CCP
            SELE FAR
            =FLOCK() .OR. FLOK("FAR")
            REPL FACTURA WITH M.NUEVO
            UNLO IN FAR
         endif
      ENDIF
      =RELEWIN("WIN")
   ENDIF
ENDCASE
ulpr=PROGRAM()
=men_lin(botom)
RETURN
