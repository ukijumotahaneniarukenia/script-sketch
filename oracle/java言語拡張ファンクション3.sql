--https://docs.oracle.com/cd/F19136_01/jjdev/stored-procedures-runtime-contexts.html#GUID-3FD56429-9F6C-4323-B175-FCD484C367A5

create or replace and resolve java source named Mock
as
import java.text.Normalizer;
public class Mock{
    public static String nomaz(String s){
        return Normalizer.normalize(s,Normalizer.Form.NFKC);
    }
}
/

--data type mapping
--https://docs.oracle.com/cd/F19136_01/jjdev/defining-call-specifications.html#GUID-698850EA-53C0-42C3-84A3-9A590BB15123
create or replace function nomaz(s varchar2)
return varchar2
as
    language java
    name 'Mock.nomaz(java.lang.String) return java.lang.String';
/


create table test_tbl as
with sub as(
select
    level as dec
    ,base(level,16) as unicode
from dual
where level>=XXX2dec('FF01',16)
connect by level<=XXX2dec('FF94',16)
)select s2.grp,s2.unicode,dec4utf8(s2.utf8) as pre--,nomaz(dec4utf8(s2.utf8)) as post
from sub s1,table(unicode2utf8(s1.unicode)) s2
;

with sub as(
    select
        grp
        ,row_number()over(partition by ceil(rownum/101) order by rownum) as subgrp
        ,unicode
        ,pre
        ,nomaz(pre) as post
    from test_tbl
)select * from sub where subgrp<=5;

