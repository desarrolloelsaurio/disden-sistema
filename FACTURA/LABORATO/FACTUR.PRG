* ษออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : FACTUR.PRG           บ
* บ COMENTARIO    : GESTION DE PACIENTES บ
* ฬออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER             บ
* บ FECHA      : 04-30-94 04:25pm        บ
* บ COPYRIGHT  : 1994 by GREGORIO REINER บ
* ศออออออออออออออออออออออออออออออออออออออผ
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
 
=cabpan1()
fwd_dijo=ALLTRIM(PROMPT())
=OPLIQ()
=OPPRA()
=OPPAC()
=OPMIX()
=OPMUT()
DO CASE
CASE fwd_dijo='Listados de Control por Pantalla' .or. ;
     fwd_dijo='Listados de Control por Impresora'
   respuesta='PAC1#3#25#Listados de Control#3;
#Pacientes \<no en condiciones;
#Datos Personales \<incompletos;
#Datos de Liquidaciขn in\<completos'
   =DEFPOP()
   ON SELE POPU PAC1 DO LPACCON WITH (fwd_dijo='Listados de Control por Pantalla')
   ACTI POPU PAC1
   RELE POPU PAC1
CASE LEFT(fwd_dijo,12)='Resumen por '
   respuesta="PAC1#5#35#Resฃmenes#3;
#C\<ompleto;
#\<C mara Gamma;
#\<Ecografกa;
#\<Tomografกa"
   =DEFPOP()
   ON SELE POPU PAC1 DO RESUMEN WITH (fwd_dijo='Resumen por Pantalla')
   ACTI POPU PAC1
   RELE POPU PAC1
CASE fwd_dijo='Emite Liquidaciขn'
CASE fwd_dijo='Cierra mes facturado'
   STORE NUL TO RESPUESTA
   M.FECINI=MESANIO("Mes a cerrar",.T.)
   IF LAST()#27 .AND. !EMPTY(M.FECINI)
      M.XMES=VAL(LEFT(M.FECINI,2))
      M.XANIO=VAL(RIGHT(M.FECINI,4))
      STORE NUL TO RESPUESTA
      SET MESS TO "Mutual a Cerrar"
      IF ELIMUT("a cerrar",-1,1)
         =POPCARTE("!!!"+CRLF+;
           "USTED DESEA CERRAR EL MES DE"+CRLF+;
           QMES(XMES)+" DE "+RIGHT(M.FECINI,4)+CRLF+;
           "DE LA OBRA SOCIAL "+;
           ALLTRIM(MUT.MUTUALABR)+CRLF+;
           "!!!")
         IF CONFIRMA("Cerrar mes",.t.,10,0)
            =WORKING()
            =DOTALK()
            M.LAOBSOC=MUT.CODMUT
            SET ORDER TO TAG PACCOD IN PER
            SELE LIQ
            SET RELA TO PACIENTE INTO PER
            repl LIQ.mes with m.xmes FOR PASADA .AND. !LIQUIDADO .and. PER.TEXTO1=LAOBSOC
            repl LIQ.ano with M.xanio FOR PASADA .AND. !LIQUIDADO .and. PER.TEXTO1=LAOBSOC
            repl LIQUIDADO with .t. FOR PASADA .AND. !LIQUIDADO .and. !empty(mes) .and. PER.TEXTO1=LAOBSOC
 
            =OFF_RELA()
            =UNTALK()
            =UNWORK()
         ENDIF
         =RELEWIN("POPCARTE")
      ENDIF
   ENDIF
CASE fwd_dijo='Reabre mes'
CASE fwd_dijo='Refactura Paciente'
CASE fwd_dijo='Reindexa base'
   DO XLIQ
ENDCASE
RETURN MEN_LIN(BOTOM)
