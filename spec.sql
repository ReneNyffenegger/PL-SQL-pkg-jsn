create or replace package jsn as
 --
 -- V0.1
 --

    function val(text varchar2) return clob;

    function val(val number) return clob;

    function name_value(name varchar2, value varchar2) return clob;

    function name_value(name varchar2, value clob) return clob;

    function name_value(name varchar2, value date) return clob;

    function name_value(name varchar2, value boolean) return clob;

    function name_value(name number, value varchar2) return clob;

end jsn;
/
