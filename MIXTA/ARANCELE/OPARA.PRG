**************************************
*-- Programa: OPPRV.PRG
*-- Fecha   : 03-23-92 12:20pm
*-- Version : R. 'EL BATA'
*-- Notas   : ABRE ARCHIVO PROVINCIAS
**************************************
PARAMETER REOP
IF REOP
   IF USED("MIX")
      USE IN MIX
   ENDIF
ENDIF
IF USED("MIX")
    SELE MIX
	SET ORDER TO TAG ARATEX
ELSE
	=MEN_LIN(ABA+"Aranceles")
   SELE 1
   =GETDBF('MIXTA','ARATEX','MIX')
ENDIF
RETU IIF(ARAPOP,DEFPOGRL(ARAPOPR,ARAPOPC,'ARAPOP','SUBSTR(MIX.TEXTO1,3)+"/"+SUBSTR(MIX.TEXTO2,3)',40,'Elija el Arancel'),.T.) .AND. MEN_LIN(BOTOM)
