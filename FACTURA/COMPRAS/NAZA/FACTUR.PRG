*:*********************************************************************
*-- Programa: FACTUR.prg
*-- Fecha   : 11-28-91 11:43am
*-- Version : R. 'EL BATA'
*-- Notas   : DERIVA A OPERACIONES DE FACTURAS DE PROVEEDORES
*-- Modificaci¢n GOYO 09-04-92 01:28am
*:*********************************************************************
PROCEDURE FACTUR
=cabpan1()
dijo=bar()
=OPPRO()
DO OPEMP
=OPPAG()
=opccp()
   DO opfar with jannro
	=OPGAS()
   d1=1
   d2=15
   d3=24
   d4=30
   d5=35
   d6=46
   d7=63
   DO CASE
   CASE DIJO=1
   =PRO("Factura de Compras")
      =RELEWIN("WIN2")
         CASE DIJO=3
      DO BFAR
   CASE DIJO=5
      respuesta='nadax#5#30#Tipo de Listado de Facturas#3;
#\<Listados;
#Facturas no cerradas;
#Libro de IVA Compras;
#\<Ultima Operaci¢n'
		=DEFPOP()
      on sele popu nadax do lfaR WITH .t.,'FA'
      acti popu nadax
      rele popu nadax
   CASE DIJO=6
      respuesta='nadax#5#30#Tipo de Listado de Facturas#3#\<Listados#Libro de IVA Compras por \<Fecha#Libro de IVA Compras por \<Mes#\<Ultima Operaci¢n'
		=DEFPOP()
      on sele popu nadax do lfaR WITH .f.,'FA'
      acti popu nadax
      rele popu nadax
   CASE DIJO=8
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
               =FLOCK() .OR. FLOK("FAD")
               SET ORDER TO
               REPL FACTURA WITH M.NUEVO FOR FACTURA=M.VIEJO .AND. PROCOD=ELPRO
               UNLO IN FAD
               SELE CCP
               =FLOCK() .OR. FLOK("CCP")
               SET ORDER TO
               REPL NUMERORE WITH M.NUEVO, ;
                 COMPR WITH LEFT(COMPR,3)+M.NUEVO ;
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
   CASE DIJO=9
      DO CMESFAR
   CASE DIJO=10
      DO AMESFAR.SPR
   CASE DIJO=12
      DO rndx WITH 12,30
      ON SELE POPU rndx DO xFAR
      ACTI POPU rndx
      RELE POPU rndx
   ENDCASE
ulpr=PROGRAM()
RETURN men_lin(botom)
