using namespace System.Management.Automation

class PeriodGenerator : IValidateSetValuesGenerator {
    [string[]] GetValidValues() {
        $Values = (Get-Content data.json | ConvertFrom-Json).Period
        return $Values
    }
}

class IntervalGenerator : IValidateSetValuesGenerator {
    [string[]] GetValidValues() {
        $Values = (Get-Content data.json | ConvertFrom-Json).Interval
        return $Values
    }
}
