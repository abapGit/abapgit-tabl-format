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
* todo, fields
    rv_ddl = rv_ddl && |define table zabapgit \{\n|.
    rv_ddl = rv_ddl && |\}\n|.

  ENDMETHOD.
ENDCLASS.
