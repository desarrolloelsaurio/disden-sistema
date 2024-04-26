********************************************************************************
*-- Programa: QUERYPRE.PRG
*-- Fecha   : 05-15-92 06:56pm
*-- Version : G. REINER
*-- Notas   : GENERA QUERY PARA LISTA DE PRECIOS
********************************************************************************
FUNCTION QUERYPRE
parameter porpa
PRIVATE PORPA
ULPR=HORA_ULP(PROGRAM())
=MOVEWIN(8,10,14,69,'win',' L¡mites de la Lista de Precios ',' [ESC] para Men£ ')
STORE 1 TO FILMER,FILPRE,FILART
STORE '.T.' TO QUEMER,QUEPRE,QUEART
STORE '' TO TTMER,TTPRE,TTART
***
FOR M.I=NUL TO 1
   =rad_bot(1,2,'filmer','*RT Todos los Art¡culos;Un Art¡culo;Anula Listado',19,m.i=1)
   IF M.I=1
      READ CYCLE
   ENDIF
   IF M.I=0 .OR. (M.I=1 .AND. FILMER#3)
      IF LAST()#27 .OR. (LAST()=27 .AND. M.I=0)
         =rad_bot(1,30,'filpre','*RT Precios;Porcentajes;Lista Mixta',19,m.i=1)
         READ CYCLE WHEN LAST()#27 .AND. M.I=1
      ENDIF
   ELSE
      EXIT
   ENDIF
NEXT
IF LASTKEY()#27 .AND. FILMER#3
   STORE NUL TO LARGOR
   =QW_MER(4,2,'MER.ARTICULO')
   =QW_PRENO()
   FISC='ENLISTA'
   FISC=QW_FISC(FISC,QUEMER)
   FISC=IIF(EMPTY(FISC),'.T.',FISC)
   TTQUE=QW_TT(TTMER)+QW_TT(TTPRE)
ENDIF
RETURN RELEWIN("WIN") .AND. last()#27
