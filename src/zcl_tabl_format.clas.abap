CLASS zcl_tabl_format DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  PROTECTED SECTION.
  PRIVATE SECTION.

    METHODS serialize
      IMPORTING
        is_data TYPE zif_abapgit_object_tabl=>ty_internal.

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
