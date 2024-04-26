**************************************************************
*-- Programa: FACTUR.prg
*-- Fecha   : 11-28-91 11:43am
*-- Version : R. 'EL BATA'
*-- Notas   : DERIVA A OPERACIONES DE FACTURAS DE PROVEEDORES
*-- Modificaci¢n GOYO
** VERSION ADMINISTRACION DE PROPIEDADES/SISTEMA DE CONSORCIOS
**************************************************************
F_DIJO=ALLTRIM(PROMPT())
=cabpan1()
do opcns
STORE 1 TO d1,c1
STORE 15 TO d2,c2
d3=24
d4=30
d5=35
STORE 46 TO d6,c3
STORE 63 TO d7
c4=52
c5=65

DO CASE
CASE F_DIJO="Facturas"
   store nul to respuesta
   if !EMPTY(elicns("",1,1))
      =OPPRO()
		=OPPAG()

      DO opfar
      DO opccp
		=OPGAS()
      do opccg
      DO ifacd WITH 'FA','FACT','FACT','FACT','Fact. Cons. '+alltrim(cns.consorcio)+' '
   endif
CASE F_DIJO="Notas de Cr‚dito"
   store nul to respuesta
   if !EMPTY(elicns("",1,1))
      =OPPRO()
		=OPPAG()

      DO opfar
      DO opccp
		=OPGAS()
      do opccg
      DO ifacd WITH 'NC','NCRE','NCRE','NCRE','N. Cred. Cs '+alltrim(cns.consorcio)+' '
   endif
CASE F_DIJO="Borra Documento"
   =OPPRO()
	=OPPAG()

   DO opccp
	=OPGAS()
   DO opfar
   if elifco()
      do opccg
      DO ifacd WITH 'FA', 'FACT','FACT','FACT','Documento Cons. '+alltrim(cns.consorcio)+' ',"BORRA", .T.
   endif
CASE F_DIJO="Muestra Factura"
   =OPPRO()
	=OPPAG()

   DO opccp
	=OPGAS()
   DO opfar
   if elifco()
      do opccg
      DO ifacd WITH 'FA', 'FACT','FACT','FACT','Documento Cons. '+alltrim(cns.consorcio)+' ',"MUESTRA", .T.
   endif
CASE LEFT(F_DIJO,5)="Lista"
   =OPPRO()
   DO opfar
	=OPPAG()

	=OPGAS()
   fisc=''
   ttque=''
   store 1 to filfac,filfec,filcns,filpro,filpag,filgas,filmon && que se lista
   CANT_MAX=19
   DIME TEXTO[CANT_MAX,2], VARIABLE[CANT_MAX], Habilitado[CANT_MAX],TTL[CANT_MAX],CTRL[CANT_MAX]
   TEXTO[1,2] =  14
   TEXTO[2,2] =   8
   TEXTO[3,2] =  20
   TEXTO[4,2] =   8
   TEXTO[5,2] =  2
   TEXTO[6,2] =  30
   TEXTO[7,2] =  23
   TEXTO[8,2] =  XACDIGI
   TEXTO[9,2] =  XACDIGI
   TEXTO[10,2]=  XACDIGI
   TEXTO[11,2]=  XACDIGI
   TEXTO[12,2]=  XACDIGI
   TEXTO[13,2]=  XACDIGI
   TEXTO[14,2]=  XACDIGI
   TEXTO[15,2]=  XACDIGI
   TEXTO[16,2]=  20
   TEXTO[17,2]=  10
   TEXTO[18,2]=  XACDIGI
   TEXTO[CANT_MAX,2]=  19

   TEXTO[1,1] ='FACTURA'
   TEXTO[2,1] ='FECHA EMISION'
   TEXTO[3,1] ='CONSORCIO'
   TEXTO[4,1] ='FECHA VENCIMIENTO'
   TEXTO[5,1] ='TIPO COMPROBANTE'
   TEXTO[6,1] ='PROVEEDOR'
   TEXTO[7,1] ='COND.PAGO'
   TEXTO[8,1] ='MONTO'
   TEXTO[9,1] ='DESCUENTO'
   TEXTO[10,1]='MONTO BRUTO'
   TEXTO[11,1]='MONTO '+ALLTRIM(XACI[1])
   TEXTO[12,1]='MONTO '+ALLTRIM(XACI[2])
   TEXTO[13,1]='MONTO '+ALLTRIM(XACI[3])
   TEXTO[14,1]='MONTO EXENTO'
   TEXTO[15,1]='MONTO NETO'
   TEXTO[16,1]='TIPO DE GASTO'
   TEXTO[17,1]='MONEDA'
   TEXTO[18,1]='COTIZACION'
   TEXTO[CANT_MAX,1]='USUARIO'
   do while queryfco()
      if filfac=2
         =IFACD("FA","Fact.","Fact","Factura","Facturas",.t.)
      else
         =acopy(habilitado,habilant)
         do while CFGFAC() .and. filfac#2
            =IIF(F_DIJO="Lista por Pantalla",LFCDP(),LFCDI())
            store .f. to variable
         ENDdo
         store .f. to variable
         =acopy(habilant,habiitado)
      endif
   enddo
CASE F_DIJO="Reindexa"
   DO XFAR
ENDCASE
ulpr=PROGRAM()
RETURN MEN_LIN(BOTOM)