drop table test_tbl purge;
create table test_tbl (
    grp       number
    , unicode   varchar2(4000 byte)
    , pre       varchar2(4000 byte)
);
set define off;
insert into test_tbl (grp,unicode,pre) values (1,'FF01','！');
insert into test_tbl (grp,unicode,pre) values (1,'FF02','＂');
insert into test_tbl (grp,unicode,pre) values (1,'FF03','＃');
insert into test_tbl (grp,unicode,pre) values (1,'FF04','＄');
insert into test_tbl (grp,unicode,pre) values (1,'FF05','％');
insert into test_tbl (grp,unicode,pre) values (1,'FF06','＆');
insert into test_tbl (grp,unicode,pre) values (1,'FF07','＇');
insert into test_tbl (grp,unicode,pre) values (1,'FF08','（');
insert into test_tbl (grp,unicode,pre) values (1,'FF09','）');
insert into test_tbl (grp,unicode,pre) values (1,'FF0A','＊');
insert into test_tbl (grp,unicode,pre) values (1,'FF0B','＋');
insert into test_tbl (grp,unicode,pre) values (1,'FF0C','，');
insert into test_tbl (grp,unicode,pre) values (1,'FF0D','－');
insert into test_tbl (grp,unicode,pre) values (1,'FF0E','．');
insert into test_tbl (grp,unicode,pre) values (1,'FF0F','／');
insert into test_tbl (grp,unicode,pre) values (1,'FF10','０');
insert into test_tbl (grp,unicode,pre) values (1,'FF11','１');
insert into test_tbl (grp,unicode,pre) values (1,'FF12','２');
insert into test_tbl (grp,unicode,pre) values (1,'FF13','３');
insert into test_tbl (grp,unicode,pre) values (1,'FF14','４');
insert into test_tbl (grp,unicode,pre) values (1,'FF15','５');
insert into test_tbl (grp,unicode,pre) values (1,'FF16','６');
insert into test_tbl (grp,unicode,pre) values (1,'FF17','７');
insert into test_tbl (grp,unicode,pre) values (1,'FF18','８');
insert into test_tbl (grp,unicode,pre) values (1,'FF19','９');
insert into test_tbl (grp,unicode,pre) values (1,'FF1A','：');
insert into test_tbl (grp,unicode,pre) values (1,'FF1B','；');
insert into test_tbl (grp,unicode,pre) values (1,'FF1C','＜');
insert into test_tbl (grp,unicode,pre) values (1,'FF1D','＝');
insert into test_tbl (grp,unicode,pre) values (1,'FF1E','＞');
insert into test_tbl (grp,unicode,pre) values (1,'FF1F','？');
insert into test_tbl (grp,unicode,pre) values (1,'FF20','＠');
insert into test_tbl (grp,unicode,pre) values (1,'FF21','Ａ');
insert into test_tbl (grp,unicode,pre) values (1,'FF22','Ｂ');
insert into test_tbl (grp,unicode,pre) values (1,'FF23','Ｃ');
insert into test_tbl (grp,unicode,pre) values (1,'FF24','Ｄ');
insert into test_tbl (grp,unicode,pre) values (1,'FF25','Ｅ');
insert into test_tbl (grp,unicode,pre) values (1,'FF26','Ｆ');
insert into test_tbl (grp,unicode,pre) values (1,'FF27','Ｇ');
insert into test_tbl (grp,unicode,pre) values (1,'FF28','Ｈ');
insert into test_tbl (grp,unicode,pre) values (1,'FF29','Ｉ');
insert into test_tbl (grp,unicode,pre) values (1,'FF2A','Ｊ');
insert into test_tbl (grp,unicode,pre) values (1,'FF2B','Ｋ');
insert into test_tbl (grp,unicode,pre) values (1,'FF2C','Ｌ');
insert into test_tbl (grp,unicode,pre) values (1,'FF2D','Ｍ');
insert into test_tbl (grp,unicode,pre) values (1,'FF2E','Ｎ');
insert into test_tbl (grp,unicode,pre) values (1,'FF2F','Ｏ');
insert into test_tbl (grp,unicode,pre) values (1,'FF30','Ｐ');
insert into test_tbl (grp,unicode,pre) values (1,'FF31','Ｑ');
insert into test_tbl (grp,unicode,pre) values (1,'FF32','Ｒ');
insert into test_tbl (grp,unicode,pre) values (1,'FF33','Ｓ');
insert into test_tbl (grp,unicode,pre) values (1,'FF34','Ｔ');
insert into test_tbl (grp,unicode,pre) values (1,'FF35','Ｕ');
insert into test_tbl (grp,unicode,pre) values (1,'FF36','Ｖ');
insert into test_tbl (grp,unicode,pre) values (1,'FF37','Ｗ');
insert into test_tbl (grp,unicode,pre) values (1,'FF38','Ｘ');
insert into test_tbl (grp,unicode,pre) values (1,'FF39','Ｙ');
insert into test_tbl (grp,unicode,pre) values (1,'FF3A','Ｚ');
insert into test_tbl (grp,unicode,pre) values (1,'FF3B','［');
insert into test_tbl (grp,unicode,pre) values (1,'FF3C','＼');
insert into test_tbl (grp,unicode,pre) values (1,'FF3D','］');
insert into test_tbl (grp,unicode,pre) values (1,'FF3E','＾');
insert into test_tbl (grp,unicode,pre) values (1,'FF3F','＿');
insert into test_tbl (grp,unicode,pre) values (1,'FF40','｀');
insert into test_tbl (grp,unicode,pre) values (1,'FF41','ａ');
insert into test_tbl (grp,unicode,pre) values (1,'FF42','ｂ');
insert into test_tbl (grp,unicode,pre) values (1,'FF43','ｃ');
insert into test_tbl (grp,unicode,pre) values (1,'FF44','ｄ');
insert into test_tbl (grp,unicode,pre) values (1,'FF45','ｅ');
insert into test_tbl (grp,unicode,pre) values (1,'FF46','ｆ');
insert into test_tbl (grp,unicode,pre) values (1,'FF47','ｇ');
insert into test_tbl (grp,unicode,pre) values (1,'FF48','ｈ');
insert into test_tbl (grp,unicode,pre) values (1,'FF49','ｉ');
insert into test_tbl (grp,unicode,pre) values (1,'FF4A','ｊ');
insert into test_tbl (grp,unicode,pre) values (1,'FF4B','ｋ');
insert into test_tbl (grp,unicode,pre) values (1,'FF4C','ｌ');
insert into test_tbl (grp,unicode,pre) values (1,'FF4D','ｍ');
insert into test_tbl (grp,unicode,pre) values (1,'FF4E','ｎ');
insert into test_tbl (grp,unicode,pre) values (1,'FF4F','ｏ');
insert into test_tbl (grp,unicode,pre) values (1,'FF50','ｐ');
insert into test_tbl (grp,unicode,pre) values (1,'FF51','ｑ');
insert into test_tbl (grp,unicode,pre) values (1,'FF52','ｒ');
insert into test_tbl (grp,unicode,pre) values (1,'FF53','ｓ');
insert into test_tbl (grp,unicode,pre) values (1,'FF54','ｔ');
insert into test_tbl (grp,unicode,pre) values (1,'FF55','ｕ');
insert into test_tbl (grp,unicode,pre) values (1,'FF56','ｖ');
insert into test_tbl (grp,unicode,pre) values (1,'FF57','ｗ');
insert into test_tbl (grp,unicode,pre) values (1,'FF58','ｘ');
insert into test_tbl (grp,unicode,pre) values (1,'FF59','ｙ');
insert into test_tbl (grp,unicode,pre) values (1,'FF5A','ｚ');
insert into test_tbl (grp,unicode,pre) values (1,'FF5B','｛');
insert into test_tbl (grp,unicode,pre) values (1,'FF5C','｜');
insert into test_tbl (grp,unicode,pre) values (1,'FF5D','｝');
insert into test_tbl (grp,unicode,pre) values (1,'FF5E','～');
insert into test_tbl (grp,unicode,pre) values (1,'FF5F','｟');
insert into test_tbl (grp,unicode,pre) values (1,'FF60','｠');
insert into test_tbl (grp,unicode,pre) values (1,'FF61','｡');
insert into test_tbl (grp,unicode,pre) values (1,'FF62','｢');
insert into test_tbl (grp,unicode,pre) values (1,'FF63','｣');
insert into test_tbl (grp,unicode,pre) values (1,'FF64','､');
insert into test_tbl (grp,unicode,pre) values (1,'FF65','･');
insert into test_tbl (grp,unicode,pre) values (1,'FF66','ｦ');
insert into test_tbl (grp,unicode,pre) values (1,'FF67','ｧ');
insert into test_tbl (grp,unicode,pre) values (1,'FF68','ｨ');
insert into test_tbl (grp,unicode,pre) values (1,'FF69','ｩ');
insert into test_tbl (grp,unicode,pre) values (1,'FF6A','ｪ');
insert into test_tbl (grp,unicode,pre) values (1,'FF6B','ｫ');
insert into test_tbl (grp,unicode,pre) values (1,'FF6C','ｬ');
insert into test_tbl (grp,unicode,pre) values (1,'FF6D','ｭ');
insert into test_tbl (grp,unicode,pre) values (1,'FF6E','ｮ');
insert into test_tbl (grp,unicode,pre) values (1,'FF6F','ｯ');
insert into test_tbl (grp,unicode,pre) values (1,'FF70','ｰ');
insert into test_tbl (grp,unicode,pre) values (1,'FF71','ｱ');
insert into test_tbl (grp,unicode,pre) values (1,'FF72','ｲ');
insert into test_tbl (grp,unicode,pre) values (1,'FF73','ｳ');
insert into test_tbl (grp,unicode,pre) values (1,'FF74','ｴ');
insert into test_tbl (grp,unicode,pre) values (1,'FF75','ｵ');
insert into test_tbl (grp,unicode,pre) values (1,'FF76','ｶ');
insert into test_tbl (grp,unicode,pre) values (1,'FF77','ｷ');
insert into test_tbl (grp,unicode,pre) values (1,'FF78','ｸ');
insert into test_tbl (grp,unicode,pre) values (1,'FF79','ｹ');
insert into test_tbl (grp,unicode,pre) values (1,'FF7A','ｺ');
insert into test_tbl (grp,unicode,pre) values (1,'FF7B','ｻ');
insert into test_tbl (grp,unicode,pre) values (1,'FF7C','ｼ');
insert into test_tbl (grp,unicode,pre) values (1,'FF7D','ｽ');
insert into test_tbl (grp,unicode,pre) values (1,'FF7E','ｾ');
insert into test_tbl (grp,unicode,pre) values (1,'FF7F','ｿ');
insert into test_tbl (grp,unicode,pre) values (1,'FF80','ﾀ');
insert into test_tbl (grp,unicode,pre) values (1,'FF81','ﾁ');
insert into test_tbl (grp,unicode,pre) values (1,'FF82','ﾂ');
insert into test_tbl (grp,unicode,pre) values (1,'FF83','ﾃ');
insert into test_tbl (grp,unicode,pre) values (1,'FF84','ﾄ');
insert into test_tbl (grp,unicode,pre) values (1,'FF85','ﾅ');
insert into test_tbl (grp,unicode,pre) values (1,'FF86','ﾆ');
insert into test_tbl (grp,unicode,pre) values (1,'FF87','ﾇ');
insert into test_tbl (grp,unicode,pre) values (1,'FF88','ﾈ');
insert into test_tbl (grp,unicode,pre) values (1,'FF89','ﾉ');
insert into test_tbl (grp,unicode,pre) values (1,'FF8A','ﾊ');
insert into test_tbl (grp,unicode,pre) values (1,'FF8B','ﾋ');
insert into test_tbl (grp,unicode,pre) values (1,'FF8C','ﾌ');
insert into test_tbl (grp,unicode,pre) values (1,'FF8D','ﾍ');
insert into test_tbl (grp,unicode,pre) values (1,'FF8E','ﾎ');
insert into test_tbl (grp,unicode,pre) values (1,'FF8F','ﾏ');
insert into test_tbl (grp,unicode,pre) values (1,'FF90','ﾐ');
insert into test_tbl (grp,unicode,pre) values (1,'FF91','ﾑ');
insert into test_tbl (grp,unicode,pre) values (1,'FF92','ﾒ');
insert into test_tbl (grp,unicode,pre) values (1,'FF93','ﾓ');
insert into test_tbl (grp,unicode,pre) values (1,'FF94','ﾔ');
commit;