---
external help file: YahooFinance-help.xml
Module Name: YahooFinance
online version:
schema: 2.0.0
---

# Get-YFStockHistory

## SYNOPSIS
Returns historical stock information

## SYNTAX

```
Get-YFStockHistory [[-Ticker] <String[]>] [[-Period] <String>] [[-Interval] <String>] [[-Start] <DateTime>]
 [[-End] <DateTime>] [<CommonParameters>]
```

## DESCRIPTION
Returns historical stock information

## EXAMPLES

### EXAMPLE 1
```
Get-YFStockHistory -Ticker AAPL -Period 5d -Interval 1m
Retrives 5 day history for ticker AAPL in 1 minute intervals
PS C:\> Get-YFStockHistory -Ticker TSLA
Retrives the max stock history for ticker TSLA in 1 day intervals
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

### -Period
How far back you want to get the history of the stock

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: Max
Accept pipeline input: False
Accept wildcard characters: False
```

### -Interval
The interval for how much data you want to return between the period

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: 1d
Accept pipeline input: False
Accept wildcard characters: False
```

### -Start
The start date for stock history

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: (Get-Date -Hour 0 -Minute 00 -Second 00).AddMonths(-5)
Accept pipeline input: False
Accept wildcard characters: False
```

### -End
The end date for stock history

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: (Get-Date -Hour 0 -Minute 00 -Second 00)
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### NA
## OUTPUTS

### NA
## NOTES
Currently using the yahoo finance api to pull the information

## RELATED LINKS
