CLASS zcl_tabl_format DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES: BEGIN OF ty_internal,
             BEGIN OF dd02v,
               contflag TYPE c LENGTH 1,
             END OF dd02v,
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


  ENDMETHOD.
ENDCLASS.
