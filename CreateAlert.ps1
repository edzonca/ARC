param (
    [string]$resourceGroupName,
    [string]$actionGroupName,
    [string]$alertRuleName,
    [string]$emailAddress,
    [string]$logAnalyticsWorkspaceId,
    [string]$alertQuery
)

# Step 1: Create Action Group
$actionGroup = New-AzActionGroup `
    -ResourceGroupName $resourceGroupName `
    -Name $actionGroupName `
    -ShortName "AGShortName" `
    -Receiver `
        @{Name="EmailReceiver"; EmailAddress=$emailAddress; Type="Email"}

# Step 2: Create Alert Rule
$alertRule = Add-AzMetricAlertRuleV2 `
    -ResourceGroupName $resourceGroupName `
    -RuleName $alertRuleName `
    -TargetResourceId $logAnalyticsWorkspaceId `
    -WindowSize (New-TimeSpan -Minutes 5) `
    -Frequency (New-TimeSpan -Minutes 5) `
    -Severity 3 `
    -Operator "GreaterThan" `
    -Threshold 0 `
    -TimeAggregation "Total" `
    -MetricName "CustomLogSearch" `
    -ActionGroupId $actionGroup.Id `
    -Description "Alert triggered by query" `
    -Query $alertQuery `
    -QueryType "LogAnalytics"

Write-Output "Alert rule created successfully"
