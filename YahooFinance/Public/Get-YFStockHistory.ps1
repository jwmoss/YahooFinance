function Get-YFStockHistory {
    [CmdletBinding()]
    param(
        [string]
        $Ticker,

        [ValidateSet(
            "1d",
            "5d",
            "1mo",
            "3mo",
            "6mo",
            "1y",
            "2y",
            "5y",
            "10y",
            "ytd",
            "max"
        )]
        [string]
        $Period = "max",

        [ValidateSet(
            "1m",
            "2m",
            "5m",
            "15m",
            "30m",
            "60m",
            "90m",
            "1h",
            "1d",
            "5d",
            "1wk",
            "1mo",
            "3mo"
        )]
        [string]
        $Interval = "1d",

        [datetime]
        $Start = (Get-Date -Hour 0 -Minute 00 -Second 00).AddMonths(-5),

        [datetime]
        $End = (Get-Date -Hour 0 -Minute 00 -Second 00),

        [ValidateSet(
            'ticker',
            'column'
        )]
        [string]
        $GroupBy = "column",

        [switch]
        $PrePost,

        [switch]
        $AutoAdjust,

        [switch]
        $Actions,

        [switch]
        $Rounding
    )

    if ($Interval -eq "30m") {
        $Interval = "15m"
    }

    $Params = @{
        period1 = Get-UnixTime $Start
        period2 = Get-UnixTime $End
        interval = $Interval
        events = "history"
    }

    $url = "https://query1.finance.yahoo.com/v7/finance/download/{0}" -f $Ticker

    Invoke-RestMethod $url -Body $Params | Convertfrom-csv | Foreach-object {
        [PSCustomObject]@{
            Date = Get-Date ($_.Date) -format "yyyy-MM-dd"
            Open = $_.Open
            High = $_.High
            Low = $_.Low
            Close = $_.Close
            AdjClose = $_.'Adj Close'
            Volume = $_.Volume
        }
    }
}
