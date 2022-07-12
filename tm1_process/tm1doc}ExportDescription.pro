601,100
602,"tm1doc}ExportDescription"
562,"VIEW"
586,"}ElementAttributes_}Dimensions"
585,"}ElementAttributes_}Dimensions"
564,
565,"wDT3yC3V``w8vou:6:F<uzUaN3AB4h_rpOUpbm<DTrbWwa\I7mmO=89p4FFt?ZNa\cgBW0lI8A^BJa8^OyO0ypRFF3RIS60uw7Ya<pT_gRhNav77Nss<9\c38Q60C@a]B21eiq0Tj7V>E[0bPcyZVln\@RnG?rBt[yO1S[=nclARG3ViUyc1Ho5URLYDsuz:k:c_P;_o"
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
570,zTemp
571,
569,0
592,0
599,1000
560,1
pDimName
561,1
2
590,1
pDimName,"}Dimensions"
637,1
pDimName,"}Dimensions \ }Cubes"
577,6
vElemName
vAttrName

NVALUE
SVALUE
VALUE_IS_STRING
578,6
2
2
2
1
2
1
579,6
1
2
3
0
0
0
580,6
0
0
0
0
0
0
581,6
0
0
0
0
0
0
582,3
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
603,0
572,69

#****Begin: Generated Statements***
#****End: Generated Statements****


# Французов Д.С. - 17/2/2022
# Процесс экспорту данных из атрибута tm1doc}Description в измерениях }Dimension и }Cubes в csv файл

# путь до директории, где лежит csv файл.
vsDirPath = '\\Vm-ibmpadev\C\TM1Models\Budgeting\ids\' ;
vsFilePath = vsDirPath | 'tm1doc_' | pDimName | '.csv' ;

vsCubeSRC = '}ElementAttributes_' | pDimName ;
vsAttrName = 'tm1doc}Description' ;
vsDimElemAttr = vsCubeSRC ;
sTempName = 'zTemp{' | GetProcessName() | '_' | TIMST ( NOW , '\Y-\m-\d \h-\i-\s' ) |'SRC';

#============================#
# Переопределение источника
#============================#

# сабсеты и представление удаляются в эпилоге
# это необходимо, чтобы оснонвной процесс мог запускать этот процесс в цикле без ошибки
nFlgTmp = 1 ;
nFlgSkipZeroes = 0 ;
nFlgSkipCalcs =  0 ;
nFlgSkipRule = 1 ;

IF ( ViewExists ( vsCubeSRC  , sTempName ) = 1 ) ;
    ViewDestroy ( vsCubeSRC , sTempName ) ;
ENDIF ;
ViewCreate ( vsCubeSRC , sTempName , nFlgTmp ) ;

nCount = 1 ;

WHILE ( TABDIM ( vsCubeSRC , nCount ) @<> '' ) ;

      vsDim = TABDIM ( vsCubeSRC , nCount ) ;

      IF ( SubsetExists ( vsDim , sTempName ) = 1 ) ;
         SubsetDestroy ( vsDim , sTempName ) ;
      ENDIF ;

      IF ( vsDim @= pDimName ) ;
                 sMDX = '{TM1FILTERBYLEVEL( {TM1SUBSETALL([' | vsDim | ']) } , 0 )}' ;
                 SubsetCreatebyMDX( sTempName , sMDX , nFlgTmp) ;
                 SubSetMDXSet (vsDim, sTempName, '' ) ;
                 ViewSubsetAssign ( vsCubeSRC , sTempName ,  vsDim , sTempName ) ;
      ENDIF;
       
      IF ( vsDim @= vsDimElemAttr ) ;
                 SubsetCreate ( vsDim , sTempName , nFlgTmp ) ;
                 SubsetElementInsert ( vsDim , sTempName , vsAttrName , 1 ) ;
                 ViewSubsetAssign ( vsCubeSRC , sTempName ,  vsDim , sTempName ) ;
      ENDIF;
      
     nCount = nCount + 1 ;
END ; 

ViewExtractSkipZeroesSet ( vsCubeSRC , sTempName , nFlgSkipZeroes ) ;
ViewExtractSkipCalcsSet ( vsCubeSRC , sTempName , nFlgSkipCalcs ) ;
ViewExtractSkipRuleValuesSet ( vsCubeSRC , sTempName , nFlgSkipRule ) ;


DatasourceType = 'VIEW' ;
DatasourceNameForServer = vsCubeSRC ;
DatasourceCubeview = sTempName ;

#SetOutputCharacterSet( vsFilePath, 'TM1CS_UTF8' ) ;
573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,5

#****Begin: Generated Statements***
#****End: Generated Statements****

TextOutput( vsFilePath, vElemName, sValue) ;
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
