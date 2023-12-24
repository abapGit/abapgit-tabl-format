CLASS zcl_tabl_format DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES: BEGIN OF ty_dd03p,
             fieldname TYPE c LENGTH 30,
             keyflag   TYPE abap_bool,
             notnull   TYPE abap_bool,
             datatype  TYPE c LENGTH 30,
             rollname  TYPE c LENGTH 30,
             leng      TYPE n LENGTH 6,
           END OF ty_dd03p.

    TYPES: BEGIN OF ty_dd05m,
             fieldname  TYPE c LENGTH 30,
             fortable   TYPE c LENGTH 30,
             forkey     TYPE c LENGTH 30,
             checktable TYPE c LENGTH 30,
             checkfield TYPE c LENGTH 30,
             primpos    TYPE n LENGTH 4,
           END OF ty_dd05m.

    TYPES: BEGIN OF ty_dd08v,
             fieldname  TYPE c LENGTH 30,
             checktable TYPE c LENGTH 30,
             ddtext     TYPE string,
             frkart     TYPE c LENGTH 10,
             card       TYPE c LENGTH 1,
             cardleft   TYPE c LENGTH 1,
           END OF ty_dd08v.

    TYPES: BEGIN OF ty_internal,
             BEGIN OF dd02v,
               tabname  TYPE c LENGTH 30,
               contflag TYPE c LENGTH 1,
               exclass  TYPE c LENGTH 1,
               mainflag TYPE c LENGTH 1,
               ddtext   TYPE string,
               tabclass TYPE string,
             END OF dd02v,
             dd03p_table TYPE STANDARD TABLE OF ty_dd03p WITH DEFAULT KEY,
             dd05m_table TYPE STANDARD TABLE OF ty_dd05m WITH DEFAULT KEY,
             dd08v_table TYPE STANDARD TABLE OF ty_dd08v WITH DEFAULT KEY,
           END OF ty_internal.

  PROTECTED SECTION.
  PRIVATE SECTION.

    METHODS serialize
      IMPORTING
        is_data TYPE ty_internal
      RETURNING
        VALUE(rv_ddl) TYPE string.

    METHODS serialize_top
      IMPORTING
        is_data TYPE ty_internal
      RETURNING
        VALUE(rv_ddl) TYPE string.

    METHODS serialize_field_annotations
      IMPORTING
        iv_fieldname  TYPE clike
        is_data       TYPE ty_internal
      RETURNING
        VALUE(rv_ddl) TYPE string.

    METHODS serialize_field_foreign_key
      IMPORTING
        iv_fieldname  TYPE clike
        is_data       TYPE ty_internal
      RETURNING
        VALUE(rv_ddl) TYPE string.

    METHODS deserialize .

    METHODS serialize_type
      IMPORTING is_dd03p TYPE ty_dd03p
      RETURNING VALUE(rv_type) TYPE string.
ENDCLASS.



CLASS zcl_tabl_format IMPLEMENTATION.


  METHOD deserialize.

* CL_DDL_PARSER, CL_SBD_STRUCTURE_OBJDATA serializer in local class?
" NEW cl_sbd_structure_persist( )->get_source(
"   EXPORTING
"     i_object_key = 'ZABAPGIT'
"   IMPORTING
"     e_source = DATA(sdf) ).

* todo

  ENDMETHOD.

  METHOD serialize_top.

* todo, escaping?
    rv_ddl = rv_ddl && |@EndUserText.label : '{ is_data-dd02v-ddtext }'\n|.

    CASE is_data-dd02v-exclass.
      WHEN '1'.
        rv_ddl = rv_ddl && |@AbapCatalog.enhancementCategory : #NOT_EXTENSIBLE\n|.
      WHEN OTHERS.
        ASSERT 1 = 'todo'.
    ENDCASE.

    CASE is_data-dd02v-tabclass.
      WHEN 'TRANSP'.
        rv_ddl = rv_ddl && |@AbapCatalog.tableCategory : #TRANSPARENT\n|.
      WHEN OTHERS.
        ASSERT 1 = 'todo'.
    ENDCASE.

    rv_ddl = rv_ddl && |@AbapCatalog.deliveryClass : #{ is_data-dd02v-contflag }\n|.

    IF is_data-dd02v-mainflag = abap_true.
      rv_ddl = rv_ddl && |@AbapCatalog.dataMaintenance : #ALLOWED\n|.
    ELSE.
      rv_ddl = rv_ddl && |@AbapCatalog.dataMaintenance : #LIMITED\n|.
    ENDIF.

  ENDMETHOD.

  METHOD serialize_field_annotations.

    DATA ls_dd08v LIKE LINE OF is_data-dd08v_table.

    READ TABLE is_data-dd08v_table INTO ls_dd08v WITH KEY fieldname = iv_fieldname.
    IF sy-subrc <> 0.
      RETURN.
    ENDIF.

    IF ls_dd08v-ddtext IS NOT INITIAL.
