********************************************************************************
*-- Programa: llmer.prg
*-- Fecha   : 03-27-92 01:50am
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE recuperado de mercader¡as
*-- Modificaci¢n GOYO 05-14-92 03:55pm
*-- Modificaci¢n GOYO 07-23-92 01:11am marca -> empresa
********************************************************************************
DO CASE
sele mer
case bar()=1
   if confirma("Borrar Todos los Productos de "+alltrim(upper(janname)),.t.,10,10)
      IF FLOCK("MER") OR flok('mer')
			   =MEN_LIN("Borrando todos los Productos de la Empresa "+alltrim(janname))
				 set dele off
         reca all
				 set dele on
      endif
   ENDIF
CASE bar()=2
   STOR NUL TO respuesta
   IF elirub(" a Borrar",-1,1)
      xcos=RUB->CODRUB
      if confirma("Borrar por Rubro "+alltrim(rub->rubro)+' de Empresa '+upper(alltrim(janname)),.t.,10,10)
         sele mer
         if flock("MER") .OR. flok('mer')
    		    =MEN_LIN("Borrando Productos de Rubro "+alltrim(rub.rubro)+" de la Empresa "+alltrim(janname))
						set dele off
            reca for mer->rubro=xcos
						set dele on
         endif
	    ENDIF
   ENDIF
CASE bar()=3
   rele temp
   dime temp[5]
   =GEN_TEM(TEMP)
   m.temporada=TEMP[pop_lisT(5,COL,temp,'Temporada de '+alltrim(m.merca))]
   IF LASTKEY()#27
      xcos=LEFT(M.TEMPORADA,1)
      if confirma("Borrar por Temporada "+alltrim(M.TEMPORADA)+" de Empresa "+upper(alltrim(janname)),.t.,10,10)
         if flock("MER") .or. flok('mer')
						set dele off
            reca for mer->temporada=xcos
						set dele on
         endif
			endif
   ENDIF
CASE bar()=4
   m.name=m.janname
	 m.nro=m.jannro
	 store 0 to respuesta
	 if !empty(eliemp("a Borrar",-1,1))
      if confirma("Borrar Todos los Productos de "+alltrim(upper(janname)),.t.,10,10)
				 =OPMER()
         IF FLOCK("MER") OR flok('mer')
			      =MEN_LIN("Borrando todos los Productos de la Empresa "+alltrim(janname))
						 set dele off
             reca all
						 set dele on
         endif
      ENDIF
	 endif
   m.janname=m.name
	 m.jannro=m.nro
	 =OPMER()
CASE bar()=5
   if confirma("Borrar por Grupo Discrimina Peso y Unidad de la Empresa "+upper(alltrim(m.janname)),.t.,10,10)
   =flock("MER") .or. flok('mer')
				 set dele off
         dele for discrim
				 set dele on
      endif
CASE bar()=6
   if confirma("Borrar por Grupo NO Discrimina Peso y Unidad de la Empresa "+upper(alltrim(m.janname)),.t.,10,10)
      =flock("MER") .or. flok('mer')
				 set dele off
         dele for !discrim
				 set dele on
	 endif
case bar()=7
   SET DELE OFF
   SET FILTER TO DELETED()
   GOTO TOP
   IF !EOF()
      STORE merpop TO anterior
      STORE .T. TO merpop
      =OPMER()
      STOR NUL TO respuesta
      IF elimer(" a Recuperar",-1,1)
         DO llmer1
      ENDIF
      STORE anterior TO merpop
   ENDIF
   SET DELE ON
   SELE mer
   SET FILTER TO
ENDCASE
unlo all
=men_lin(botom)
RETURN
