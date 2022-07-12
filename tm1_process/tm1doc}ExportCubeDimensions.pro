601,100
602,"tm1doc}ExportCubeDimensions"
562,"SUBSET"
586,"}Cubes"
585,"}Cubes"
564,
565,"rqn7ddiQNK?J>:]cT6aiI3In@sM24LA2LiAWQ=Lg]UPfP_V5?Td=fXLn?F9lzznbn]yiXdO\[hy9zw3drG@V?rKM`c7U9hJoDO^4z8XlqDNi8LZ;[in690vXnM_ZWySj9[:>z\JJR\u^tFVh?BRj8Yp;>pl>4Q[exW>=rhkHkpsQo6m?DNnyPaHS3_czkex05V?bc0mq"
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
560,0
561,0
590,0
637,0
577,1
vCube
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
572,26

#****Begin: Generated Statements***
#****End: Generated Statements****

# Французов Д.С. - 08/7/2022
# Процесс экспорту наименований измерений в кубах  в csv файл

# путь до директории, где лежит csv файл.
vsDirPath = '\\Vm-ibmpadev\C\TM1Models\Budgeting\ids\' ;
vsFilePath = vsDirPath | 'tm1doc_CubeDimensions.csv' ;

vsDim = '}Cubes' ;
sTempName = 'zTemp{' | GetProcessName() | '_' | TIMST ( NOW , '\Y-\m-\d \h-\i-\s' ) |'SRC' ;
nFlgTmp = 1 ;

#============================#
# Переопределение источника
#============================#
sMDX = '{TM1FILTERBYLEVEL( {TM1SUBSETALL([' | vsDim | ']) } , 0 )}' ;
SubsetCreatebyMDX( sTempName , sMDX , nFlgTmp) ;
SubSetMDXSet( vsDim, sTempName, '' ) ;

DatasourceType = 'SUBSET';
DatasourceNameForServer = '}Cubes';
DatasourceDimensionSubset = sTempName ;

573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,12

#****Begin: Generated Statements***
#****End: Generated Statements****

vnCounter = 1 ;

WHILE( TABDIM(vCube, vnCounter ) @<> '' ) ;
    vsDimName = TABDIM(vCube, vnCounter ) ;
    TextOutPut(vsFilePath, vCube, vsDimName,  NumberToString( vnCounter) ) ;
    vnCounter = vnCounter +  1 ;

END ;
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
