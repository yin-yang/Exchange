Exchange Server
=======================================================================
Una lista de fuentes de Exchange

![Exchange Server](https://github.com/yin-yang/Exchange/resources/exchange.png)

## Lista de contenidos

* [Herramientas](https://github.com/yin-yang/Exchange/#Herramientas)
* [Blogs de Utilidad](https://github.com/yin-yang/Exchange/#Blogs-de-utilidad)
* [Cmdlets](https://github.com/yin-yang/Exchange/#Cmdlets)
  * Chequeo de salud
  * Relevamiento
* Guía de operación y reportes

## Herramientas

---

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

## Blogs de Utilidad

---
*En los siguientes blogs encontraran guías, tutoriales, resolución de problemas, etc. Son altamente recomendados para leer y hacer seguimiento.*

* [Practical365](https://practical365.com)
* [Documentación oficial Exchange](https://docs.microsoft.com/en-us/exchange/) 
* [MSExchangeGuru](http://msexchangeguru.com/)
* [Exchange Experts](https://www.experts-exchange.com/)

## Cmdlets

---

1. Copiar archivo Test-ExchangeServerHealth.ps1
2. Ejecutar desde un servidor Exchange (2010, 2013 o 2016)
3. Para generar un reporte
   `.\Test-ExchangeServerHealth.ps1 -ReportFile .\archivo.html -ReportMode`