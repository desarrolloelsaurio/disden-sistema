* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : CABLIQ.PRG                                               บ
* บ COMENTARIO    : GENERA CABECERA DE LIQUIDACION                           บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION CABLIQ
PARAMETER ELCON
PRIVATE ARCHIVO
STORE LEFT(SINCOSAS(ELCON),8)+'.TXT' TO TMPPR
=ADIR(ARCHIVO,TMPPR)
IF ALEN(ARCHIVO)>1
   =MOVEWIN(9,10,18,50,'WIN','Datos de la Liquidaciขn',ALLTRIM(ELCON))
   @ 1,1 SAY 'CONSORCIO        :' COLO SCHE 3
   @ 2,1 SAY 'FECHA DE CREACION:' COLO SCHE 3
   @ 3,1 SAY 'HORA             :' COLO SCHE 3
   @ 4,1 SAY "ARCHIVO          :" COLO SCHE 3
   @ 1,21 GET ELCON
   @ 2,21 GET ARCHIVO[1,3]
   @ 3,21 GET ARCHIVO[1,4]
   @ 4,21 GET ARCHIVO[1,1]
   CLEA GETS
   TMPPR=IIF(CONFIRMA('DATOS DE CABECERA',.F.,6,1),TMPPR,'')
   =RELEWIN("WIN")
ELSE
   =CARTEL2("No hay Archivo de Liquidaciขn","Para el consorcio",ALLTRIM(UPPER(ELCON)),"Genere y Reintente")
   TMPPR=''
ENDIF
RETURN TMPPR
