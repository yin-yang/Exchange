
$Mailboxes = Get-Mailbox -ResultSize Unlimited -IgnoreDefaultScope
$Databases = Get-MailboxDatabase

$list = @()

Foreach ($mailbox in $mailboxes) {
    
    $quota_values = $mailbox

    if ($Mailbox.UseDatabaseQuotaDefaults) {

        $userDB = $databases | where-object { $_.name -eq $Mailbox.database }

        $quota_values = $userDB
        
    } # if 
        
    # quotas
    if (-not $quota_values.prohibitsendquota.isunlimited) {
        $prohibit_send_quota = $quota_values.prohibitsendquota | Select-Object -ExpandProperty Value

    }
    else {
        $prohibit_send_quota = "Unlimited"
    } # if else

    if (-not $quota_values.prohibitsendreceivequota.isunlimited) {
        $send_receive_quota = $quota_values.prohibitsendreceivequota | Select-Object -ExpandProperty Value

    }
    else {
        $prohibit_send_quota = "Unlimited"
    } # if else

    $statistics = $mailbox | get-mailboxStatistics

    $Property = @{
        alias = $mailbox.alias
        primarySmtpAddress = $mailbox.primarySmtpAddress
        database = $mailbox.database
        TotalItemSize = $statistics.TotalItemSize
        ProhibitSentQuota = $prohibit_send_quota
        ProhibitSendReceiveQuota = $send_receive_quota
    }

    $Object = New-Object PSObject -Property $Property

    $list += $Object
    
} # foreach

$list | Export-Csv -NoTypeInformation C:\buzones.csv