*:*********************************************************************
*:
*:        Program: INICIO.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, FRIGORIFICO LA TROPA
*:  Last modified: 04/19/91     10:12
*:
*:          Calls: INICIO2.PRG
*:               : INICIO1.PRG
*:               : SUELDOS.PRG
*:
*:      Documented 04/19/91 at 10:13               FoxDoc  version 2.01
*:*********************************************************************
SET TALK OFF
SET ESCA OFF
CLEA
DIME letra[26,5]
letra[ 1, 1]=" ��� "
letra[ 1, 2]="�   �"
letra[ 1, 3]="�����"
letra[ 1, 4]="�   �"
letra[ 1, 5]="�   �"
letra[ 2, 1]="���� "
letra[ 2, 2]="�   �"
letra[ 2, 3]="���� "
letra[ 2, 4]="�   �"
letra[ 2, 5]="���� "
letra[ 3, 1]=" ��� "
letra[ 3, 2]="�   �"
letra[ 3, 3]="�    "
letra[ 3, 4]="�   �"
letra[ 3, 5]=" ��� "
letra[ 4, 1]="���� "
letra[ 4, 2]="�   �"
letra[ 4, 3]="�   �"
letra[ 4, 4]="�   �"
letra[ 4, 5]="���� "
letra[ 5, 1]="�����"
letra[ 5, 2]="�    "
letra[ 5, 3]="�����"
letra[ 5, 4]="�    "
letra[ 5, 5]="�����"
letra[ 6, 1]="�����"
letra[ 6, 2]="�    "
letra[ 6, 3]="�����"
letra[ 6, 4]="�    "
letra[ 6, 5]="�    "
letra[ 7, 1]=" ����"
letra[ 7, 2]="�    "
letra[ 7, 3]="�  ��"
letra[ 7, 4]="�   �"
letra[ 7, 5]=" ��� "
letra[ 8, 1]="�   �"
letra[ 8, 2]="�   �"
letra[ 8, 3]="�����"
letra[ 8, 4]="�   �"
letra[ 8, 5]="�   �"
letra[ 9, 1]="�����"
letra[ 9, 2]="  �  "
letra[ 9, 3]="  �  "
letra[ 9, 4]="  �  "
letra[ 9, 5]="�����"
letra[10, 1]="   ��"
letra[10, 2]="    �"
letra[10, 3]="    �"
letra[10, 4]="�   �"
letra[10, 5]=" ��� "
letra[11, 1]="�   �"
letra[11, 2]="�   �"
letra[11, 3]="���� "
letra[11, 4]="�   �"
letra[11, 5]="�   �"
letra[12, 1]="�    "
letra[12, 2]="�    "
letra[12, 3]="�    "
letra[12, 4]="�    "
letra[12, 5]="�����"
letra[13, 1]="�   �"
letra[13, 2]="�� ��"
letra[13, 3]="� � �"
letra[13, 4]="�   �"
letra[13, 5]="�   �"
letra[14, 1]="�   �"
letra[14, 2]="��  �"
letra[14, 3]="� � �"
letra[14, 4]="�  ��"
letra[14, 5]="�   �"
letra[15, 1]=" ��� "
letra[15, 2]="�   �"
letra[15, 3]="�   �"
letra[15, 4]="�   �"
letra[15, 5]=" ��� "
letra[16, 1]="���� "
letra[16, 2]="�   �"
letra[16, 3]="���� "
letra[16, 4]="�    "
letra[16, 5]="�    "
letra[17, 1]=" ��� "
letra[17, 2]="�   �"
letra[17, 3]="�   �"
letra[17, 4]="� � �"
letra[17, 5]=" ����"
letra[18, 1]="���� "
letra[18, 2]="�   �"
letra[18, 3]="���� "
letra[18, 4]="�   �"
letra[18, 5]="�   �"
letra[19, 1]=" ����"
letra[19, 2]="�    "
letra[19, 3]=" ��� "
letra[19, 4]="    �"
letra[19, 5]="���� "
letra[20, 1]="�����"
letra[20, 2]="  �  "
letra[20, 3]="  �  "
letra[20, 4]="  �  "
letra[20, 5]="  �  "
letra[21, 1]="�   �"
letra[21, 2]="�   �"
letra[21, 3]="�   �"
letra[21, 4]="�   �"
letra[21, 5]=" ��� "
letra[22, 1]="�   �"
letra[22, 2]="�   �"
letra[22, 3]="�   �"
letra[22, 4]=" � � "
letra[22, 5]="  �  "
letra[23, 1]="�   �"
letra[23, 2]="�   �"
letra[23, 3]="� � �"
letra[23, 4]="�� ��"
letra[23, 5]="�   �"
letra[24, 1]="�   �"
letra[24, 2]=" � � "
letra[24, 3]="  �  "
letra[24, 4]=" � � "
letra[24, 5]="�   �"
letra[25, 1]="�   �"
letra[25, 2]=" � � "
letra[25, 3]="  �  "
letra[25, 4]="  �  "
letra[25, 5]="  �  "
letra[26, 1]="�����"
letra[26, 2]="    �"
letra[26, 3]=" ��� "
letra[26, 4]="�    "
letra[26, 5]="�����"
CLEA
@ 1,1 TO 16,79 177
@ 3,3 TO 14,76
DO d:\sueldos\inicio2 WITH 3,15,'SUELDOS  Y'
DO d:\sueldos\inicio2 WITH 10,20,'JORNALES'
@ 20,0 SAY PADC(" AID S.A. ",80) COLO I
@ 21,0 SAY PADC("Goyo REINER",80) COLO I
@ 24,0 SAY PADC("TECLA PARA CONTINUAR",80) COLO I
DO WHILE INKEY()=0
ENDDO
FOR A=1 TO 16
   scroll 2,2,15,78,1
   FOR B=1 TO 200
   NEXT
NEXT
FOR A=0 TO 25
   scroll 0,0,24,79,1
   FOR B=1 TO 100
   NEXT
NEXT
@ 1,1 TO 16,79 177
@ 3,3 TO 14,76
DO d:\sueldos\inicio1 WITH 3,15,'SUELDOS  Y'
DO d:\sueldos\inicio1 WITH 10,20,'JORNALES'
store .t. to control
DO d:\sueldos\sueldos
DO WHILE .T.
   ACTI MENU main
ENDDO
RETURN
