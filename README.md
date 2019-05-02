# Exchange

### Health check Exchange:
1. Copiar archivo Test-ExchangeServerHealth.ps1
2. Ejecutar desde un servidor Exchange (2010, 2013 o 2016). 
3. Una forma de ejecutar es: `\Test-ExchangeServerHealth.ps1 -ReportFile .\archivo.html -ReportMode` Esto generara un archivo html con el reporte.

### Herramientas
* https://mxtoolbox.com/ Chequeo de dominio, headers, blacklist, test de registros dns.
* https://www.testconnectivity.microsoft.com/ test de conectividad de outlook, autodiscover, activesync, chequeo de headers
* Message Analyze headers: https://appsource.microsoft.com/en-us/product/office/WA104005406 Para obtener headers de correo desde Outlook
* SARA https://diagnostics.outlook.com/#/ herramienta para detectar y solucionar problemas en Outlook y Office
* Exchange Deployment Assistant: https://docs.microsoft.com/en-us/exchange/exchange-deployment-assistant?view=exchserver-2019
* Exchange Server Role Requirements Calculator: https://gallery.technet.microsoft.com/Exchange-2013-Server-Role-f8a61780  Calculadora para detectar requerimientos en implementacion de plataforma Exchange
* Migracion Performance Analysis: https://blogs.technet.microsoft.com/exchange/2014/03/24/mailbox-migration-performance-analysis/ Calcular migracion de buzones a Office 365
* PortQry: https://www.microsoft.com/en-us/download/details.aspx?id=24009 Chequeo de puertos

### Blogs y arcitulos
1. https://practical365.com
2. https://docs.microsoft.com/en-us/exchange/ Tips, tutoriales para realizar implementaciones y migraciones de Exchange
