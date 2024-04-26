********************************************************************************
*-- Programa: bmer.prg
*-- Fecha   : 11-02-91 12:22pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE borrado de mercader¡as
*-- Modificaci¢n GOYO 07-23-92 01:11am marca -> empresa
********************************************************************************
DO CASE
sele mer
case bar()=1
   if confirma("Borrar Todos los Productos de "+alltrim(upper(janname)),.t.,10,10)
      IF FLOCK("MER") OR flok('mer')
			   =MEN_LIN("Borrando todos los Productos de la Empresa "+alltrim(janname))
         dele all
      endif
   ENDIF
CASE bar()=2
   STOR NUL TO respuesta
   IF !EMPTY(elirub(" a Borrar",-1,1))
      xcos=RUB->CODRUB
      if confirma("Borrar por Rubro "+alltrim(rub->rubro)+' de Empresa '+upper(alltrim(janname)),.t.,10,10)
         sele mer
         if flock("MER") .OR. flok('mer')
    		    =MEN_LIN("Borrando Productos de Rubro "+alltrim(rub.rubro)+" de la Empresa "+alltrim(janname))
            dele for mer->rubro=xcos
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
            dele for mer->temporada=xcos
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
         =FLOCK("MER") OR flok('mer')
			      =MEN_LIN("Borrando todos los Productos de la Empresa "+alltrim(janname))
            dele all
      ENDIF
	 endif
   m.janname=m.name
	 m.jannro=m.nro
	 =OPMER()
CASE bar()=5
   if confirma("Borrar por Grupo Discrimina Peso y Unidad de la Empresa "+upper(alltrim(m.janname)),.t.,10,10)
      =flock("MER") .or. flok('mer')
         dele for discrim
	 endif
CASE bar()=6
   if confirma("Borrar por Grupo NO Discrimina Peso y Unidad de la Empresa "+upper(alltrim(m.janname)),.t.,10,10)
      if flock("MER") .or. flok('mer')
         dele for !discrim
      endif
	 endif
case bar()=7
   STOR NUL TO respuesta
   IF !EMPTY(elimer(" a Borrar",-1,1))
      DO bmer1
   ENDIF
ENDCASE
unlo all
=men_lin(botom)
RETURN
