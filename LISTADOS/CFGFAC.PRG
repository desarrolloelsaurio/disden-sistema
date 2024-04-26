********************************
*-- Programa: CFGFAC.PRG
*-- Fecha   : 02-25-92 06:34pm
*-- Version : G. REINER
*-- Notas   : CONFIGURA LISTADO
********************************
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
FUNCTION CFGFAC
PARAMETER EL_ARR
CC=MAX(8+aR_MAXAN(@texto),23)
IF CANT_MAX>16
   m.losren=int(m.CANT_MAX/2)
   m.salto=m.cc-1
   m.ancho=(m.cc*2)
ELSE
   m.losren=CANT_MAX
   m.ancho=m.cc
   store nul to salto
ENDIF
=movecent(0,0,5+m.losren,m.ancho,'win'," Campos a Listar ","Marque el que desee incluir")
STORE ' ' TO m.nada
store 1 to m.vez,m.rx1
store 2 to m.cx1
FOR A=1 TO CANT_MAX
   IF HABILITADO[A]
      V='VA'+ALLTRIM(STR(A))
      STORE 'Imprime Campo de '+texto[a,1]+' ?' TO &V
      @ m.rx1,m.cx1 get variable[a] pict texto[a,1] func '*C' MESS &V COLO SCHE 19 ;
      FONT "ARIAL",12
   ELSE
      @ m.rx1,m.cx1 get variable[a] pict texto[a,1] func '*C' DISA COLO SCHE 19 ;
      FONT "ARIAL",12      
   ENDIF
   IF m.losren=CANT_MAX
      m.rx1=A+1
   ELSE
      m.cx1=m.cx1+m.salto
      m.vez=m.vez+1
      if m.vez=3
         m.vez=1
         m.rx1=m.rx1+1
         m.cx1=2
      endif
   ENDIF
next
mxcol=int((wcols()-18)/2)
@ m.rx1+1,mxcol GET NADA pict '@*H \!\<Acepta;\?\<Rechaza' ;
  DEFA 0 MESS '[ENTER] Acepta Campos - [ESC] Rechaza' ;
  COLO SCHE 19 ;
  VALID CFGFAC1(NADA) ;
  FONT "ARIAL",12
A=1
read cycle
=RELEWIN("WIN")
FOR A=1 TO CANT_MAX
   if variable[a]
      exit
   endif
NEXT
RETURN men_lin(BOTOM) .AND. A<=CANT_MAX .and. last()#27 .AND. ALLTRIM(M.NADA)#'Rechaza'
 
FUNCTION CFGFAC1
PARAMETER C_NADA
IF ALLTRIM(C_NADA)='Rechaza'
   CLEA READ
   RETURN .F.
ENDIF
RETURN .T.
