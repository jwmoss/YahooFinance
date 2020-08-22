# YahooFinance

A PowerShell Module that retrieves information from Yahoo Finance API and website.

## Overview

[![PowerShell Gallery Version](https://img.shields.io/powershellgallery/v/YahooFinance.svg)](https://www.powershellgallery.com/packages/YahooFinance)
[![PowerShell Gallery Downloads](https://img.shields.io/powershellgallery/dt/YahooFinance.svg)](https://www.powershellgallery.com/packages/YahooFinance)

Please open a [Pull Request](https://github.com/jwmoss/YahooFinance/blob/master/.github/PULL_REQUEST_TEMPLATE.md) if you desire any new features or create an [Issue](https://github.com/jwmoss/YahooFinance/blob/master/.github/ISSUE_TEMPLATE.md) if you come across a bug.

## Installation

```powershell
Install-Module -Name YahooFinance -Scope CurrentUser -Repository PSGallery
```

## Examples

```powershell
## Retrives stock ticker information for Apple and Tesla
Get-YFStock -Ticker "AAPL","TSLA"

##  Retrives max history for ticker AAPL in 1 minute intervals
Get-YFStockHistory -Ticker AAPL -Interval 1m
```
