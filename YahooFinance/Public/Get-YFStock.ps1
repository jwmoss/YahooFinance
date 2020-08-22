function Get-YFStock {
    [CmdletBinding()]
    param(
        [string[]]
        $Ticker
    )

    foreach ($t in $ticker) {

        $Url = "$script:scrape_base/{0}" -f $t
        $page = Invoke-WebRequest -uri $url
        $rawhtml = ConvertFrom-Html $page.RawContent

        $data = (($rawhtml.SelectNodes("/html/body/script[1]/text()").Innertext -split "`n")[5] -replace "root.App.main = ") ##| convertfrom-json
        $ht = $data -replace $data[-1] | convertfrom-json -AsHashTable
        $data = $ht.context.dispatcher.stores.QuoteSummaryStore

        [PSCustomObject]@{
            Zip                         = $data.summaryProfile["zip"]
            Sector                      = $data.summaryProfile["sector"]
            FullTimeEmployees           = $data.summaryProfile["fullTimeEmployees"]
            LongBusinessSummary         = $data.summaryProfile["longBusinessSummary"]
            City                        = $data.summaryProfile["city"]
            Phone                       = ($data.summaryProfile["phone"]).Trim()
            State                       = $data.summaryProfile["state"]
            Country                     = $data.summaryProfile["country"]
            CompanyOfficers             = $data.summaryProfile["companyOfficers"]
            Website                     = $data.summaryProfile["website"]
            Address                     = $data.summaryProfile["address1"]
            Industry                    = $data.summaryProfile["industry"]
            PreviousClose               = $data.summaryDetail.previousClose.raw
            RegularMarketClose          = $data.price.regularMarketOpen.raw
            TwoHundredDayAverage        = $data.summaryDetail.twoHundredDayAverage.raw
            TrailingAnnualDividendYield = $data.summaryDetail.trailingAnnualDividendYield
            PayoutRatio                 = $data.summaryProfile.payoutRatio
            Volume24Hr                  = $data.price.volume24Hr
            RegularMarketDayHigh        = $data.summaryDetail.regularMarketDayHigh.raw
            NavPrice                    = $data.summaryDetail.navPrice
            AverageDailyVolume10Day     = $data.price.averageDailyVolume10Day.raw
            TotalAssets                 = $data.summaryDetail.totalAssets
            RegularMarketPreviousClose  = $data.summaryDetail.regularMarketPreviousClose.raw
            FiftyDayAverage             = $data.summaryDetail.fiftyDayAverage.raw
            TrailingAnnualDividendRate  = $data.summaryDetail.trailingAnnualDividendRate.raw
            Open                        = $data.summaryDetail.open.raw
            ToCurrency                  = $data.price.toCurrency.raw
            AverageVolume10days         = $data.summaryDetail.averageVolume10days.raw
            ExpireDate                  = $data.summaryDetail.expireDate
            Yield                       = $data.summaryDetail.yield
            RegularMarketPrice          = $data.price.regularMarketPrice.raw
            FloatShares                 = $data.defaultKeyStatistics.floatShares.raw
            ShortPercentOfFloat         = $data.defaultKeyStatistics.shortPercentOfFloat.fmt
            EnterpriseValue             = $data.defaultKeyStatistics.enterpriseValue.longFmt
            RegularMarketDayLow         = $data.price.regularMarketDayLow.raw
            ShortRatio                  = $data.defaultKeyStatistics.shortRatio.raw
        }
    }
}
