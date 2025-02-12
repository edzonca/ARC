Abstract
Receive an email when Azure Arc contains a VM without Azure Benefit Enabled or SQL License blank

This Script create :

ActionGroup that sent an email when the alarm will be triggered
Alarm that contains the query
TBD
Required parameter :

TenantID
SubscriptionID
Email Address where the alarm will be sent



you can run with this commandline

.\CreateAlert.ps1 -resourceGroupName "YourResourceGroupName" -actionGroupName "YourActionGroupName" -alertRuleName "YourAlertRuleName" -emailAddress "youremail@example.com" -logAnalyticsWorkspaceId "YourLogAnalyticsWorkspaceId" -alertQuery "Your Kusto Query Here"
