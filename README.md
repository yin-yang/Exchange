Exchange Server :e-mail:
=======================================================================
Una lista de fuentes de Exchange de gran utilidad para implementar, migrar y administrar la plataforma. :coffee:

![Exchange Server](https://github.com/yin-yang/Exchange/blob/master/resources/exchange.png)

## Lista de contenidos 

* [Herramientas](https://github.com/yin-yang/Exchange/#Herramientas)
* [Blogs de Utilidad](https://github.com/yin-yang/Exchange/#Blogs-de-utilidad)
* [Cmdlets](https://github.com/yin-yang/Exchange/#Cmdlets)
  * [Chequeo de salud]((https://github.com/yin-yang/Exchange/#Health-Check)
  * Relevamiento :construction:
* Guía de operación y reportes :construction:

---

## Herramientas

* [MXToolBox](https://mxtoolbox.com/): Chequeo de dominio, headers, blacklist, test de registros dns.
* [Test Connectivity](https://www.testconnectivity.microsoft.com/): Test de conectividad de outlook, autodiscover, activesync, chequeo de headers.
* [Message Analyze headers](https://appsource.microsoft.com/en-us/product/office/WA104005406): Addin de Outlookk para obtener headers y realizar analisis.
* [SARA](https://diagnostics.outlook.com/#/): herramienta para detectar y solucionar problemas en Outlook y Office
* [Exchange Deployment Assistant](https://docs.microsoft.com/en-us/exchange/exchange-deployment-assistant?view=exchserver-2019): Asistente de migración e implementación de Exchange Server.
* [Exchange Server Role Requirements Calculator](https://gallery.technet.microsoft.com/Exchange-2013-Server-Role-f8a61780): Calculadora para detectar requerimientos en implementacion de plataforma Exchange.
* [Migracion Performance Analysis](https://blogs.technet.microsoft.com/exchange/2014/03/24/mailbox-migration-performance-analysis/): Calcular migracion de buzones a Office 365
* [PortQry](https://www.microsoft.com/en-us/download/details.aspx?id=24009): Chequeo de puertos
* [AppRiver](https://tools.appriver.com/) Chequeos, herramientas generales
* [MigrationWiz](https://www.bittitan.com/migrationwiz/why-migrationwiz/): Migraciones Exchange Server, Exchange Online, Office 365.
* [ProcExplorer](https://docs.microsoft.com/en-us/sysinternals/downloads/process-explorer): explorardor y detalle de procesos.
* [ProcMonitor](https://docs.microsoft.com/en-us/sysinternals/downloads/procmon): monitoreo de procesos
* [Veeam Exchange Discovery Tool (Free)](https://www.veeam.com/blog/how-to-free-exchange-discovery-tool-helps-admin.html>): Explorar bases de datos EDB.

---

## Blogs de Utilidad :gem:

*En los siguientes blogs encontraran guías, tutoriales, resolución de problemas, etc. Son altamente recomendados para leer y hacer seguimiento.*

* [Practical365](https://practical365.com)
* [Documentación oficial Exchange](https://docs.microsoft.com/en-us/exchange/) 
* [MSExchangeGuru](http://msexchangeguru.com/)
* [Exchange Experts](https://www.experts-exchange.com/)

---

## Cmdlets

### Health check
1. [Get-HealthReport](https://docs.microsoft.com/en-us/powershell/module/exchange/server-health-and-performance/get-healthreport?view=exchange-ps) (Exchange 2013 o superior) Reporte de salud de servidor

`Get-ExchangeServer | Get-HealthReport`
Más info:
* https://blogs.technet.microsoft.com/managing_availability/2013/05/29/getting-the-health-of-an-exchange-server/
* https://docs.microsoft.com/en-us/exchange/high-availability/managed-availability/health-sets?view=exchserver-2019

2. [Test-ServiceHealth](https://docs.microsoft.com/en-us/powershell/module/exchange/server-health-and-performance/test-servicehealth?view=exchange-ps) Verificación de servicios.

3. [Get-MailboxDatabaseCopyStatus](https://docs.microsoft.com/en-us/powershell/module/exchange/database-availability-groups/get-mailboxdatabasecopystatus?view=exchange-ps) Detalle de bases de datos y sus copias.
`Get-MailboxDatabaseCopyStatus *`
Estado de todas las bases de datos.

4. [Test-ReplicationHealth](https://docs.microsoft.com/en-us/powershell/module/exchange/database-availability-groups/test-replicationhealth?view=exchange-ps): Verificación de replicación DAG.

`Test-ReplicationHealth | ? {$_.result -like "*error*" | select -expand error }`

Muestra detalle de errores de replicación.
  
5. [Get-Queue](https://docs.microsoft.com/en-us/powershell/module/exchange/mail-flow/get-queue?view=exchange-ps): Información de las colas de correos en servidores de transporte.

`Get-Queue *`

6. [Test-ExchangeServerHealth](https://github.com/yin-yang/Exchange/blob/master/Test-ExchangeServerHealth.ps1) Chequeo  sobre plataforma Exchange (2010, 2013, 2016).
  
Para generar un reporte:

`Test-ExchangeServerHealth -ReportFile .\archivo.html -ReportMode`

7. [Get-ServerHealth](https://docs.microsoft.com/en-us/powershell/module/exchange/server-health-and-performance/get-serverhealth?view=exchange-ps) (Exchange 2013, 2016, 2019) Chequeo de servidor Exchange.


8. [Test-MailFlow](https://docs.microsoft.com/en-us/powershell/module/exchange/mail-flow/Test-Mailflow?view=exchange-ps)

`Test-MailFlow Server1 -TargetMailboxServer Server2`
Chequea Mail Flow desde Server1 a Server2.

`Test-MailFlow -TargetEmailAddress jose@contoso.com`
Chequea envío de correo desde servidor hacia el buzón especificado.

9. [Get-ServerComponentState](https://docs.microsoft.com/en-us/powershell/module/exchange/server-health-and-performance/get-servercomponentstate?view=exchange-ps) (Exchange 2013 o superior) Muestra estado de los componentes y endpoints de Exchange.

10. [Test-MAPIConectivity](https://docs.microsoft.com/en-us/powershell/module/exchange/mailboxes/Test-MAPIConnectivity?view=exchange-ps) Verificación que el servicio de MAPI, Exchange Store y Directory Services funcionen al logearse a un buzón del servidor especificado.

11. [Test-ExchangeSearch](https://docs.microsoft.com/en-us/powershell/module/exchange/mailbox-databases-and-servers/test-exchangesearch?view=exchange-ps) Chequea estado de busqueda sobre un buzón

12. Para encontrar todos los cmdlets de Test: `Get-Command -Verb Test | Where Module -match $env:computername`