- IN

```
$ cat test.xml | xml el -v | sed 's/^/"/;s/$/"/' | while read path;do echo xmllint --xpath $path test.xml;done
xmllint --xpath "PurchaseOrders" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder[@PurchaseOrderNumber='99503' and @OrderDate='1999-10-20']" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Address[@Type='Shipping']" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Address/Name" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Address/Street" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Address/City" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Address/State" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Address/Zip" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Address/Country" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Address[@Type='Billing']" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Address/Name" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Address/Street" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Address/City" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Address/State" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Address/Zip" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Address/Country" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/DeliveryNotes" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Items" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Items/Item[@PartNumber='872-AA']" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Items/Item/ProductName" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Items/Item/Quantity" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Items/Item/USPrice" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Items/Item/Comment" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Items/Item[@PartNumber='926-AA']" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Items/Item/ProductName" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Items/Item/Quantity" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Items/Item/USPrice" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Items/Item/ShipDate" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder[@PurchaseOrderNumber='99505' and @OrderDate='1999-10-22']" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Address[@Type='Shipping']" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Address/Name" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Address/Street" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Address/City" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Address/State" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Address/Zip" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Address/Country" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Address[@Type='Billing']" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Address/Name" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Address/Street" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Address/City" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Address/State" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Address/Zip" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Address/Country" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/DeliveryNotes" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Items" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Items/Item[@PartNumber='456-NM']" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Items/Item/ProductName" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Items/Item/Quantity" test.xml
xmllint --xpath "PurchaseOrders/PurchaseOrder/Items/Item/USPrice" test.xml
```


- CMD

```
$ xmllint --xpath "PurchaseOrders/PurchaseOrder[@PurchaseOrderNumber='99505' and @OrderDate='1999-10-22']" test.xml | xmllint --format -
```

- OUT

```
<?xml version="1.0"?>
<PurchaseOrder PurchaseOrderNumber="99505" OrderDate="1999-10-22">
  <Address Type="Shipping">
    <Name>Cristian Osorio</Name>
    <Street>456 Main Street</Street>
    <City>Buffalo</City>
    <State>NY</State>
    <Zip>98112</Zip>
    <Country>USA</Country>
  </Address>
  <Address Type="Billing">
    <Name>Cristian Osorio</Name>
    <Street>456 Main Street</Street>
    <City>Buffalo</City>
    <State>NY</State>
    <Zip>98112</Zip>
    <Country>USA</Country>
  </Address>
  <DeliveryNotes>Please notify me before
    shipping.</DeliveryNotes>
  <Items>
    <Item PartNumber="456-NM">
      <ProductName>Power Supply</ProductName>
      <Quantity>1</Quantity>
      <USPrice>45.99</USPrice>
    </Item>
  </Items>
</PurchaseOrder>
```
