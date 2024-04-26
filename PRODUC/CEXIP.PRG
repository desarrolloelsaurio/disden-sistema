********************************************************************************
*-- PROGRAMA: CEXIP.PRG
*-- FECHA   : 09/18/91 04:03PM
*-- VERSION : G. REINER
*-- NOTAS   : CALCULA STOCK NECESARIO PARA FABRICAR UN PRODUCTO POR PANTALLA
********************************************************************************
STORE HORA_ulp(program()) to ulpr
if cheqseg()
   STORE NUL TO respuesta
   IF !EMPTY(elimer(" a Fabricar",-1,1))
      RTCL=MER.ARTICULO
      MRCD=ALLTRIM(MER.MERCA)
			STORE NUL TO CAMUT,ELTALLE
			IF TALLECAN()
         =WIN0()
         =men_lin(" Calculando - Espere por favor ")
         SELE des
         @ 1,0 SAY rtcl+"-"+mrcd COLO SCHE 19
         @ 2,0 SAY 'Cantidad a Fabricar:'+ALLTRIM(STR(camut)) COLO SCHE 19
         ?
         B=paip
         acla=PADC("MATERIAL",20)+B+PADC("CANTIDAD BRUTA",14)+B+PADC("CANTIDAD NETA",14)+B+PADC("U. COMPRA",10)+B+PADC("EXISTENCIA",10)+B+PADC("NECES.",6)
         lns=REPL("=",LEN(acla))
         @ 1,0 SAY rtcl+"-"+mrcd COLO SCHE 19
         @ 2,0 SAY 'Cantidad a Fabricar:'+ALLTRIM(STR(camut))+" / Talle: "+alltrim(str(eltalle)) COLO SCHE 19
         =_lin()
         _wrap=.f.
         SCAN FOR articulo=rtcl .AND. ((tipo=LEFT(abio,1) .OR. tipo=LEFT(tella,1))) .and. talle=eltalle
            IF ROW()>22
               IF !fin_lns(1)
                  EXIT
               ELSE
                  CLEA
                  =men_lin(" Calculando - Espere por favor ")
                  @ 1,0 SAY rtcl+"-"+mrcd COLO SCHE 19
                  @ 2,0 SAY 'Cantidad a Fabricar:'+ALLTRIM(STR(camut))+" / Talle: "+alltrim(str(eltalle)) COLO SCHE 19
                  ?
                  =_lin()
               ENDIF
            ENDIF
            IF tipo=LEFT(abio,1)
               =xseek(des.aviCODPRO,'AVIS','avicodPRO')
               ? LEFT(aviS.avio,20)
               uo=aviS.unidad
               st=aviS.stock
            ELSE
               =XSEEK(DES.TELCODPRO,'TELS','TELCODPRO')
               ? LEFT(TELS.TELA,20)
               uo=telS.unidad
               st=telS.stock
            ENDIF
            ?? paip
            ct2=cantidad*camut
            ?? STR(ct2,14)
            ?? PAIP
            ct3=ct2/fraccion
            ?? STR(ct3,14,2)
            ?? PAIP
            ?? SAYMIX(uo,"MDDCOD",10)
            ?? PAIP
            ?? STR(st,10)
            ?? PAIP
            ?? IIF(st>=ct3,'------',STR(CEILING(ct3-st),6))
         ENDSCAN
         IF LASTKEY()#27
            ? LNS
            =MEN_LIN(" Tecla para continuar ",.F.,.F.,.F.,.T.)
            =RELEWIN("WIN")
         ENDIF
         =IAUD(MER.ARTICULO+'-'+MER.MERCA)
      ENDIF
   ENDIF
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
