
- https://techblog.zozo.com/entry/xpath

```
kuraine@263a008ecb6d ~/script-sketch/nodejs$./00001-XPATH取得-getXpath-DONE-gx.js im | tail -n1 | sh | sed 's;/root;;' | sed -n '2,$p' | xargs -I@ echo xmllint --xpath @ test.xml
xmllint --xpath /agents test.xml
xmllint --xpath /agents/agent test.xml
xmllint --xpath /agents/agent[0] test.xml
xmllint --xpath /agents/agent[0]/age test.xml
xmllint --xpath /agents/agent[0]/id test.xml
xmllint --xpath /agents/agent[0]/name test.xml
xmllint --xpath /agents/agent[0]/name[0] test.xml
xmllint --xpath /agents/agent[0]/name[0]/$t test.xml
xmllint --xpath /agents/agent[0]/name[0]/type test.xml
xmllint --xpath /agents/agent[0]/name[1] test.xml
xmllint --xpath /agents/agent[0]/name[1]/$t test.xml
xmllint --xpath /agents/agent[0]/name[1]/type test.xml
xmllint --xpath /agents/agent[0]/sex test.xml
xmllint --xpath /agents/agent[1] test.xml
xmllint --xpath /agents/agent[1]/age test.xml
xmllint --xpath /agents/agent[1]/id test.xml
xmllint --xpath /agents/agent[1]/name test.xml
xmllint --xpath /agents/agent[1]/name[0] test.xml
xmllint --xpath /agents/agent[1]/name[0]/$t test.xml
xmllint --xpath /agents/agent[1]/name[0]/type test.xml
xmllint --xpath /agents/agent[1]/name[1] test.xml
xmllint --xpath /agents/agent[1]/name[1]/$t test.xml
xmllint --xpath /agents/agent[1]/name[1]/type test.xml
xmllint --xpath /agents/agent[1]/sex test.xml
```

```
kuraine@263a008ecb6d ~/script-sketch/nodejs$cat test.xml | ./00001-XPATH取得-getXpath-DONE-gx.js | jq 'fromjson' | gron
json = {};
json.agents = {};
json.agents.agent = [];
json.agents.agent[0] = {};
json.agents.agent[0].age = "Still attractive";
json.agents.agent[0].id = "007";
json.agents.agent[0].name = [];
json.agents.agent[0].name[0] = {};
json.agents.agent[0].name[0].$t = "James";
json.agents.agent[0].name[0].type = "first";
json.agents.agent[0].name[1] = {};
json.agents.agent[0].name[1].$t = "Bond";
json.agents.agent[0].name[1].type = "last";
json.agents.agent[0].sex = "Male";
json.agents.agent[1] = {};
json.agents.agent[1].age = "Depends on your timeline";
json.agents.agent[1].id = "013";
json.agents.agent[1].name = [];
json.agents.agent[1].name[0] = {};
json.agents.agent[1].name[0].$t = "Austin";
json.agents.agent[1].name[0].type = "first";
json.agents.agent[1].name[1] = {};
json.agents.agent[1].name[1].$t = "Powers";
json.agents.agent[1].name[1].type = "last";
json.agents.agent[1].sex = "Yes, please";
kuraine@263a008ecb6d ~/script-sketch/nodejs$cat test.xml | xmllint --pretty 1 -
<?xml version="1.0"?>
<agents>
  <agent id="007">
    <name type="first">James</name>
    <name type="last">Bond</name>
    <age>Still attractive</age>
    <sex>Male</sex>
  </agent>
  <agent id="013">
    <name type="first">Austin</name>
    <name type="last">Powers</name>
    <age>Depends on your timeline</age>
    <sex>Yes, please</sex>
  </agent>
</agents>
kuraine@263a008ecb6d ~/script-sketch/nodejs$./00001-XPATH取得-getXpath-DONE-gx.js im | tail -n1 | sh | sed 's;/root;;' | sed -n '2,$p' | xargs -I@ echo xmllint --xpath @ test.xml
xmllint --xpath /agents test.xml
xmllint --xpath /agents/agent test.xml
xmllint --xpath /agents/agent[0] test.xml
xmllint --xpath /agents/agent[0]/age test.xml
xmllint --xpath /agents/agent[0]/id test.xml
xmllint --xpath /agents/agent[0]/name test.xml
xmllint --xpath /agents/agent[0]/name[0] test.xml
xmllint --xpath /agents/agent[0]/name[0]/$t test.xml
xmllint --xpath /agents/agent[0]/name[0]/type test.xml
xmllint --xpath /agents/agent[0]/name[1] test.xml
xmllint --xpath /agents/agent[0]/name[1]/$t test.xml
xmllint --xpath /agents/agent[0]/name[1]/type test.xml
xmllint --xpath /agents/agent[0]/sex test.xml
xmllint --xpath /agents/agent[1] test.xml
xmllint --xpath /agents/agent[1]/age test.xml
xmllint --xpath /agents/agent[1]/id test.xml
xmllint --xpath /agents/agent[1]/name test.xml
xmllint --xpath /agents/agent[1]/name[0] test.xml
xmllint --xpath /agents/agent[1]/name[0]/$t test.xml
xmllint --xpath /agents/agent[1]/name[0]/type test.xml
xmllint --xpath /agents/agent[1]/name[1] test.xml
xmllint --xpath /agents/agent[1]/name[1]/$t test.xml
xmllint --xpath /agents/agent[1]/name[1]/type test.xml
xmllint --xpath /agents/agent[1]/sex test.xml
```
