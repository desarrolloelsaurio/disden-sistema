*:*********************************************************************
*-- Programa: FACTUR.prg
*-- Fecha   : 11-28-91 11:43am
*-- Version : R. 'EL BATA'
*-- Notas   : DERIVA A OPERACIONES DE FACTURAS DE PROVEEDORES
*-- Modificaci¢n GOYO 09-04-92 01:28am
*-- VERSION MULTIEMPRESA - BALCALA
* 1  Factura de Proveedores
* 3  Borra Factura
* 5  Lista por Pantalla
* 6  Lista por Impresora
* 8  Corrige Numeraci¢n
* 9  Cierra Mes de I.V.A.
* 11 Restaura el Archivo
*:*********************************************************************
PROCEDURE FACTUR
=cabpan1()
dijo=bar()
diko=alltrim(prompt())
=OPPRO()
DO OPEMP
=OPPAG()

d1=1
d2=15
d3=24
d4=30
d5=35
d6=46
d7=63
DO CASE
CASE diko="Factura de Proveedores"
   DO opfar
   if !empty(jannro)
      DO opccp WITH JANNRO
      DO ifacd WITH .f.,'FA','Fact','FACT','Factura','Facturas'
   ENDIF
CASE diko="Borra Factura"
   DO opfar
   if !empty(jannro)
      DO opccp WITH JANNRO
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
   ENDIF
CASE diko="Lista por Pantalla"
   respuesta='nadax#5#30#Tipo de Listado de Facturas#3#\<Listados#Libro de \<IVA Compras#\<Ultima Operaci¢n'
	=DEFPOP()
   on sele popu nadax do lfaR WITH .t.,'FA'
   acti popu nadax
   rele popu nadax
CASE diko="Lista por Impresora"
   respuesta='nadax#5#30#Tipo de Listado de Facturas#3#\<Listados#Libro de \<IVA Compras#\<Ultima Operaci¢n'
	=DEFPOP()
   on sele popu nadax do lfaR WITH .f.,'FA'
   acti popu nadax
   rele popu nadax
CASE diko="Corrige Numeraci¢n"
   DO opfar with jannro
   if !empty(jannro)
      DO opccp
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
   ENDIF
CASE diko="Cierra Mes de I.V.A."
   DO opfar with jannro
   if !empty(jannro)
      DO opccp
      DO CMESFAR
   ENDIF
CASE diko="Restaura el Archivo"
   DO opfar
   if !empty(jannro)
   DO rndx WITH 12,30
   ON SELE POPU rndx DO xFAR
   ACTI POPU rndx
   RELE POPU rndx
   endif
ENDCASE
=men_lin(botom)
RETURN
