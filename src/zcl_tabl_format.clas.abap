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
             leng      TYPE n LENGTH 6,
           END OF ty_dd03p.

    TYPES: BEGIN OF ty_internal,
             BEGIN OF dd02v,
               tabname  TYPE c LENGTH 30,
               contflag TYPE c LENGTH 1,
               exclass  TYPE c LENGTH 1,
               ddtext   TYPE string,
               tabclass TYPE string,
             END OF dd02v,
             dd03p_table TYPE STANDARD TABLE OF ty_dd03p WITH DEFAULT KEY,
           END OF ty_internal.

  PROTECTED SECTION.
  PRIVATE SECTION.

    METHODS serialize
      IMPORTING
        is_data TYPE ty_internal
      RETURNING
        VALUE(rv_ddl) TYPE string.

    METHODS deserialize .
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


  METHOD serialize.

    DATA ls_dd03p   LIKE LINE OF is_data-dd03p_table.
    DATA lv_key     TYPE string.
    DATA lv_type    TYPE string.
    DATA lv_notnull TYPE string.
    DATA lv_pre     TYPE string.
    DATA lv_int     TYPE i.
    DATA lv_colon   TYPE i.

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

* todo, which field is this?
    rv_ddl = rv_ddl && |@AbapCatalog.dataMaintenance : #LIMITED\n|.

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

      CLEAR lv_notnull.
      IF ls_dd03p-notnull = abap_true.
        lv_notnull = | not null| .
      ENDIF.

      CLEAR lv_type.
      lv_int = ls_dd03p-leng.
      lv_type = |abap.{ to_lower( ls_dd03p-datatype ) }({ lv_int })|.

      lv_pre = |{ lv_key }{ to_lower( ls_dd03p-fieldname ) }|.
      IF strlen( lv_pre ) < lv_colon.
        lv_pre = lv_pre && repeat( val = | | occ = lv_colon - strlen( lv_pre ) ).
      ENDIF.
      rv_ddl = rv_ddl && |  { lv_pre } : { lv_type }{ lv_notnull };\n|.
    ENDLOOP.
    rv_ddl = rv_ddl && |\n|.

    rv_ddl = rv_ddl && |\}|.

  ENDMETHOD.
ENDCLASS.
