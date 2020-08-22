---
external help file: YahooFinance-help.xml
Module Name: YahooFinance
online version:
schema: 2.0.0
---

# Get-YFStock

## SYNOPSIS
Returns information about the stock ticker

## SYNTAX

```
Get-YFStock [[-Ticker] <String[]>] [<CommonParameters>]
```

## DESCRIPTION
Returns information about the stock ticker

## EXAMPLES

### EXAMPLE 1
```
Get-YFStock -Ticker AAPL,TSLA
Retrives stock ticker information for Apple and Tesla
```

## PARAMETERS

### -Ticker
The stock ticker you to pull history

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### Inputs (if any)
## OUTPUTS

### Output (if any)
## NOTES
Currently having to scrape the website to pull this information

## RELATED LINKS
