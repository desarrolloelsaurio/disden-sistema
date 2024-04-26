function getmeliq
para conso
priv conso
return iif(getdoc(conso,'ME'),IIF(EMPTY(doc.numero),1,doc.numero),nul)
