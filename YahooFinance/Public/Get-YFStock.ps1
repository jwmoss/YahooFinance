function Get-YFStock {
    [CmdletBinding()]
    param(
        [string[]]
        $Ticker,

        [ValidateSet( [PeriodGenerator] )]
        [string]
        $Period = "max",

        [ValidateSet( [IntervalGenerator] )]
        [string]
        $Interval = "1d",

        [datetime]
        $Start,

        [datetime]
        $End,

        [ValidateSet('ticker', 'column')]
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
