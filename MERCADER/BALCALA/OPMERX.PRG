*********************************************************
*-- Programa: OPMER.PRG
*-- Fecha   : 05/28/91 01:53am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO MERCADERIAS
*-- Modificaci¢n GOYO 07-23-92 01:11am marca -> empresa
*-- Modificaci¢n GOYO (area 14)
********************************************************
PARAMETER CSA
PRIVATE CSA
JANNRO=IIF(PARAMETER()=1,CSA,nul)
STORE NUL TO RESPUESTA
DO WHILE EMPTY(JANNRO)
	=eliemp("",-1,1)
ENDDO
SELE 14
cosa=q_arc("MER")
if EMPTY(DBF()) .OR. substr(DBF(),rat('\',dbf())+1)#cosa+'.DBF'
    IF USED("MER")
       USE IN MER
    ENDIF
    =MEN_LIN('Abriendo archivo de Mercader¡as')
	=GETDBF(COSA,"articulo","mer",14,.T.)
ENDIF
IF JANNAME='DEMOS'
   SELE MER
   SET ORDER TO
   IF RECC()>20
      GO 20
      DELE NEXT 10000
      PACK
   ENDIF
ENDIF

IF merpop
	if merpop1
	  =DEFPOGRL(merpopr,merpopc,"merpop","mer.merca",30,'Elija la Mercader¡a')
	else
 	   =DEFPOGRL(merpopr,merpopc,"merpop","mer.ARTICULO",20,'Elija la Mercader¡a')
		=OPRUB()
	endif
	ON SELE POPU merpop DO resp1
ELSE
	RELE POPU merpop
ENDIF
RETURN men_lin(botom)