* todo, escaping?
      rv_ddl = rv_ddl && |  @AbapCatalog.foreignKey.label : '{ ls_dd08v-ddtext }'\n|.
    ENDIF.

    rv_ddl = rv_ddl && |  @AbapCatalog.foreignKey.keyType : #{ ls_dd08v-frkart }\n|.

    rv_ddl = rv_ddl && |  @AbapCatalog.foreignKey.screenCheck : true\n|.

  ENDMETHOD.

  METHOD serialize_field_foreign_key.

    DATA ls_dd08v LIKE LINE OF is_data-dd08v_table.
    DATA ls_dd05m LIKE LINE OF is_data-dd05m_table.
    DATA lv_pre TYPE string.
    DATA lv_cardinality TYPE string.

    READ TABLE is_data-dd08v_table INTO ls_dd08v WITH KEY fieldname = iv_fieldname.
    IF sy-subrc <> 0.
      RETURN.
    ENDIF.

    IF ls_dd08v-cardleft = 'C' AND ls_dd08v-card = '1'.
      lv_cardinality = |[1,0..1]|.
    ELSEIF ls_dd08v-cardleft = '1' AND ls_dd08v-card = 'N'.
      lv_cardinality = |[1..*,1]|.
    ELSE.
      ASSERT 1 = 'todo'.
    ENDIF.

    rv_ddl = rv_ddl && |\n    with foreign key { lv_cardinality } { to_lower( ls_dd08v-checktable) }|.

* assumption: dd05m table is sorted by PRIMPOS ascending
    LOOP AT is_data-dd05m_table INTO ls_dd05m WHERE fieldname = iv_fieldname.
      IF lv_pre IS INITIAL.
        lv_pre = |\n      where |.
      ELSE.
        lv_pre = |\n        and |.
      ENDIF.
      rv_ddl = rv_ddl && |{ lv_pre }{ to_lower( ls_dd05m-checkfield ) } = { to_lower( ls_dd05m-fortable ) }.{ to_lower( ls_dd05m-forkey ) }|.
    ENDLOOP.

  ENDMETHOD.

  METHOD serialize.

    DATA ls_dd03p LIKE LINE OF is_data-dd03p_table.
    DATA lv_key   TYPE string.
    DATA lv_type  TYPE string.
    DATA lv_pre   TYPE string.
    DATA lv_int   TYPE i.
    DATA lv_colon TYPE i.


    rv_ddl = rv_ddl && serialize_top( is_data ).

    rv_ddl = rv_ddl && |define table { to_lower( is_data-dd02v-tabname ) } \{\n|.

    LOOP AT is_data-dd03p_table INTO ls_dd03p.
      lv_int = 0.
      IF ls_dd03p-keyflag = abap_true.
        lv_int = 4.
      ENDIF.
      lv_int = lv_int + strlen( ls_dd03p-fieldname ).
      IF lv_int > lv_colon.
        lv_colon = lv_int.
      ENDIF.
    ENDLOOP.

    LOOP AT is_data-dd03p_table INTO ls_dd03p.
      CLEAR lv_key.
      IF ls_dd03p-keyflag = abap_true.
        lv_key = |key |.
      ENDIF.

      rv_ddl = rv_ddl && serialize_field_annotations(
        iv_fieldname = ls_dd03p-fieldname
        is_data      = is_data ).

      lv_type = serialize_type( ls_dd03p ).

      lv_pre = |{ lv_key }{ to_lower( ls_dd03p-fieldname ) }|.
      IF strlen( lv_pre ) < lv_colon.
        lv_pre = lv_pre && repeat( val = | | occ = lv_colon - strlen( lv_pre ) ).
      ENDIF.
      rv_ddl = rv_ddl && |  { lv_pre } : { lv_type }|.
      rv_ddl = rv_ddl && serialize_field_foreign_key(
        iv_fieldname = ls_dd03p-fieldname
        is_data      = is_data ).
      rv_ddl = rv_ddl && |;\n|.
    ENDLOOP.
    rv_ddl = rv_ddl && |\n|.

    rv_ddl = rv_ddl && |\}|.

  ENDMETHOD.

  METHOD serialize_type.

    DATA lv_notnull TYPE string.
    DATA lv_int TYPE i.

    IF is_dd03p-notnull = abap_true.
      lv_notnull = | not null| .
    ENDIF.

    IF is_dd03p-rollname IS NOT INITIAL.
      rv_type = |{ to_lower( is_dd03p-rollname ) }{ lv_notnull }|.
    ELSE.
      lv_int = is_dd03p-leng.
      CASE is_dd03p-datatype.
        WHEN 'STRG'.
          rv_type = |abap.string(0)|.
        WHEN OTHERS.
          rv_type = |abap.{ to_lower( is_dd03p-datatype ) }({ lv_int }){ lv_notnull }|.
      ENDCASE.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
