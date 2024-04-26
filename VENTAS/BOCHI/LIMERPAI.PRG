********************************************************************************
*-- Programa: LIMERPAI.PRG
*-- Fecha   : 14.03.90
*-- Version : G. REINER
*-- Notas   : LISTADO MERCADERIAS
********************************************************************************
*DEFI WIND win FROM 0,0 TO 23,79 DOUB
*EFINE WIND win1 FROM 10,25 TO 12,54 DOUB
*CTI WIND win
*CTI WIND win1
*TORE '' TO code
*TORE 10 TO COL
* 0,0 SAY 'CODIGO'
*O WHIL LEN(code)<11
*  DO WHIL INKEY()=0
*  ENDD
*  A=LASTKEY()
*  IF A#13
*     code=code+CHR(A)
*  ELSE
*     EXIT
*  ENDI
*  @ 0,COL SAY CHR(7)
*  @ 0,COL SAY 'X' COLO SCHE 24
*  COL=COL+1
*NDDO
*EAC WIND ALL
*ET COLOR TO W
*N ESCAPE
*N ERROR
*ELE mer
*ET ORDER TO
*F USER()='JULIGAN'
*  ok=VAL(LEFT(code,1))
*LSE
*  code=code+'}}}}}}}}}}}'
*  code=LEFT(code,10)
*  GO 570
*  I=0
*  ok=1
*  DO WHIL I#10
*     I=I+1
*     IF LEFT(detalle,1)=SUBSTR(code,I,1)
*        SKIP
*     ELSE
*        ok=0
*        EXIT
*     ENDI
*  ENDD
*  IF ok=0
*     I=0
*     ok=2
*     GO 1160
*     DO WHIL I#10
*        I=I+1
*        IF LEFT(detalle,1)=SUBSTR(code,I,1)
*           SKIP
*        ELSE
*           ok=0
*           EXIT
*        ENDI
*     ENDD
*  ENDI
*  IF ok=0
*     I=0
*     ok=3
*     GO 1196
*     DO WHIL I#10
*        I=I+1
*        IF LEFT(detalle,1)=SUBSTR(code,I,1)
*           SKIP
*        ELSE
*           ok=0
*           EXIT
*        ENDI
*     ENDD
*  ENDI
*NDIF
respuesta=1
*ET ORDER TO TAG artic
RETURN
