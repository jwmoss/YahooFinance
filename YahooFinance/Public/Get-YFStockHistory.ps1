function Get-YFStockHistory {

    <#
    .SYNOPSIS
        Returns historical stock information
    .DESCRIPTION
        Returns historical stock information
    .PARAMETER Ticker
        The stock ticker you to pull history
    .PARAMETER Period
        How far back you want to get the history of the stock
    .PARAMETER Interval
        The interval for how much data you want to return between the period
    .PARAMETER Start
        The start date for stock history
    .PARAMETER End
        The end date for stock history
    .PARAMETER GroupBy
        The end date for stock history
    .EXAMPLE
        PS C:\> Get-YFStockHistory -Ticker AAPL -Period 5d -Interval 1m

        Retrives 5 day history for ticker AAPL in 1 minute intervals

    .EXAMPLE
        PS C:\> Get-YFStockHistory -Ticker TSLA

        Retrives the max stock history for ticker TSLA in 1 day intervals

    .INPUTS
        NA
    .OUTPUTS
        NA
    .NOTES
        Currently using the yahoo finance api to pull the information
    #>

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
        $Start = (Get-Date -Hour 0 -Minute 00 -Second 00).AddMonths(-5),

        [datetime]
        $End = (Get-Date -Hour 0 -Minute 00 -Second 00)
    )

    Begin {
        if ($Interval -eq "30m") {
            $Interval = "15m"
        }
    }
    Process {

        $Params = @{
            period1  = Get-UnixTime $Start
            period2  = Get-UnixTime $End
            interval = $Interval
            events   = "history"
        }

        $ticker | ForEach-Object {
            $url = "$script:url_base/v7/finance/download/{0}" -f $_
            $stock = $_
            Invoke-RestMethod $url -Body $Params | Convertfrom-csv | Foreach-object {
                [PSCustomObject]@{
                    Ticker   = $stock
                    Date     = Get-Date ($_.Date) -format "yyyy-MM-dd"
                    Open     = $_.Open
                    High     = $_.High
                    Low      = $_.Low
                    Close    = $_.Close
                    AdjClose = $_.'Adj Close'
                    Volume   = [int32]$_.Volume
                }
            }
        }
    }
    End {

    }
}
