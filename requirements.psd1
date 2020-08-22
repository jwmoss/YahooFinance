@{
    PSDependOptions = @{
        Target = 'CurrentUser'
    }
    'Pester' = @{
        Version = '4.9.0'
        Parameters = @{
            SkipPublisherCheck = $true
        }
    }
    'psake' = @{
        Version = '4.8.0'
    }
    'PowerHTML' = @{
        Version = '0.1.7'
    }
    'BuildHelpers' = @{
        Version = '2.0.15'
    }
    'PowerShellBuild' = @{
        Version = '0.4.0'
    }
}
