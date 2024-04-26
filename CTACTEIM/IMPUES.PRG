* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : IMPUES.PRG                               บ
* บ COMENTARIO    : GESTION DE CUENTA CORRIENTE DE IMPUESTOS บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM

ULPR=PROGRAM()
IM_DIJO=ALLTRIM(PROMPT())
=CABPAN1()
=OPIMP()
=OPCCI()
=OPCCL()
=OPALQ()
=OPPRP()
=OPCCP()
=OPINM()
RESPUESTA='IMPU#4#38#Elija el Impuesto#3;
#\<Municipal;
#\<Inmobiliario;
#\<Dipos'
=DEFPOP()
DO CASE
CASE IM_DIJO="Ingreso Mฃltiples Vencimientos"
   DO IIMPUMUL.SPR
CASE LEFT(IM_DIJO,7)="Ingreso"
   ON SELE POPU IMPU DO IIMPU
   ACTI POPU IMPU
   RELE POPU IMPU
CASE IM_DIJO="Borra"
RESPUESTA='IMPU1#4#38#Tipo de Borrado#3;
#Borra Impuesto de \<Inquilino;
#Borra Impuesto de \<Propietario;
#Transfiere a I\<nquilino;
#Transfiere a P\<ropietario;
#Transfiere de In\<quilino a Inquilino'
=DEFPOP()
ON SELE POPU IMPU1 DO BIMP
ACTI POPU IMPU1
RELE POPU IMPU1
CASE IM_DIJO="Control"
   ON SELE POPU IMPU DO LIMPU
   ACTI POPU IMPU
   RELE POPU IMPU
CASE IM_DIJO="Entrega"
   STORE NUL TO RESPUESTA
   =IIF(EMPTY(eliinm(" a Entregar",-1,1,'T')),.T.,eimpu())
case IM_DIJO="Recepciขn"
   STORE nul TO respuesta
   =IIF(EMPTY(eliinm(" a Recibir",-1,1,'T')),.T.,RIMPU())
CASE IM_DIJO="Listado por Pantalla" .OR. ;
     IM_DIJO="Listado por Impresora"
RESPUESTA='IMPU1#4#38#Tipo de Listado#3;
#Impuestos de \<Inquilinos;
#Impuestos de \<Propietarios'
=DEFPOP()
ON SELE POPU IMPU1 DO LCCI1 WITH (IM_DIJO="Listado por Pantalla")
ACTI POPU IMPU1
RELE POPU IMPU1
ULPR=HORA_ULP(PROGRAM())
ENDCASE
RETURN MEN_LIN(BOTOM)
