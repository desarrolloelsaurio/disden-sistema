parameter dirbase
priv pipo,dirbase,xa,padre,actual
set full on
set exact on
dirbase=iif(empty(dirbase),getd(),dirbase)
if last()#27 .and. !empty(dirbase)
   dirbase=alltrim(dirbase)
   if right(dirbase,1)="\"
   dirbase=left(dirbase,len(dirbase)-1)
   endif
   wait "directorio base:"+dirbase wind nowa
   if !used("director")
   create table director ;
   (padre c(64),;
   actual c(8))
*   index on alltrim(padre)+alltrim(actual) tag padre
*   set order to tag padre
   m.padre=dirbase
   m.actual=""
      insert into director from memv
   endif
   if !empty(adir(pipo,(dirbase+"\*."),"D"))
   sele director
   for xa=3 to alen(pipo,1)
      *if !seek(alltrim(dirbase)+alltrim(pipo[xa,1]))
      m.padre=dirbase
      m.actual=pipo[xa,1]
      insert into director from memv
      =tododir(alltrim(director.padre)+"\"+(alltrim(director.actual)))      
      *endif
   next
   endif
endif
return .t.