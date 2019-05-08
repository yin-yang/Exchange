[CmdletBinding()]

param (

    [string]
    $Path = ('{0}\report.csv' -f $env:USERPROFILE )

)

$Mailboxes = Get-Mailbox -ResultSize Unlimited -IgnoreDefaultScope
$Databases = Get-MailboxDatabase

$list = @()

Foreach ($mailbox in $mailboxes) {
    
    $quota_values = $mailbox

    if ($Mailbox.UseDatabaseQuotaDefaults) {

        $userDB = $databases | where-object { $_.name -eq $Mailbox.database }

        $quota_values = $userDB
        
    } # if 
        
    $statistics = $mailbox | get-mailboxStatistics
    # quotas
    if (-not $quota_values.prohibitsendquota.isunlimited) {
        $prohibit_send_quota = $quota_values.prohibitsendquota | Select-Object -ExpandProperty Value

        $prohibit_send_quota = $prohibit_send_quota -replace “(.*\()|,| [a-z]*\)”, “”
        $prohibit_send_quota = [math]::Round($prohibit_send_quota / 1MB, 2)
    }
    else {
        $prohibit_send_quota = "Unlimited"
    } # if else
    
    if (-not $quota_values.prohibitsendreceivequota.isunlimited) {
        $send_receive_quota = $quota_values.prohibitsendreceivequota | Select-Object -ExpandProperty Value
        $send_receive_quota = $send_receive_quota -replace “(.*\()|,| [a-z]*\)”, “”
        $send_receive_quota = [math]::Round($send_receive_quota / 1MB, 2)
        
    }
    else {
        $send_receive_quota = "Unlimited"
    } # if else


    $TotalItemSizeInBytes = $statistics.TotalItemSize.Value -replace “(.*\()|,| [a-z]*\)”, “”

    $Property = @{
        alias                    = $mailbox.alias
        primarySmtpAddress       = $mailbox.primarySmtpAddress
        database                 = $mailbox.database
        TotalItemSizeInMB        = [math]::Round($TotalItemSizeInBytes / 1MB, 2)
        ProhibitSentQuota        = $prohibit_send_quota
        ProhibitSendReceiveQuota = $send_receive_quota
        LastLogonTime            = $statistics.LastLogonTime
    }

    $Object = New-Object PSObject -Property $Property

    $list += $Object
    
} # foreach

Write-Verbose "Exporting data to file $Path"
$list | Export-Csv -NoTypeInformation -Path $Path -Encoding Unicode