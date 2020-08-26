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
