function Get-YFStock {
    [CmdletBinding()]
    param(
        [string[]]
        $Ticker
    )

    $Hash = @{ }

    if ($Ticker -is [array]) {
        $ticker.ForEach( {
                $url = ("$script:url_base/v7/finance/options/{0}") -f $_
                $results = Invoke-RestMethod -Method "Get" -Uri $url

                if ($null -ne $results.optionChain.Error) {
                    Write-Warning "Error while retrieivng $_"
                }
                else {
                    $hash.Add($_, $results.optionChain.result)
                }
            })
    }
    else {
        $url = ("$script:url_base/v7/finance/options/{0}") -f $ticker
        $results = Invoke-RestMethod -Method "Get" -Uri $url

        if ($null -ne $results.optionChain.Error) {
            Write-Warning "Error while retrieivng $ticker"
        }
        else {
            $hash.Add($Ticker, $results.optionChain.result)
            $hash
        }
    }
    $hash
}
