function GetNestedValue {
    param (
        [Parameter(Mandatory = $true)]
        [object]$Object,

        [Parameter(Mandatory = $true)]
        [string]$Key
    )

    $keys = $Key -split '/'
    $value = $Object

    try {
        foreach ($k in $keys) {
            $value = $value.$k
        }
    }
    catch {
        $value = $null
    }

    return $value
}


$Epmloyee = @{
    "Department" = @{
        "DevOps" = @{
            "Team" = "Microsoft Business"
        }
    }
}
$key1 = "Department/DevOps/Team"
$result1 = GetNestedValue -Object $Epmloyee -Key $key1
Write-Output $Key1
Write-Output $result1
