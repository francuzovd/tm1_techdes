601,100
602,"tm1doc}CreateAttr"
562,"SUBSET"
586,"}Dimensions"
585,"}Dimensions"
564,
565,"dpf0aZ@t4IjpvEdphj0s<eo8LRT7jbNHCfj1\[8gMOxmFMlu5pLNH`CLzDmiuNTOS2ac_xuoriv[Nid;v3kgjyxyzOU4f;kzus8R\\9=^zIrVQkvu<IS:QfKCfpnhEs00Qa[LhXZc2e5REY=<UKB9`Gz]OYP;KW[izYPg:w6W3yK8=pk^OuNA7>:ZoaCz927uuICA>WL"
559,1
928,0
593,
594,
595,
597,
598,
596,
800,
801,
566,0
567,","
588,"."
589,","
568,""""
570,
571,All
569,0
592,0
599,1000
560,1
pImport
561,1
1
590,1
pImport,0
637,1
pImport,"0 - do not import, 1 - import"
577,1
vDimName
578,1
2
579,1
1
580,1
0
581,1
0
582,1
VarType=32ColType=827
603,0
572,22

#****Begin: Generated Statements***
#****End: Generated Statements****

# Французов Д.С. - 
# автоматтическое создание атрибута Description

#имя нового атрибута
vsNewAttr_Name = 'tm1doc}Description' ;
vsDim = '}Dimensions' ;
vnFlgTmp = 1 ;

# создаём сабсеты для выбранных измерений
sMDX = '{[}Dimensions].[}Cubes], [}Dimensions].[}Dimensions], [}Dimensions].[}Processes]}' ;
vsTempName = 'zTemp{' | GetProcessName() | '_' | TIMST ( NOW , '\Y-\m-\d \h-\i-\s' ) ;
SubsetCreateByMDX( vsTempName , sMDX, vnFlgTmp ); 

# Переопределение источника

DatasourceType = 'SUBSET' ;
DatasourceNameForServer = vsDim ;
DatasourceDimensionSubset = vsTempName ;
573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,12

#****Begin: Generated Statements***
#****End: Generated Statements****


ElementAttrInsert(vDimName, '', '', vsNewAttr_Name, 'S' ) ;

IF(  (pImport = 1 ) 
#& (vDimName @<> '}Processes') 
) ;
    ExecuteProcess('tm1doc}ImportDescription', 'pDimName', vDimName, 'pAttrName', vsNewAttr_Name ) ;
ENDIF ;
575,3

#****Begin: Generated Statements***
#****End: Generated Statements****
576,CubeAction=1511DataAction=1503CubeLogChanges=0
930,0
638,1
804,0
1217,0
900,
901,
902,
938,0
937,
936,
935,
934,
932,0
933,0
903,
906,
929,
907,
908,
904,0
905,0
909,0
911,
912,
913,
914,
915,
916,
917,0
918,1
919,0
920,50000
921,""
922,""
923,0
924,""
925,""
926,""
927,""
