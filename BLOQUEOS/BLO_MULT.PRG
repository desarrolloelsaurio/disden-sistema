*:*********************************************************************
*-- Programa: BLO_MULT.PRG
*-- Fecha   : 08-12-92 12:02pm
*-- Version : G. REINER
*-- Notas   : DEVUELVE LOS REGISTROS A BLOQUEAR PARA UN ARCHIVO
*!*********************************************************************
function BLO_MULT
parameter clave,condicion,FISC,apodo,horden,OTRACOND
private clave,salida,apodo,horden,apodoant,hordenant,FISC,condicion
IF CLAVE='?'
   CLEA
   TEXT
   **********************************************************************
   * Funci¢n : BLO_MULT.PRG                                             *
   * Fecha   : 08-12-92 12:02pm                                         *
   * Version : G. REINER                                                *
   **********************************************************************
   * Uso     : REGISTRO=BLO_PEC(CLAVE,FISC,ALIAS(),ORDER TAG)           *
   * Qu‚ Hace: Devuelve un String con todos los registros que responden *
   *           a la clave CLAVE, separados por comas, listo para usar   *
   *           la cuerda para bloquear los registros                    *
   *           Si no se aclara alias ni order tag, la funci¢n asume los *
   *           actuales                                                 *
   *           Si no se aclara fisc, la funci¢n scanea clave            *
   *           El parametro CONDICION informa la condici¢n segun la cual*
   *           nohayent es .t. o .f.                                    *
   **********************************************************************
ENDT
SALIDA=" "
ELSE
SALIDA=''
m.otracond=iif(type("otracond")#"C",".t.",otracond)
m.apodoant=alias()
m.hordenant=order()
m.apodo=iif(type("m.apodo")#"C",alias(),m.apodo)
m.horden=iif(type("m.horden")#"C",order(),m.horden)
m.fisc=iif(type("m.fisc")#"C",'.T.',m.fisc)
m.condicion=iif(type("m.condicion")#'C','.F.',m.condicion)
sele (M.APODO)
SET ORDER TO TAG (M.HORDEN)
=XSEEK(CLAVE)
SCAN WHILE eval(m.fisc)
   if eval(otracond)
      SALIDA=SALIDA+ALLTRIM(STR(RECNO()))+","
      IF eval(condicion)
         nohayent=.F.
      ENDIF
   endif
ENDSCAN
SELE (M.APODOANT)
SET ORDER TO TAG (M.HORDENANT)
ENDIF
RETURN SINULT(SALIDA)
