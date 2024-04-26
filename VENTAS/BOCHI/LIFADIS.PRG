*****************************************************
*-- Programa: LIFADIS
*-- Fecha   : 29/12/89
*-- Version : G. REINER
*-- Notas   : LISTADO DE FACTURAS EMITIDAS EN EL MES
*--           DISCRIMINADAS DIA POR DIA
*--      VIENE DE FACTURA.PRG
****************************************************
DO CASE
CASE BAR()<2
   RETURN TO MASTER
ENDC
mes=0
DEFI WIND win FROM 10,0 TO 14,79 DOUB
ACTI WIND win
@ 1,5 SAY 'MES A LISTAR (0 PARA MENU) ' GET mes PICT '99' RANGE 0,12
READ
DEAC WIND ALL
IF mes#0
   ON ERROR QUIT
   ON ESCAPE RETURN TO MASTER
   respuesta=0
   DO limerpai
   ON ESCAPE
   ON ERROR
   IF !EMPTY(RESPUESTA)
      respu=respuesta
      SELE fac1
      fisc="MONTH(FACFECHA)=MES .and. facfiltro#'RE'"
      fincli=RECCOUNT('PER')+1
      SET ORDER TO TAG facfecha
      RELE linea,pepe,texto,acla,tt
      PRIVATE linea,pepe,texto,acla,tt
      IF GETENV("EQUIPO")#"MICASA"
         DO WHIL !PRIN()
            DO impresor
         ENDD
      ENDIF
      sort on facnumero to tempo for ;
        MONTH(FACFECHA)=MES .and. ;
        facfiltro#'RE' .and. ;
        facfiltro#"ND"
      sele 0
      use tempo
      GO TOP
      SCAN FOR TIPO="A"
         FECHA=FACFECHA
         EXIT
      ENDSCAN
      IF !EOF()
         SCAN FOR !EMPTY(TIPO)
            LALETRA=TIPO
            EXIT
         ENDSCAN
         GO TOP
         ELNUM=FACNUMERO-1
         VEZ=1
         SCAN
            IF VEZ=1
               IF FACNUMERO#ELNUM+1 .AND. ;
                  FACNUMERO#ELNUM+2 .AND. ;
    		      FACNUMERO#ELNUM
                  IF LALETRA="A"
                     LALETRA="B"
                  ELSE
                     LALETRA="A"
                  ENDIF
                  VEZ=2
                ENDIF
             ENDIF
            IF EMPTY(TIPO)
               REPL TIPO WITH LALETRA
            ENDIF
            ELNUM=FACNUMERO
         ENDSCAN
         tt='FACTURAS EMITIDAS - FECHA '+DTOC(fecha)+;
           chr(13)+chr(10)+;
           "FACTURAS 'A'"
         Do lifadis1 WITH "A"
         SCAN FOR TIPO="B"
            FECHA=FACFECHA
            EXIT
         ENDSCAN
         tt='FACTURAS EMITIDAS - FECHA '+DTOC(fecha)+;
           chr(13)+chr(10)+;
           "FACTURAS 'B'"
         Do lifadis1 WITH "B"
      ENDIF
      RELEASE linea,pepe,texto,acla
      SET FILTER TO
      SET INDEX TO
      USE IN TEMPO
      ERASE TEMPO.DBF
   ENDI
ENDI
DEAC WIND ALL
RETURN
