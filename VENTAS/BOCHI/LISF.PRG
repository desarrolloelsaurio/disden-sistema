DEFI WIND WIN FROM 0,0 TO 14,79 DOUBL
ACTI WIND WIN
@ 1,0 say "       浜様様様様様様様様様様様様様様様様様様様僕様様様様僕様曜様様様様曜様様�"
@ 2,0 say "       �          ANCHO DE LA LETRA            �  ALTO   �COLR� INCLINA �2IMP�"
@ 3,0 say "浜様様郵陳陳堕陳賃陳陳堕陳賃陳陳堕陳賃陳陳堕陳鍔陳陳堕陳鍔陳陳彡陳賃陳陳彡陳超"
@ 4,0 say "�      �ECom�PCom�EStd�PStd�ECXp�PCXp�EExp�PExp�MEDI�DOBL�INVE�ITAL�SUBR�CALI�"
@ 5,0 say "把陳陳鍔陳陳田陳津陳陳田陳津陳陳田陳津陳陳田陳鍔陳陳田陳鍔陳陳彡陳津陳陳彡陳超"
@ 6,0 say "�TITULO�    �    �    �    �    �    �    �    �    �    �    �    �    �    �"
@ 7,0 say "把陳陳鍔陳陳田陳津陳陳田陳津陳陳田陳津陳陳田陳鍔陳陳田陳鍔陳陳彡陳津陳陳彡陳超"
@ 8,0 say "�TEXTO �    �    �    �    �    �    �    �    �    �    �    �    �    �    �"
@ 9,0 say "把陳陳鍔陳陳田陳津陳陳田陳津陳陳田陳津陳陳田陳鍔陳陳田陳鍔陳陳彡陳津陳陳彡陳超"
@ 10,0 say "�PIE   �    �    �    �    �    �    �    �    �    �    �    �    �    �    �"
@ 11,0 say "藩様様擁様様詫様溶様様詫様溶様様詫様溶様様詫様擁様様詫様擁様様瞥様溶様様瞥様夕"
acti screen
DECLARE TLE[3,14]
SET MESS TO 'Cambie opciones con la barra espaciadora'
R=0
DO WHIL R<3
   STOR R+1 TO R
   C=0
   DO WHIL C<14
      STOR C+1 TO C
      STOR '--' TO TLE[R,C]
      @ 5+(R*2),(C-1)*5+10 GET TLE[R,C] PICT '@M --,SI'
   ENDD
ENDD
READ
SET MESS TO ''
RETU
