--https://whtiecloud.hatenadiary.org/entry/20061205/1165298449
--https://grantm.github.io/perl-libxml-by-example/_static/xpath-sandbox/xpath-sandbox.html?q=/%2A
create table test_tbl (
  id        raw(16)
  ,data      XMLTYPE
);  

declare
xmldoc clob;
begin
xmldoc := '<?xml version="1.0"?>
  <playlist>
  <movie id="tt0112384">
    <title>Apollo 13</title>
    <director>Ron Howard</director>
    <release-date>1995-06-30</release-date>
    <mpaa-rating>PG</mpaa-rating>
    <running-time>140</running-time>
    <genre>adventure</genre>
    <genre>drama</genre>
    <cast>
      <person name="Tom Hanks" role="Jim Lovell"></person>
      <person name="Bill Paxton" role="Fred Haise"></person>
      <person name="Kevin Bacon" role="Jack Swigert"></person>
      <person name="Gary Sinise" role="Ken Mattingly"></person>
      <person name="Ed Harris" role="Gene Kranz"></person>
    </cast>
    <imdb-info url="http://www.imdb.com/title/tt0112384/">
      <synopsis>
        NASA must devise a strategy to return Apollo 13 to Earth safely
        after the spacecraft undergoes massive internal damage putting
        the lives of the three astronauts on board in jeopardy.
      </synopsis>
      <score>7.6</score>
    </imdb-info>
  </movie>
  <movie id="tt0307479">
    <title>Solaris</title>
    <director>Steven Soderbergh</director>
    <release-date>2002-11-27</release-date>
    <mpaa-rating>PG-13</mpaa-rating>
    <running-time>99</running-time>
    <genre>drama</genre>
    <genre>mystery</genre>
    <genre>romance</genre>
    <cast>
      <person name="George Clooney" role="Chris Kelvin"></person>
      <person name="Natascha McElhone" role="Rheya"></person>
      <person name="Ulrich Tukur" role="Gibarian"></person>
    </cast>
    <imdb-info url="http://www.imdb.com/title/tt0307479/">
      <synopsis>
        A troubled psychologist is sent to investigate the crew of an
        isolated research station orbiting a bizarre planet.
      </synopsis>
      <score>6.2</score>
    </imdb-info>
  </movie>
  <movie id="tt1731141">
    <title>Ender''s Game</title>
    <director>Gavin Hood</director>
    <release-date>2013-11-01</release-date>
    <mpaa-rating>PG-13</mpaa-rating>
    <running-time>114</running-time>
    <genre>action</genre>
    <genre>scifi</genre>
    <cast>
      <person name="Asa Butterfield" role="Ender Wiggin"></person>
      <person name="Harrison Ford" role="Colonel Graff"></person>
      <person name="Hailee Steinfeld" role="Petra Arkanian"></person>
    </cast>
    <imdb-info url="http://www.imdb.com/title/tt1731141/">
      <synopsis>
        Young Ender Wiggin is recruited by the International Military
        to lead the fight against the Formics, a genocidal alien race
        which nearly annihilated the human race in a previous invasion.
      </synopsis>
      <score>6.7</score>
    </imdb-info>
  </movie>
  <movie id="tt0816692">
    <title>Interstellar</title>
    <director>Christopher Nolan</director>
    <release-date>2014-11-07</release-date>
    <mpaa-rating>PG-13</mpaa-rating>
    <running-time>169</running-time>
    <genre>adventure</genre>
    <genre>drama</genre>
    <genre>scifi</genre>
    <cast>
      <person name="Matthew McConaughey" role="Cooper"></person>
      <person name="Anne Hathaway" role="Brand"></person>
      <person name="Jessica Chastain" role="Murph"></person>
      <person name="Michael Caine" role="Professor Brand"></person>
    </cast>
    <imdb-info url="http://www.imdb.com/title/tt0816692/">
      <synopsis>
        A team of explorers travel through a wormhole in space in an
        attempt to ensure humanity''s survival.
      </synopsis>
      <score>8.6</score>
    </imdb-info>
  </movie>
  <movie id="tt3659388">
    <title>The Martian</title>
    <director>Ridley Scott</director>
    <release-date>2015-10-02</release-date>
    <mpaa-rating>PG-13</mpaa-rating>
    <running-time>144</running-time>
    <genre>adventure</genre>
    <genre>drama</genre>
    <genre>scifi</genre>
    <cast>
      <person name="Matt Damon" role="Mark Watney"></person>
      <person name="Jessica Chastain" role="Melissa Lewis"></person>
      <person name="Kristen Wiig" role="Annie Montrose"></person>
    </cast>
    <imdb-info url="http://www.imdb.com/title/tt3659388/">
      <synopsis>
        During a manned mission to Mars, Astronaut Mark Watney is
        presumed dead after a fierce storm and left behind by his crew.
        But Watney has survived and finds himself stranded and alone on
        the hostile planet. With only meager supplies, he must draw upon
        his ingenuity, wit and spirit to subsist and find a way to
        signal to Earth that he is alive.
      </synopsis>
      <score>8.1</score>
    </imdb-info>
  </movie>
</playlist>';
insert into test_tbl values (sys_guid(),xmltype(xmldoc));
commit;
end;
/

select e.id,e.data,e.data.getclobval() from test_tbl e;


desc test_tbl;

--//https://stackoverflow.com/questions/743031/retrieve-value-of-an-xml-element-in-oracle-pl-sql/743420

--koreii
--http://niwanos.hatenablog.com/entries/2010/08/05

--https://docs.oracle.com/cd/E16338_01/appdev.112/b70200/toc.htm
--https://docs.oracle.com/cd/E16338_01/appdev.112/b70200/xdb04cre.htm#i1024803
create or replace function get_node_list(list_name varchar2,xmldoc dbms_xmldom.domdocument)
return dbms_xmldom.domnodelist
as
rt dbms_xmldom.domnodelist;
begin
    rt := dbms_xmldom.getelementsbytagname(xmldoc, list_name);
    return rt;
end;
/

SELECT *
  FROM test_tbl e
  WHERE XMLExists('/playlist'
                  PASSING e.data);

SELECT *
  FROM test_tbl e
  WHERE XMLExists('/playlist/movie'
                  PASSING e.data);

--https://docs.oracle.com/cd/B19306_01/appdev.102/b14258/d_xmldom.htm#i1122230
--http://niwanos.hatenablog.com/entry/2018/11/16/225440
select
    e.*
    ,DBMS_XMLDOM.NEWDOMDOCUMENT(e.data)
from
    test_tbl e;

create table unko as
select dbms_xmlgen.getxml('select * from dual') as tt from dual; 

desc unko;

select comp_name from dba_registry where comp_name like '%XML%'; 


--https://www.oracle.com/technical-resources/articles/quinlan-xml.html
