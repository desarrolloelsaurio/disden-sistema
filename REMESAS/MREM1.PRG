********************************************************************************
*-- Programa: MREM1.PRG
*-- Fecha   : 12/15/91
*-- Version : V.LEEGSTRA
*-- Notas   : MUESTRA REMESA PARA CAMBIAR DATOS
********************************************************************************
PARAMETER fattal, desdec,comosell
PRIVATE desdecual,hastacual, cuantos
desdecual=desdec
cuantos = OCCURS(",",fattal)+1
hastacual=desdecual+13
IF hastacual>cuantos
   hastacual=cuantos
ENDIF
ACTI WIND win
ren=0
c1=1
c2=21
c3=42
c4=53
c5=60
c6=68
   A="Ú"+REPLICATE("Ä",19)+"Â"+REPLICATE("Ä",20)+"Â"+REPLICATE("Ä",10)+"Â"+REPLICATE("Ä",6)+"Â"+REPLICATE("Ä",7)+"Â"+REPLICATE("Ä",10)+"¿"
   B="³"+REPLICATE(' ',19)+"³"+REPLICATE(' ',20)+"³"+REPLICATE(' ',10)+"³"+REPLICATE(' ',6)+"³"+REPLICATE(' ',7)+"³"+REPLICATE(' ',10)+"³"
   C="Ã"+REPLICATE("Ä",19)+"Å"+REPLICATE("Ä",20)+"Å"+REPLICATE("Ä",10)+"Å"+REPLICATE("Ä",6)+"Å"+REPLICATE("Ä",7)+"Å"+REPLICATE("Ä",10)+"´"
   D="À"+REPLICATE("Ä",19)+"Á"+REPLICATE("Ä",20)+"Á"+REPLICATE("Ä",10)+"Á"+REPLICATE("Ä",6)+"Á"+REPLICATE("Ä",7)+"Á"+REPLICATE("Ä",10)+"Ù"
   if comosell
      @ 0,0 say A
      @ 1,0 say B
      ren=1
   else
      ren=0
   endif
   @ ren,0 SAY B
   @ ren,1 SAY "MERCADERIA"
   @ ren,21 SAY "OBSERVACIONES"
   @ ren,42 SAY "TIPO ENVA."
   @ ren,53 SAY "BULTOS"
   @ ren,60 SAY "Kg/BULT"
   @ ren,68 SAY "   ZONA   "
   ren=ren+1
   if comosell
      @ ren,0 say C
      renf=ren+1
   else
      renf=ren
   endif
   for ren=renf to 20
      @ ren,0 SAY B
   ENDfor
   @ ren,0 SAY D
ren=renf
FOR I=desdecual TO hastacual
   SELE rem
   nada=IIF(I=1,1,AT(",",fattal,I-1)+1)
   nada1=IIF(I=cuantos,LEN(fattal)+1,AT(",",fattal,I))
   GO VAL(SUBSTR(fattal, nada, nada1-nada))
   SCAT MEMV
   sele mer
   SET ORDER TO TAG MERCA
   @ ren ,c1 SAY iif(seek(m->merca),left(chrtran(mer->palpopup," ",""),19),"Merca. inexistente ")
   @ ren ,c2 SAY m->tamano
   naenvas=iif(XSEEK(M->ENVASE,'MIX','ENVCOD'),left(mix->texto1,10),space(10))
   @ ren,c3 SAY naenvas
   @ ren, c4 SAY str(m->bultos,6)
   @ ren, c5 SAY str(m->kgbulto,7,2)
   nazona=iif(XSEEK(M->ZONA,'MIX','ZONCOD'),left(mix->texto1,10),space(10))
   @ ren, c6 SAY nazona
   SELE rem
   ren=ren+1
NEXT
RETURN
