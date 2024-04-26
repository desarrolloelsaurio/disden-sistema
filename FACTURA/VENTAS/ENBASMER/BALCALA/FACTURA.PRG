********************************************************************************
*-- Programa: FACTURA.prg
*-- Fecha   : 11-03-91 02:03am
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE FACTURACION
*-- Modificaci¢n GOYO 07-23-92 00:25am marca -> empresa
********************************************************************************
P_DIJO=ALLTRIM(PROMPT())
ulpr=PROGRAM()
=cabpan1()
=OPCLI()
=OPVIA()
=OPCIU()
=OPPAG()

do OPEMP
DO CASE
CASE P_DIJO='Restaura el Archivo'
   IF !empty(ELIEMP("- [ESC] para Salir",2,NUL))
      IF !EMPTY(JANNRO)
         =cabpan1()
        =OPFAC()SI with jannro
    	DO rndx WITH 12,40
	    ON SELE POPU rndx DO xfac
      	ACTI POPU rndx
    	RELE POPU rndx
	ENDIF
	ENDIF
CASE BAR()=1
   store nul to respuesta
   IF !empty(ELIEMP(" - [ESC] para Salir",2,NUL))
      IF JANNRO#NUL
         =cabpan1()
         STOR jannro TO m.marca,nadmar
         STORE LEFT(TEXTO2,2) TO M.CODMARCA
         =OPCCL() with jannro
         =OPMER() WITH JANNRO
         =OPKAR() with jannro
         =OPFAC() with jannro
         do oprem with jannro
         store NUL to respuesta
         DO WHILE .T.
            if elicli('a Facturar',-1,1)
               elcli=PER.codcli
               sele rem
               SET ORDER TO TAG CODCLI
               if SEEK(PER.CODCLI)
                  cant_max=NUL
                  SCAN WHILE CODCLI=PER.CODCLI
                  cant_max=CANT_MAX+IIF(empty(facturado),1,NUL)
                  ENDSCAN
                  IF !EMPTY(CANT_MAX)
                     RELE REMITOS
                     dime remitos[cant_max,3]
                     copy to array remitos field remito,fechaem FOR CODCLI=PER.CODCLI .AND. EMPTY(FACTURADO)
                     if alguno(@remitos,'REMITOS A FACTURAR',ALLTRIM(PER.CLIENTE))
                        DO facm
                     ENDIF
                  ENDIF
               endif
               sele rem
               set filter to
            ELSE
               EXIT
            endif
         ENDD
      ENDIF
   endif
CASE BAR()=2
   stor nul to respuesta,JANNRO
   IF !empty(ELIEMP(" - [ESC] para Salir",2,NUL))
      IF JANNRO#NUL
         =cabpan1()
         STOR jannro TO m.marca,nadmar
         STORE LEFT(TEXTO2,2) TO M.CODMARCA
         =OPCCL() with jannro
         =OPMER() WITH JANNRO
         =OPKAR() with jannro
         =OPFAC() with jannro
         DO facd
      ENDIF
   endif
CASE BAR()=4
   respuesta='nadax#5#30#Tipo de Listado de Facturas#3;
   #Listados \<Facturas;
   #\<Costos Facturas;
   #\<Diferencia de Precios;
   #-;
   #Listados \<Documentaci¢n Emitida;
   #Costos D\<ocumentaci¢n;
   #\<Planilla;
   #Libro de \<IVA Ventas'
	=DEFPOP()
   on sele popu nadax do lfacP1 with 'FA'
   acti popu nadax
   rele popu nadax
case bar()=5
   respuesta='nadax#5#30#Tipo de Listado de Facturas#3;
   #\<Listados Facturas;
   #\<Costos Facturas;
   #\<Diferencia de Precios;
   #-;
   #Listados \<Documentaci¢n;
   #Costos D\<ocumentaci¢n;
   #Documentaci¢n \<Emitida;
   #\<Planilla;
   #Libro de \<IVA Ventas'
	=DEFPOP()
   on sele popu nadax do lfaci1 WITH 'FA'
   acti popu nadax
   rele popu nadax
CASE BAR()=7
   store nul to respuesta
   IF !empty(ELIEMP(" - [ESC] para Salir",2,NUL))
   =OPFAC() WITH JANNRO
   DO CONT_FAC
   ENDIF
case bar()=8
   =OPFAC() with jannro
   STORE NUL TO RESPUESTA,M.FACTURA
   IF !ELIFAC()
      STORE {} TO RESPUESTA
      fcha=pregunta("FECHA DE LA FACTURA "+SUCU+'-'+ZERO(M.FACTURA,8),.T.,10,0,'E')
      IF LAST()#27 .AND. !EMPTY(FCHA)
         =MEN_LIN(GRABANDO)
         SELE FAC
         =FLOCK("FAC") .OR. FLOK("FAC")
         APPE BLAN
         =REPUSE()
         REPL FECHAEM WITH fcha
         REPL FECHAVE WITH fcha
         REPL CODCLI WITH "ANULADA"
         REPL FACTURA WITH M.FACTURA
         UNLO IN FAC
      ENDIF
   else
      =cartel("La factura N§ "+SUCU+'-'+ZERO(M.FACTURA,8),"no esta vacia",'',"** ES IMPOSIBLE ANULARLA **")
   endif
   ENDCASE
ulpr=PROGRAM()
=MEN_LIN(BOTOM)
UNLO ALL
RETURN
