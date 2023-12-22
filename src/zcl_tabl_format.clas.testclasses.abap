CLASS ltcl_test DEFINITION FOR TESTING DURATION SHORT RISK LEVEL HARMLESS FINAL.

  PRIVATE SECTION.
    METHODS test
      IMPORTING
        iv_ddl TYPE string
        iv_xml TYPE string.

    METHODS test1 FOR TESTING RAISING cx_static_check.
    METHODS test2 FOR TESTING RAISING cx_static_check.

ENDCLASS.


CLASS ltcl_test IMPLEMENTATION.

  METHOD test.

    DATA lo_format TYPE REF TO zcl_tabl_format.
    DATA ls_data   TYPE zcl_tabl_format=>ty_internal.
    DATA lv_ddl    TYPE string.

    CREATE OBJECT lo_format.

    CALL TRANSFORMATION id
      OPTIONS value_handling = 'accept_data_loss'
      SOURCE XML iv_xml
      RESULT dd02v = ls_data-dd02v.

    lv_ddl = lo_format->serialize( ls_data ).

  ENDMETHOD.

  METHOD test1.

    DATA lv_ddl TYPE string.
    DATA lv_xml TYPE string.

    lv_ddl =
      `@EndUserText.label : 'Generated by abapGit'` && |\n| &&
      `@AbapCatalog.enhancementCategory : #NOT_EXTENSIBLE` && |\n| &&
      `@AbapCatalog.tableCategory : #TRANSPARENT` && |\n| &&
      `@AbapCatalog.deliveryClass : #L` && |\n| &&
      `@AbapCatalog.dataMaintenance : #LIMITED` && |\n| &&
      `define table zabapgit {` && |\n| &&
      `  key type  : abap.char(12) not null;` && |\n| &&
      `  key value : abap.char(12) not null;` && |\n| &&
      `  data_str  : abap.string(0);` && |\n| &&
      `` && |\n| &&
      `}`.

    lv_xml =
      `<?xml version="1.0" encoding="utf-8"?>` && |\n| &&
      `<abapGit version="v1.0.0" serializer="LCL_OBJECT_TABL" serializer_version="v1.0.0">` && |\n| &&
      ` <asx:abap xmlns:asx="http://www.sap.com/abapxml" version="1.0">` && |\n| &&
      `  <asx:values>` && |\n| &&
      `   <DD02V>` && |\n| &&
      `    <TABNAME>ZABAPGIT</TABNAME>` && |\n| &&
      `    <DDLANGUAGE>E</DDLANGUAGE>` && |\n| &&
      `    <TABCLASS>TRANSP</TABCLASS>` && |\n| &&
      `    <DDTEXT>Generated by abapGit</DDTEXT>` && |\n| &&
      `    <MASTERLANG>E</MASTERLANG>` && |\n| &&
      `    <CONTFLAG>L</CONTFLAG>` && |\n| &&
      `    <EXCLASS>1</EXCLASS>` && |\n| &&
      `   </DD02V>` && |\n| &&
      `   <DD09L>` && |\n| &&
      `    <TABNAME>ZABAPGIT</TABNAME>` && |\n| &&
      `    <AS4LOCAL>A</AS4LOCAL>` && |\n| &&
      `    <TABKAT>1</TABKAT>` && |\n| &&
      `    <TABART>APPL1</TABART>` && |\n| &&
      `    <BUFALLOW>N</BUFALLOW>` && |\n| &&
      `   </DD09L>` && |\n| &&
      `   <DD03P_TABLE>` && |\n| &&
      `    <DD03P>` && |\n| &&
      `     <FIELDNAME>TYPE</FIELDNAME>` && |\n| &&
      `     <KEYFLAG>X</KEYFLAG>` && |\n| &&
      `     <ADMINFIELD>0</ADMINFIELD>` && |\n| &&
      `     <INTTYPE>C</INTTYPE>` && |\n| &&
      `     <INTLEN>000024</INTLEN>` && |\n| &&
      `     <NOTNULL>X</NOTNULL>` && |\n| &&
      `     <DATATYPE>CHAR</DATATYPE>` && |\n| &&
      `     <LENG>000012</LENG>` && |\n| &&
      `     <MASK>  CHAR</MASK>` && |\n| &&
      `    </DD03P>` && |\n| &&
      `    <DD03P>` && |\n| &&
      `     <FIELDNAME>VALUE</FIELDNAME>` && |\n| &&
      `     <KEYFLAG>X</KEYFLAG>` && |\n| &&
      `     <ADMINFIELD>0</ADMINFIELD>` && |\n| &&
      `     <INTTYPE>C</INTTYPE>` && |\n| &&
      `     <INTLEN>000024</INTLEN>` && |\n| &&
      `     <NOTNULL>X</NOTNULL>` && |\n| &&
      `     <DATATYPE>CHAR</DATATYPE>` && |\n| &&
      `     <LENG>000012</LENG>` && |\n| &&
      `     <MASK>  CHAR</MASK>` && |\n| &&
      `    </DD03P>` && |\n| &&
      `    <DD03P>` && |\n| &&
      `     <FIELDNAME>DATA_STR</FIELDNAME>` && |\n| &&
      `     <ADMINFIELD>0</ADMINFIELD>` && |\n| &&
      `     <INTTYPE>g</INTTYPE>` && |\n| &&
      `     <INTLEN>000008</INTLEN>` && |\n| &&
      `     <DATATYPE>STRG</DATATYPE>` && |\n| &&
      `     <MASK>  STRG</MASK>` && |\n| &&
      `    </DD03P>` && |\n| &&
      `   </DD03P_TABLE>` && |\n| &&
      `  </asx:values>` && |\n| &&
      ` </asx:abap>` && |\n| &&
      `</abapGit>`.

    test( iv_xml = lv_xml
          iv_ddl = lv_ddl ).

  ENDMETHOD.

  METHOD test2.

    DATA lv_ddl TYPE string.
    DATA lv_xml TYPE string.

    lv_ddl =
      `@EndUserText.label : 'Clients'` && |\n| &&
      `@AbapCatalog.enhancementCategory : #NOT_EXTENSIBLE` && |\n| &&
      `@AbapCatalog.tableCategory : #TRANSPARENT` && |\n| &&
      `@AbapCatalog.deliveryClass : #C` && |\n| &&
      `@AbapCatalog.dataMaintenance : #ALLOWED` && |\n| &&
      `define table t000 {` && |\n| &&
      `  key mandt  : mandt not null;` && |\n| &&
      `  mtext      : mtext_d not null;` && |\n| &&
      `  ort01      : ort01 not null;` && |\n| &&
      `  @AbapCatalog.foreignKey.keyType : #KEY` && |\n| &&
      `  @AbapCatalog.foreignKey.screenCheck : true` && |\n| &&
      `  mwaer      : mwaer not null` && |\n| &&
      `    with foreign key [1..*,1] tcurc` && |\n| &&
      `      where mandt = t000.mandt` && |\n| &&
      `        and waers = t000.mwaer;` && |\n| &&
      `  adrnr      : char10 not null;` && |\n| &&
      `  cccategory : cccategory not null;` && |\n| &&
      `  cccoractiv : cccoractiv not null;` && |\n| &&
      `  ccnocliind : ccnocliind not null;` && |\n| &&
      `  cccopylock : cccopylock not null;` && |\n| &&
      `  ccnocascad : ccnocascad not null;` && |\n| &&
      `  ccsoftlock : ccsoftlock not null;` && |\n| &&
      `  ccorigcont : ccorigcont not null;` && |\n| &&
      `  ccimaildis : ccimaildis not null;` && |\n| &&
      `  cctemplock : cctemplock not null;` && |\n| &&
      `  changeuser : as4user not null;` && |\n| &&
      `  changedate : as4date not null;` && |\n| &&
      `  @AbapCatalog.foreignKey.label : 'Logical system'` && |\n| &&
      `  @AbapCatalog.foreignKey.keyType : #KEY` && |\n| &&
      `  @AbapCatalog.foreignKey.screenCheck : true` && |\n| &&
      `  logsys     : logsys not null` && |\n| &&
      `    with foreign key [1,0..1] tbdls` && |\n| &&
      `      where logsys = t000.logsys;` && |\n| &&
      `` && |\n| &&
      `}`.

    lv_xml =
      `<?xml version="1.0" encoding="utf-8"?>` && |\n| &&
      `<abapGit version="v1.0.0" serializer="LCL_OBJECT_TABL" serializer_version="v1.0.0">` && |\n| &&
      ` <asx:abap xmlns:asx="http://www.sap.com/abapxml" version="1.0">` && |\n| &&
      `  <asx:values>` && |\n| &&
      `   <DD02V>` && |\n| &&
      `    <TABNAME>T000</TABNAME>` && |\n| &&
      `    <DDLANGUAGE>E</DDLANGUAGE>` && |\n| &&
      `    <TABCLASS>TRANSP</TABCLASS>` && |\n| &&
      `    <BUFFERED>E</BUFFERED>` && |\n| &&
      `    <DDTEXT>Clients</DDTEXT>` && |\n| &&
      `    <APPLCLASS>SAP</APPLCLASS>` && |\n| &&
      `    <MASTERLANG>D</MASTERLANG>` && |\n| &&
      `    <MAINFLAG>X</MAINFLAG>` && |\n| &&
      `    <CONTFLAG>C</CONTFLAG>` && |\n| &&
      `    <SHLPEXI>X</SHLPEXI>` && |\n| &&
      `    <EXCLASS>1</EXCLASS>` && |\n| &&
      `   </DD02V>` && |\n| &&
      `   <DD09L>` && |\n| &&
      `    <TABNAME>T000</TABNAME>` && |\n| &&
      `    <AS4LOCAL>A</AS4LOCAL>` && |\n| &&
      `    <TABKAT>0</TABKAT>` && |\n| &&
      `    <TABART>APPL2</TABART>` && |\n| &&
      `    <PUFFERUNG>X</PUFFERUNG>` && |\n| &&
      `    <PROTOKOLL>X</PROTOKOLL>` && |\n| &&
      `    <TRANSPFLAG>X</TRANSPFLAG>` && |\n| &&
      `    <BUFALLOW>X</BUFALLOW>` && |\n| &&
      `   </DD09L>` && |\n| &&
      `   <DD03P_TABLE>` && |\n| &&
      `    <DD03P>` && |\n| &&
      `     <FIELDNAME>MANDT</FIELDNAME>` && |\n| &&
      `     <KEYFLAG>X</KEYFLAG>` && |\n| &&
      `     <ROLLNAME>MANDT</ROLLNAME>` && |\n| &&
      `     <ADMINFIELD>0</ADMINFIELD>` && |\n| &&
      `     <NOTNULL>X</NOTNULL>` && |\n| &&
      `     <COMPTYPE>E</COMPTYPE>` && |\n| &&
      `    </DD03P>` && |\n| &&
      `    <DD03P>` && |\n| &&
      `     <FIELDNAME>MTEXT</FIELDNAME>` && |\n| &&
      `     <ROLLNAME>MTEXT_D</ROLLNAME>` && |\n| &&
      `     <ADMINFIELD>0</ADMINFIELD>` && |\n| &&
      `     <NOTNULL>X</NOTNULL>` && |\n| &&
      `     <COMPTYPE>E</COMPTYPE>` && |\n| &&
      `    </DD03P>` && |\n| &&
      `    <DD03P>` && |\n| &&
      `     <FIELDNAME>ORT01</FIELDNAME>` && |\n| &&
      `     <ROLLNAME>ORT01</ROLLNAME>` && |\n| &&
      `     <ADMINFIELD>0</ADMINFIELD>` && |\n| &&
      `     <NOTNULL>X</NOTNULL>` && |\n| &&
      `     <COMPTYPE>E</COMPTYPE>` && |\n| &&
      `    </DD03P>` && |\n| &&
      `    <DD03P>` && |\n| &&
      `     <FIELDNAME>MWAER</FIELDNAME>` && |\n| &&
      `     <ROLLNAME>MWAER</ROLLNAME>` && |\n| &&
      `     <CHECKTABLE>TCURC</CHECKTABLE>` && |\n| &&
      `     <ADMINFIELD>0</ADMINFIELD>` && |\n| &&
      `     <NOTNULL>X</NOTNULL>` && |\n| &&
      `     <SHLPORIGIN>P</SHLPORIGIN>` && |\n| &&
      `     <COMPTYPE>E</COMPTYPE>` && |\n| &&
      `    </DD03P>` && |\n| &&
      `    <DD03P>` && |\n| &&
      `     <FIELDNAME>ADRNR</FIELDNAME>` && |\n| &&
      `     <ROLLNAME>CHAR10</ROLLNAME>` && |\n| &&
      `     <ADMINFIELD>0</ADMINFIELD>` && |\n| &&
      `     <NOTNULL>X</NOTNULL>` && |\n| &&
      `     <COMPTYPE>E</COMPTYPE>` && |\n| &&
      `    </DD03P>` && |\n| &&
      `    <DD03P>` && |\n| &&
      `     <FIELDNAME>CCCATEGORY</FIELDNAME>` && |\n| &&
      `     <ROLLNAME>CCCATEGORY</ROLLNAME>` && |\n| &&
      `     <ADMINFIELD>0</ADMINFIELD>` && |\n| &&
      `     <NOTNULL>X</NOTNULL>` && |\n| &&
      `     <VALEXI>X</VALEXI>` && |\n| &&
      `     <SHLPORIGIN>F</SHLPORIGIN>` && |\n| &&
      `     <COMPTYPE>E</COMPTYPE>` && |\n| &&
      `    </DD03P>` && |\n| &&
      `    <DD03P>` && |\n| &&
      `     <FIELDNAME>CCCORACTIV</FIELDNAME>` && |\n| &&
      `     <ROLLNAME>CCCORACTIV</ROLLNAME>` && |\n| &&
      `     <ADMINFIELD>0</ADMINFIELD>` && |\n| &&
      `     <NOTNULL>X</NOTNULL>` && |\n| &&
      `     <VALEXI>X</VALEXI>` && |\n| &&
      `     <SHLPORIGIN>F</SHLPORIGIN>` && |\n| &&
      `     <COMPTYPE>E</COMPTYPE>` && |\n| &&
      `    </DD03P>` && |\n| &&
      `    <DD03P>` && |\n| &&
      `     <FIELDNAME>CCNOCLIIND</FIELDNAME>` && |\n| &&
      `     <ROLLNAME>CCNOCLIIND</ROLLNAME>` && |\n| &&
      `     <ADMINFIELD>0</ADMINFIELD>` && |\n| &&
      `     <NOTNULL>X</NOTNULL>` && |\n| &&
      `     <VALEXI>X</VALEXI>` && |\n| &&
      `     <SHLPORIGIN>F</SHLPORIGIN>` && |\n| &&
      `     <COMPTYPE>E</COMPTYPE>` && |\n| &&
      `    </DD03P>` && |\n| &&
      `    <DD03P>` && |\n| &&
      `     <FIELDNAME>CCCOPYLOCK</FIELDNAME>` && |\n| &&
      `     <ROLLNAME>CCCOPYLOCK</ROLLNAME>` && |\n| &&
      `     <ADMINFIELD>0</ADMINFIELD>` && |\n| &&
      `     <NOTNULL>X</NOTNULL>` && |\n| &&
      `     <VALEXI>X</VALEXI>` && |\n| &&
      `     <SHLPORIGIN>F</SHLPORIGIN>` && |\n| &&
      `     <COMPTYPE>E</COMPTYPE>` && |\n| &&
      `    </DD03P>` && |\n| &&
      `    <DD03P>` && |\n| &&
      `     <FIELDNAME>CCNOCASCAD</FIELDNAME>` && |\n| &&
      `     <ROLLNAME>CCNOCASCAD</ROLLNAME>` && |\n| &&
      `     <ADMINFIELD>0</ADMINFIELD>` && |\n| &&
      `     <NOTNULL>X</NOTNULL>` && |\n| &&
      `     <VALEXI>X</VALEXI>` && |\n| &&
      `     <SHLPORIGIN>F</SHLPORIGIN>` && |\n| &&
      `     <COMPTYPE>E</COMPTYPE>` && |\n| &&
      `    </DD03P>` && |\n| &&
      `    <DD03P>` && |\n| &&
      `     <FIELDNAME>CCSOFTLOCK</FIELDNAME>` && |\n| &&
      `     <ROLLNAME>CCSOFTLOCK</ROLLNAME>` && |\n| &&
      `     <ADMINFIELD>0</ADMINFIELD>` && |\n| &&
      `     <NOTNULL>X</NOTNULL>` && |\n| &&
      `     <VALEXI>X</VALEXI>` && |\n| &&
      `     <SHLPORIGIN>F</SHLPORIGIN>` && |\n| &&
      `     <COMPTYPE>E</COMPTYPE>` && |\n| &&
      `    </DD03P>` && |\n| &&
      `    <DD03P>` && |\n| &&
      `     <FIELDNAME>CCORIGCONT</FIELDNAME>` && |\n| &&
      `     <ROLLNAME>CCORIGCONT</ROLLNAME>` && |\n| &&
      `     <ADMINFIELD>0</ADMINFIELD>` && |\n| &&
      `     <NOTNULL>X</NOTNULL>` && |\n| &&
      `     <COMPTYPE>E</COMPTYPE>` && |\n| &&
      `    </DD03P>` && |\n| &&
      `    <DD03P>` && |\n| &&
      `     <FIELDNAME>CCIMAILDIS</FIELDNAME>` && |\n| &&
      `     <ROLLNAME>CCIMAILDIS</ROLLNAME>` && |\n| &&
      `     <ADMINFIELD>0</ADMINFIELD>` && |\n| &&
      `     <NOTNULL>X</NOTNULL>` && |\n| &&
      `     <VALEXI>X</VALEXI>` && |\n| &&
      `     <SHLPORIGIN>F</SHLPORIGIN>` && |\n| &&
      `     <COMPTYPE>E</COMPTYPE>` && |\n| &&
      `    </DD03P>` && |\n| &&
      `    <DD03P>` && |\n| &&
      `     <FIELDNAME>CCTEMPLOCK</FIELDNAME>` && |\n| &&
      `     <ROLLNAME>CCTEMPLOCK</ROLLNAME>` && |\n| &&
      `     <ADMINFIELD>0</ADMINFIELD>` && |\n| &&
      `     <NOTNULL>X</NOTNULL>` && |\n| &&
      `     <VALEXI>X</VALEXI>` && |\n| &&
      `     <SHLPORIGIN>F</SHLPORIGIN>` && |\n| &&
      `     <COMPTYPE>E</COMPTYPE>` && |\n| &&
      `    </DD03P>` && |\n| &&
      `    <DD03P>` && |\n| &&
      `     <FIELDNAME>CHANGEUSER</FIELDNAME>` && |\n| &&
      `     <ROLLNAME>AS4USER</ROLLNAME>` && |\n| &&
      `     <ADMINFIELD>0</ADMINFIELD>` && |\n| &&
      `     <NOTNULL>X</NOTNULL>` && |\n| &&
      `     <COMPTYPE>E</COMPTYPE>` && |\n| &&
      `     <ANONYMOUS>X</ANONYMOUS>` && |\n| &&
      `    </DD03P>` && |\n| &&
      `    <DD03P>` && |\n| &&
      `     <FIELDNAME>CHANGEDATE</FIELDNAME>` && |\n| &&
      `     <ROLLNAME>AS4DATE</ROLLNAME>` && |\n| &&
      `     <ADMINFIELD>0</ADMINFIELD>` && |\n| &&
      `     <NOTNULL>X</NOTNULL>` && |\n| &&
      `     <SHLPORIGIN>T</SHLPORIGIN>` && |\n| &&
      `     <COMPTYPE>E</COMPTYPE>` && |\n| &&
      `    </DD03P>` && |\n| &&
      `    <DD03P>` && |\n| &&
      `     <FIELDNAME>LOGSYS</FIELDNAME>` && |\n| &&
      `     <ROLLNAME>LOGSYS</ROLLNAME>` && |\n| &&
      `     <CHECKTABLE>TBDLS</CHECKTABLE>` && |\n| &&
      `     <ADMINFIELD>0</ADMINFIELD>` && |\n| &&
      `     <NOTNULL>X</NOTNULL>` && |\n| &&
      `     <SHLPORIGIN>P</SHLPORIGIN>` && |\n| &&
      `     <COMPTYPE>E</COMPTYPE>` && |\n| &&
      `    </DD03P>` && |\n| &&
      `   </DD03P_TABLE>` && |\n| &&
      `   <DD05M_TABLE>` && |\n| &&
      `    <DD05M>` && |\n| &&
      `     <FIELDNAME>LOGSYS</FIELDNAME>` && |\n| &&
      `     <FORTABLE>T000</FORTABLE>` && |\n| &&
      `     <FORKEY>LOGSYS</FORKEY>` && |\n| &&
      `     <CHECKTABLE>TBDLS</CHECKTABLE>` && |\n| &&
      `     <CHECKFIELD>LOGSYS</CHECKFIELD>` && |\n| &&
      `     <PRIMPOS>0001</PRIMPOS>` && |\n| &&
      `     <DOMNAME>LOGSYS</DOMNAME>` && |\n| &&
      `     <DATATYPE>CHAR</DATATYPE>` && |\n| &&
      `    </DD05M>` && |\n| &&
      `    <DD05M>` && |\n| &&
      `     <FIELDNAME>MWAER</FIELDNAME>` && |\n| &&
      `     <FORTABLE>T000</FORTABLE>` && |\n| &&
      `     <FORKEY>MANDT</FORKEY>` && |\n| &&
      `     <CHECKTABLE>TCURC</CHECKTABLE>` && |\n| &&
      `     <CHECKFIELD>MANDT</CHECKFIELD>` && |\n| &&
      `     <PRIMPOS>0001</PRIMPOS>` && |\n| &&
      `     <DOMNAME>MANDT</DOMNAME>` && |\n| &&
      `     <DATATYPE>CLNT</DATATYPE>` && |\n| &&
      `    </DD05M>` && |\n| &&
      `    <DD05M>` && |\n| &&
      `     <FIELDNAME>MWAER</FIELDNAME>` && |\n| &&
      `     <FORTABLE>T000</FORTABLE>` && |\n| &&
      `     <FORKEY>MWAER</FORKEY>` && |\n| &&
      `     <CHECKTABLE>TCURC</CHECKTABLE>` && |\n| &&
      `     <CHECKFIELD>WAERS</CHECKFIELD>` && |\n| &&
      `     <PRIMPOS>0002</PRIMPOS>` && |\n| &&
      `     <DOMNAME>WAERS</DOMNAME>` && |\n| &&
      `     <DATATYPE>CUKY</DATATYPE>` && |\n| &&
      `    </DD05M>` && |\n| &&
      `   </DD05M_TABLE>` && |\n| &&
      `   <DD08V_TABLE>` && |\n| &&
      `    <DD08V>` && |\n| &&
      `     <FIELDNAME>LOGSYS</FIELDNAME>` && |\n| &&
      `     <CHECKTABLE>TBDLS</CHECKTABLE>` && |\n| &&
      `     <FRKART>KEY</FRKART>` && |\n| &&
      `     <CARD>1</CARD>` && |\n| &&
      `     <DDTEXT>Logical system</DDTEXT>` && |\n| &&
      `     <CARDLEFT>C</CARDLEFT>` && |\n| &&
      `    </DD08V>` && |\n| &&
      `    <DD08V>` && |\n| &&
      `     <FIELDNAME>MWAER</FIELDNAME>` && |\n| &&
      `     <CHECKTABLE>TCURC</CHECKTABLE>` && |\n| &&
      `     <FRKART>KEY</FRKART>` && |\n| &&
      `     <CARD>N</CARD>` && |\n| &&
      `     <CARDLEFT>1</CARDLEFT>` && |\n| &&
      `    </DD08V>` && |\n| &&
      `   </DD08V_TABLE>` && |\n| &&
      `   <DD35V_TALE>` && |\n| &&
      `    <DD35V>` && |\n| &&
      `     <SHLPNAME>H_T000</SHLPNAME>` && |\n| &&
      `    </DD35V>` && |\n| &&
      `   </DD35V_TALE>` && |\n| &&
      `   <DD36M>` && |\n| &&
      `    <DD36M>` && |\n| &&
      `     <SHLPNAME>H_T000</SHLPNAME>` && |\n| &&
      `     <SHLPFIELD>MANDT</SHLPFIELD>` && |\n| &&
      `     <FLPOSITION>0001</FLPOSITION>` && |\n| &&
      `     <SHTABLE>T000</SHTABLE>` && |\n| &&
      `     <SHFIELD>MANDT</SHFIELD>` && |\n| &&
      `     <SHLPINPUT>X</SHLPINPUT>` && |\n| &&
      `     <SHLPOUTPUT>X</SHLPOUTPUT>` && |\n| &&
      `     <ROLLNAME>MANDT</ROLLNAME>` && |\n| &&
      `     <DOMNAME>MANDT</DOMNAME>` && |\n| &&
      `     <DATATYPE>CLNT</DATATYPE>` && |\n| &&
      `     <LENG>000003</LENG>` && |\n| &&
      `    </DD36M>` && |\n| &&
      `    <DD36M>` && |\n| &&
      `     <SHLPNAME>H_T000</SHLPNAME>` && |\n| &&
      `     <SHLPFIELD>MTEXT</SHLPFIELD>` && |\n| &&
      `     <FLPOSITION>0002</FLPOSITION>` && |\n| &&
      `     <SHTYPE>G</SHTYPE>` && |\n| &&
      `     <SHLPOUTPUT>X</SHLPOUTPUT>` && |\n| &&
      `     <ROLLNAME>MTEXT_D</ROLLNAME>` && |\n| &&
      `     <DOMNAME>TEXT25</DOMNAME>` && |\n| &&
      `     <DATATYPE>CHAR</DATATYPE>` && |\n| &&
      `     <LENG>000025</LENG>` && |\n| &&
      `    </DD36M>` && |\n| &&
      `    <DD36M>` && |\n| &&
      `     <SHLPNAME>H_T000</SHLPNAME>` && |\n| &&
      `     <SHLPFIELD>ORT01</SHLPFIELD>` && |\n| &&
      `     <FLPOSITION>0003</FLPOSITION>` && |\n| &&
      `     <SHTYPE>G</SHTYPE>` && |\n| &&
      `     <SHLPOUTPUT>X</SHLPOUTPUT>` && |\n| &&
      `     <ROLLNAME>ORT01</ROLLNAME>` && |\n| &&
      `     <DOMNAME>TEXT25</DOMNAME>` && |\n| &&
      `     <DATATYPE>CHAR</DATATYPE>` && |\n| &&
      `     <LENG>000025</LENG>` && |\n| &&
      `    </DD36M>` && |\n| &&
      `   </DD36M>` && |\n| &&
      `   <TABL_EXTRAS>` && |\n| &&
      `    <TDDAT>` && |\n| &&
      `     <TABNAME>T000</TABNAME>` && |\n| &&
      `     <CCLASS>SS</CCLASS>` && |\n| &&
      `    </TDDAT>` && |\n| &&
      `   </TABL_EXTRAS>` && |\n| &&
      `  </asx:values>` && |\n| &&
      ` </asx:abap>` && |\n| &&
      `</abapGit>`.

* todo

  ENDMETHOD.

ENDCLASS.
