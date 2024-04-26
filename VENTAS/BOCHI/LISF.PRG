DEFI WIND WIN FROM 0,0 TO 14,79 DOUBL
ACTI WIND WIN
@ 1,0 say "       имммммммммммммммммммммммммммммммммммммммкмммммммммкммммкмммммммммкмммм╩"
@ 2,0 say "       ╨          ANCHO DE LA LETRA            ╨  ALTO   ╨COLR╨ INCLINA ╨2IMP╨"
@ 3,0 say "имммммм╧ддддбддддбддддбддддбддддбддддбддддбддддвддддбддддвддддвддддбддддвдддд╤"
@ 4,0 say "╨      ╨EComЁPComЁEStdЁPStdЁECXpЁPCXpЁEExpЁPExp╨MEDIЁDOBL╨INVE╨ITALЁSUBR╨CALI╨"
@ 5,0 say "гддддддвддддеддддеддддеддддеддддеддддеддддеддддвддддеддддвддддвддддеддддвдддд╤"
@ 6,0 say "╨TITULO╨    Ё    Ё    Ё    Ё    Ё    Ё    Ё    ╨    Ё    ╨    ╨    Ё    ╨    ╨"
@ 7,0 say "гддддддвддддеддддеддддеддддеддддеддддеддддеддддвддддеддддвддддвддддеддддвдддд╤"
@ 8,0 say "╨TEXTO ╨    Ё    Ё    Ё    Ё    Ё    Ё    Ё    ╨    Ё    ╨    ╨    Ё    ╨    ╨"
@ 9,0 say "гддддддвддддеддддеддддеддддеддддеддддеддддеддддвддддеддддвддддвддддеддддвдддд╤"
@ 10,0 say "╨PIE   ╨    Ё    Ё    Ё    Ё    Ё    Ё    Ё    ╨    Ё    ╨    ╨    Ё    ╨    ╨"
@ 11,0 say "хммммммйммммоммммоммммоммммоммммоммммоммммоммммйммммоммммйммммйммммоммммймммм╪"
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
