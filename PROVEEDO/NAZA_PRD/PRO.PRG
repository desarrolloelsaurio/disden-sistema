**************************************************
*-- Programa: PRO.prg
*-- Fecha   : 06/06/91 02:13pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE PROVEEDORES
**************************************************
ulpr=PROGRAM()
=cabpan1()
sele pro
DO CASE
CASE BAR()=1
   DO ipro
CASE BAR()=2
   STORE 0 TO respuesta
   IF !empty(elipro(" a Corregir",-1,1))
      DO cpro
   ENDIF
CASE BAR()=4
   STORE 0 TO respuesta
   if !empty(elipro(" a Borrar",-1,1))
      DO bpro
   ENDIF
CASE BAR()=5
   SET DELE OFF
   SET FILTER TO DELETED()
   GOTO TOP
   IF !EOF()
      STORE propop TO anterior
      STORE .T. TO propop
      =OPPRO()
      STORE 0 TO respuesta
      if !empty(elipro(" a Recuperar",-1,1))
         DO llpro
      ENDIF
      STORE anterior TO propop
   ENDIF
   SET DELE ON
   SELE pro
   SET FILTER TO
CASE BAR()=8
DO lproi
CASE BAR()=9
RESPUESTA='cligrl#13#20#L¡mites del Listado#3#\<Todos los Proveedores#\<Un Proveedor'
=DEFPOP()
   ON SELE POPU cligrl DO lprop
   ACTI POPU cligrl
   RELE POPU cligrl
CASE BAR()=11
   =VGRL("PRO"," PROVEEDORES"," DE PROVEEDORES")
CASE BAR()=13
   ulpr='XPRO'
   DO rndx WITH 16,20
   ON SELE POPU rndx DO xpro
   ACTI POPU rndx
   RELE POPU rndx
ENDCASE
ulpr=PROGRAM()
UNLO ALL
RETURN Men_lin(botom)
