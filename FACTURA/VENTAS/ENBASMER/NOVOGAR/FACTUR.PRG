**************************************************************************
*-- Programa: FACTUR.prg
*-- Fecha   : 11-03-91 02:03am
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE FACTURACION
*-- VERSION NOVOGAR
*-- Modificaci¢n GOYO 05-27-93 03:05pm (CAMBIO DE POPUPS)
********************************************************************************
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF

ulpr=PROGRAM()
=cabpan1()
fc_dijo=alltrim(PROMPT())
=OPCLI()
=opvia()
=OPCIU()
=oppag()
=OPCCL()
=OPMER()
=OPKAR()
=OPFAC()
DO CASE
CASE FC_DIJO="Factura Directa"
   DO FAC.SPR
CASE FC_DIJO="Factura de Bien de Uso"
   DO FAC.SPR WITH .T.
CASE FC_DIJO="Factura de Remito"
   STORE NUL TO M.RESPUESTA
   =OPREM()
   IF ELIREM("a Facturar","R")
      DO FAC.SPR WITH .F.,.F.,.F.,REM.REMITO
   ENDIF
CASE FC_DIJO='Facturaci¢n "A"'
   respuesta='fct#4#30#Operaciones con Facturas Tipo "A"#3;
#Listados por \<Pantalla;
#Listados por \<Impresora;
#-;
#\<Restaura el Archivo'
   =DEFPOP()
   ON SELE POPU FCT DO FACTURA WITH 'A'
   ACTI POPU FCT
   RELE POPU FCT
CASE FC_DIJO='Facturaci¢n "B"'
   respuesta='fct#5#30#Operaciones con Facturas Tipo "B"#3;
#Listados por \<Pantalla;
#Listados por \<Impresora;
#-;
#\<Restaura el Archivo'
   =DEFPOP()
   ON SELE POPU FCT DO FACTURA WITH 'B'
   ACTI POPU FCT
   RELE POPU FCT
CASE FC_DIJO='Todas las Facturas'
   respuesta='fct#5#30#Listados Todas las Facturas#3;
#Listados por \<Pantalla;
#Listados por \<Impresora;
#-;
#\<Restaura el Archivo'
   =DEFPOP()
   ON SELE POPU FCT DO FACTURA WITH '*'
   ACTI POPU FCT
   RELE POPU FCT
CASE FC_DIJO='Anula Factura'
   =AFAC()
CASE FC_DIJO='Reindexa Archivo'
   DO XFAC
CASE FC_DIJO='Listado Multiempresa'
   respuesta='fct#5#30#Tipo de Listado Multiempresa#3;
#Indexa Empresas;
#Por Marca;
#Por Rubro;
#Por Rubro/Subrubro'
   =DEFPOP()
   ON SELE POPU FCT do LMULTI
   ACTI POPU FCT
   RELE POPU FCT
ENDCASE
ULPR=PROGRAM()
UNLO ALL
RETURN MEN_LIN(BOTOM)
 
PROCEDURE LMULTI
LM_DIJO=ALLTRIM(PROMPT())
ESOK=.F.
STORE NUL TO M.OPCION_1
DO CASE
CASE LM_DIJO='Indexa Empresas'
   =XFAC("ARROYO")
   =XFAC("EQUIPA")
CASE LM_DIJO='Por Marca'
=OPMAR()
   STORE NUL TO M.RESPUESTA
   IF ELIMAR("a Listar",-1,1)
      STORE .T. TO M.ESOK
      TT1="Marca:"+alltrim(mi1.texto1)
      fisc="mer.marca='"+left(mi1.texto2,2)+"'"
      STORE 1 TO M.OPCION_1      
   ENDIF
CASE LM_DIJO='Por Rubro/Subrubro'
      STORE 2 TO M.OPCION_1      
CASE LM_DIJO='Por Rubro'
   =oprub()
   STORE NUL TO M.RESPUESTA
   IF ELIrub("a Listar",-1,1)
      STORE .T. TO M.ESOK
      TT1="Rubro:"+alltrim(rub.rubro)
      cosa=zero(rub.codrub,3)
      fisc="left(articulo,3)='"+cosa+"'"
      STORE 3 TO M.OPCION_1            
   ENDIF
