#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
PROCEDURE REIMFAC
PARAMETER PORPAN,ELFORM,HISTORICO
public laconsig
ELFORMPL=IIF(ELFORM="FA",'Facturas',IIF(ELFORM="NC","Notas de Crédito","Notas de Débito"))
ELFORMSI=IIF(ELFORM="FA",'Factura',IIF(ELFORM="NC","Nota de Crédito","Nota de Débito"))
IF PORPAN
   DO REIMFAC1
ELSE
   respuesta='REIMFAC#5#45#;
     Menú de Reimpresión de '+ELFORMPL+'#3;
#\<Original;
#\<Duplicado;
#\<Triplicado;
#Tod\<as'
   =defpop()
   ON SELE POPU REIMFAC DO REIMFAC1
   ACTI POPU REIMFAC
   RELE POPU REIMFAC
ENDIF
RETURN MEN_LIN(BOTOM)
 
PROCEDURE REIMFAC1
RE_DIJO=ALLTRIM(PROMPT())
=OPCCL()
=opcli()
=opmer()
IF HISTORICO
   =CLOSDBF("FAX")
   =CLOSDBF("FAC")
   =OPFAH()
ELSE
   =opfac()
ENDIF
store nul to respuesta
if elifac()
   M.LAFACOK=FAC.FACTURA
   IF ELFORM=FAC.TIPO .OR. ;
        ELFORM="FA" .AND. EMPTY(FAC.TIPO)
      STORE .F. TO MUCHAS
      ELGIL=SAYPER(FAC.CODCLI,"CODCLI")
      HAIR=SAYMIX(PER.LOCALIDAD,"CIUCOD")
      LACONDIVA=SAYMIX(PER.CONDIVA,"IVACOD")
      ELNROIVA=PER.NROIVA
      ELTELEF=ALLTRIM(PER.TELEFONO)+" - "+ALLTRIM(PER.FAX)
      DO CASE
      CASE RE_DIJO="Original" .OR. ;
           PORPAN
         LACOPIA="ORIGINAL"
      CASE RE_DIJO="Duplicado"
         LACOPIA="DUPLICADO"
      CASE RE_DIJO="Triplicado"
         LACOPIA="TRIPLICADO"
      CASE RE_DIJO="Todas"
         STORE .T. TO M.MUCHAS
         STORE "" TO M.LACOPIA
      ENDCASE
      SELE FAX
      SET ORDER TO TAG FACTURA
      M.HAYUNO=SEEK(FAC.FACTURA)
      m.numero = FAC.FACTURA
      IF M.MUCHAS
         _PCOPIES=iif(left(fac.factura,1)="A",iif(historico,3,1),2)
         COPIA=1
         DO CASE
         CASE ELFORM="NC"
            SELE FAC
            SCAT MEMV
            SELE CCL
            SET ORDER TO TAG NUMERORE
            SEEK FAC.FACTURA
            M.DETALLE=CCL.DETALLE
            M.PAANULAR=CCL.COMPR
         CASE ELFORM="ND"
            SELE FAC
            SCAT MEMV
            SELE CCL
            SET ORDER TO TAG NUMERORE
            SEEK FAC.FACTURA
            M.DETALLE=CCL.DETALLE
            M.PAANULAR=CCL.COMPR
         ENDCASE
         PRINT
            =XSEEK(M.LAFACOK,"FAC","FACTURA")
            m.txtvende = fac.usuario
            LACOPIA=IIF(COPIA=1,"ORIGINAL",;
              IIF(COPIA=2,;
              IIF(LEFT(FAC.FACTURA,1)="A",;
              "TRIPLICADO","DUPLICADO"),;
              "DUPLICADO"))
            SELE FAX
            M.HAYUNO=SEEK(FAC.FACTURA)
            if left(FAC.factura,1)="Q"
            	m.laconsig="CONSIGNACION"
            endif
            DO CASE
            CASE ELFORM="FA"
               IF GETENV("ESTUD")="SI"
                  repo form pretr to prin PROM;
                    noconsole ;
                    for fax.factura=fac.factura
               ELSE
                  repo form pretr to prin PROM;
                    noconsole ;
                    for fax.factura=fac.factura
               ENDIF
            CASE ELFORM="NC"
               M.FACTURA=FAC.FACTURA
               IF LEFT(FAC.FACTURA,1)="B"
                  IF M.HAYUNO
                     repo form lDEVi to prin PROM;
                       noconsole ;
                       for fax.factura=FAC.factura
                  ELSE
                     SELE FAC
                     repo form lCREi to prin PROM;
                       noconsole ;
                      for faC.factura=M.factura
                  ENDIF
               ELSE
                  IF M.HAYUNO
                     repo form lDEVA to prin PROMP;
                       noconsole ;
                       for fax.factura=FAC.factura
                  ELSE
                     SELE FAC
                     repo form lCREA to prin PROM;
                       noconsole ;
                       for faC.factura=M.factura
                  ENDIF
               ENDIF
            CASE ELFORM="ND"
               SELE FAC
               repo form ldebi to prin PROM;
                 noconsole ;
                 for faC.factura=M.factura
            ENDCASE
            COPIA=COPIA+1
         ENDP
      ELSE
         IF PORPAN
               SELE FAC
               SCAT MEMV
               SELE CCL
               SET ORDER TO TAG NUMERORE
               SEEK FAC.FACTURA
               M.DETALLE=CCL.DETALLE
               M.PAANULAR=CCL.COMPR
               SELE FAX
            M.FACTURA=FAC.FACTURA
            if left(FAC.factura,1)="Q"
            	m.laconsig="CONSIGNACION"
            endif
            m.txtvende = fac.usuario
            IF GETENV("ESTUD")="SI"
               IF ELFORM="NC"
                  IF M.HAYUNO
                     SELE FAX
                     repo form lDEVi PREV;
                       for fax.factura=FAC.factura
                  ELSE
                     SELE FAC
                     repo form lCREi PREV;
                      for faC.factura=M.factura
                  ENDIF
               ELSE
                  repo form pretr ;
                    prev ;
                    WHILE fax.factura=fac.factura
               ENDIF
            ELSE
               IF ELFORM="NC"
               SELE FAC
               SCAT MEMV
               SELE CCL
               SET ORDER TO TAG NUMERORE
               SEEK FAC.FACTURA
               M.DETALLE=CCL.DETALLE
               M.PAANULAR=CCL.COMPR
               SELE FAX
                IF M.HAYUNO
                     SELE FAX
                     repo form lDEVA PREV;
                       for fax.factura=FAC.factura
                  ELSE
                     SELE FAC
                     repo form lCREA PREV;
                       for faC.factura=M.factura
                  ENDIF
               ELSE
	            if left(FAC.factura,1)="Q"
    	        	m.laconsig="CONSIGNACION"
        	    endif
                  repo form pretr ;
                    prev ;
                    WHILE fax.factura=fac.factura
               ENDIF
            ENDIF
         ELSE
            m.txtvende = fac.usuario
            DO CASE
            CASE ELFORM="FA"
	            if left(FAC.factura,1)="Q"
    	        	m.laconsig="CONSIGNACION"
        	    endif
               IF GETENV("ESTUD")="SI"
                  repo form pretr to prin PROM;
                    noconsole WHILE fax.factura=fac.factura
               ELSE
                  repo form pretr to prin PROM;
                    noconsole WHILE fax.factura=fac.factura
               ENDIF
            CASE ELFORM="NC"
               SELE FAC
               SCAT MEMV
               SELE CCL
               SET ORDER TO TAG NUMERORE
               SEEK FAC.FACTURA
               M.DETALLE=CCL.DETALLE
               M.PAANULAR=CCL.COMPR
               SELE FAX
               IF LEFT(FAC.FACTURA,1)="B"
               M.FACTURA=FAC.FACTURA
                  IF M.HAYUNO
                     repo form lDEVi to prin PROM;
                       noconsole ;
                       for fax.factura=FAC.factura
                  ELSE
                     SELE FAC
                     repo form lCREi to prin PROM;
                       noconsole ;
                       for faC.factura=M.factura
                  ENDIF
               ELSE
                  IF M.HAYUNO
                     repo form lDEVA to prin PROM;
                       noconsole ;
                       for fax.factura=FAC.factura
                  ELSE
                     SELE FAC
                     repo form lCREA to prin PROM;
                       noconsole ;
                       for faC.factura=M.factura
                  ENDIF
               ENDIF
            CASE ELFORM="ND"
               SELE FAC
               SCAT MEMV
               SELE CCL
               SET ORDER TO TAG NUMERORE
               SEEK FAC.FACTURA
               M.DETALLE=CCL.DETALLE
               M.PAANULAR=CCL.COMPR
               SELE FAC
               repo form ldebi to prin PROM;
                 noconsole ;
                 for faC.factura=M.factura
            ENDCASE
         ENDIF
      ENDIF
   ELSE
      WAIT "EL FORMULARIO "+FAC.FACTURA+" NO ES DEL TIPO REQUERIDO" WIND
   ENDIF
ELSE
   =NOSELEC(ELFORMSI)
ENDIF
=CLOSDBF("FAC") .OR. CLOSDBF("FAX")
RETURN MEN_LIN(BOTOM)
