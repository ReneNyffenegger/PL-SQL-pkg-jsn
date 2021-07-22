create or replace package body jsn as
 --
 -- V0.1 
 --

    function val(text varchar2) return clob is -- {
    begin
        return '"' || replace(text, '"', '\"') || '"';
    end val; -- }

    function val(val number) return clob is -- {
    begin
        return to_char(val);
    end val; -- }

    function name_value(name varchar2, value varchar2) return clob is
    begin
         return '"' || name || '": "' || value || '"';
    end name_value;

    function name_value(name varchar2, value clob) return clob is
    begin
         return '"' || name || '": "< CLOB > "';
    end name_value;

    function name_value(name varchar2, value date) return clob is
    begin
         return name_value(name, tim.iso_8601(value));
    end name_value;

    function name_value(name varchar2, value boolean) return clob is -- {
    begin

         if value then
            return val(name) || ': true';
         end if;

         if not value then
            return val(name) || ': false';
         end if;

         return val(name) || ': null';

    end name_value; -- }

    function name_value(name number, value varchar2) return clob is -- {
    begin
         return '"' || name || '": "' || value || '"';
    end name_value; -- }

end jsn;
/

show errors
