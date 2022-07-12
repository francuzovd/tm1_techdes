601,100
602,"tm1doc}ImportDescription"
562,"CHARACTERDELIMITED"
586,"\\Vm-ibmpadev\C\TM1Models\Budgeting\ids\tm1doc_}Dimеnsions.csv"
585,"\\Vm-ibmpadev\c\TM1Models\Budgeting\ids\tm1doc_}Dimensions.csv"
564,
565,"v6\w9zJYtau@gGcN3gxZPuayZQ?JI;IG]e;ecdGCc;5<E2GmqavTxhiPnl_whEJpJuG2`S1Ak6d<x`uSYeoNuIczzt]cq[cs9Jp[tK\B2uJ=Vvzkl4MxXnDaMGgJ=PO<4p`8V:DwcB3_`]qNy_bD:wyYG8pzPUyp?Ul@?xQ\BC:78V:RTZPwiPA:7hNXw3EyFLatyL37"
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
571,
569,0
592,0
599,1000
560,2
pDimName
pAttrName
561,2
2
2
590,2
pDimName,"}Dimensions"
pAttrName,"tm1doc}Description"
637,2
pDimName,"}Dimensions \ }Cubes"
pAttrName,""
577,3
vElemName
sValue
V3
578,3
2
2
2
579,3
1
2
3
580,3
0
0
0
581,3
0
0
0
582,3
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
603,0
572,27

#****Begin: Generated Statements***
#****End: Generated Statements****

# Французов Д.С. - 17/2/2022
# Процесс по заполнению атрибута tm1doc}Description в измерениях }Dimension и }Cubes из подготовленного csv файла

# путь до директории, где лежит csv файл.
vsDirPath = '\\Vm-ibmpadev\C\TM1Models\Budgeting\ids\' ;
vsFilePath = vsDirPath | 'tm1doc_' | pDimName | '.csv' ;

IF( FileExists( vsFilePath ) = 0) ; 
    LogOutput( 'INFO', 'File not exists - ' | vsFilePath ) ;
    ProcessQuit ;
ENDIF;

vsCube = '}ElementAttributes_' | pDimName ;
vAttrName = 'tm1doc}Description' ;

SetInputCharacterSet( 'TM1CS_UTF8' ) ;

DatasourceType = 'CHARACTERDELIMITED' ;
DatasourceNameForServer = vsFilePath ;
DatasourceASCIIDelimiter = ',' ;
DatasourceASCIIHeaderRecords = 0 ;
DatasourceASCIIQuoteCharacter = '"' ;

573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,8

#****Begin: Generated Statements***
#****End: Generated Statements****

CellPutS( sValue, vsCube, vElemName, pAttrName ) ;

#CellPutS( vElemName, vsCube, vElemName, pAttrName ) ;
#textoutput( vsDirPath | 'test.txt', sValue, vsCube, vElemName, pAttrName, V3 ) ;
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
