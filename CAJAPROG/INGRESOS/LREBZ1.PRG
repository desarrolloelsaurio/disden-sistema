function lrebz1
PARAMETER SALTA
EXTERNAL ARRAY HABILITADO,TEX
IF !SALTA
   ? paip
   for lxa = 1 to cant_max
      if VARIABLE[lxa]
         IF LXA>4
            ?? STR(TEX[LXA],XACDIGI,2)
         ELSE
            IF LXA=1
               IF ESCHAR
                  ?? RIGHT(TEX[LXA],TEXTO[LXA,2])
               ELSE
                  ?? PADR(Q_FAC(SUCU+"-"+ALLTRIM(STR(TEX[LXA]))),TEXTO[LXA,2])
               ENDIF
            ELSE
               ?? PADR(TEX[LXA],TEXTO[LXA,2])
            ENDIF
         ENDIF
         ?? PAIP
      endif
   nexT
	 STORE CASOS+1 TO CASOS
ELSE
   STORE NUL TO TTL
ENDIF
STORE NUL TO TEX[5],TEX[6],TEX[7],TEX[8],TEX[9]
STORE CAJ.NUMERE TO TEX[1]
STORE CAJ.FECHAOP TO TEX[2]
STORE PER.CLIENTE TO TEX[3]
STORE CAJ.COMPR TO TEX[4]
return .t.
