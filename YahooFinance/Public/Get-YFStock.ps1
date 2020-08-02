function Get-YFStock {
    [CmdletBinding()]
    param(
        [string[]]
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
        $Start,

        [datetime]
        $End,

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

    if ($Tickers -is [array]) {

    }
    else {

    }

}
