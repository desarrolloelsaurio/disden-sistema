*************************************
*-- Programa: cligrl.PRG
*-- Fecha   : 09/12/91 12:34pm
*-- Version : G. REINER
*-- Notas   : DEFINE EL POPUP cligrl
*************************************
PARAMETER R,C,t,DEAUNO,CL_TEXTO
#IF "NOVOGAR" $ CURDIR()
   respuesta='cligrl#'+str(R)+'#'+str(C)+'#'+t+'#3#\<Todos los Clientes#Por \<Localidad#Por \<Zona#Por \<Condici¢n de I.V.A.#Por \<Monto de Cr‚dito#Por Lista de \<Precios#\<Bloqueados'
   RESPUESTA=RESPUESTA+IIF(DEAUNO,'#\<Un Cliente',"")
#ELSE
    IF EMPTY(CL_TEXTO) .OR. CL_TEXTO="I"
       respuesta='cligrl'+;
       '#'+str(R)+;
       '#'+str(C)+;
       '#'+t+';
       #3;
       #\<Todos los Inquilinos;
       #Por \<Localidad;
       #Por \<Propietario'
       RESPUESTA=RESPUESTA+IIF(DEAUNO,'#\<Un Inquilino',"")
    ENDIF
#ENDIF
UNLO ALL
RETURN defpop()
