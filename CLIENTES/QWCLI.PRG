*******************************************
*-- Programa: QWPER.PRG
*-- Fecha   : 05-04-92 03:19pm
*-- Version : G. REINER
*-- Notas   : DEVUELVE FISC PARA CLIENTES
*******************************************
PARAMETER TROFIL,OTRAVAR
PRIVATE TROFIL
#DEFINE NUL    0                                 && NUL
SALIDA='.F.'
DO CASE
CASE TROFIL=1
   SALIDA='.T.'
   TT='Todos los Clientes'
CASE TROFIL=2
   SALIDA=QWCIU(CIUGRL(" Ciudad a Listar "),"PER.localidad")
   IF SALIDA#".F."
      QW=AT(CHR(250),SALIDA)
      SALIDA=left(SALIDA,qw-1)
      TT=SUBSTR(SALIDA,QW+1)
   ENDIF
CASE TROFIL=3
   =OPZON()
   STOR NUL TO RESPUESTA
   IF !EMPTY(elizon(" a Listar",-1,1))
      SALIDA='LEFT(PER.TEXTO1,2)="'+LEFT(TEXTO2,2)+'"'
      TT='Por Zona:'+ALLTRIM(mix.texto1)
   ELSE
      STORE '.F.' TO SALIDA
   ENDIF
   #IF "RAFULS" $ CURDIR() .OR. "ALQUIL" $ CURDIR()
   CASE TROFIL=4
      STOR NUL TO RESPUESTA
      IF !EMPTY(eliiNQ(" a Listar",-1,1))
         XCOS=RESPUESTA
         SALIDA=CUAL+'="'+PER.CODCLI+'"'
         TT='Inquilino:'+ALLTRIM(per.cliente)
      ELSE
         STORE '.F.' TO SALIDA
      ENDIF
   #ELSE
   CASE TROFIL=4
      STOR NUL TO RESPUESTA
      IF !EMPTY(eliiva(" a Listar",-1,1))
         XCOS=RESPUESTA
         SALIDA='PER.condiva='+LEFT(MIX.TEXTO2,2)
         TT='Por Condici¢n de I.V.A.:'+ALLTRIM(MIX.TEXTO1)
      ELSE
         STORE '.F.' TO SALIDA
      ENDIF
   #ENDIF
CASE TROFIL=6
   STORE NUL TO RESPUESTA
   IF !EMPTY(ELILIS("del Cliente"))
      SALIDA='PER.NU1='+ALLTRIM(STR(RESPUESTA))
      TT='Por Lista de Precios:'
      nada1='XALIS'+alltrim(str(respuesta))
      TT=TT+EVAL(NADA1)
   ELSE
      STORE '.F.' TO SALIDA
   ENDIF
CASE TROFIL=7
   SALIDA='PER.bloqueo'
   TT='Clientes Bloqueados'
CASE TROFIL=8
   =OPCLI()
   STOR NUL TO RESPUESTA
   IF !EMPTY(elicli(" a Corregir",-1,1))
      tt='CLIENTE:'+alltrim(PER.cliente)
      IF EMPTY(OTRAVAR)
         salida='PER.codcli="'+PER.codcli+'"'
      ELSE
         salida=ALLTRIM(OTRAVAR)+'="'+PER.codcli+'"'
      ENDIF
   ELSE
      =NOSELEC("CLIENTE")
      STORE '.F.' TO SALIDA
   ENDIF
OTHERWISE
   STORE '.T.' TO SALIDA
ENDCASE
=MEN_LIN(BOTOM)
RETURN SALIDA