ENDCASE
if esok
   store {} to m.fecini,fecfin
   if entre_fe("a Listar")
      =working()
      =dotalk()
      fisc1=fisc+" .and. betw(fac.fechaem,{"+dtoc(fecini)+"},{"+dtoc(fecfin)+"})"
      ** PREPARA ROSARIO      
      sele fac
      set order to tag factura
      sele fax
      set rela to factura into fac
      IF M.OPCION_1=1
         SET RELA TO ARTICULO INTO MER ADDI
      ENDIF
      copy to tmpnov for eval(fisc1)
      sele 0
      use tmpnov alias nov
      index on articulo tag articulo
      set order to tag articulo
      total on articulo to totnov      
      USE TOTNOV
      ** PREPARA ARROYO      
      sele 0
      use (path+"\arroyo\facturas") alias faca EXCL
      set order to tag factura
      sele 0
      use (path+"\arroyo\factudat") alias faxa EXCL
      set rela to factura into fac
      IF M.OPCION_1=1
         SET RELA TO ARTICULO INTO MER ADDI
      ENDIF
      fisc1=fisc+" .and. betw(faca.fechaem,{"+dtoc(fecini)+"},{"+dtoc(fecfin)+"})"
      copy to tmparr for eval(fisc1)
      sele 0
      use tmparr alias aro excl
      index on articulo tag articulo
      set order to tag articulo
      total on articulo to totarr
      USE TOTARR
      ** PREPARA EQUIPA
      sele 0
      use (path+"\equipa\facturas") alias facb EXCL
      set order to tag factura
      sele 0
      use (path+"\equipa\factudat") alias faxb EXCL
      set rela to factura into facb
      IF M.OPCION_1=1
         SET RELA TO ARTICULO INTO MER ADDI
      ENDIF
      fisc1=fisc+" .and. betw(facb.fechaem,{"+dtoc(fecini)+"},{"+dtoc(fecfin)+"})"
      copy to tmpequ for eval(fisc1)
      sele 0
      use tmpequ alias equ
      index on articulo tag articulo
      set order to tag articulo
      total on articulo to totequ      
      USE TOTEQU
      create cursor resumen ;
      (articulo c(20),;
      descrip c(40),;
      NOVOGAR n(10),;
      arroyo n(10),;
      equipa n(10))
      index on articulo tag articulo
      =cargart(1,"TOTNOV")
      =cargart(2,"TOTARR")      
      =cargart(3,"TOTEQU")      
      SELE RESUMEN
      INDEX ON NOVOGAR+arroyo+equipa TAG COSA
      SET ORDER TO TAG COSA
      ACLAPAN=PAIP+PADC("ARTICULO",20)+;
      PAIP+PADC("NOVOGAR",XACDIGI)+;
      PAIP+PADC("ARROYO",XACDIGI)+;
      PAIP+PADC("EQUIPA",XACDIGI)+;
      PAIP+PADC("TOTALES",XACDIGI)+paip
      ACLAPRN=PAIP+PADC("ARTICULO",20)+;
      PAIP+PADC("DESCRIPCION",40)+;
      PAIP+PADC("NOVOGAR",XACDIGI)+;
      PAIP+PADC("ARROYO",XACDIGI)+;
      PAIP+PADC("EQUIPA",XACDIGI)+;
      PAIP+PADC("TOTALES",XACDIGI)+paip
      tt="Listado Multiempresa"+crlf+;
      tt1+crlf+;
      "entre el "+dtoc(fecini)+" y el "+dtoc(fecfin)
      =XPRN1(4,"RESUMEN","LMULT0()",FISC,"MULTIEMPRESA",4)
      USE IN RESUMEN
      USE IN TOTNOV
      USE IN TOTARR
      USE IN TOTEQU
      =closdbf("nov")
      =closdbf("equ")
      =closdbf("aro")
      ERASE TOTNOV.DBF
      ERASE TMPNOV.DBF
      ERASE TMPNOV.CDX      
      ERASE TOTARR.DBF
      ERASE TMPARR.DBF      
      ERASE TMPARR.CDX           
      ERASE TOTEQU.DBF
      ERASE TMPEQU.DBF      
      ERASE TMPEQU.CDX
      =CLOSDBF("FAXA")
      =CLOSDBF("FACA")
      =off_tmp()      
      =untalk()
      =unwork()
   endif
endif
RETURN MEN_LIN(BOTOM)

function cargart
parameter NUMER_EMPRESA,ALIAS_EMPRESA
SELE (ALIAS_EMPRESA)
SCAN
   LACOSA=ARTICULO
   LACANT=CANTIDAD
   IF !XSEEK(ARTICULO,"RESUMEN","ARTICULO")
      SELE RESUMEN
      APPE BLAN
      REPL ARTICULO WITH LACOSA
      REPL DESCRIP WITH SAYMER(LACOSA)
   ELSE
      SELE RESUMEN
   ENDIF
   DO CASE
   CASE NUMER_EMPRESA=1
   REPL NOVOGAR WITH NOVOGAR+LACANT
   CASE NUMER_EMPRESA=2
   REPL ARROYO WITH ARROYO+LACANT
   CASE NUMER_EMPRESA=3
   REPL EQUIPA WITH EQUIPA+LACANT
   ENDCASE
   SELE (ALIAS_EMPRESA)
ENDSCAN
RETURN .T.

FUNCTION LMULT0
? PAIP
?? ARTICULO
?? paip
IF !PORPAN
?? DESCRIP
?? PAIP
ENDIF
?? STR(NOVOGAR,XACDIGI)
?? PAIP
?? STR(ARROYO,XACDIGI)
?? PAIP
?? STR(EQUIPA,XACDIGI)
?? PAIP
?? str(novogar+arroyo+equipa,xacdigi)
?? paip
store total[1]+novogar to total[1]
store total[2]+arroyo to total[2]
store total[3]+equipa to total[3]
store total[4]+novogar+arroyo+equipa to total[4]
return .t.

