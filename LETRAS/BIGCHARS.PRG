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
      @ 0,0 say " ��"
      @ 0,3 say "�" COLO (COLORvar)
      @ 1,0 say "���"
      @ 1,3 say "�" COLO W+/n
      @ 1,4 say "�" COLO (COLORvar)
      @ 2,1 say "�� " COLO W+/n
      @ 3,0 say " ��"
      @ 3,3 say "�" COLO W+/n
      @ 4,0 say "   ��" COLO (COLORvar)
   case LALETRA = "s"
      =bigcha01(5,5,7)
      @ 1,0 say "��"
      @ 1,2 say "�" COLO W+/n
      @ 1,3 say "��"
      @ 2,0 say " �"
      @ 2,2 say "���" COLO W+/n
      @ 2,5 say "�" COLO (COLORvar)
      @ 3,0 say "����"
      @ 3,4 say "� " COLO W+/n
      @ 4,0 say "  ���" COLO (COLORvar)
   case LALETRA = "e"
      =bigcha01(5,5,7)
      @ 1,0 say "��"
      @ 1,2 say "��" COLO W+/n
      @ 1,4 say "�"
      @ 2,0 say "����� " COLO W+/n
      @ 3,0 say "��"
      @ 3,2 say "���" COLO W+/n
      @ 3,5 say "�" COLO (COLORvar)
      @ 4,0 say "  ���" COLO (COLORvar)
   case LALETRA = "r"
      =bigcha01(5,5,6)
      @ 1,0 say "���"
      @ 1,3 say "�" COLO W+/n
      @ 1,4 say "�" COLO (COLORvar)
      @ 2,0 say "�� " COLO W+/n
      @ 2,3 say "�" COLO (COLORvar)
      @ 3,0 say "�� " COLO W+/n
      @ 4,0 say " ��" COLO (COLORvar)
   case LALETRA = "o"
      =bigcha01(5,5,7)
      @ 1,0 say "��"
      @ 1,2 say "��" COLO W+/n
      @ 1,4 say "�"
      @ 2,0 say "�� �� " COLO W+/n
      @ 3,0 say "��"
      @ 3,2 say "��� " COLO W+/n
      @ 4,0 say "  ���" COLO (COLORvar)
   case LALETRA = "a"
      =bigcha01(5,6,8)
      @ 1,0 say "��"
      @ 1,2 say "��" COLO W+/n
      @ 1,4 say "�"
      @ 2,0 say "��"
      @ 2,2 say "��� " COLO W+/n
      @ 3,0 say "��"
      @ 3,2 say "����" COLO W+/n
      @ 4,0 say "  �� ��" COLO (COLORvar)
   case LALETRA = "i"
      =bigcha01(5,3,4)
      @ 0,0 say "�"
      @ 0,1 say "�" COLO W+/n
      @ 0,2 say "�" COLO (COLORvar)
      @ 1,0 say "��"
      @ 1,2 say "�" COLO (COLORvar)
      @ 2,0 say "�� " COLO W+/n
      @ 3,0 say "�� " COLO W+/n
      @ 4,0 say " ��" COLO (COLORvar)
   case LALETRA = "n"
      =bigcha01(5,5,7)
      @ 1,0 say "��"
      @ 1,2 say "��" COLO W+/n
      @ 1,4 say "�"
      @ 2,0 say "�� �� " COLO W+/n
      @ 3,0 say "�� �� " COLO W+/n
      @ 4,0 say " �� ��" COLO (COLORvar)
   case LALETRA = "m"
      =bigcha01(5,8,10)
      @ 1,0 say "��"
      @ 1,2 say "��" COLO W+/n
      @ 1,4 say "�"
      @ 1,5 say "��" COLO W+/n
      @ 1,7 say "�"
      @ 2,0 say "�� �� �� " COLO W+/n
      @ 3,0 say "�� �� �� " COLO W+/n
      @ 4,0 say " �� �� ��" COLO (COLORvar)
   case LALETRA = "f"
      =bigcha01(5,6,7)
      @ 0,0 say " ��"
      @ 0,3 say "��" COLO W+/n
      @ 0,5 say "�" COLO (COLORvar)
      @ 1,0 say "���"
      @ 1,3 say "�" COLO W+/n
      @ 1,4 say "�" COLO (COLORvar)
      @ 2,1 say "�� " COLO W+/n
      @ 3,1 say "�� " COLO W+/n
      @ 4,0 say "  ��" COLO (COLORvar)
   case LALETRA = "l"
      =bigcha01(5,3,4)
      @ 0,0 say "��"
      @ 0,2 say "�" COLO (COLORvar)
      @ 1,0 say "�� " COLO W+/n
      @ 2,0 say "�� " COLO W+/n
      @ 3,0 say "�� " COLO W+/n
      @ 4,0 say " ��" COLO (COLORvar)
   case LALETRA = "k"
      =bigcha01(5,7,8)
      @ 0,0 say "��"
      @ 0,2 say "�" COLO (COLORvar)
      @ 1,0 say "�����" COLO W+/n
      @ 1,5 say "�" COLO (COLORvar)
      @ 2,0 say "����" COLO W+/n
      @ 2,4 say "�" COLO (COLORvar)
      @ 3,0 say "�� " COLO W+/n
      @ 3,3 say "���"
      @ 4,0 say " ��  ��" COLO (COLORvar)
   case LALETRA = "u"
      =bigcha01(5,6,7)
      @ 1,0 say "��"
      @ 1,2 say "�" COLO (COLORvar)
      @ 1,3 say "��"
      @ 1,5 say "�" COLO (COLORvar)
      @ 2,0 say "�� �� " COLO W+/n
      @ 3,0 say "��"
      @ 3,2 say "�" COLO W+/n
      @ 3,3 say "�"
      @ 3,4 say "� " COLO W+/n
      @ 4,0 say "  �� �" COLO (COLORvar)
   case LALETRA = "b"
      =bigcha01(5,6,7)
      @ 0,0 say "��"
      @ 0,2 say "�" COLO (COLORvar)
      @ 1,0 say "����" COLO W+/n
      @ 1,4 say "�"
      @ 2,0 say "�� " COLO W+/n
      @ 2,3 say " �"
      @ 2,5 say "�" COLO (COLORvar)
      @ 3,0 say "����� " COLO W+/n
      @ 4,0 say " ����" COLO (COLORvar)
   case LALETRA = "c"
      =bigcha01(5,5,6)
      @ 1,0 say "��"
      @ 1,2 say "��" COLO W+/n
      @ 1,4 say "�" COLO (COLORvar)
      @ 2,0 say "�� " COLO W+/n
      @ 2,3 say " �" COLO (COLORvar)
      @ 3,0 say "��"
      @ 3,2 say "��" COLO W+/n
      @ 3,4 say "�" COLO (COLORvar)
      @ 4,0 say "  ���" COLO (COLORvar)
   case LALETRA = "d"
      =bigcha01(5,5,7)
      @ 0,0 say "   ��"
      @ 0,5 say "�" COLO (COLORvar)
      @ 1,0 say "��"
      @ 1,2 say "��� " COLO W+/n
      @ 2,0 say "� " COLO W+/n
      @ 2,2 say "�" COLO (COLORvar)
      @ 2,3 say "�� " COLO W+/n
      @ 3,0 say "�����"
      @ 3,5 say "�" COLO (COLORvar)
      @ 4,0 say "  ����" COLO (COLORvar)
   case LALETRA = "q"
      =bigcha01(5,5,7)
      @ 1,0 say "��"
      @ 1,2 say "�" COLO W+/n
      @ 1,3 say "��"
      @ 1,5 say "�" COLO (COLORvar)
      @ 2,0 say "� " COLO W+/n
      @ 2,2 say "�" COLO (COLORvar)
      @ 2,3 say "�� " COLO W+/n
      @ 3,0 say "�����"
      @ 3,5 say "�" COLO (COLORvar)
      @ 4,0 say "  �" COLO (COLORvar)
      @ 4,3 say "�� " COLO W+/n
      @ 5,0 say "    ��" COLO (COLORvar)
   case LALETRA = "g"
      =bigcha01(5,6,7)
      @ 1,0 say "��"
      @ 1,2 say "�" COLO W+/n
      @ 1,3 say "��"
      @ 1,5 say "�" COLO (COLORvar)
      @ 2,0 say "� " COLO W+/n
      @ 2,2 say "�" COLO (COLORvar)
      @ 2,3 say "�� " COLO W+/n
      @ 3,0 say "�����"
      @ 3,5 say "�" COLO (COLORvar)
      @ 4,0 say " �"
      @ 4,2 say "�" COLO W+/n
      @ 4,3 say "�"
      @ 4,4 say "� " COLO W+/n
      @ 5,0 say "  ���" COLO (COLORvar)
   case LALETRA = "h"
      =bigcha01(5,5,7)
      @ 0,0 say "��" COLO W+/n
      @ 0,2 say "�" COLO (COLORvar)
      @ 1,0 say "����" COLO W+/n
      @ 1,4 say "�"
      @ 2,0 say "�� �� " COLO W+/n
      @ 3,0 say "�� �� " COLO W+/n
      @ 4,0 say " �� ��" COLO (COLORvar)
   case LALETRA = "j"
      =bigcha01(5,3,5)
      @ 0,0 say " �"
      @ 0,2 say "�" COLO W+/n
      @ 0,3 say "�" COLO (COLORvar)
      @ 1,0 say " ��"
      @ 1,3 say "�" COLO (COLORvar)
      @ 2,1 say "�� " COLO W+/n
      @ 3,1 say "�� " COLO W+/n
      @ 4,0 say "�"
      @ 4,1 say "� " COLO W+/n
      @ 4,3 say "�" COLO (COLORvar)
   case LALETRA = "p"
      =bigcha01(5,6,7)
      @ 1,0 say "�����"
      @ 2,0 say "�� " COLO W+/n
      @ 2,3 say " �"
      @ 2,5 say "�" COLO (COLORvar)
      @ 3,0 say "����� " COLO W+/n
      @ 4,0 say "�� " COLO W+/n
      @ 4,3 say "��" COLO (COLORvar)
      @ 5,0 say " ��" COLO (COLORvar)
   case LALETRA = "w"
      =bigcha01(5,8,9)
      @ 1,0 say "��"
      @ 1,2 say "�" COLO (COLORvar)
      @ 1,3 say "�"
      @ 1,4 say "�" COLO (COLORvar)
      @ 1,5 say "��"
      @ 1,7 say "�" COLO (COLORvar)
      @ 2,0 say "��"
      @ 2,2 say "����� " COLO W+/n
      @ 3,1 say "�� �� " COLO W+/n
      @ 4,0 say "  �� ��" COLO (COLORvar)
   case LALETRA = "x"
      =bigcha01(5,7,8)
      @ 1,0 say "�����"
      @ 1,5 say "�" COLO W+/n
      @ 1,6 say "�" COLO (COLORvar)
      @ 2,0 say " ���"
      @ 2,4 say "�" COLO W+/n
      @ 2,5 say "�" COLO (COLORvar)
      @ 3,0 say "�� " COLO W+/n
      @ 3,3 say "�" COLO (COLORvar)
      @ 3,4 say "��" COLO W+/n
      @ 3,6 say "�" COLO (COLORvar)
      @ 4,0 say " ��  ��" COLO (COLORvar)
   case LALETRA = "y"
      =bigcha01(5,6,7)
      @ 1,0 say "��"
      @ 1,2 say "�" COLO (COLORvar)
      @ 1,3 say "��"
      @ 1,5 say "�" COLO (COLORvar)
      @ 2,0 say "�� �� " COLO W+/n
      @ 3,0 say " ���"
      @ 3,4 say "� " COLO W+/n
      @ 4,0 say " ��"
      @ 4,3 say "� " COLO W+/n
      @ 5,0 say "  ��" COLO (COLORvar)
   case LALETRA = "v"
      =bigcha01(5,6,7)
      @ 1,0 say "��"
      @ 1,2 say "�" COLO (COLORvar)
      @ 1,3 say "��"
      @ 1,5 say "�" COLO (COLORvar)
      @ 2,0 say "�"
      @ 2,1 say "� �� " COLO W+/n
      @ 3,0 say " ��"
      @ 3,3 say "� " COLO W+/n
      @ 4,0 say "   �" COLO (COLORvar)
   case LALETRA = "/"
      =bigcha01(5,4,6)
      @ 0,0 say "   �"
      @ 0,4 say "�" COLO (COLORvar)
      @ 1,0 say "  �"
      @ 1,3 say "��" COLO (COLORvar)
      @ 2,0 say " �"
      @ 2,2 say "��" COLO (COLORvar)
      @ 3,0 say "�"
      @ 3,1 say "��" COLO (COLORvar)
      @ 4,0 say " �" COLO (COLORvar)
   case LALETRA = "z"
      =bigcha01(5,6,7)
      @ 1,0 say "�"
      @ 1,1 say "����" COLO W+/n
      @ 1,5 say "�" COLO (COLORvar)
      @ 2,0 say " ��"
      @ 2,3 say "� " COLO W+/n
      @ 2,5 say "�" COLO (COLORvar)
      @ 3,0 say "����" COLO W+/n
      @ 3,4 say "�"
      @ 4,0 say " �����" COLO (COLORvar)
   case LALETRA = "|"
      startx = startx + 6
      curenty = starty
   case LALETRA = "A"
      =bigcha01(5,7,9)
      @ 0,2 say "���" COLO W+/n
      @ 0,5 say "�" COLO (COLORvar)
      @ 1,1 say "�� ��" COLO W+/n
      @ 1,6 say "�" COLO (COLORvar)
      @ 2,0 say "�"
      @ 2,1 say "������" COLO W+/n
      @ 3,0 say "�� " COLO W+/n
      @ 3,3 say "��" COLO (COLORvar)
      @ 3,5 say "�� " COLO W+/n
      @ 4,0 say " ��   ��" COLO (COLORvar)
   case LALETRA = "B"
      =bigcha01(5,6,8)
      @ 0,0 say "����" COLO W+/n
      @ 0,4 say "��"
      @ 1,0 say "���" COLO W+/n
      @ 1,3 say "��"
      @ 1,5 say "� " COLO W+/n
      @ 2,0 say "�� " COLO W+/n
      @ 2,3 say "�"  COLO (COLORvar)
      @ 2,4 say "��" COLO W+/n
      @ 2,6 say "�"  COLO (COLORvar)
      @ 3,0 say "���" COLO W+/n
      @ 3,3 say "��"
      @ 3,5 say "� " COLO W+/n
      @ 4,0 say " �����" COLO (COLORvar)
   case LALETRA = "C"
      =bigcha01(5,8,9)
      @ 0,0 say " ��"
      @ 0,3 say "���" COLO W+/n
      @ 0,6 say "�"
      @ 1,0 say "�� " COLO W+/n
      @ 1,3 say "�" COLO (COLORvar)
      @ 1,4 say "  �"
      @ 1,7 say "�" COLO (COLORvar)
      @ 2,0 say "�� " COLO W+/n
      @ 2,3 say "   � "
      @ 3,0 say " �����"
      @ 3,6 say "� " COLO W+/n
      @ 4,0 say "   ����" COLO (COLORvar)
   case LALETRA = "D"
      =bigcha01(5,6,8)
      @ 0,0 say "����" COLO W+/n
      @ 0,4 say "�"
      @ 1,0 say "�� " COLO W+/n
      @ 1,3 say " ��"
      @ 1,6 say "�" COLO (COLORvar)
      @ 2,0 say "�� " COLO W+/n
      @ 2,3 say " ��"
      @ 2,6 say "�" COLO (COLORvar)
      @ 3,0 say "����� " COLO W+/n
      @ 3,6 say "�" COLO (COLORvar)
      @ 4,0 say " ����" COLO (COLORvar)
   case LALETRA = "E"
      =bigcha01(5,6,7)
      @ 0,0 say "�����" COLO W+/n
      @ 0,5 say "�" COLO (COLORvar)
      @ 1,0 say "���" COLO W+/n
      @ 1,3 say "��"
      @ 2,0 say "�� " COLO W+/n
      @ 2,3 say "���" COLO (COLORvar)
      @ 3,0 say "���" COLO W+/n
      @ 3,3 say "��"
      @ 4,0 say " �����" COLO (COLORvar)
   case LALETRA = "F"
      =bigcha01(5,6,7)
      @ 0,0 say "�����" COLO W+/n
      @ 0,5 say "�" COLO (COLORvar)
      @ 1,0 say "���" COLO W+/n
      @ 1,3 say "�"
      @ 2,0 say "�� " COLO W+/n
      @ 2,3 say "��" COLO (COLORvar)
      @ 3,0 say "�� " COLO W+/n
      @ 4,0 say " ��" COLO (COLORvar)
   case LALETRA = "G"
      =bigcha01(5,8,9)
      @ 0,0 say " ��"
      @ 0,3 say "���" COLO W+/n
      @ 0,6 say "�"
      @ 1,0 say "�� " COLO W+/n
      @ 1,3 say "�" COLO (COLORvar)
      @ 1,4 say "  �"
      @ 1,7 say "�" COLO (COLORvar)
      @ 2,0 say "�� " COLO W+/n
      @ 2,3 say " ���"
      @ 2,7 say "�" COLO (COLORvar)
      @ 3,0 say " �����"
      @ 3,6 say "� " COLO W+/n
      @ 4,0 say "   ����" COLO (COLORvar)
   case LALETRA = "H"
      =bigcha01(5,7,8)
      @ 0,0 say "��"
      @ 0,2 say "� " COLO (COLORvar)
      @ 0,4 say "��"
      @ 0,6 say "� " COLO (COLORvar)
      @ 1,0 say "���" COLO W+/n
      @ 1,3 say "���"
      @ 1,6 say "�" COLO (COLORvar)
      @ 2,0 say "�� " COLO W+/n
      @ 2,3 say "�" COLO (COLORvar)
      @ 2,4 say "�� " COLO W+/n
      @ 3,0 say "�� " COLO W+/n
      @ 3,3 say " "
      @ 3,4 say "�� " COLO W+/n
      @ 4,0 say " ��  ��" COLO (COLORvar)
   case LALETRA = "I"
      =bigcha01(5,3,4)
      @ 0,0 say "��"
      @ 0,2 say "�" COLO (COLORvar)
      @ 1,0 say "�� " COLO W+/n
      @ 2,0 say "�� " COLO W+/n
      @ 3,0 say "�� " COLO W+/n
      @ 4,0 say " ��" COLO (COLORvar)
   case LALETRA = "J"
      =bigcha01(5,6,7)
      @ 0,0 say "   ��"
      @ 0,5 say "�" COLO (COLORvar)
      @ 1,3 say "�� " COLO W+/n
      @ 2,3 say "�� " COLO W+/n
      @ 3,0 say "����"
      @ 3,4 say "� " COLO W+/n
      @ 4,0 say "  ���" COLO (COLORvar)
   case LALETRA = "K"
      =bigcha01(5,7,9)
      @ 0,0 say "��"
      @ 0,2 say "�" COLO (COLORvar)
      @ 0,3 say "��"
      @ 0,5 say "�" COLO W+/n
      @ 0,6 say "�" COLO (COLORvar)
      @ 1,0 say "���� " COLO W+/n
      @ 1,5 say "�" COLO (COLORvar)
      @ 2,0 say "����" COLO W+/n
      @ 2,4 say "�"
      @ 3,0 say "�� " COLO W+/n
      @ 3,3 say " ���"
      @ 4,0 say " ��   ��" COLO (COLORvar)
   case LALETRA = "L"
      =bigcha01(5,6,7)
      @ 0,0 say "��"
      @ 0,2 say "�" COLO (COLORvar)
      @ 1,0 say "�� " COLO W+/n
      @ 2,0 say "�� " COLO W+/n
      @ 3,0 say "���" COLO W+/n
      @ 3,3 say "��"
      @ 4,0 say " �����" COLO (COLORvar)
   case LALETRA = "M"
      =bigcha01(5,10,11)
      @ 0,0 say "���   ���"
      @ 0,9 say "�" COLO (COLORvar)
      @ 1,0 say "����" COLO W+/n
      @ 1,4 say " ����"
      @ 1,9 say "�" COLO (COLORvar)
      @ 2,0 say "�� ��� �� " COLO W+/n
      @ 3,0 say "�� " COLO W+/n
      @ 3,3 say " �"
      @ 3,5 say "��" COLO (COLORvar)
      @ 3,7 say "�� " COLO W+/n
      @ 4,0 say " ��  �  ��" COLO (COLORvar)
   case LALETRA = "N"
      =bigcha01(5,8,9)
      @ 0,0 say "���  ��"
      @ 0,7  say "�" COLO (COLORvar)
      @ 1,0 say "����" COLO W+/n
      @ 1,4 say " ��"
      @ 1,7 say "�" COLO (COLORvar)
      @ 2,0 say "�� " COLO W+/n
      @ 2,3 say "�"
      @ 2,4 say "��� " COLO W+/n
      @ 3,0 say "�� " COLO W+/n
      @ 3,3 say " ���"
      @ 3,7 say " " COLO W+/n
      @ 4,0 say " ��   ��" COLO (COLORvar)
   case LALETRA = "O"
      =bigcha01(7,7,9)
      @ 0,0 say " ��"
      @ 0,3 say "�" COLO W+/n
      @ 0,4 say "��"
      @ 1,0 say "�� " COLO W+/n
      @ 1,3 say "� " COLO (COLORvar)
      @ 1,5 say "��"
      @ 1,7 say "�" COLO (COLORvar)
      @ 2,0 say "�� " COLO W+/n
      @ 2,3 say "  ��"
      @ 2,7 say "�" COLO (COLORvar)
      @ 3,0 say " ����"
      @ 3,5 say "� " COLO W+/n
      @ 3,7 say "�" COLO (COLORvar)
      @ 4,0 say "   ���" COLO (COLORvar)
   case LALETRA = "P"
      =bigcha01(5,6,8)
      @ 0,0 say "���" COLO W+/n
      @ 0,3 say "���"
      @ 1,0 say "�� " COLO W+/n
      @ 1,3 say " ��"
      @ 1,6 say "�" COLO (COLORvar)
      @ 2,0 say "����� " COLO W+/n
      @ 2,6 say "�" COLO (COLORvar)
      @ 3,0 say "�� " COLO W+/n
      @ 4,0 say " ��" COLO (COLORvar)
   case LALETRA = "Q"
      =bigcha01(5,8,9)
      @ 0,0 say " ��"
      @ 0,3 say "�" COLO W+/n
      @ 0,4 say "��"
      @ 1,0 say "�� " COLO W+/n
      @ 1,3 say "� " COLO (COLORvar)
      @ 1,5 say "��"
      @ 1,7 say "�" COLO (COLORvar)
      @ 2,0 say "�� " COLO W+/n
      @ 2,3 say "� ��"
      @ 2,7 say "�" COLO (COLORvar)
      @ 3,0 say " �����"
      @ 3,6 say "��" COLO (COLORvar)
      @ 4,0 say "   ���" COLO (COLORvar)
      @ 4,6 say "�"
      @ 4,7 say "�" COLO (COLORvar)
   case LALETRA = "R"
      =bigcha01(5,7,8)
      @ 0,0 say "���" COLO W+/n
      @ 0,3 say "���"
      @ 1,0 say "�� " COLO W+/n
      @ 1,3 say " ��"
      @ 1,6 say "�" COLO (COLORvar)
      @ 2,0 say "������" COLO W+/n
      @ 2,6 say "�" COLO (COLORvar)
      @ 3,0 say "�� " COLO W+/n
      @ 3,3 say " ��"
      @ 3,6 say "�" COLO (COLORvar)
      @ 4,0 say " ��  ��" COLO (COLORvar)
   case LALETRA = "S"
      =bigcha01(5,7,8)
      @ 0,0 say "��"
      @ 0,2 say "���" COLO W+/n
      @ 0,5 say "�"
      @ 1,0 say "�����"
      @ 1,5 say "��" COLO (COLORvar)
      @ 2,0 say "�  ���"
      @ 2,6 say "�" COLO (COLORvar)
      @ 3,0 say "�����"
      @ 3,5 say "� " COLO W+/n
      @ 4,0 say "  ����" COLO (COLORvar)
   case LALETRA = "T"
      =bigcha01(5,7,8)
      @ 0,0 say "�"
      @ 0,1 say "�����" COLO W+/n
      @ 0,6 say "�" COLO (COLORvar)
      @ 1,2 say "�� " COLO W+/n
      @ 2,2 say "�� " COLO W+/n
      @ 3,2 say "�� " COLO W+/n
      @ 4,0 say "   ��" COLO (COLORvar)
   case LALETRA = "U"
      =bigcha01(5,6,8)
      @ 0,0 say "��"
      @ 0,2 say "� " COLO (COLORvar)
      @ 0,4 say "��"
      @ 0,6 say "� " COLO (COLORvar)
      @ 1,0 say "�� " COLO W+/n
      @ 1,3 say " ��"
      @ 1,6 say "�" COLO (COLORvar)
      @ 2,0 say "�� " COLO W+/n
      @ 2,3 say " "
      @ 2,4 say "�� " COLO W+/n
      @ 3,0 say "��"
      @ 3,2 say "�" COLO W+/n
      @ 3,3 say "�"
      @ 3,4 say "�� " COLO W+/n
      @ 4,0 say "  ����" COLO (COLORvar)
   case LALETRA = "V"
      =bigcha01(5,7,9)
      @ 0,0 say "��"
      @ 0,2 say "�" COLO (COLORvar)
      @ 0,3 say "  ��"
      @ 0,7 say "�" COLO (COLORvar)
      @ 1,0 say " ��"
      @ 1,3 say "�" COLO (COLORvar)
      @ 1,4 say "�� " COLO W+/n
      @ 1,7 say "�" COLO (COLORvar)
      @ 2,0 say " ��"
      @ 2,3 say "��� " COLO W+/n
      @ 3,0 say "  ��"
      @ 3,4 say "� " COLO W+/n
      @ 4,0 say "    �" COLO (COLORvar)
   case LALETRA = "W"
      =bigcha01(5,10,12)
      @ 0,0 say "��"
      @ 0,2 say "� " COLO (COLORvar)
      @ 0,4 say "��"
      @ 0,6 say "� " COLO (COLORvar)
      @ 0,8 say "��"
      @ 0,10 say "�" COLO (COLORvar)
      @ 1,0 say "��"
      @ 1,2 say "�" COLO W+/n
      @ 1,3 say " ��"
      @ 1,6 say "�" COLO (COLORvar)
      @ 1,7 say "��"
      @ 1,9 say "� " COLO W+/n
      @ 2,1 say "�������� " COLO W+/n
      @ 3,2 say "�� " COLO W+/n
      @ 3,6 say "�� " COLO W+/n
      @ 3,9 say "�" COLO (COLORvar)
      @ 4,0 say "   ��  ��" COLO (COLORvar)
   case LALETRA = "X"
      =bigcha01(5,8,9)
      @ 0,0 say "��"
      @ 0,2 say "�" COLO (COLORvar)
      @ 0,3 say "  ��"
      @ 0,7 say "�" COLO (COLORvar)
      @ 1,0 say " ����"
      @ 1,5 say "�" COLO W+/n
      @ 1,6 say "��" COLO (COLORvar)
      @ 2,0 say " ��"
      @ 2,3 say "���" COLO W+/n
      @ 3,0 say "�� " COLO W+/n
      @ 3,3 say "�" COLO (COLORvar)
      @ 3,4 say " ��"
      @ 3,7 say "�" COLO (COLORvar)
      @ 4,0 say " ��   ��" COLO (COLORvar)
   case LALETRA = "Y"
      =bigcha01(5,9,10)
      @ 0,0 say "��"
      @ 0,2 say "�" COLO (COLORvar)
      @ 0,3 say "   ��"
      @ 0,8 say "�" COLO (COLORvar)
      @ 1,0 say " ��"
      @ 1,3 say "�" COLO (COLORvar)
      @ 1,4 say " ��"
      @ 1,7 say "��" COLO (COLORvar)
      @ 2,0 say "  ���"
      @ 2,5 say "� " COLO W+/n
      @ 2,7 say "�" COLO (COLORvar)
      @ 3,3 say "�� " COLO W+/n
      @ 4,0 say "    ��" COLO (COLORvar)
   case LALETRA = "Z"
      =bigcha01(5,6,8)
      @ 0,0 say "�"
      @ 0,1 say "�����" COLO W+/n
      @ 0,6 say "�" COLO (COLORvar)
      @ 1,0 say "  ��"
      @ 1,4 say "� " COLO W+/n
      @ 1,6 say "�" COLO (COLORvar)
      @ 2,0 say " ��"
      @ 2,3 say "� " COLO W+/n
      @ 3,0 say "����" COLO W+/n
      @ 3,4 say "��"
      @ 4,0 say " ������ " COLO (COLORvar)
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
