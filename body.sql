create or replace package body jsn as
 --
 -- V0.2
 --

    function val(text varchar2) return clob is -- {
    begin
        return '"' || replace(text, '"', '\"') || '"';
    end val; -- }

    function val(val number) return clob is -- {
    begin

        if val <= -1 or val >= 1 then
           return to_char(val);
        end if;

        if val < 0 then
           return '-0' || to_char(abs(val));
        else
           return '0' || to_char(     val );
        end if;

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
