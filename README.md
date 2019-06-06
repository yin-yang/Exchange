Exchange Server :e-mail:
=======================================================================
Una lista de fuentes de Exchange de gran utilidad para implementar, migrar y administrar la plataforma. :coffee:

![Exchange Server](https://github.com/yin-yang/Exchange/blob/master/resources/exchange.png)

## Lista de contenidos 

* [Herramientas](https://github.com/yin-yang/Exchange/#Herramientas)
* [Blogs de Utilidad](https://github.com/yin-yang/Exchange/#Blogs-de-utilidad)
* [Cmdlets](https://github.com/yin-yang/Exchange/#Cmdlets)
  * [Chequeo de salud](https://github.com/yin-yang/Exchange/#Health-Check)
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








| Comando                                                                                                                                                               | Detalle                                                                                                                               | Ejemplo                                                                          | Versión                   |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- | ------------------------- |
| [Get-HealthReport](https://docs.microsoft.com/en-us/powershell/module/exchange/server-health-and-performance/get-healthreport?view=exchange-ps)                          | Reporte de salud de servidor                                                                                                          | `Get-HealthReport`                                          | Exchange 2013 o Superior  |
| [Test-ServiceHealth](https://docs.microsoft.com/en-us/powershell/module/exchange/server-health-and-performance/test-servicehealth?view=exchange-ps)                      | Chequeo de servicios Exchange                                                                                                         | `Test-ServiceHealth -Server *server*`                                            | Exchange 2010 o Superior  |
| [Get-MailboxDatabaseCopyStatus](https://docs.microsoft.com/en-us/powershell/module/exchange/database-availability-groups/get-mailboxdatabasecopystatus?view=exchange-ps) | Detalle de bases de datos y sus copias.                                                                                               | `Get-MailboxDatabaseCopyStatus *`                                                | Exchange 2010 o superior  |
| [Test-ReplicationHealth](https://docs.microsoft.com/en-us/powershell/module/exchange/database-availability-groups/test-replicationhealth?view=exchange-ps)               | Verificación de replicación DAG.                                                                                                      | `Test-ReplicationHealth` | Exchange 2010 o superior  |
| [Get-Queue](https://docs.microsoft.com/en-us/powershell/module/exchange/mail-flow/get-queue?view=exchange-ps)                                                            | Información de las colas de correos en servidores de transporte.                                                                      | `Get-Queue *`                                                                    | Exchange 2010 o Superior  |
| [Test-ExchangeServerHealth](https://github.com/yin-yang/Exchange/blob/master/Test-ExchangeServerHealth.ps1)                                                              | Chequeo  sobre plataforma Exchange (2010, 2013, 2016)                                                                                 | `Test-ExchangeServerHealth -ReportFile .\archivo.html -ReportMode`               | Exchange 2010 o superior  |
| [Get-ServerHealth](https://docs.microsoft.com/en-us/powershell/module/exchange/server-health-and-performance/get-serverhealth?view=exchange-ps)                          | Chequeo de servidor Exchange.                                                                                                         | `Get-ServerHealth`                                                               | Exchange 2013 o superior  |
| [Test-MailFlow](https://docs.microsoft.com/en-us/powershell/module/exchange/mail-flow/Test-Mailflow?view=exchange-ps)                                                    | Chequeo de mail flow outbound                                                                                                         | `Test-MailFlow Server1 -TargetMailboxServer Server2`                             | Exchange 2010 o superior  |
| [Get-ServerComponentState](https://docs.microsoft.com/en-us/powershell/module/exchange/server-health-and-performance/get-servercomponentstate?view=exchange-ps)          | Muestra estado de los componentes y endpoints de Exchange.                                                                            | `Get-ServerComponentState -identity server01`                                    | Exchange 2013 o superior. |
| [Test-MAPIConectivity](https://docs.microsoft.com/en-us/powershell/module/exchange/mailboxes/Test-MAPIConnectivity?view=exchange-ps)                                     | Verificación que el servicio de MAPI, Exchange Store y Directory Services funcionen al logearse a un buzón del servidor especificado. | `Test-MAPIConnectivity -Server Server01`                                         | Exchange 2010 o superior  |
| [Test-ExchangeSearch](https://docs.microsoft.com/en-us/powershell/module/exchange/mailbox-databases-and-servers/test-exchangesearch?view=exchange-ps)                    | Chequea estado de busqueda sobre un buzón                                                                                             | `Test-ExchangeSearch -identity buzon@contoso.com`                                | Exchange 2010 o superior  |
