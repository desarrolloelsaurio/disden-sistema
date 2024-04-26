* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : IMPINT.PRG                                               บ
* บ COMENTARIO    : GESTION DE IMPUESTOS INTERNOS                            บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 08-29-93                                                    บ
* บ HORA       : 10:21:35pm                                                  บ
* บ COPYRIGHT  : 1994 by GREGORIO REINER / VERSION NOVOGAR                   บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE ENTERCON "PULSE [ENTER] PARA CONTINUAR"  && ENTERCON
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
IM_DIJO=ALLTRIM(PROMPT())
ULPR=PROGRAM()
=CABPAN1()
SELE MER
DO CASE
CASE IM_DIJO='Generaliza'
   IF ESJEFE()
      DO GRL2 WITH 8,45,'Lกmites de la Generalizaciขn'
      ON SELE POPU NADA DO RESP1
      ACTI POPU NADA
      RELE POPU NADA
      TT=''
      FISC=QWMER(BAR())
      IF FISC#".F."
         =POPCARTE("USTED HA SELECCIONADO"+CRLF+"GENERALIZACION POR"+CRLF+TT+CRLF)
         STORE NUL TO ELPORC
         M.ELPORC=INFIC("Porcentaje a Generalizar",100)
         IF LAST()#27 .AND. ;
            CONFIRMA("Actualizaciขn de "+alltrim(str(m.ELPORC))+" %",.t.,10,0)
            SELE MER
            SET ORDER TO
            =WORKING()
            =DOTALK()
            =FLOCK("MER") .OR. FLOK("MER")
            REPL IMPINT WITH ELPORC FOR &FISC
            UNLO IN MER
         ENDIF
         =RELEWIN("POPCARTE")
         =UNTALK()
         =UNWORK()
      ENDIF
ELSE
   =CARTEL("ACCESO DENEGADO",;
     "ESTE ES UN PROGRAMA DE USO EXCLUSIVO DE LA GERENCIA",;
     "POR FAVOR, NO INTENTE INGRESAR NUEVAMENTE",;
     ENTERCON)
   =IAUD("GENERALIZA IMP. INT.")
ENDIF
CASE IM_DIJO='Corrige'
   IF ESJEFE()
      STORE NUL TO M.RESPUESTA
      IF !EMPTY(ELIMER("a Corregir",-1,1))
         ON KEY LABEL TAB KEYB CHR(23)
         =MEN_LIN("Corrige Impuestos Internos - [TAB] para Salir")
         =MOVEWIN(2,5,20,75,"WIN"," Corrige Impuestos Internos ")
         SELE MER
         BROW FIEL ARTICULO:H="ARTICULO":R ,;
           MERCA:H="DESCRIPCION":R,;
           IMPINT:H="IMPUESTO":P="999.99" ;
           WIND WIN
         ON KEY LABEL TAB
         =RELEWIN("WIN")
      ENDIF
   ELSE
      =CARTEL("ACCESO DENEGADO",;
        "ESTE ES UN PROGRAMA DE USO EXCLUSIVO DE LA GERENCIA",;
        "POR FAVOR, NO INTENTE INGRESAR NUEVAMENTE",;
        ENTERCON)
      =IAUD("CORRECCION DE IMP. INT.")
   ENDIF
CASE IM_DIJO='Lista por Pantalla' .or. ;
     IM_DIJO='Lista por Impresora'
   respuesta='limpint#11#45#Listado de Impuestos Internos#3;
#Productos \<con Impuesto Interno;
#Productos \<sin Impuesto Interno;
#\<Por Porcentaje de Impuesto Interno'
   =defpop()
   ON SELE POPU limpint DO limpint with IM_DIJO='Lista por Pantalla'
   ACTI POPU limpint
   RELE POPU limpint
ENDCASE
RETURN MEN_LIN(BOTOM)
