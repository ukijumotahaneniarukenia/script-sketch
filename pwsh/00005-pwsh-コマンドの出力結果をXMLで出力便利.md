- CMD

```
$ pwsh -o XML -c 'Get-Date' | sed 1d | xmllint --format -
```

- OUT

```
<?xml version="1.0"?>
<Objs xmlns="http://schemas.microsoft.com/powershell/2004/04" Version="1.1.0.1">
  <Obj S="Output" RefId="0">
    <DT S="Output">2020-08-26T14:55:27.870101+09:00</DT>
    <MS>
      <Obj N="DisplayHint" RefId="1">
        <TN RefId="0">
          <T>Microsoft.PowerShell.Commands.DisplayHintType</T>
          <T>System.Enum</T>
          <T>System.ValueType</T>
          <T>System.Object</T>
        </TN>
        <ToString>DateTime</ToString>
        <I32>2</I32>
      </Obj>
    </MS>
  </Obj>
</Objs>
```


- CMD


```
$ pwsh -o XML -c '$PSVersionTable' | sed 1d | xmllint --format - | xml2 | 2xml | xmllint --format -
```

- OUT

```
<?xml version="1.0"?>
<Objs xmlns="http://schemas.microsoft.com/powershell/2004/04" Version="1.1.0.1">
  <Obj S="Output" RefId="0">
    <TN RefId="0">
      <T>System.Management.Automation.PSVersionHashTable</T>
      <T>
System.Collections.Hashtable</T>
      <T>
System.Object</T>
    </TN>
    <DCT>
      <En>
        <S N="Key">OS</S>
        <S N="Value">Linux 5.4.0-42-generic #46-Ubuntu SMP Fri Jul 10 00:24:02 UTC 2020</S>
      </En>
      <En>
        <S N="Key">PSCompatibleVersions</S>
        <Obj N="Value" RefId="1">
          <TN RefId="1">
            <T>System.Version[]</T>
            <T>
System.Array</T>
            <T>
System.Object</T>
          </TN>
          <LST>
            <Version>1.0</Version>
            <Version>
2.0</Version>
            <Version>
3.0</Version>
            <Version>
4.0</Version>
            <Version>
5.0</Version>
            <Version>
5.1.10032.0</Version>
            <Version>
6.0.0</Version>
            <Version>
6.1.0</Version>
            <Version>
6.2.0</Version>
            <Version>
7.0.3</Version>
          </LST>
        </Obj>
      </En>
      <En>
        <S N="Key">Platform</S>
        <S N="Value">Unix</S>
      </En>
      <En>
        <S N="Key">SerializationVersion</S>
        <Version N="Value">1.1.0.1</Version>
      </En>
      <En>
        <S N="Key">GitCommitId</S>
        <S N="Value">7.0.3</S>
      </En>
      <En>
        <S N="Key">PSEdition</S>
        <S N="Value">Core</S>
      </En>
      <En>
        <S N="Key">WSManStackVersion</S>
        <Version N="Value">3.0</Version>
      </En>
      <En>
        <S N="Key">PSVersion</S>
        <Obj N="Value" RefId="2">
          <TN RefId="2">
            <T>System.Management.Automation.SemanticVersion</T>
            <T>
System.Object</T>
          </TN>
          <ToString>7.0.3</ToString>
          <Props>
            <I32 N="Major">7</I32>
            <I32 N="Minor">0</I32>
            <I32 N="Patch">3</I32>
            <Nil N="PreReleaseLabel"/>
            <Nil N="BuildLabel"/>
          </Props>
        </Obj>
      </En>
      <En>
        <S N="Key">PSRemotingProtocolVersion</S>
        <Version N="Value">2.3</Version>
      </En>
    </DCT>
  </Obj>
</Objs>
```
