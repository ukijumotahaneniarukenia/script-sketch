CMD

```
$ python3 -mjson.tool a.json | pygmentize -l json 
{
    "Fruits": [
        {
            "Name": "Apple",
            "Quantity": 3,
            "Price": 100
        },
        {
            "Name": "Orange",
            "Quantity": 15,
            "Price": 110
        },
        {
            "Name": "Mango",
            "Quantity": 100,
            "Price": 90
        },
        {
            "Name": "Banana",
            "Quantity": 6,
            "Price": 100
        },
        {
            "Name": "Kiwifruit",
            "Quantity": 40,
            "Price": 50
        }
    ]
}

$ python3 -mjson.tool a.json | pygmentize -l json | jq
parse error: Invalid numeric literal at line 2, column 6

$ python3 -mjson.tool a.json | pygmentize -l json | jq -R 
"{"
"    \u001b[38;5;28;01m\"Fruits\"\u001b[39;00m: ["
"        {"
"            \u001b[38;5;28;01m\"Name\"\u001b[39;00m: \u001b[38;5;124m\"Apple\"\u001b[39m,"
"            \u001b[38;5;28;01m\"Quantity\"\u001b[39;00m: \u001b[38;5;241m3\u001b[39m,"
"            \u001b[38;5;28;01m\"Price\"\u001b[39;00m: \u001b[38;5;241m100\u001b[39m"
"        },"
"        {"
"            \u001b[38;5;28;01m\"Name\"\u001b[39;00m: \u001b[38;5;124m\"Orange\"\u001b[39m,"
"            \u001b[38;5;28;01m\"Quantity\"\u001b[39;00m: \u001b[38;5;241m15\u001b[39m,"
"            \u001b[38;5;28;01m\"Price\"\u001b[39;00m: \u001b[38;5;241m110\u001b[39m"
"        },"
"        {"
"            \u001b[38;5;28;01m\"Name\"\u001b[39;00m: \u001b[38;5;124m\"Mango\"\u001b[39m,"
"            \u001b[38;5;28;01m\"Quantity\"\u001b[39;00m: \u001b[38;5;241m100\u001b[39m,"
"            \u001b[38;5;28;01m\"Price\"\u001b[39;00m: \u001b[38;5;241m90\u001b[39m"
"        },"
"        {"
"            \u001b[38;5;28;01m\"Name\"\u001b[39;00m: \u001b[38;5;124m\"Banana\"\u001b[39m,"
"            \u001b[38;5;28;01m\"Quantity\"\u001b[39;00m: \u001b[38;5;241m6\u001b[39m,"
"            \u001b[38;5;28;01m\"Price\"\u001b[39;00m: \u001b[38;5;241m100\u001b[39m"
"        },"
"        {"
"            \u001b[38;5;28;01m\"Name\"\u001b[39;00m: \u001b[38;5;124m\"Kiwifruit\"\u001b[39m,"
"            \u001b[38;5;28;01m\"Quantity\"\u001b[39;00m: \u001b[38;5;241m40\u001b[39m,"
"            \u001b[38;5;28;01m\"Price\"\u001b[39;00m: \u001b[38;5;241m50\u001b[39m"
"        }"
"    ]"
"}"
```
