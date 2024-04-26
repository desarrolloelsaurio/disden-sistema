*********************************
*-- Programa: MENSAJ.PRG
*-- Fecha   : 06/05/91 03:09pm
*-- Version : G. REINER
*-- Notas   : MENU VARIOS
*Env¡a Mensaje
*Mensajes Enviados
*Mensajes Recibidos
*Res\<ponde Mensajes
*Listados por Pantalla
*Listados por Impresora
*Cierra Mensaje
*Borra Mensajes
*Reindexa
*********************************
#DEFINE ENTERCON "PULSE [ENTER] PARA CONTINUAR"  && ENTERCON
VR_DIJO=alltrim(prompt())
=CABPAN1()
DO CASE
CASE VR_DIJO="Env¡a Mensaje"
   DO IMEN.SPR
CASE VR_DIJO="Mensajes Enviados"
   IF OPMENS(GETENV("USERNAME"),.T.)
      =men_lin("[TAB] Consulta Mensaje - [ESC] para Salir")
      SELE MENS1
      SET ORDER TO TAG CODIGO
      =MOVECENT(0,0,10,43,"WIN"," Mensajes Enviados ",DOSSPAC(JANNAME))
      ON KEY LABEL TAB DO RMEN.SPR WITH ;
      " Verifica Mensaje ",.F.,.T.
      BROW ;
        FIELD CODIGO:R ,;
        RECEPTOR:R ,;
        FECHAOP:R ,;
        FECHA:R ,;
        CRD=IIF(CERRADA," SI "," NO "):H="CERR":R ;
        WIND WIN ;
        NOMENU NOAPPEND NODELETE
   ELSE
      =CARTEL("NO EXISTE EL SUBDIRECTORIO",;
        "PARA ALMACENAR LA GESTION DE MENSAJES",;
        "IMPOSIBLE COMTINUAR CON LA GESTION",;
        ENTERCON)
   ENDIF
   =CLOSDBF("MENS")
   =CLOSDBF("MENS1")
   ON KEY LABEL TAB
      =RELEWIN("WIN")
CASE VR_DIJO="Mensajes Recibidos" .OR. ;
     VR_DIJO="Responde Mensajes"
   hacer=iif(VR_DIJO="Responde Mensajes"," Responde "," Consulta")
   ON KEY LABEL TAB DO RMEN.SPR WITH ;
     hacer+" Mensaje ",(VR_DIJO="Responde Mensajes")
   IF OPMENS(GETENV("USERNAME"))
      =men_lin("[TAB] "+hacer+" - [ESC] para Salir")
      SET ORDER TO TAG CODIGO
      =MOVECENT(0,0,10,39,"WIN"," Mensajes Recibidos ",DOSSPAC(JANNAME))
      BROW ;
        FIELD CODIGO:R ,;
        EMISOR:R ,;
        FECHAOP:R ,;
        FECHA:R ;
        WIND WIN ;
        NOMENU NOAPPEND NODELETE
   ELSE
      =CARTEL("NO EXISTE EL SUBDIRECTORIO",;
        "PARA ALMACENAR LA GESTION DE MENSAJES",;
        "IMPOSIBLE COMTINUAR CON LA GESTION",;
        ENTERCON)
   ENDIF
   =CLOSDBF("MENS")
   =CLOSDBF("MENS1")
   ON KEY LABEL TAB
         =RELEWIN("WIN")
CASE VR_DIJO="Reindexa"
   DO XMENS
ENDCASE
ulpr=PROGRAM()
RETURN MEN_LIN(BOTOM)
