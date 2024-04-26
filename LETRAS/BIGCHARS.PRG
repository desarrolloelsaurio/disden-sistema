procedure bigchars
parameter startx,starty,instring,inicio,relleno
private startx,starty,instring,inicio
if parameter()=3
   inicio=1
endif
curenty = starty
curlet = 1
curwin=inicio
if "MONO" $ upper(sys(2006))
   colorvar = "n/n"
else
   colorvar = "n/b"
endif
do while curlet <= len(instring) and curenty < 89
LALETRA=subs(instring,curlet,1)
   do case
   case LALETRA = " "
      =bigcha01(3,5,6)
   case LALETRA = "t"
      =bigcha01(5,5,6)
      @ 0,0 say " ÛÛ"
      @ 0,3 say "Ü" COLO (COLORvar)
      @ 1,0 say "ßÛÛ"
      @ 1,3 say "ß" COLO W+/n
      @ 1,4 say "Ü" COLO (COLORvar)
      @ 2,1 say "ÛÛ " COLO W+/n
      @ 3,0 say " ßÛ"
      @ 3,3 say "Ü" COLO W+/n
      @ 4,0 say "   ßß" COLO (COLORvar)
   case LALETRA = "s"
      =bigcha01(5,5,7)
      @ 1,0 say "ÜÛ"
      @ 1,2 say "ß" COLO W+/n
      @ 1,3 say "ÛÜ"
      @ 2,0 say " ß"
      @ 2,2 say "ßÛÜ" COLO W+/n
      @ 2,5 say "ß" COLO (COLORvar)
      @ 3,0 say "ßÛÜÛ"
      @ 3,4 say "ß " COLO W+/n
      @ 4,0 say "  ßßß" COLO (COLORvar)
   case LALETRA = "e"
      =bigcha01(5,5,7)
      @ 1,0 say "ÜÛ"
      @ 1,2 say "ßÛ" COLO W+/n
      @ 1,4 say "Ü"
      @ 2,0 say "ÛÛßßß " COLO W+/n
      @ 3,0 say "ßÛ"
      @ 3,2 say "ÜÛß" COLO W+/n
      @ 3,5 say "Ü" COLO (COLORvar)
      @ 4,0 say "  ßßß" COLO (COLORvar)
   case LALETRA = "r"
      =bigcha01(5,5,6)
      @ 1,0 say "ÛÜÛ"
      @ 1,3 say "ß" COLO W+/n
      @ 1,4 say "Ü" COLO (COLORvar)
      @ 2,0 say "ÛÛ " COLO W+/n
      @ 2,3 say "ß" COLO (COLORvar)
      @ 3,0 say "ÛÛ " COLO W+/n
      @ 4,0 say " ßß" COLO (COLORvar)
   case LALETRA = "o"
      =bigcha01(5,5,7)
      @ 1,0 say "ÜÛ"
      @ 1,2 say "ßÛ" COLO W+/n
      @ 1,4 say "Ü"
      @ 2,0 say "ÛÛ ÛÛ " COLO W+/n
      @ 3,0 say "ßÛ"
      @ 3,2 say "ÜÛß " COLO W+/n
      @ 4,0 say "  ßßß" COLO (COLORvar)
   case LALETRA = "a"
      =bigcha01(5,6,8)
      @ 1,0 say "Üß"
      @ 1,2 say "ßÛ" COLO W+/n
      @ 1,4 say "Ü"
      @ 2,0 say "ÜÛ"
      @ 2,2 say "ßÛÛ " COLO W+/n
      @ 3,0 say "ßÛ"
      @ 3,2 say "ÜÛÛÜ" COLO W+/n
      @ 4,0 say "  ßß ßß" COLO (COLORvar)
   case LALETRA = "i"
      =bigcha01(5,3,4)
      @ 0,0 say "ß"
      @ 0,1 say "ß" COLO W+/n
      @ 0,2 say "Ü" COLO (COLORvar)
      @ 1,0 say "ÛÛ"
      @ 1,2 say "Ü" COLO (COLORvar)
      @ 2,0 say "ÛÛ " COLO W+/n
      @ 3,0 say "ÛÛ " COLO W+/n
      @ 4,0 say " ßß" COLO (COLORvar)
   case LALETRA = "n"
      =bigcha01(5,5,7)
      @ 1,0 say "ÛÜ"
      @ 1,2 say "ßÛ" COLO W+/n
      @ 1,4 say "Ü"
      @ 2,0 say "ÛÛ ÛÛ " COLO W+/n
      @ 3,0 say "ÛÛ ÛÛ " COLO W+/n
      @ 4,0 say " ßß ßß" COLO (COLORvar)
   case LALETRA = "m"
      =bigcha01(5,8,10)
      @ 1,0 say "ÛÜ"
      @ 1,2 say "ßÛ" COLO W+/n
      @ 1,4 say "Ü"
      @ 1,5 say "ßÛ" COLO W+/n
      @ 1,7 say "Ü"
      @ 2,0 say "ÛÛ ÛÛ ÛÛ " COLO W+/n
      @ 3,0 say "ÛÛ ÛÛ ÛÛ " COLO W+/n
      @ 4,0 say " ßß ßß ßß" COLO (COLORvar)
   case LALETRA = "f"
      =bigcha01(5,6,7)
      @ 0,0 say " ÜÛ"
      @ 0,3 say "ßß" COLO W+/n
      @ 0,5 say "Ü" COLO (COLORvar)
      @ 1,0 say "ßÛÛ"
      @ 1,3 say "ß" COLO W+/n
      @ 1,4 say "Ü" COLO (COLORvar)
      @ 2,1 say "ÛÛ " COLO W+/n
      @ 3,1 say "ÛÛ " COLO W+/n
      @ 4,0 say "  ßß" COLO (COLORvar)
   case LALETRA = "l"
      =bigcha01(5,3,4)
      @ 0,0 say "ÛÛ"
      @ 0,2 say "Ü" COLO (COLORvar)
      @ 1,0 say "ÛÛ " COLO W+/n
      @ 2,0 say "ÛÛ " COLO W+/n
      @ 3,0 say "ÛÛ " COLO W+/n
      @ 4,0 say " ßß" COLO (COLORvar)
   case LALETRA = "k"
      =bigcha01(5,7,8)
      @ 0,0 say "ÛÛ"
      @ 0,2 say "Ü" COLO (COLORvar)
      @ 1,0 say "ÛÛÜÛß" COLO W+/n
      @ 1,5 say "Ü" COLO (COLORvar)
      @ 2,0 say "ÛÛÛÜ" COLO W+/n
      @ 2,4 say "ß" COLO (COLORvar)
      @ 3,0 say "ÛÛ " COLO W+/n
      @ 3,3 say "ßÛÜ"
      @ 4,0 say " ßß  ßß" COLO (COLORvar)
   case LALETRA = "u"
      =bigcha01(5,6,7)
      @ 1,0 say "ÛÛ"
      @ 1,2 say "Ü" COLO (COLORvar)
      @ 1,3 say "ÛÛ"
      @ 1,5 say "Ü" COLO (COLORvar)
      @ 2,0 say "ÛÛ ÛÛ " COLO W+/n
      @ 3,0 say "ßÛ"
      @ 3,2 say "Ü" COLO W+/n
      @ 3,3 say "ß"
      @ 3,4 say "Û " COLO W+/n
      @ 4,0 say "  ßß ß" COLO (COLORvar)
   case LALETRA = "b"
      =bigcha01(5,6,7)
      @ 0,0 say "ÛÛ"
      @ 0,2 say "Ü" COLO (COLORvar)
      @ 1,0 say "ÛÛßÛ" COLO W+/n
      @ 1,4 say "Ü"
      @ 2,0 say "ÛÛ " COLO W+/n
      @ 2,3 say " Û"
      @ 2,5 say "Û" COLO (COLORvar)
      @ 3,0 say "ÛÛÜÛß " COLO W+/n
      @ 4,0 say " ßßßß" COLO (COLORvar)
   case LALETRA = "c"
      =bigcha01(5,5,6)
      @ 1,0 say "ÜÛ"
      @ 1,2 say "ßÛ" COLO W+/n
      @ 1,4 say "Ü" COLO (COLORvar)
      @ 2,0 say "ÛÛ " COLO W+/n
      @ 2,3 say " ß" COLO (COLORvar)
      @ 3,0 say "ßÛ"
      @ 3,2 say "ÜÛ" COLO W+/n
      @ 3,4 say "Ü" COLO (COLORvar)
      @ 4,0 say "  ßßß" COLO (COLORvar)
   case LALETRA = "d"
      =bigcha01(5,5,7)
      @ 0,0 say "   ÛÛ"
      @ 0,5 say "Ü" COLO (COLORvar)
      @ 1,0 say "ÜÛ"
      @ 1,2 say "ßÛÛ " COLO W+/n
      @ 2,0 say "Û " COLO W+/n
      @ 2,2 say "ß" COLO (COLORvar)
      @ 2,3 say "ÛÛ " COLO W+/n
      @ 3,0 say "ßÛÜÛÛ"
      @ 3,5 say "Û" COLO (COLORvar)
      @ 4,0 say "  ßßßß" COLO (COLORvar)
   case LALETRA = "q"
      =bigcha01(5,5,7)
      @ 1,0 say "ÜÛ"
      @ 1,2 say "ß" COLO W+/n
      @ 1,3 say "ÜÛ"
      @ 1,5 say "Ü" COLO (COLORvar)
      @ 2,0 say "Û " COLO W+/n
      @ 2,2 say "ß" COLO (COLORvar)
      @ 2,3 say "ÛÛ " COLO W+/n
      @ 3,0 say "ßÛÜÛÛ"
      @ 3,5 say "Û" COLO (COLORvar)
      @ 4,0 say "  ß" COLO (COLORvar)
      @ 4,3 say "ÛÛ " COLO W+/n
      @ 5,0 say "    ßß" COLO (COLORvar)
   case LALETRA = "g"
      =bigcha01(5,6,7)
      @ 1,0 say "ÜÛ"
      @ 1,2 say "ß" COLO W+/n
      @ 1,3 say "ÜÛ"
      @ 1,5 say "Ü" COLO (COLORvar)
      @ 2,0 say "Û " COLO W+/n
      @ 2,2 say "ß" COLO (COLORvar)
      @ 2,3 say "ÛÛ " COLO W+/n
      @ 3,0 say "ßÛÜÛÛ"
      @ 3,5 say "Û" COLO (COLORvar)
      @ 4,0 say " Ü"
      @ 4,2 say "Ü" COLO W+/n
      @ 4,3 say "Û"
      @ 4,4 say "ß " COLO W+/n
      @ 5,0 say "  ßßß" COLO (COLORvar)
   case LALETRA = "h"
      =bigcha01(5,5,7)
      @ 0,0 say "ÛÛ" COLO W+/n
      @ 0,2 say "Ü" COLO (COLORvar)
      @ 1,0 say "ÛÛßÛ" COLO W+/n
      @ 1,4 say "Ü"
      @ 2,0 say "ÛÛ ÛÛ " COLO W+/n
      @ 3,0 say "ÛÛ ÛÛ " COLO W+/n
      @ 4,0 say " ßß ßß" COLO (COLORvar)
   case LALETRA = "j"
      =bigcha01(5,3,5)
      @ 0,0 say " ß"
      @ 0,2 say "ß" COLO W+/n
      @ 0,3 say "Ü" COLO (COLORvar)
      @ 1,0 say " ÛÛ"
      @ 1,3 say "Ü" COLO (COLORvar)
      @ 2,1 say "ÛÛ " COLO W+/n
      @ 3,1 say "ÛÛ " COLO W+/n
      @ 4,0 say "ß"
      @ 4,1 say "ß " COLO W+/n
      @ 4,3 say "ß" COLO (COLORvar)
   case LALETRA = "p"
      =bigcha01(5,6,7)
      @ 1,0 say "ÛÜßÛÜ"
      @ 2,0 say "ÛÛ " COLO W+/n
      @ 2,3 say " Û"
      @ 2,5 say "Û" COLO (COLORvar)
      @ 3,0 say "ÛÛÜÛß " COLO W+/n
      @ 4,0 say "ÛÛ " COLO W+/n
      @ 4,3 say "ßß" COLO (COLORvar)
      @ 5,0 say " ßß" COLO (COLORvar)
   case LALETRA = "w"
      =bigcha01(5,8,9)
      @ 1,0 say "ÛÛ"
      @ 1,2 say "Ü" COLO (COLORvar)
      @ 1,3 say "Û"
      @ 1,4 say "Ü" COLO (COLORvar)
      @ 1,5 say "ÛÛ"
      @ 1,7 say "Ü" COLO (COLORvar)
      @ 2,0 say "ßÛ"
      @ 2,2 say "ÜÛÜÛß " COLO W+/n
      @ 3,1 say "ÛÛ ÛÛ " COLO W+/n
      @ 4,0 say "  ßß ßß" COLO (COLORvar)
   case LALETRA = "x"
      =bigcha01(5,7,8)
      @ 1,0 say "ßÛÜÜÛ"
      @ 1,5 say "ß" COLO W+/n
      @ 1,6 say "Ü" COLO (COLORvar)
      @ 2,0 say " ÜÛÛ"
      @ 2,4 say "Ü" COLO W+/n
      @ 2,5 say "ß" COLO (COLORvar)
      @ 3,0 say "ÛÛ " COLO W+/n
      @ 3,3 say "ß" COLO (COLORvar)
      @ 3,4 say "ÛÛ" COLO W+/n
      @ 3,6 say "Ü" COLO (COLORvar)
      @ 4,0 say " ßß  ßß" COLO (COLORvar)
   case LALETRA = "y"
      =bigcha01(5,6,7)
      @ 1,0 say "ÛÛ"
      @ 1,2 say "Ü" COLO (COLORvar)
      @ 1,3 say "ÛÛ"
      @ 1,5 say "Ü" COLO (COLORvar)
      @ 2,0 say "ÛÛ ÛÛ " COLO W+/n
      @ 3,0 say " ßÛÛ"
      @ 3,4 say "ß " COLO W+/n
      @ 4,0 say " ÜÛ"
      @ 4,3 say "ß " COLO W+/n
      @ 5,0 say "  ßß" COLO (COLORvar)
   case LALETRA = "v"
      =bigcha01(5,6,7)
      @ 1,0 say "ÛÛ"
      @ 1,2 say "Ü" COLO (COLORvar)
      @ 1,3 say "ÛÛ"
      @ 1,5 say "Ü" COLO (COLORvar)
      @ 2,0 say "ß"
      @ 2,1 say "Û Ûß " COLO W+/n
      @ 3,0 say " ßÛ"
      @ 3,3 say "ß " COLO W+/n
      @ 4,0 say "   ß" COLO (COLORvar)
   case LALETRA = "/"
      =bigcha01(5,4,6)
      @ 0,0 say "   Û"
      @ 0,4 say "Ü" COLO (COLORvar)
      @ 1,0 say "  Û"
      @ 1,3 say "Üß" COLO (COLORvar)
      @ 2,0 say " Û"
      @ 2,2 say "Üß" COLO (COLORvar)
      @ 3,0 say "Û"
      @ 3,1 say "Üß" COLO (COLORvar)
      @ 4,0 say " ß" COLO (COLORvar)
   case LALETRA = "z"
      =bigcha01(5,6,7)
      @ 1,0 say "ß"
      @ 1,1 say "ßßÛÛ" COLO W+/n
      @ 1,5 say "Ü" COLO (COLORvar)
      @ 2,0 say " ÜÛ"
      @ 2,3 say "ß " COLO W+/n
      @ 2,5 say "ß" COLO (COLORvar)
      @ 3,0 say "ÛÛÜÜ" COLO W+/n
      @ 3,4 say "Ü"
      @ 4,0 say " ßßßßß" COLO (COLORvar)
   case LALETRA = "|"
      startx = startx + 6
      curenty = starty
   case LALETRA = "A"
      =bigcha01(5,7,9)
      @ 0,2 say "ÛÛÛ" COLO W+/n
      @ 0,5 say "Ü" COLO (COLORvar)
      @ 1,1 say "ÛÛ ÛÛ" COLO W+/n
      @ 1,6 say "Ü" COLO (COLORvar)
      @ 2,0 say "Ü"
      @ 2,1 say "ÛÛÜÛÛÜ" COLO W+/n
      @ 3,0 say "ÛÛ " COLO W+/n
      @ 3,3 say "ßß" COLO (COLORvar)
      @ 3,5 say "ÛÛ " COLO W+/n
      @ 4,0 say " ßß   ßß" COLO (COLORvar)
   case LALETRA = "B"
      =bigcha01(5,6,8)
      @ 0,0 say "ÛÛßß" COLO W+/n
      @ 0,4 say "ÛÜ"
      @ 1,0 say "ÛÛÜ" COLO W+/n
      @ 1,3 say "ÜÛ"
      @ 1,5 say "ß " COLO W+/n
      @ 2,0 say "ÛÛ " COLO W+/n
      @ 2,3 say "ß"  COLO (COLORvar)
      @ 2,4 say "ÛÛ" COLO W+/n
      @ 2,6 say "Ü"  COLO (COLORvar)
      @ 3,0 say "ÛÛÜ" COLO W+/n
      @ 3,3 say "ÜÛ"
      @ 3,5 say "ß " COLO W+/n
      @ 4,0 say " ßßßßß" COLO (COLORvar)
   case LALETRA = "C"
      =bigcha01(5,8,9)
      @ 0,0 say " ÜÛ"
      @ 0,3 say "ßßÛ" COLO W+/n
      @ 0,6 say "Ü"
      @ 1,0 say "ÛÛ " COLO W+/n
      @ 1,3 say "ß" COLO (COLORvar)
      @ 1,4 say "  ß"
      @ 1,7 say "Û" COLO (COLORvar)
      @ 2,0 say "ÛÛ " COLO W+/n
      @ 2,3 say "   Ü "
      @ 3,0 say " ßÛÜÜÛ"
      @ 3,6 say "ß " COLO W+/n
      @ 4,0 say "   ßßßß" COLO (COLORvar)
   case LALETRA = "D"
      =bigcha01(5,6,8)
      @ 0,0 say "ÛÛßÛ" COLO W+/n
      @ 0,4 say "Ü"
      @ 1,0 say "ÛÛ " COLO W+/n
      @ 1,3 say " ÛÛ"
      @ 1,6 say "Ü" COLO (COLORvar)
      @ 2,0 say "ÛÛ " COLO W+/n
      @ 2,3 say " ÛÛ"
      @ 2,6 say "Û" COLO (COLORvar)
      @ 3,0 say "ÛÛÜÛß " COLO W+/n
      @ 3,6 say "ß" COLO (COLORvar)
      @ 4,0 say " ßßßß" COLO (COLORvar)
   case LALETRA = "E"
      =bigcha01(5,6,7)
      @ 0,0 say "ÛÛßßß" COLO W+/n
      @ 0,5 say "Ü" COLO (COLORvar)
      @ 1,0 say "ÛÛÜ" COLO W+/n
      @ 1,3 say "ÜÜ"
      @ 2,0 say "ÛÛ " COLO W+/n
      @ 2,3 say "ßßß" COLO (COLORvar)
      @ 3,0 say "ÛÛÜ" COLO W+/n
      @ 3,3 say "ÜÜ"
      @ 4,0 say " ßßßßß" COLO (COLORvar)
   case LALETRA = "F"
      =bigcha01(5,6,7)
      @ 0,0 say "ÛÛßßß" COLO W+/n
      @ 0,5 say "Ü" COLO (COLORvar)
      @ 1,0 say "ÛÛÜ" COLO W+/n
      @ 1,3 say "Ü"
      @ 2,0 say "ÛÛ " COLO W+/n
      @ 2,3 say "ßß" COLO (COLORvar)
      @ 3,0 say "ÛÛ " COLO W+/n
      @ 4,0 say " ßß" COLO (COLORvar)
   case LALETRA = "G"
      =bigcha01(5,8,9)
      @ 0,0 say " ÜÛ"
      @ 0,3 say "ßßÛ" COLO W+/n
      @ 0,6 say "Ü"
      @ 1,0 say "ÛÛ " COLO W+/n
      @ 1,3 say "ß" COLO (COLORvar)
      @ 1,4 say "  ß"
      @ 1,7 say "Û" COLO (COLORvar)
      @ 2,0 say "ÛÛ " COLO W+/n
      @ 2,3 say " ßÛÛ"
      @ 2,7 say "Ü" COLO (COLORvar)
      @ 3,0 say " ßÛÜÜÛ"
      @ 3,6 say "ß " COLO W+/n
      @ 4,0 say "   ßßßß" COLO (COLORvar)
   case LALETRA = "H"
      =bigcha01(5,7,8)
      @ 0,0 say "ÛÛ"
      @ 0,2 say "Ü " COLO (COLORvar)
      @ 0,4 say "ÛÛ"
      @ 0,6 say "Ü " COLO (COLORvar)
      @ 1,0 say "ÛÛÜ" COLO W+/n
      @ 1,3 say "ÜÛÛ"
      @ 1,6 say "Û" COLO (COLORvar)
      @ 2,0 say "ÛÛ " COLO W+/n
      @ 2,3 say "ß" COLO (COLORvar)
      @ 2,4 say "ÛÛ " COLO W+/n
      @ 3,0 say "ÛÛ " COLO W+/n
      @ 3,3 say " "
      @ 3,4 say "ÛÛ " COLO W+/n
      @ 4,0 say " ßß  ßß" COLO (COLORvar)
   case LALETRA = "I"
      =bigcha01(5,3,4)
      @ 0,0 say "ÛÛ"
      @ 0,2 say "Ü" COLO (COLORvar)
      @ 1,0 say "ÛÛ " COLO W+/n
      @ 2,0 say "ÛÛ " COLO W+/n
      @ 3,0 say "ÛÛ " COLO W+/n
      @ 4,0 say " ßß" COLO (COLORvar)
   case LALETRA = "J"
      =bigcha01(5,6,7)
      @ 0,0 say "   ÛÛ"
      @ 0,5 say "Ü" COLO (COLORvar)
      @ 1,3 say "ÛÛ " COLO W+/n
      @ 2,3 say "ÛÛ " COLO W+/n
      @ 3,0 say "ßÛÜÛ"
      @ 3,4 say "ß " COLO W+/n
      @ 4,0 say "  ßßß" COLO (COLORvar)
   case LALETRA = "K"
      =bigcha01(5,7,9)
      @ 0,0 say "ÛÛ"
      @ 0,2 say "Ü" COLO (COLORvar)
      @ 0,3 say "ÜÛ"
      @ 0,5 say "ß" COLO W+/n
      @ 0,6 say "Ü" COLO (COLORvar)
      @ 1,0 say "ÛÛÛß " COLO W+/n
      @ 1,5 say "ß" COLO (COLORvar)
      @ 2,0 say "ÛÛßÛ" COLO W+/n
      @ 2,4 say "Ü"
      @ 3,0 say "ÛÛ " COLO W+/n
      @ 3,3 say " ßÛÜ"
      @ 4,0 say " ßß   ßß" COLO (COLORvar)
   case LALETRA = "L"
      =bigcha01(5,6,7)
      @ 0,0 say "ÛÛ"
      @ 0,2 say "Ü" COLO (COLORvar)
      @ 1,0 say "ÛÛ " COLO W+/n
      @ 2,0 say "ÛÛ " COLO W+/n
      @ 3,0 say "ÛÛÜ" COLO W+/n
      @ 3,3 say "ÜÜ"
      @ 4,0 say " ßßßßß" COLO (COLORvar)
   case LALETRA = "M"
      =bigcha01(5,10,11)
      @ 0,0 say "ÛÛÜ   ÜÛÛ"
      @ 0,9 say "Ü" COLO (COLORvar)
      @ 1,0 say "ÛÛÛÜ" COLO W+/n
      @ 1,4 say " ÜÛÛÛ"
      @ 1,9 say "Û" COLO (COLORvar)
      @ 2,0 say "ÛÛ ÛÜÛ ÛÛ " COLO W+/n
      @ 3,0 say "ÛÛ " COLO W+/n
      @ 3,3 say " Û"
      @ 3,5 say "Ûß" COLO (COLORvar)
      @ 3,7 say "ÛÛ " COLO W+/n
      @ 4,0 say " ßß  ß  ßß" COLO (COLORvar)
   case LALETRA = "N"
      =bigcha01(5,8,9)
      @ 0,0 say "ÛÛÜ  ÛÛ"
      @ 0,7  say "Ü" COLO (COLORvar)
      @ 1,0 say "ÛÛßÜ" COLO W+/n
      @ 1,4 say " ÛÛ"
      @ 1,7 say "Û" COLO (COLORvar)
      @ 2,0 say "ÛÛ " COLO W+/n
      @ 2,3 say "ß"
      @ 2,4 say "ÜÛÛ " COLO W+/n
      @ 3,0 say "ÛÛ " COLO W+/n
      @ 3,3 say " ßÛÛ"
      @ 3,7 say " " COLO W+/n
      @ 4,0 say " ßß   ßß" COLO (COLORvar)
   case LALETRA = "O"
      =bigcha01(7,7,9)
      @ 0,0 say " ÜÛ"
      @ 0,3 say "ß" COLO W+/n
      @ 0,4 say "ÛÜ"
      @ 1,0 say "ÛÛ " COLO W+/n
      @ 1,3 say "ß " COLO (COLORvar)
      @ 1,5 say "ÛÛ"
      @ 1,7 say "Ü" COLO (COLORvar)
      @ 2,0 say "ÛÛ " COLO W+/n
      @ 2,3 say "  ÛÛ"
      @ 2,7 say "Û" COLO (COLORvar)
      @ 3,0 say " ßÛÜÛ"
      @ 3,5 say "ß " COLO W+/n
      @ 3,7 say "ß" COLO (COLORvar)
      @ 4,0 say "   ßßß" COLO (COLORvar)
   case LALETRA = "P"
      =bigcha01(5,6,8)
      @ 0,0 say "ÛÛß" COLO W+/n
      @ 0,3 say "ßÛÜ"
      @ 1,0 say "ÛÛ " COLO W+/n
      @ 1,3 say " ÛÛ"
      @ 1,6 say "Û" COLO (COLORvar)
      @ 2,0 say "ÛÛßßß " COLO W+/n
      @ 2,6 say "ß" COLO (COLORvar)
      @ 3,0 say "ÛÛ " COLO W+/n
      @ 4,0 say " ßß" COLO (COLORvar)
   case LALETRA = "Q"
      =bigcha01(5,8,9)
      @ 0,0 say " ÜÛ"
      @ 0,3 say "ß" COLO W+/n
      @ 0,4 say "ÛÜ"
      @ 1,0 say "ÛÛ " COLO W+/n
      @ 1,3 say "ß " COLO (COLORvar)
      @ 1,5 say "ÛÛ"
      @ 1,7 say "Ü" COLO (COLORvar)
      @ 2,0 say "ÛÛ " COLO W+/n
      @ 2,3 say "Ü ÛÛ"
      @ 2,7 say "Û" COLO (COLORvar)
      @ 3,0 say " ßÛÜÛÜ"
      @ 3,6 say "ßß" COLO (COLORvar)
      @ 4,0 say "   ßßß" COLO (COLORvar)
      @ 4,6 say "ß"
      @ 4,7 say "Ü" COLO (COLORvar)
   case LALETRA = "R"
      =bigcha01(5,7,8)
      @ 0,0 say "ÛÛß" COLO W+/n
      @ 0,3 say "ßÛÜ"
      @ 1,0 say "ÛÛ " COLO W+/n
      @ 1,3 say " ÛÛ"
      @ 1,6 say "Û" COLO (COLORvar)
      @ 2,0 say "ÛÛßßÛÜ" COLO W+/n
      @ 2,6 say "ß" COLO (COLORvar)
      @ 3,0 say "ÛÛ " COLO W+/n
      @ 3,3 say " ÛÛ"
      @ 3,6 say "Û" COLO (COLORvar)
      @ 4,0 say " ßß  ßß" COLO (COLORvar)
   case LALETRA = "S"
      =bigcha01(5,7,8)
      @ 0,0 say "ÜÛ"
      @ 0,2 say "ßßÛ" COLO W+/n
      @ 0,5 say "Ü"
      @ 1,0 say "ßÛÛÜÜ"
      @ 1,5 say "ßß" COLO (COLORvar)
      @ 2,0 say "Ü  ßÛÛ"
      @ 2,6 say "Û" COLO (COLORvar)
      @ 3,0 say "ßÛÜÜÛ"
      @ 3,5 say "ß " COLO W+/n
      @ 4,0 say "  ßßßß" COLO (COLORvar)
   case LALETRA = "T"
      =bigcha01(5,7,8)
      @ 0,0 say "ß"
      @ 0,1 say "ßÛÛßß" COLO W+/n
      @ 0,6 say "Ü" COLO (COLORvar)
      @ 1,2 say "ÛÛ " COLO W+/n
      @ 2,2 say "ÛÛ " COLO W+/n
      @ 3,2 say "ÛÛ " COLO W+/n
      @ 4,0 say "   ßß" COLO (COLORvar)
   case LALETRA = "U"
      =bigcha01(5,6,8)
      @ 0,0 say "ÛÛ"
      @ 0,2 say "Ü " COLO (COLORvar)
      @ 0,4 say "ÛÛ"
      @ 0,6 say "Ü " COLO (COLORvar)
      @ 1,0 say "ÛÛ " COLO W+/n
      @ 1,3 say " ÛÛ"
      @ 1,6 say "Û" COLO (COLORvar)
      @ 2,0 say "ÛÛ " COLO W+/n
      @ 2,3 say " "
      @ 2,4 say "ÛÛ " COLO W+/n
      @ 3,0 say "ßÛ"
      @ 3,2 say "Ü" COLO W+/n
      @ 3,3 say "Ü"
      @ 3,4 say "Ûß " COLO W+/n
      @ 4,0 say "  ßßßß" COLO (COLORvar)
   case LALETRA = "V"
      =bigcha01(5,7,9)
      @ 0,0 say "ÛÛ"
      @ 0,2 say "Ü" COLO (COLORvar)
      @ 0,3 say "  ÛÛ"
      @ 0,7 say "Ü" COLO (COLORvar)
      @ 1,0 say " ÛÛ"
      @ 1,3 say "Ü" COLO (COLORvar)
      @ 1,4 say "ÛÛ " COLO W+/n
      @ 1,7 say "ß" COLO (COLORvar)
      @ 2,0 say " ßÛ"
      @ 2,3 say "ÜÛß " COLO W+/n
      @ 3,0 say "  ßÛ"
      @ 3,4 say "ß " COLO W+/n
      @ 4,0 say "    ß" COLO (COLORvar)
   case LALETRA = "W"
      =bigcha01(5,10,12)
      @ 0,0 say "ÛÛ"
      @ 0,2 say "Ü " COLO (COLORvar)
      @ 0,4 say "ÛÛ"
      @ 0,6 say "Ü " COLO (COLORvar)
      @ 0,8 say "ÛÛ"
      @ 0,10 say "Ü" COLO (COLORvar)
      @ 1,0 say "ßÛ"
      @ 1,2 say "Ü" COLO W+/n
      @ 1,3 say " ÛÛ"
      @ 1,6 say "Û" COLO (COLORvar)
      @ 1,7 say "ÜÛ"
      @ 1,9 say "ß " COLO W+/n
      @ 2,1 say "ÛÛÜÛÛÜÛÛ " COLO W+/n
      @ 3,2 say "ÛÛ " COLO W+/n
      @ 3,6 say "ÛÛ " COLO W+/n
      @ 3,9 say "ß" COLO (COLORvar)
      @ 4,0 say "   ßß  ßß" COLO (COLORvar)
   case LALETRA = "X"
      =bigcha01(5,8,9)
      @ 0,0 say "ÛÛ"
      @ 0,2 say "Ü" COLO (COLORvar)
      @ 0,3 say "  ÛÛ"
      @ 0,7 say "Ü" COLO (COLORvar)
      @ 1,0 say " ßÛÜÛ"
      @ 1,5 say "ß" COLO W+/n
      @ 1,6 say "Ûß" COLO (COLORvar)
      @ 2,0 say " ÜÛ"
      @ 2,3 say "ßÛÜ" COLO W+/n
      @ 3,0 say "ÛÛ " COLO W+/n
      @ 3,3 say "ß" COLO (COLORvar)
      @ 3,4 say " ÛÛ"
      @ 3,7 say "Ü" COLO (COLORvar)
      @ 4,0 say " ßß   ßß" COLO (COLORvar)
   case LALETRA = "Y"
      =bigcha01(5,9,10)
      @ 0,0 say "ÛÛ"
      @ 0,2 say "Ü" COLO (COLORvar)
      @ 0,3 say "   ÛÛ"
      @ 0,8 say "Ü" COLO (COLORvar)
      @ 1,0 say " ÛÛ"
      @ 1,3 say "Ü" COLO (COLORvar)
      @ 1,4 say " ÛÛ"
      @ 1,7 say "Ûß" COLO (COLORvar)
      @ 2,0 say "  ßÛÛ"
      @ 2,5 say "ß " COLO W+/n
      @ 2,7 say "ß" COLO (COLORvar)
      @ 3,3 say "ÛÛ " COLO W+/n
      @ 4,0 say "    ßß" COLO (COLORvar)
   case LALETRA = "Z"
      =bigcha01(5,6,8)
      @ 0,0 say "ß"
      @ 0,1 say "ßßßÛÛ" COLO W+/n
      @ 0,6 say "Ü" COLO (COLORvar)
      @ 1,0 say "  ÜÛ"
      @ 1,4 say "ß " COLO W+/n
      @ 1,6 say "ß" COLO (COLORvar)
      @ 2,0 say " ÛÛ"
      @ 2,3 say "ß " COLO W+/n
      @ 3,0 say "ÛÛÜÜ" COLO W+/n
      @ 3,4 say "ÜÜ"
      @ 4,0 say " ßßßßßß " COLO (COLORvar)
   endcase
   curlet = curlet + 1
   curwin=curwin+1
enddo
return .t.
function bigcha01
parameter masx,masy,masc
private masx,masy,masc
define window ("letter" + alltrim(str(curwin))) ;
from startx,curenty to startx + masx,curenty + masy ;
none noshadow
activate window ("letter" + alltrim(str(curwin)))
curenty = curenty + masc
if !empty(relleno)
   @ 0,0,masx,masy box repl(relleno,9)
endif
return.t.
