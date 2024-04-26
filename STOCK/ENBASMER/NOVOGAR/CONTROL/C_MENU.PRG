*Carga Stock Inicial
*#\<Emite Remito;
*#\<Consulta
*#\<Lista por Pantalla
*#\<Lista por Impresora'
c1=1
c2=22
c3=53
c4=64
ULPR=PROGRAM()
IF CHEQSEG()
   C_DIJO=ALLTRIM(PROMPT())
   DO CASE
   CASE C_DIJO='Lista Remito de Proveedor por Pantalla'
   =oprec1()
	=lRec(.t.)
   CASE C_DIJO='Lista Remito de Proveedor por Impresora'
   =oprec1()
   	=lRec()
   CASE C_DIJO='Recibe Remito de Proveedor'
   =oprec1()
   DO IREC
   CASE C_DIJO="Reindexa"
      DO INDEXA
   CASE C_DIJO="Borra Stock Sucursal"
      IF NEGOCIO()    && DEVUELVE .T. SI LA SUCURSAL SELECCIONADA CORRESPONDE
					  && A ALGUNA DE LAS CASAS CENTRALES
         =CARTEL("NO SE PUEDE BORRAR EL STOCK",;
           "DE LA SUCURSAL EN LA QUE USTED SE ENCUENTRA",;
           "ES SOLAMENTE PARA OTRAS SUCURSALES",;
           "PULSE [ENTER] PARA CONTINUAR")
      ELSE
         IF CONFIRMA(C_DIJO,.T.,10,0)
            SELE STOS
            IF LASUC $ FULL(DBF())
               =FLOCK("STOS") .OR. FLOK("STOS")
               IF FUERARED()#27
               =OPSTOS(LASUC,.T.)
               =WORKING()
               =DOTALK()
               ZAP
               =OPSTOS(LASUC,.T.,.T.)
               =UNTALK()
               =UNWORK()
               ENDIF
            ELSE
               =CARTEL("EL ARCHIVO ABIERTO",;
                 "NO CORRESPONDE CON LA SUCURSAL SELECCIONADA",;
                 "IMPOSIBLE BORRAR STOCK",;
                 "PULSE [ENTER] PARA CONTINUAR")
            ENDIF
         ENDIF
      ENDIF
   CASE C_DIJO="Consulta"
      =CLOSDAT()
		=OPRUB()
      =OPMIX()
      DO OPMI1
      =OPPRO()
      IF NEGOCIO()
         =OPMER()
      ELSE
         =OPSTOS(LASUC,.F.,.F.,.T.)
      ENDIF
      =MPRE(.T.)
      =CLOSDAT()
   CASE C_DIJO="Emite Remito"
       =CLOSDAT()
       =OPMIX()
       DO OPMI1
       STORE "" TO LARECTEX
       LAREC=AQUESUC()
       IF !EMPTY(LAREC)
          =OPSTOS1(LASUC,LAREC)
          IF NEGOCIO()
             =OPKAR()
             =OPREM()
          ELSE
             =OPREMS(LASUC)
          ENDIF
          DO REMD WITH "I"
       ENDIF
   CASE C_DIJO="Corrige Stock"
      =CLOSDAT()
      =OPPRO()
      =OPMIX()
      DO OPMI1
      DO OPCOL
      DO OPCAR
      IF NEGOCIO()
         =OPMER()
      ELSE
         =OPSTOS(LASUC,.F.,.F.,.T.)
      ENDIF
      ACTI SCRE
      DO grl2 WITH 5,30,'L¡mites de la Correcci¢n',.t.
      ON SELE POPU nada DO ASTO WITH 2
      ACTI POPU nada
      RELE POPU nada
   CASE C_DIJO="Carga Stock Inicial"
      DO CSINI.SPR
CASE C_DIJO="Lista Stock por Pantalla" .OR. ;
     C_DIJO="Lista Stock por Impresora"
     store nul to respuesta
     DO OPCOL
	  =OPMAR()
     if !empty(ELIEMP("a Listar",-1,1))
         =OPPRO()
			=OPRUB()
      =CLOSDAT()
      IF NEGOCIO()
         =OPMER()
      ELSE
         =OPSTOS(LASUC,.F.,.F.,.T.)
      ENDIF
      ACTI SCRE
      do lsto with C_DIJO="Lista Stock por Pantalla"
      ENDIF
CASE C_DIJO="Lista Remitos por Pantalla" .OR. ;
     C_DIJO="Lista Remitos por Impresora"
     store nul to respuesta
     DO OPCOL
	  =OPMAR()
     if !empty(ELIEMP("a Listar",-1,1))
         =OPPRO()
			=OPRUB()
        =CLOSDAT()
      IF NEGOCIO()
         =OPMER()
         DO OPREM
      ELSE
         =OPSTOS(LASUC,.F.,.F.,.T.)
         =OPREMS(LASUC)
      ENDIF
      ACTI SCRE
      do queryrem with C_DIJO="Lista Remitos por Pantalla"
      ENDIF
   ENDCASE
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)

function oprec1
         =CLOSDAT()
               IF NEGOCIO()
         =OPMER()
      ELSE
         =OPSTOS(LASUC,.F.,.F.,.T.)
      ENDIF
   DO oppec
=OPPRO()
DO OPEMP
=OPMAR()
DO OPPEC
DO OPFAR
DO oprec
=OPKAR()
return
