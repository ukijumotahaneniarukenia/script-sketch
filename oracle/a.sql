set SERVEROUTPUT ON;
--https://odieweblog.wordpress.com/2018/03/24/reading-large-xml-node-values-using-the-dom-api/

declare
  xmldoc   xmltype;
  domdoc   dbms_xmldom.DOMDocument;
  node     dbms_xmldom.DOMNode;
  istream  utl_characterinputstream;
  tmp      varchar2(32767);
  nread    integer := 32767;
  output   clob;
  
begin
  
  select xmlelement("test", rpad(to_clob('X'),131072,'X'))
  into xmldoc
  from dual;
  
  domdoc := dbms_xmldom.newDOMDocument(xmldoc);
  node := dbms_xslprocessor.selectSingleNode(dbms_xmldom.makenode(domdoc), '/test/text()');
  
  dbms_lob.createtemporary(output, true);
  
  istream := dbms_xmldom.getNodeValueAsCharacterStream(node);
  
  loop
    istream.read(tmp, nread);
    exit when nread = 0;
    dbms_lob.writeappend(output, nread, tmp);
  end loop;
  
  istream.close();
  
  dbms_output.put_line('output size = '||dbms_lob.getlength(output));
  
  dbms_lob.freetemporary(output);
  dbms_xmldom.freeDocument(domdoc);
  
end;  
/

--https://stackoverflow.com/questions/47189798/how-to-use-dbms-xmldom-in-oracle-plsql-in-order-to-get-a-good-function-performan

