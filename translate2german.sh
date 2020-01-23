#!/bin/bash
#
# Weboberfläche des Pi-hole auf deutsch übersetzen
# getestet auf Version Pi-hole Version v4.3.2 Web Interface Version v4.3.2 FTL Version v4.3.1
#
# Benutzung auf eigene Gefahr!!!
#
####################################################################################################################
# Setzen der Variablen

username=`whoami`
hostname=`hostname`
ipadresse=`hostname -I`
date=`date +'%Y%m%d-%H%M%S'`

standard="\033[0m"
grau="\033[1;30m"
rotfett="\033[1;31m"
blaufett="\033[1;34m"
gruenfett="\033[1;32m"

info="[i]"
over="\\r\\033[K"
fehler="[${rotfett}✗${standard}]"
haken="[${gruenfett}✓${standard}]"
done="${gruenfett} done!${standard}"

exec 2> /tmp/error-translate.log

####################################################################################################################
# Start des Script's

clear

echo
echo -e "${blaufett}   Übersetze die Pi-hole Weboberfläche auf deutsch ...${standard}"
echo
echo -e "${blaufett}   Dies kann einige Minuten dauern ...${standard}"
echo

cp -r /var/www/html/admin /var/www/html/admin.sicherung.vom.$date                               # Sicherung des Verzeichnisses
sudo cp /var/www/html/pihole/index.php /var/www/html/pihole/index.php.sicherung.vom.$date       # Sicherung der index.php


# Startseite
sudo rpl 'Your black hole for Internet advertisements' 'Ihr schwarzes Loch für Internetwerbung.' /var/www/html/pihole/index.php
sudo rpl 'Did you mean to go to the admin panel' 'Möchten Sie zum Administrationsbereich' /var/www/html/pihole/index.php
sudo rpl '<span>Login</span>' '<span>Anmelden</span>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl 'Sign in to start your session' 'Melden Sie sich an, um Ihre Sitzung zu starten.' /var/www/html/admin/scripts/pi-hole/php/loginpage.php
sudo rpl 'Verify that cookies are allowed for' 'Überprüfen Sie, ob Cookies zugelassen sind für' /var/www/html/admin/scripts/pi-hole/php/loginpage.php
sudo rpl 'Wrong password!' 'Falsches Passwort!' /var/www/html/admin/scripts/pi-hole/php/loginpage.php
sudo rpl 'After installing Pi-hole for the first time, a password is generated and displayed to the user. The' 'Nach der erstmaligen Installation von Pi-hole wird ein Passwort generiert und dem Benutzer angezeigt.' /var/www/html/admin/scripts/pi-hole/php/loginpage.php
sudo rpl 'password cannot be retrieved later on, but it is possible to set a new password (or explicitly disable' 'Das Passwort kann später nicht mehr abgerufen werden. Es ist jedoch möglich, ein neues Passwort festzulegen' /var/www/html/admin/scripts/pi-hole/php/loginpage.php
sudo rpl 'the password by setting an empty password) using the command' '(oder das Passwort explizit zu deaktivieren, indem Sie ein leeres Passwort festlegen). Verwenden Sie hierzu:' /var/www/html/admin/scripts/pi-hole/php/loginpage.php
sudo rpl 'Password' 'Passwort' /var/www/html/admin/scripts/pi-hole/php/loginpage.php
sudo rpl '<li><samp>Return</samp> &rarr; Log in and go to requested page (<?php echo $scriptname; ?>)</li>' '<li><samp>Enter</samp> &rarr; Anmelden und zur Startseite gehen (<?php echo $scriptname; ?>)</li>' /var/www/html/admin/scripts/pi-hole/php/loginpage.php
sudo rpl '<li><samp>Ctrl+Return</samp> &rarr; Log in and go to Settings page</li>' '<li><samp>Ctrl+Enter</samp> &rarr; Anmelden und zur Einstellungsseite gehen</li>' /var/www/html/admin/scripts/pi-hole/php/loginpage.php
sudo rpl 'Remember me for 7 days' '7 Tage merken' /var/www/html/admin/scripts/pi-hole/php/loginpage.php
sudo rpl 'Log in' 'Anmelden' /var/www/html/admin/scripts/pi-hole/php/loginpage.php
sudo rpl 'Forgot password' 'Passwort vergessen' /var/www/html/admin/scripts/pi-hole/php/loginpage.php



# Statusanzeige oben links
sudo rpl '<a id="status"><i class="fa fa-circle" style="color:#7FFF00"></i> Active</a>' '<a id="status"><i class="fa fa-circle" style="color:#7FFF00"></i> Aktiv</a>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl 'Memory usage:&nbsp;&nbsp;' 'Speicher:&nbsp;&nbsp;' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl 'Temp:&nbsp;' 'Temperatur:&nbsp;' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl 'Load:&nbsp;&nbsp;' 'Auslastung:&nbsp;&nbsp;' /var/www/html/admin/scripts/pi-hole/php/header.php



# Statusanzeige oben rechts
  # noch nichts zu übersetzen



# Menüleiste
sudo rpl '<li class="header">MAIN NAVIGATION</li>' '<li class="header" <p><span style="background-color:chartreuse">Hauptmenü</span></p></li>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '<span>Dashboard</span>' '<span>Übersicht</span>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '<span>Query Log</span>' '<span>Anfragen Protokoll</span>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '<span>Speedtest</span>' '<span>Geschwindigkeitstest</span>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '<span>Long term data</span>' '<span>Langzeitdaten</span>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '<span>Graphics</span>' '<span>Grafiken</span>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '<span>Top Lists</span>' '<span>Top Listen</span>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '<span>Disable&nbsp;&nbsp;&nbsp;<span id="flip-status-disable"></span>' '<span>Ausschalten&nbsp;&nbsp;&nbsp;<span id="flip-status-disable"></span>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '<span id="enableLabel">Enable&nbsp;&nbsp;&nbsp;<span id="flip-status-enable"></span></span>' '<span id="enableLabel">Einschalten&nbsp;&nbsp;&nbsp;<span id="flip-status-enable"></span></span>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '<span>Permanently</span>' '<span>Permanent</span>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '<span>For 10 seconds</span>' '<span>Für 10 Sekunden</span>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '<span>For 30 seconds</span>' '<span>Für 30 Sekunden</span>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '<span>For 5 minutes</span>' '<span>Für 5 Minuten</span>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '<span>Custom time</span>' '<span>Benutzerdefinierte Zeit</span>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '<span>Tools</span>' '<span>Werkzeuge</span>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '<span>Update Gravity</span>' '<span>Aktualisierung Gravity</span>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '<span>Query Lists</span>' '<span>Domain in einer Liste finden</span>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '<span>Audit log</span>' '<span>Prüfprotokoll</span>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '<span>Tail pihole.log</span>' '<span>pihole.log anzeigen</span>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '<span>Tail pihole-FTL.log</span>' '<span>pihole-FTL.log anzeigen</span>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '<span>Generate debug log</span>' '<span>Erstelle Debug-Protokoll</span>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '<span>Network</span>' '<span>Netzwerk</span>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '<span>Settings</span>' '<span>Einstellungen</span>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '<span>Logout</span>' '<span>Abmelden</span>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '<span>Donate</span>' '<span>Spenden</span>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '<span>Help</span>' '<span>Hilfe</span>' /var/www/html/admin/scripts/pi-hole/php/header.php



# Fußleiste
sudo rpl '<div style="display: inline-block"><strong><a href="https://pi-hole.net/donate" target="_blank"><i class="fa fa-heart"></i> Donate</a></strong> if you found this useful.</div>' '<div style="display: inline-block"><strong><a href="https://pi-hole.net/donate" target="_blank"><i class="fa fa-heart"></i> Spenden</a></strong> Sie bitte, wenn Sie Pi-hole nützlich finden.&nbsp;&nbsp;&nbsp <a href="" <i class="fa fa-edit"></a></i>&nbsp Übersetzt von <a href="https://github.com/pimanDE"><strong>pimanDE</strong>.</a></div>' /var/www/html/admin/scripts/pi-hole/php/footer.php
sudo rpl 'Update available' 'Aktualisierung vorhanden' /var/www/html/admin/scripts/pi-hole/php/footer.php



# Übersicht
sudo rpl '<p>Total queries' '<p>Anfragen insgesamt' /var/www/html/admin/index.php
sudo rpl 'clients)</p>' 'Geräte)</p>' /var/www/html/admin/index.php
sudo rpl '<p>Queries Blocked</p>' '<p>Geblockte Anfragen</p>' /var/www/html/admin/index.php
sudo rpl '<p>Percent Blocked</p>' '<p>Geblockt in Prozent</p>' /var/www/html/admin/index.php
sudo rpl 'Domains on Blocklist' 'Domains in den Blocklisten' /var/www/html/admin/index.php
sudo rpl 'Queries over last' 'Anfragen der letzten' /var/www/html/admin/index.php
sudo rpl 'hours' 'Stunden' /var/www/html/admin/index.php
sudo rpl '"Upstreams from "+from+" to "+to' '"Upstream von "+from+" bis "+to' /var/www/html/admin/scripts/pi-hole/js/index.js
sudo rpl 'Total DNS Queries' 'DNS Anfragen insgesamt' /var/www/html/admin/scripts/pi-hole/js/index.js
sudo rpl 'Blocked DNS Queries' 'geblockte DNS Anfragen' /var/www/html/admin/scripts/pi-hole/js/index.js
sudo rpl 'Speedtest results over last' 'Geschwindigkeitsergebnisse der letzten' /var/www/html/admin/index.php
sudo rpl '" Days"' '" Tage"' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl 'Clients (over time)' 'Geräte im Laufe der Zeit' /var/www/html/admin/index.php
sudo rpl 'Client activity from "+from+" to "+to' 'Gerät aktiv von "+from+" bis "+to' /var/www/html/admin/scripts/pi-hole/js/index.js
sudo rpl '<td>No activity recorded</td>' '<td>Keine Aktivität aufgezeichnet.</td>' /var/www/html/admin/scripts/pi-hole/js/index.js
sudo rpl 'Query Types' 'Anfragetypen' /var/www/html/admin/index.php
sudo rpl '"Query types"' '"Anfragetyp"' /var/www/html/admin/scripts/pi-hole/js/index.js
sudo rpl 'Queries answered by' 'Anfragen beantwortet von' /var/www/html/admin/index.php
sudo rpl '"Forward destinations"' '"Weitergeleitete Ziele"' /var/www/html/admin/scripts/pi-hole/js/index.js
sudo rpl 'Top Permitted Domains' 'Am meisten zugelassene Domains' /var/www/html/admin/index.php
sudo rpl '<th>Hits</th>' '<th>Treffer</th>' /var/www/html/admin/index.php
sudo rpl '<th>Frequency</th>' '<th>Häufigkeit</th>' /var/www/html/admin/index.php
sudo rpl '"% of " + data.dns_queries_today + "\"> <div class=\"progress-bar progress-bar-green\"' '"% von insgesamt " + data.dns_queries_today + " Anfragen\"> <div class=\"progress-bar progress-bar-green\"' /var/www/html/admin/scripts/pi-hole/js/index.js
sudo rpl 'Top Blocked Domains' 'Am meisten geblockte Domains' /var/www/html/admin/index.php
sudo rpl '"% of " + data.ads_blocked_today + "\"> <div class=\"progress-bar progress-bar-yellow\"' '"% von insgesamt " + data.ads_blocked_today + " Domains\"> <div class=\"progress-bar progress-bar-yellow\"' /var/www/html/admin/scripts/pi-hole/js/index.js
sudo rpl 'Top Clients (total)' 'Top Geräte (insgesamt)' /var/www/html/admin/index.php
sudo rpl '<th>Client</th>' '<th>Gerät</th>' /var/www/html/admin/index.php
sudo rpl '<th>Requests</th>' '<th>Anfragen</th>' /var/www/html/admin/index.php
sudo rpl 'sources[client] + "</td> <td> <div class=\"progress progress-sm\" title=\""+percentage.toFixed(1)+"% of " + data.dns_queries_today + "\"> <div class=\"progress-bar progress-bar-blue\"' 'sources[client] + "</td> <td> <div class=\"progress progress-sm\" title=\""+percentage.toFixed(1)+"% von insgesamt " + data.dns_queries_today + " Anfragen\"> <div class=\"progress-bar progress-bar-blue\"' /var/www/html/admin/scripts/pi-hole/js/index.js
sudo rpl 'Top Clients (blocked only)' 'Top Geräte (nur geblockt)' /var/www/html/admin/index.php
sudo rpl 'sources_blocked[client] + "</td> <td> <div class=\"progress progress-sm\" title=\""+percentage.toFixed(1)+"% of " + data.dns_queries_today + "\"> <div class=\"progress-bar progress-bar-blue\"' 'sources_blocked[client] + "</td> <td> <div class=\"progress progress-sm\" title=\""+percentage.toFixed(1)+"% von insgesamt " + data.dns_queries_today + " Anfragen\"> <div class=\"progress-bar progress-bar-blue\"' /var/www/html/admin/scripts/pi-hole/js/index.js



# Anfragen Protokoll
sudo rpl 'Recent Queries' 'Letzte Anfragen' /var/www/html/admin/queries.php
sudo rpl '$showing = "showing";' '$showing = "zeige";' /var/www/html/admin/queries.php
sudo rpl 'queries for client' 'Anfragen für Gerät' /var/www/html/admin/queries.php
sudo rpl 'up to 100 queries' 'bis zu 100 Anfragen' /var/www/html/admin/queries.php
sudo rpl '<a href=\"?all\">show all</a>' ' oder <a href=\"?all\">zeige alle Anfragen</a>' /var/www/html/admin/queries.php
sudo rpl '"Search:"' '"Suche:"' /var/www/html/admin/scripts/vendor/jquery.dataTables.min.js
sudo rpl '"Show _MENU_ entries"' '"Zeige _MENU_ Einträge"' /var/www/html/admin/scripts/vendor/jquery.dataTables.min.js
sudo rpl '10, 25, 50, 100, "All"' '10, 25, 50, 100, "Alle"' /var/www/html/admin/scripts/pi-hole/js/queries.js
sudo rpl '<th>Time</th>' '<th>Zeit</th>' /var/www/html/admin/queries.php
sudo rpl '<th>Type</th>' '<th>Typ</th>' /var/www/html/admin/queries.php
sudo rpl '<th>Client</th>' '<th>Gerät</th>' /var/www/html/admin/queries.php
sudo rpl '<th>Reply</th>' '<th>Wiederholung</th>' /var/www/html/admin/queries.php
sudo rpl '<th>Action</th>' '<th>Aktion</th>' /var/www/html/admin/queries.php
sudo rpl '"Click to show only " + this.innerHTML + " queries"' '"Klicken Sie hier, um nur " + this.innerHTML + " Anfragen anzuzeigen."' /var/www/html/admin/scripts/pi-hole/js/queries.js
sudo rpl '"Click to show only queries with domain" + this.innerHTML;' '"Klicken Sie hier, um nur Anfragen mit der Domain " + this.innerHTML + " anzuzeigen."; ' /var/www/html/admin/scripts/pi-hole/js/queries.js
sudo rpl '"Click to show only queries made by " + this.innerHTML;' '"Klicken Sie hier, um nur Anfragen anzuzeigen, die von " + this.innerHTML + " angefragt wurden.";' /var/www/html/admin/scripts/pi-hole/js/queries.js
sudo rpl 'Showing _START_ to _END_ of _TOTAL_ entries' 'Zeige _START_ bis _END_ von _TOTAL_ Einträgen' /var/www/html/admin/scripts/vendor/jquery.dataTables.min.js
sudo rpl 'Apply filtering on click on Type, Domain, and Clients' 'Wenden Sie die Filterung an, indem Sie auf Typ, Domain oder Gerät klicken.' /var/www/html/admin/queries.php
sudo rpl '<div class="alProcessing">Adding <span id="alDomain"></span> to the <span id="alList"></span>...</div>' '<div class="alProcessing">Hinzufügen zur <span id="alDomain"></span> to the <span id="alList"></span>...</div>' /var/www/html/admin/queries.php
sudo rpl 'successfully added to the' 'erolgreich hinzugefügt zur' /var/www/html/admin/queries.php
sudo rpl 'Timeout or Network Connection Error!' 'Zeitüberschreitung der Netzwerkfehler!' /var/www/html/admin/queries.php
sudo rpl 'Clear Filters' 'Filter löschen' /var/www/html/admin/queries.php



# Geschwindigkeitstest
sudo rpl 'Adding' 'Hinzufügen' /var/www/html/admin/speedtest.php
sudo rpl 'to the' 'zum' /var/www/html/admin/speedtest.php
sudo rpl 'Success!' 'Erfolgreich!' /var/www/html/admin/speedtest.php
sudo rpl 'Failure! Something went wrong.' 'Fehler! Etwas ist schief gelaufen.' /var/www/html/admin/speedtest.php
sudo rpl 'Recent Speedtests' 'Aktueller Bandbreitentest' /var/www/html/admin/speedtest.php
sudo rpl 'Test Time' 'Testzeit' /var/www/html/admin/speedtest.php
sudo rpl 'End Time' 'Endzeit' /var/www/html/admin/speedtest.php
sudo rpl 'Your IP' 'Ihre IP-Adresse' /var/www/html/admin/speedtest.php
sudo rpl 'Distance' 'Entfernung' /var/www/html/admin/speedtest.php
sudo rpl 'Results' 'Ergebnisse' /var/www/html/admin/speedtest.php
sudo rpl '> View Result</a' '> Ansehen</a' /var/www/html/admin/scripts/pi-hole/js/speedresults.js



# Langzeitdaten
sudo rpl 'Compute graphical statistics from the Pi-hole query database' 'Grafische Statistiken der pi-hole Anfragedatenbank' /var/www/html/admin/db_graph.php
sudo rpl 'Date and time range' 'Datums- und Zeitbereich' /var/www/html/admin/db_graph.php
sudo rpl 'Depending on how large of a range you specified, the request may time out while Pi-hole tries to retrieve all the data.' 'Je nachdem, wie groß der von Ihnen angegebene Bereich ist, tritt möglicherweise eine Zeitüberschreitung auf, während Pi-hole versucht, alle Daten abzurufen.' /var/www/html/admin/db_graph.php
sudo rpl 'Click to select date and time range' 'Klicken Sie zum Auswählen des Datums- und Zeitbereichs' /var/www/html/admin/db_graph.php
sudo rpl '"January"' '"Januar"' /var/www/html/admin/scripts/vendor/jquery-ui.min.js
sudo rpl '"February"' '"Februar"' /var/www/html/admin/scripts/vendor/jquery-ui.min.js
sudo rpl '"March"' '"März"' /var/www/html/admin/scripts/vendor/jquery-ui.min.js
sudo rpl '"May"' '"Mai"' /var/www/html/admin/scripts/vendor/jquery-ui.min.js
sudo rpl '"June"' '"Juni"' /var/www/html/admin/scripts/vendor/jquery-ui.min.js
sudo rpl '"July"' '"Juli"' /var/www/html/admin/scripts/vendor/jquery-ui.min.js
sudo rpl '"October"' '"Oktober"' /var/www/html/admin/scripts/vendor/jquery-ui.min.js
sudo rpl '"December"' '"Dezember"' /var/www/html/admin/scripts/vendor/jquery-ui.min.js
sudo rpl '"Oct","Nov","Dec"' '"Okt","Nov","Dez"' /var/www/html/admin/scripts/vendor/jquery-ui.min.js
sudo rpl '"Monday"' '"Montag"' /var/www/html/admin/scripts/vendor/jquery-ui.min.js
sudo rpl '"Tuesday"' '"Dienstag"' /var/www/html/admin/scripts/vendor/jquery-ui.min.js
sudo rpl '"Wednesday"' '"Mittwoch"' /var/www/html/admin/scripts/vendor/jquery-ui.min.js
sudo rpl '"Thursday"' '"Donnerstag"' /var/www/html/admin/scripts/vendor/jquery-ui.min.js
sudo rpl '"Friday"' '"Freitag"' /var/www/html/admin/scripts/vendor/jquery-ui.min.js
sudo rpl '"Saturday"' '"Samstag"' /var/www/html/admin/scripts/vendor/jquery-ui.min.js
sudo rpl '"Sunday"' '"Sonntag"' /var/www/html/admin/scripts/vendor/jquery-ui.min.js
sudo rpl '"Sun","Mon","Tue","Wed","Thu","Fri","Sat"' '"So","Mo","Di","Mi","Do","Fr","Sa"' /var/www/html/admin/scripts/vendor/jquery-ui.min.js
sudo rpl '"Su","Mo","Tu","We","Th","Fr","Sa"' '"So","Mo","Di","Mi","Do","Fr","Sa"' /var/www/html/admin/scripts/vendor/jquery-ui.min.js
sudo rpl 'Today": ' 'Heute": ' /var/www/html/admin/scripts/pi-hole/js/db_graph.js
sudo rpl 'Yesterday": ' 'Gestern": ' /var/www/html/admin/scripts/pi-hole/js/db_graph.js
sudo rpl 'Last 7 Days": ' 'Letzten 7 Tage": ' /var/www/html/admin/scripts/pi-hole/js/db_graph.js
sudo rpl 'Last 30 Days": ' 'Letzten 30 Tage": ' /var/www/html/admin/scripts/pi-hole/js/db_graph.js
sudo rpl 'This Month": ' 'Dieser Monat": ' /var/www/html/admin/scripts/pi-hole/js/db_graph.js
sudo rpl 'Last Month": ' 'Letzter Monat": ' /var/www/html/admin/scripts/pi-hole/js/db_graph.js
sudo rpl 'This Year": ' 'Dieses Jahr": ' /var/www/html/admin/scripts/pi-hole/js/db_graph.js
sudo rpl 'All Time": ' 'Gesamter Zeitraum": ' /var/www/html/admin/scripts/pi-hole/js/db_graph.js
sudo rpl 'Custom Range' 'Benutzerdefiniert' /var/www/html/admin/scripts/vendor/daterangepicker.js
sudo rpl 'Queries over the selected time period' 'Anfragen über den ausgewählten Zeitraum' /var/www/html/admin/db_graph.php
sudo rpl '"Queries from "+from+" to "+to+" on "' '"Anfragen von "+from+" Uhr bis "+to+" Uhr am "' /var/www/html/admin/scripts/pi-hole/js/db_graph.js
sudo rpl 'Total DNS Queries' 'DNS Anfragen insgesamt' /var/www/html/admin/scripts/pi-hole/js/db_graph.js
sudo rpl 'Blocked DNS Queries' 'Geblockte DNS Anfragen' /var/www/html/admin/scripts/pi-hole/js/db_graph.js
sudo rpl 'Specify date range to be queried from the Pi-hole query database' 'Geben Sie den Datumsbereich an, der aus der pi-hole-Anfragedatenbank abgefragt werden soll.' /var/www/html/admin/db_queries.php
sudo rpl 'Date and time range' 'Datums- und Zeitbereich' /var/www/html/admin/db_queries.php
sudo rpl 'Depending on how large of a range you specified, the request may time out while Pi-hole tries to retrieve all the data.' 'Abhängig davon, wie groß der von Ihnen angegebene Bereich ist, kann die Anforderung ausfallen, während Pi-hole versucht, alle Daten abzurufen.' /var/www/html/admin/db_queries.php
sudo rpl 'Click to select date and time range' 'Klicken Sie zum Auswählen des Datums- und Zeitbereichs' /var/www/html/admin/db_queries.php 
sudo rpl 'Today": ' 'Heute": ' /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl 'Yesterday": ' 'Gestern": ' /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl 'Last 7 Days": ' 'Letzten 7 Tage": ' /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl 'Last 30 Days": ' 'Letzten 30 Tage": ' /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl 'This Month": ' 'Dieser Monat": ' /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl 'Last Month": ' 'Letzter Monat": ' /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl 'This Year": ' 'Dieses Jahr": ' /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl 'All Time": ' 'Gesamter Zeitraum": ' /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl 'Query status' 'Status Anfragen' /var/www/html/admin/db_queries.php
sudo rpl 'Blocked (exact)' 'Geblockt (genau)' /var/www/html/admin/db_queries.php
sudo rpl 'OK (forwarded)' 'OK (weitergeleitet)' /var/www/html/admin/db_queries.php
sudo rpl 'OK (cached)' 'OK (aus dem Speicher geholt)' /var/www/html/admin/db_queries.php
sudo rpl 'Blocked (regex/wildcard)' 'Geblockt (regex/wildcard)' /var/www/html/admin/db_queries.php
sudo rpl 'Blocked (blacklist)' 'Geblockt (Blacklist)' /var/www/html/admin/db_queries.php
sudo rpl 'Blocked (external)' 'Geblockt (extern)' /var/www/html/admin/db_queries.php
sudo rpl 'An unknown error occurred while loading the data.' 'Beim Laden der Daten ist folgender Fehler aufgetreten.' /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl 'Error. Selector types specified using an invalid format.' 'Es wurde keine Auswahl einer Status Anfrage getroffen.' /var/www/html/admin/api_db.php
sudo rpl 'Queries Blocked (Wildcards)' 'Geblockte Anfragen (Wildcard)' /var/www/html/admin/db_queries.php
sudo rpl 'Queries Blocked' 'Geblockte Anfragen' /var/www/html/admin/db_queries.php
sudo rpl 'Queries Total' 'Alle Anfragen' /var/www/html/admin/db_queries.php
sudo rpl 'Recent Queries' 'Letzte Anfragen' /var/www/html/admin/db_queries.php
sudo rpl '10, 25, 50, 100, "All"' '10, 25, 50, 100, "Alle"' /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl '<th>Time</th>' '<th>Zeitpunkt</th>' /var/www/html/admin/db_queries.php
sudo rpl '<th>Type</th>' '<th>Typ</th>' /var/www/html/admin/db_queries.php
sudo rpl '<th>Client</th>' '<th>Gerät</th>' /var/www/html/admin/db_queries.php
sudo rpl '<th>Action</th>' '<th>Aktion</th>' /var/www/html/admin/db_queries.php
sudo rpl 'No data available in table' 'Keine Daten in der Tabelle vorhanden.' /var/www/html/admin/scripts/vendor/jquery.dataTables.min.js
sudo rpl 'Showing 0 to 0 of 0 entries' 'Zeige 0 bis 0 von 0 Einträgen' /var/www/html/admin/scripts/vendor/jquery.dataTables.min.js
sudo rpl 'Compute Top Lists from the Pi-hole query database' 'Top Listen aus der Pi-Hole-Anfragedatenbank berechnen' /var/www/html/admin/db_lists.php
sudo rpl 'Date and time range' 'Datums- und Zeitbereich' /var/www/html/admin/db_lists.php
sudo rpl 'Depending on how large of a range you specified, the request may time out while Pi-hole tries to retrieve all the data.' 'Abhängig davon, wie groß der von Ihnen angegebene Bereich ist, kann die Anforderung ausfallen, während Pi-hole versucht, alle Daten abzurufen.' /var/www/html/admin/db_lists.php
sudo rpl 'Click to select date and time range' 'Klicken Sie zum Auswählen des Datums- und Zeitbereichs' /var/www/html/admin/db_lists.php
sudo rpl 'Today": ' 'Heute": ' /var/www/html/admin/scripts/pi-hole/js/db_lists.js
sudo rpl 'Yesterday": ' 'Gestern": ' /var/www/html/admin/scripts/pi-hole/js/db_lists.js
sudo rpl 'Last 7 Days": ' 'Letzten 7 Tage": ' /var/www/html/admin/scripts/pi-hole/js/db_lists.js
sudo rpl 'Last 30 Days": ' 'Letzten 30 Tage": ' /var/www/html/admin/scripts/pi-hole/js/db_lists.js
sudo rpl 'This Month": ' 'Dieser Monat": ' /var/www/html/admin/scripts/pi-hole/js/db_lists.js
sudo rpl 'Last Month": ' 'Letzter Monat": ' /var/www/html/admin/scripts/pi-hole/js/db_lists.js
sudo rpl 'This Year": ' 'Dieses Jahr": ' /var/www/html/admin/scripts/pi-hole/js/db_lists.js
sudo rpl 'All Time": ' 'Gesamter Zeitraum": ' /var/www/html/admin/scripts/pi-hole/js/db_lists.js
sudo rpl 'Top Blocked Domains' 'Top geblockte Domains' /var/www/html/admin/db_lists.php
sudo rpl 'Top Clients' 'Top Geräte' /var/www/html/admin/db_lists.php
sudo rpl '<th>Hits</th>' '<th>Treffer</th>' /var/www/html/admin/db_lists.php
sudo rpl 'Frequency' 'Häufigkeit' /var/www/html/admin/db_lists.php
sudo rpl '</td> <td>" + data.top_domains[domain] + "</td> <td> <div class=\"progress progress-sm\" title=\""+percentage.toFixed(1)+"% of " + sum + "\"> <div class=\"progress-bar progress-bar-blue\" style=\"width: "' '</td> <td>" + data.top_domains[domain] + "</td> <td> <div class=\"progress progress-sm\" title=\""+percentage.toFixed(1)+"% von insgesamt " + sum + " Domains\"> <div class=\"progress-bar progress-bar-blue\" style=\"width: "' /var/www/html/admin/scripts/pi-hole/js/db_lists.js
sudo rpl '<tr> <td>" + ad + "</td> <td>" + data.top_ads[ad] + "</td> <td> <div class=\"progress progress-sm\" title=\""+percentage.toFixed(1)+"% of " + sum + "\"> <div class=\"progress-bar progress-bar-blue\" style=\"width: "' '<tr> <td>" + ad + "</td> <td>" + data.top_ads[ad] + "</td> <td> <div class=\"progress progress-sm\" title=\""+percentage.toFixed(1)+"% von insgesamt " + sum + " Domains\"> <div class=\"progress-bar progress-bar-blue\" style=\"width: "' /var/www/html/admin/scripts/pi-hole/js/db_lists.js
sudo rpl '</td> <td>" + data.top_sources[client] + "</td> <td> <div class=\"progress progress-sm\" title=\""+percentage.toFixed(1)+"% of " + sum + "\"> <div class=\"progress-bar progress-bar-blue\" style=\"width: "' '</td> <td>" + data.top_sources[client] + "</td> <td> <div class=\"progress progress-sm\" title=\""+percentage.toFixed(1)+"% von insgesamt " + sum + " Anfragen\"> <div class=\"progress-bar progress-bar-blue\" style=\"width: "' /var/www/html/admin/scripts/pi-hole/js/db_lists.js
sudo rpl '<th>Client</th>' '<th>Gerät</th>' /var/www/html/admin/db_lists.php
sudo rpl '<th>Requests</th>' '<th>Anfragen</th>' /var/www/html/admin/db_lists.php



# Whitelist
sudo rpl 'echo "Invalid list parameter"' 'echo "Ungültiger Listenparameter"' /var/www/html/admin/list.php
sudo rpl 'echo "Whitelist"' 'echo "Erlaubte Adressen"' /var/www/html/admin/list.php
sudo rpl 'Add a domain (example.com or sub.example.com)' 'Webseite hinzufügen (z.B. beispiel.com oder mobile.beispiel.com)' /var/www/html/admin/list.php
sudo rpl '<button id="btnAdd" class="btn btn-default" type="button">Add</button>' '<button id="btnAdd" class="btn btn-default" type="button">Hinzufügen</button>' /var/www/html/admin/list.php



# Blacklist
sudo rpl 'echo "Blacklist"' 'echo "Geblockte Adressen"' /var/www/html/admin/list.php
sudo rpl '<button id="btnAdd" class="btn btn-default" type="button">Add (exact)</button>' '<button id="btnAdd" class="btn btn-default" type="button">Hinzufügen (genau)</button>' /var/www/html/admin/list.php
sudo rpl '<button id="btnAddWildcard" class="btn btn-default" type="button">Add (wildcard)</button>' '<button id="btnAddWildcard" class="btn btn-default" type="button">(Wildcard</button>' /var/www/html/admin/list.php
sudo rpl '<button id="btnAddRegex" class="btn btn-default" type="button">Add (regex)</button>' '<button id="btnAddRegex" class="btn btn-default" type="button">(RegEx)</button>' /var/www/html/admin/list.php
sudo rpl 'Adding to the' 'Hinzufügen zu: ' /var/www/html/admin/list.php
sudo rpl 'Success! The list will refresh.' 'Erfolgreich! Die Liste wird aktualisiert.' /var/www/html/admin/list.php
sudo rpl 'Failure! Something went wrong, see output below:' 'Fehlgeschlagen! Etwas ist schief gelaufen, siehe Ausgabe unten:' /var/www/html/admin/list.php
sudo rpl 'At least one domain was already present, see output below:' 'Mindestens eine Domain war bereits vorhanden, siehe Ausgabe unten:' /var/www/html/admin/list.php
sudo rpl '<h3>Exact blocking</h3>' '<h3>Genaues Blocken folgender Adressen:</h3>' /var/www/html/admin/list.php



# Ausschalten
sudo rpl 'Custom disable timeout' 'Benutzerdefinierte Zeit' /var/www/html/admin/scripts/pi-hole/php/footer.php
sudo rpl '/> Secs' '/> Sekunden' /var/www/html/admin/scripts/pi-hole/php/footer.php
sudo rpl '/> Mins' '/> Minuten' /var/www/html/admin/scripts/pi-hole/php/footer.php
sudo rpl '>Close<' '>Schließen<' /var/www/html/admin/scripts/pi-hole/php/footer.php
sudo rpl 'Submit' 'Absenden' /var/www/html/admin/scripts/pi-hole/php/footer.php



# Werkzeuge
sudo rpl 'Update Gravity (list of blocked domains)' 'Aktualisieren der Gravity Liste (Liste der geblockten Domains)' /var/www/html/admin/gravity.php
sudo rpl '>Update<' '>Aktualisieren<' /var/www/html/admin/gravity.php
sudo rpl 'Find Blocked Domain In Lists' 'Gesperrte Domain in einer Liste finden' /var/www/html/admin/queryads.php
sudo rpl 'Domain to look for (example.com or sub.example.com)' 'zu suchende Domain (beispiel.com oder mobile.beispiel.com)' /var/www/html/admin/queryads.php
sudo rpl '<button id="btnSearch" class="btn btn-default" type="button">Search partial match</button>' '<button id="btnSearch" class="btn btn-default" type="button">Suche teilweise Übereinstimmung</button>' /var/www/html/admin/queryads.php
sudo rpl '<button id="btnSearchExact" class="btn btn-default" type="button">Search exact match</button>' '<button id="btnSearchExact" class="btn btn-default" type="button">genaue Übereinstimmung' /var/www/html/admin/queryads.php
sudo rpl 'Audit log (showing live data)' 'Auditprotokoll (zeige Live-Daten)' /var/www/html/admin/auditlog.php
sudo rpl 'Allowed queries' 'Erlaubte Anfragen' /var/www/html/admin/auditlog.php
sudo rpl 'Blocked queries' 'Geblockte Anfragen' /var/www/html/admin/auditlog.php
sudo rpl '<th>Hits</th>' '<th>Treffer</th>' /var/www/html/admin/auditlog.php
sudo rpl '<th>Actions</th>' '<th>Aktionen</th>' /var/www/html/admin/auditlog.php
sudo rpl ' <p><strong>Important:</strong> Note that black- and whitelisted domains are not automatically applied on this page to avoid restarting the DNS service too often. Instead, click on this button, to have the new settings become effective:</p>' ' <p><strong>Wichtig:</strong> Beachten Sie, dass auf dieser Seite nicht automatisch die Black- und Whitelist-Domains angewendet werden, damit ein zu häufiger Neustart des DNS-Dienstes vermieden wird. Klicken Sie stattdessen auf die Schaltfläche, damit die neuen Einstellungen wirksam werden:</p>' /var/www/html/admin/auditlog.php
sudo rpl '>Update black-/whitelists<' '>Aktualisierung der Black- und Whitelist<' /var/www/html/admin/auditlog.php
sudo rpl 'Output the last lines of the pihole.log file (live)' 'Ausgabe der letzten Zeilen der Datei pihole.log (live)' /var/www/html/admin/taillog.php
sudo rpl 'Automatic scrolling on update' 'Automatisches Scrollen beim Update' /var/www/html/admin/taillog.php
sudo rpl 'Output the last lines of the pihole-FTL.log file (live)' 'Ausgabe der letzten Zeilen der Datei pihole-FTL.log (live)' /var/www/html/admin/taillog-FTL.php
sudo rpl 'Automatic scrolling on update' 'Automatisches Scrollen beim Update' /var/www/html/admin/taillog-FTL.php
sudo rpl 'Upload debug log and provide token once finished' 'Laden Sie das Debug-Protokoll hoch und stellen Sie das Token bereit, sobald es fertig ist.' /var/www/html/admin/debug.php
sudo rpl 'Once you click this button a debug log will be generated and can automatically be uploaded if we detect a working internet connection.' 'Sobald Sie auf diese Schaltfläche klicken, wird ein Debug-Protokoll erstellt, das automatisch hochgeladen werden kann, wenn eine funktionierende Internetverbindung erkannt wird.' /var/www/html/admin/debug.php
sudo rpl 'Generate debug log' 'Generiere ein Debug-Protokoll' /var/www/html/admin/debug.php
sudo rpl 'Updating...' 'Aktualisiere ...' /var/www/html/admin/gravity.php
sudo rpl 'Success!' 'Erfolgreich!' /var/www/html/admin/gravity.php


# Netzwerk
sudo rpl '<h3 class="box-title">Network overview</h3>' '<h3 class="box-title">Netzwerkübersicht</h3>' /var/www/html/admin/network.php
sudo rpl '10, 25, 50, 100, "All"' '10, 25, 50, 100, "Alle"' /var/www/html/admin/scripts/pi-hole/js/network.js

sudo rpl '<th>IP address</th>' '<th>IP Adresse</th>' /var/www/html/admin/network.php
sudo rpl '<th>Hardware address</th>' '<th>Hardware Adresse</th>' /var/www/html/admin/network.php
sudo rpl '<th>Interface</th>' '<th>Schnittstelle</th>' /var/www/html/admin/network.php
sudo rpl '<th>First seen</th>' '<th>Zum ersten Mal gesehen</th>' /var/www/html/admin/network.php
sudo rpl '<th>Last Query</th>' '<th>Letzte Anfrage</th>' /var/www/html/admin/network.php
sudo rpl '<th>Number of queries</th>' '<th>Anzahl der Anfragen</th>' /var/www/html/admin/network.php
sudo rpl '<th>Uses Pi-hole</th>' '<th>Verwendet Pi-hole</th>' /var/www/html/admin/network.php
sudo rpl 'Click to show recent queries made by' 'Klicken Sie hier, für die letzten Anfragen von' /var/www/html/admin/scripts/pi-hole/js/network.js
sudo rpl '<label>Background color: Last query from this device seen ...</label>' '<label>Hintergrundfarbe: Letzte Anfrage von diesem Gerät gesehen ...</label>' /var/www/html/admin/network.php
sudo rpl '>just now<' '>Im Moment<' /var/www/html/admin/network.php
sudo rpl '... to ...' '... zu ...' /var/www/html/admin/network.php
sudo rpl '>24 hours ago' '>vor 24 Stunden' /var/www/html/admin/network.php
sudo rpl '>&gt; 24 hours ago' '>vor mehr als 24 Stunden' /var/www/html/admin/network.php
sudo rpl 'Device does not use Pi-hole' 'Gerät verwendet nicht Pi-hole' /var/www/html/admin/network.php



# Einstellungen
  #
sudo rpl 'Info<' 'Information<' /var/www/html/admin/settings.php
sudo rpl 'Error<' 'Fehler<' /var/www/html/admin/settings.php

  # System
sudo rpl 'The PHP extension <code>Phar</code> is not loaded. Please ensure it is installed and loaded if you want to use the Pi-hole teleporter.' 'Die PHP-Erweiterung <code>Phar</code> ist nicht geladen. Bitte stellen Sie sicher, dass es installiert und geladen ist, wenn Sie den Pi-hole-Teleporter verwenden möchten.' /var/www/html/admin/settings.php
sudo rpl '<h3 class="box-title">Network Information</h3>' '<h3 class="box-title">Netzwerk Informationen</h3>' /var/www/html/admin/settings.php
sudo rpl '<th scope="row">Pi-hole Ethernet Interface:</th>' '<th scope="row">Pi-hole Ethernet Schnittstelle:</th>' /var/www/html/admin/settings.php
sudo rpl '<th scope="row">Pi-hole IPv4 address:</th>' '<th scope="row">Pi-hole IPv4 Adresse:</th>' /var/www/html/admin/settings.php
sudo rpl '<th scope="row">Pi-hole IPv6 address:</th>' '<th scope="row">Pi-hole IPv6 Adresse:</th>' /var/www/html/admin/settings.php
sudo rpl '<th scope="row">Pi-hole hostname:</th>' '<th scope="row">Pi-hole Hostname:</th>' /var/www/html/admin/settings.php
sudo rpl '<h3 class="box-title">FTL Information</h3>' '<h3 class="box-title">FTL Informationen</h3>' /var/www/html/admin/settings.php
sudo rpl '<th scope="row">FTL version:</th>' '<th scope="row">FTL Version:</th>' /var/www/html/admin/settings.php
sudo rpl '<th scope="row">Process identifier (PID):</th>' '<th scope="row">Prozesskennung (PID):</th>' /var/www/html/admin/settings.php
sudo rpl '<th scope="row">Time FTL started:</th>' '<th scope="row">FTL gestartet am:</th>' /var/www/html/admin/settings.php
sudo rpl '<th scope="row">User / Group:</th>' '<th scope="row">Benutzer / Gruppe:</th>' /var/www/html/admin/settings.php
sudo rpl '<th scope="row">Total CPU utilization:</th>' '<th scope="row">Gesamte CPU Auslastung:</th>' /var/www/html/admin/settings.php
sudo rpl '<th scope="row">Memory utilization:</th>' '<th scope="row">Speicher Auslastung:</th>' /var/www/html/admin/settings.php
sudo rpl '<span title="Resident memory is the portion of memory occupied by a process that is held in main memory (RAM). The rest of the occupied memory exists in the swap space or file system.">Used memory:</span>' '<span title="Der residente Speicher ist der Teil des Speichers, der von einem Prozess belegt wird, der im Hauptspeicher (RAM) gespeichert ist. Der Rest des belegten Speichers befindet sich im Auslagerungsspeicher oder im Dateisystem.">Benutzter Speicher:</span>' /var/www/html/admin/settings.php
sudo rpl '<span title="Size of the DNS domain cache">DNS cache size:</span>' '<span title="Size of the DNS domain cache">DNS Cache Größe:</span>' /var/www/html/admin/settings.php
sudo rpl '<span title="Number of cache insertions">DNS cache insertions:</span>' '<span title="Anzahl der Einträge im Cache">DNS Cache Einträge:</span>' /var/www/html/admin/settings.php
sudo rpl '<span title="Number of cache entries that had to be removed although they are not expired (increase cache size to reduce this number)">DNS cache evictions:</span>' '<span title="Anzahl der Cache Einträge, die entfernt werden mussten, obwohl sie nicht abgelaufen sind (erhöhen Sie die Cache Größe, um diese Anzahl zu verringern).">DNS Cache Entfernungen:</span>' /var/www/html/admin/settings.php
sudo rpl 'See also our <a href="https://docs.pi-hole.net/ftldns/dns-cache/" target="_blank">DNS cache documentation</a>.' 'Siehe auch unsere <a href="https://docs.pi-hole.net/ftldns/dns-cache/" target="_blank">DNS Cache Dokumentation</a>.' /var/www/html/admin/settings.php
sudo rpl '<h3 class="box-title">Danger Zone!</h3><br/>' '<center><h3 class="box-title"><font color="red"><strong>Gefahrenzone!</strong></font></h3><br/></center>' /var/www/html/admin/settings.php
sudo rpl '<button type="button" class="btn btn-warning confirm-disablelogging-noflush form-control">Disable query logging</button>' '<button type="button" class="btn btn-warning confirm-disablelogging-noflush form-control">Deaktiviere Anfrageprotokollierung</button>' /var/www/html/admin/settings.php
sudo rpl 'Enable query logging' 'Aktivieren der Abfrageprotokollierung' /var/www/html/admin/settings.php
sudo rpl '<button type="button" class="btn btn-danger confirm-flushlogs form-control">Flush logs</button>' '<button type="button" class="btn btn-danger confirm-flushlogs form-control">Protokolleinträge löschen</button>' /var/www/html/admin/settings.php
sudo rpl '<button type="button" class="btn btn-danger confirm-disablelogging form-control">Disable query logging and flush logs</button>' '<button type="button" class="btn btn-danger confirm-disablelogging form-control">Deakt. Anfrageprotokoll und Einträge löschen</button>' /var/www/html/admin/settings.php
sudo rpl '<button type="button" class="btn btn-danger confirm-poweroff form-control">Power off system</button>' '<button type="button" class="btn btn-danger confirm-poweroff form-control">System ausschalten' /var/www/html/admin/settings.php
sudo rpl 'The system will poweroff in 5 seconds...' 'Das System schaltet sich in 5 Sekunden aus ...' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl '<button type="button" class="btn btn-warning confirm-restartdns form-control">Restart DNS resolver</button>' '<button type="button" class="btn btn-warning confirm-restartdns form-control">DNS-Auflösung neustarten</button>' /var/www/html/admin/settings.php
sudo rpl 'The Pi-hole log file has been flushed' 'Die Pi-hole Protokolldatei wurde geleert.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl '<button type="button" class="btn btn-danger confirm-reboot form-control">Restart system</button>' '<button type="button" class="btn btn-danger confirm-reboot form-control">System neustarten</button>' /var/www/html/admin/settings.php
sudo rpl 'The system will reboot in 5 seconds...' 'Das System startet in 5 Sekunden neu ...' /var/www/html/admin/scripts/pi-hole/php/savesettings.php

  # Blocklist
sudo rpl '>Blocklists</a>' '>Sperrlisten</a>' /var/www/html/admin/settings.php
sudo rpl "Blocklists used to generate Pi-hole's Gravity:" "Anzahl der Sperrlisten:" /var/www/html/admin/settings.php
sudo rpl '<th>Enabled</th>' '<th>Auswählen</th>' /var/www/html/admin/settings.php
sudo rpl '<th>List</th>' '<th>Sperrliste</th>' /var/www/html/admin/settings.php
sudo rpl '<th style="width:1%">Delete</th>' '<th style="width:1%">Löschen</th>' /var/www/html/admin/settings.php
sudo rpl 'Enter one URL per line to add new blocklists' 'Geben Sie eine URL pro Zeile ein, um neue Sperrlisten hinzuzufügen.' /var/www/html/admin/settings.php
sudo rpl '<button type="submit" class="btn btn-primary" name="submit" value="save" id="blockinglistsave">Save</button>' '<button type="submit" class="btn btn-primary" name="submit" value="save" id="blockinglistsave">Speichern</button>' /var/www/html/admin/settings.php
sudo rpl "done!" '.' /var/www/html/admin/settings.php
sudo rpl "<span><strong>Important: </strong>Save and Update when you're .</span>" '<span><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Wichtig: </strong>Speichern und aktualisieren Sie, wenn Sie fertig sind.</span>' /var/www/html/admin/settings.php
sudo rpl '>Save and Update<' '>Speichern und aktualisieren<' /var/www/html/admin/settings.php

  # DNS
sudo rpl '<h1 class="box-title">Upstream DNS Servers</h1>' '<h1 class="box-title">Upstream DNS-Server</h1>' /var/www/html/admin/settings.php
sudo rpl '<label>Custom 1 (IPv4)</label>' '<label>Benutzerdefiniert 1 (IPv4)</label>' /var/www/html/admin/settings.php
sudo rpl '<label>Custom 2 (IPv4)</label>' '<label>Benutzerdefiniert 2 (IPv4)</label>' /var/www/html/admin/settings.php
sudo rpl '<label>Custom 3 (IPv6)</label>' '<label>Benutzerdefiniert 3 (IPv6)</label>' /var/www/html/admin/settings.php
sudo rpl '<label>Custom 4 (IPv6)</label>' '<label>Benutzerdefiniert 4 (IPv6)</label>' /var/www/html/admin/settings.php
sudo rpl '<h1 class="box-title">Interface listening behavior</h1>' '<h1 class="box-title">Abhörverhalten der Schnittstelle</h1>' /var/www/html/admin/settings.php
sudo rpl '<br>Allows only queries from devices that are at most one hop away (local devices)</label>' '<br>Ermöglicht nur Anfragen von Geräten, die höchstens einen Sprung entfernt sind (lokale Geräte).</label>' /var/www/html/admin/settings.php
sudo rpl '<strong>Listen on all interfaces</strong>' '<strong>Höre an allen Schnittstellen</strong>' /var/www/html/admin/settings.php
sudo rpl '<strong>Listen only on interface <?php echo htmlentities($piHoleInterface); ?></strong>' '<strong>Höre nur an Schnittstelle: <?php echo htmlentities($piHoleInterface); ?></strong>' /var/www/html/admin/settings.php
sudo rpl '<strong>Listen on all interfaces, permit all origins</strong>' '<strong>Höre auf allen Schnittstellen, lasse alle Quellen zu.</strong>' /var/www/html/admin/settings.php
sudo rpl '<p>Note that the last option should not be used on devices which are' '<p>Beachten Sie, dass die letzte Option nicht auf Geräten verwendet werden' /var/www/html/admin/settings.php
sudo rpl 'directly connected to the Internet. This option is safe if your' 'sollte, die direkt mit dem Internet verbunden sind. Diese Option ist sicher,' /var/www/html/admin/settings.php
sudo rpl 'Pi-hole is located within your local network, i.e. protected behind' 'wenn sich Ihr Pi-hole in Ihrem lokalen Netzwerk befindet, d.h. hinter Ihrem' /var/www/html/admin/settings.php
sudo rpl 'your router, and you have not forwarded port 53 to this device. In' 'Router geschützt ist und Sie den Port 53 nicht an dieses Gerät weitergeleitet' /var/www/html/admin/settings.php
sudo rpl 'virtually all other cases you have to make sure that your Pi-hole is' 'haben. In praktisch allen anderen Fällen müssen Sie sicherstellen, dass Ihr' /var/www/html/admin/settings.php
sudo rpl 'properly firewalled.</p>' 'Pi-hole ordnungsgemäß mit einer Firewall versehen ist.</p>' /var/www/html/admin/settings.php
sudo rpl '<p>ECS (Extended Client Subnet) defines a mechanism for recursive resolvers to send partial client IP address information to authoritative DNS name servers. Content Delivery Networks (CDNs) and latency-sensitive services use this to give geo-located responses when responding to name lookups coming through public DNS resolvers. <em>Note that ECS may result in reduced privacy.</em></p>' '<p>ECS (Extended Client Subnet) definiert einen Mechanismus für rekursive Resolver, um teilweise IP-Adressinformationen des Clients an autorisierende DNS-Nameserver zu senden. Content Delivery Networks (CDNs) und latenzempfindliche Dienste verwenden diese Option, um geografische Antworten auf Namenssuchen zu geben, die über öffentliche DNS-Resolver eingehen. <em>Beachten Sie, dass ECS die Privatsphäre beeinträchtigen kann.</em></p>' /var/www/html/admin/settings.php
sudo rpl '<h3 class="box-title">Advanced DNS settings</h3>' '<h3 class="box-title">Erweiterte DNS-Einstellungen</h3>' /var/www/html/admin/settings.php
sudo rpl '>>Never forward non-FQDNs</label>' '>>Niemals Nicht-FQDNs weiterleiten</label>' /var/www/html/admin/settings.php
sudo rpl '>>Never forward reverse lookups for private IP ranges</label>' '>>Niemals Reverse-Lookups für private IP-Bereiche weiterleiten</label>' /var/www/html/admin/settings.php
sudo rpl '<p>Note that enabling these two options may increase your privacy' '<p>Beachten Sie, dass das Aktivieren dieser beiden Optionen Ihre Privatsphäre' /var/www/html/admin/settings.php
sudo rpl 'slightly, but may also prevent you from being able to access' 'geringfügig verbessern kann, Sie jedoch auch daran hindern kann, auf lokale' /var/www/html/admin/settings.php
sudo rpl 'local hostnames if the Pi-hole is not used as DHCP server</p>' 'Hostnamen zuzugreifen, wenn Pi-hole nicht als DHCP-Server verwendet wird.</p>' /var/www/html/admin/settings.php
sudo rpl '>>Use DNSSEC</label>' '>>Verwende DNSSEC</label>' /var/www/html/admin/settings.php
sudo rpl '<p>Validate DNS replies and cache DNSSEC data. When forwarding DNS' '<p>Überprüfen Sie die DNS-Antworten und speichern Sie die DNSSEC-Daten im Cache.' /var/www/html/admin/settings.php
sudo rpl 'queries, Pi-hole requests the DNSSEC records needed to validate' 'Bei der Weiterleitung von DNS Anfragen fordert Pi-hole die zur Validierung' /var/www/html/admin/settings.php
sudo rpl 'the replies. If a domain fails validation or the upstream does not' 'erforderlichen DNSSEC-Datensätze Einträge an. Wenn eine Domain die' /var/www/html/admin/settings.php
sudo rpl 'support DNSSEC, this setting can cause issues resolving domains.' 'Validierung nicht besteht oder der Upstream DNSSEC nicht unterstützt,' /var/www/html/admin/settings.php
sudo rpl 'Use Google, Cloudflare, DNS.WATCH, Quad9, or another DNS' 'kann diese Einstellung Probleme beim Auflösen von Domänen verursachen. Verwenden' /var/www/html/admin/settings.php
sudo rpl 'server which supports DNSSEC when activating DNSSEC. Note that' 'Sie Google, Cloudflare, DNS.WATCH, Quad9 oder einen anderen DNS Server,' /var/www/html/admin/settings.php
sudo rpl 'the size of your log might increase significantly' 'der DNSSEC unterstützt, wenn DNSSEC aktiviert wird. Beachten Sie, dass die Größe' /var/www/html/admin/settings.php
sudo rpl 'when enabling DNSSEC. A DNSSEC resolver test can be found' 'Ihres Protokolls erheblich beim Aktivieren von DNSSEC zunehmen kann.' /var/www/html/admin/settings.php
sudo rpl '<a href="http://dnssec.vs.uni-due.de/" target="_blank">here</a>.</p>' 'Einen DNSSEC-Resolvertest finden Sie <a href="http://dnssec.vs.uni-due.de/" target="_blank">hier</a>.</p>' /var/www/html/admin/settings.php
sudo rpl '<label>Conditional Forwarding</label>' '<label>Bedingte Weiterleitung</label>' /var/www/html/admin/settings.php
sudo rpl "<p>If not configured as your DHCP server, Pi-hole won't be able to" '<p>Wenn Pi-hole nicht als DHCP-Server konfiguriert ist kann,' /var/www/html/admin/settings.php
sudo rpl 'determine the names of devices on your local network.  As a' 'es die Namen der Geräte in Ihrem lokalen Netzwerk nicht ermitteln. Daher' /var/www/html/admin/settings.php
sudo rpl 'result, tables such as Top Clients will only show IP addresses.</p>' 'werden in den Tabellen der Top Geräte nur die IP-Adressen angezeigt.</p>' /var/www/html/admin/settings.php
sudo rpl '<p>One solution for this is to configure Pi-hole to forward these' '<p>Eine Lösung hierfür besteht darin, Pi-hole so zu konfigurieren, dass die Anfragen' /var/www/html/admin/settings.php
sudo rpl 'requests to your DHCP server (most likely your router), but only for devices on your' 'an Ihren DHCP-Server (höchstwahrscheinlich an Ihren Router) weitergeleitet werden, jedoch' /var/www/html/admin/settings.php
sudo rpl 'home network.  To configure this we will need to know the IP' 'nur für Geräte in Ihrem Heimnetzwerk. Um dies zu konfigurieren, müssen wir die IP-Adresse' /var/www/html/admin/settings.php
sudo rpl 'address of your DHCP server and the name of your local network.</p>' 'Ihres DHCP-Servers und den Namen Ihres lokalen Netzwerks kennen.</p>' /var/www/html/admin/settings.php
sudo rpl '<p>Note: The local domain name must match the domain name specified' '<p>Hinweis: Der lokale Domänenname muss mit dem in Ihrem DHCP-Server angegebenen Domänennamen' /var/www/html/admin/settings.php
sudo rpl 'in your DHCP server, likely found within the DHCP settings.</p>' 'übereinstimmen, der wahrscheinlich in den DHCP-Einstellungen enthalten ist.</p>' /var/www/html/admin/settings.php
sudo rpl '>>Use Conditional Forwarding</label>' '>>Verwende bedingtes Weiterleiten</label>' /var/www/html/admin/settings.php
sudo rpl '<th>IP of your router</th>' '<th>IP-Adresse Ihres Routers (z.B. 192.168.178.1)</th>' /var/www/html/admin/settings.php
sudo rpl '<th>Local domain name</th>' '<th>Lokaler Domänenname (z.B. fritz.box)</th>' /var/www/html/admin/settings.php
sudo rpl '>Save</button>' '>Speichern</button>' /var/www/html/admin/settings.php
sudo rpl 'The DNS settings have been updated (using ".$DNSservercount." DNS servers)' 'Die DNS Einstellungen wurden aktualisiert (es wird ".$DNSservercount." DNS Server benutzt).' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'Conditional forwarding IP (".htmlspecialchars($_POST["conditionalForwardingIP"]).") is invalid!' 'Die bedingte Weiterleitungs-IP (".htmlspecialchars($_POST["conditionalForwardingIP"]).") ist ungültig!' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl '"Conditional forwarding domain name (".htmlspecialchars($_POST["conditionalForwardingDomain"]).") is invalid!<br>"' '"Der bedingte Weiterleitungs-Domain Name (".htmlspecialchars($_POST["conditionalForwardingDomain"]).") ist ungültig!<br>"' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'The DNS server has been restarted' 'Der DNS-Server wurde neu gestartet.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'No DNS server has been selected.' 'Es wurde kein DNS Server ausgewählt.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'The settings have been reset to their previous values' 'Die Einstellungen wurden auf ihre vorherigen Werte zurückgesetzt.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'Logging has been disabled and logs have been flushed' 'Die Protokollierung wurde deaktiviert und die Protokolle wurden gelöscht.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'Logging has been disabled, your logs have <strong>not</strong> been flushed' 'Die Protokollierung wurde deaktiviert, Ihre Protokolle wurden <strong>nicht</strong> gelöscht.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'Logging has been enabled' 'Die Protokollierung wurde aktiviert.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'Top Domains/Ads entry ".htmlspecialchars($domain)." is invalid (use only domains)!<br>' 'Top Domain Eintrag ".htmlspecialchars($domain)." ist ungültig (nur Domains verwenden)!<br>' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'Top Clients entry ".htmlspecialchars($client)." is invalid (use only host names and IP addresses)!<br>' 'Top Client Eintrag ".htmlspecialchars($client)." ist ungültig (verwende nur Hostnamen und IP-Adressen)!<br>' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl '"IP (".htmlspecialchars($IP).") is invalid!<br>"' '"IP (".htmlspecialchars($IP).") ist ungültig!<br>"' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl '"Port (".htmlspecialchars($port).") is invalid!<br>"' '"Port (".htmlspecialchars($port).") ist ungültig!<br>"' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'IP address (".htmlspecialchars($ip).") is invalid!<br>' 'Die IP-Adresse (".htmlspecialchars($ip).") ist ungültig!<br>' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'Host name (".htmlspecialchars($hostname).") is invalid!<br>' 'Der Hostname (".htmlspecialchars($hostname).") ist ungültig!<br>' /var/www/html/admin/scripts/pi-hole/php/savesettings.php

  # DHCP
sudo rpl '<h3 class="box-title">DHCP Settings</h3>' '<h3 class="box-title">DHCP Einstellungen</h3>' /var/www/html/admin/settings.php
sudo rpl 'DHCP server enabled</label>' 'DHCP Server einschalten</label>' /var/www/html/admin/settings.php
sudo rpl "Make sure your router's DHCP server is disabled when using the Pi-hole DHCP server!" 'Vergewissern Sie sich, dass der DHCP-Server Ihres Routers deaktiviert ist, wenn Sie den Pi-hole DHCP-Server verwenden!' /var/www/html/admin/settings.php
sudo rpl '<label>Range of IP addresses to hand out</label>' '<label>Bereich der zu verteilenden IP-Adressen</label>' /var/www/html/admin/settings.php
sudo rpl '<div class="input-group-addon">From</div>' '<div class="input-group-addon">Von</div>' /var/www/html/admin/settings.php
sudo rpl '<div class="input-group-addon">To</div>' '<div class="input-group-addon">Bis</div>' /var/www/html/admin/settings.php
sudo rpl '<label>Router (gateway) IP address</label>' '<label>IP Adresse des Routers (z.B. 192.168.178.1)</label>' /var/www/html/admin/settings.php
sudo rpl '<h3 class="box-title">Advanced DHCP settings</h3>' '<h3 class="box-title">Erweiterte DHCP Einstellungen</h3>' /var/www/html/admin/settings.php
sudo rpl 'Pi-hole domain name' 'Pi-hole Domänenname' /var/www/html/admin/settings.php
sudo rpl 'DHCP lease time' 'DHCP Leasingzeit' /var/www/html/admin/settings.php
sudo rpl 'Lease time in hours' 'Leasingzeit in Stunden' /var/www/html/admin/settings.php
sudo rpl 'Hint: 0 = infinite, 24 = one day, 168 = one week, 744 = one month, 8760 = one year' 'Hinweis: 0 = unendlich, 24 = ein Tag, 168 = eine Woche, 744 = einen Monat, 8760 = ein Jahr' /var/www/html/admin/settings.php
sudo rpl 'Enable IPv6 support (SLAAC + RA)' 'Aktiviere IPv6 Unterstützung (SLAAC + RA)' /var/www/html/admin/settings.php
sudo rpl 'Enable DHCP rapid commit (fast address assignment)' 'DHCP-Schnellübertragung aktivieren (schnelle Adresszuweisung)' /var/www/html/admin/settings.php
sudo rpl '<h3 class="box-title">DHCP leases</h3>' '<h3 class="box-title">DHCP Leases</h3>' /var/www/html/admin/settings.php
sudo rpl '<label>Currently active DHCP leases</label>' '<label>Derzeit aktive DHCP-Leases</label>' /var/www/html/admin/settings.php
sudo rpl '<th>MAC address</th>' '<th>MAC Addresse</th>' /var/www/html/admin/settings.php
sudo rpl '<th>IP address</th>' '<th>IP Adresse</th>' /var/www/html/admin/settings.php
sudo rpl 'Static DHCP leases configuration' 'Einstellungen für statische DHCP Leases' /var/www/html/admin/settings.php
sudo rpl 'Static release for MAC address (".htmlspecialchars($mac).") already defined!' 'Statische Freigabe für MAC Adresse (".htmlspecialchars($mac).") ist bereits definiert!' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'Static lease for IP address (".htmlspecialchars($ip).") already defined!' 'Statisches Leasing für IP Adresse (".htmlspecialchars($ip).") ist bereits definiert!' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'Static lease for hostname (".htmlspecialchars($hostname).") already defined!' 'Statisches Leasing für Hostname (".htmlspecialchars($hostname).") ist bereits definiert!' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'A new static address has been added' 'Eine neue statische Adresse wurde hinzugefügt.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'The static address with MAC address ".htmlspecialchars($mac)." has been removed' 'Die statische Adresse mit der MAC-Adresse ".htmlspecialchars ($mac)." wurde entfernt.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'From IP (".htmlspecialchars($from).") is invalid!' 'Von IP (".htmlspecialchars($from).") ist ungültig!' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'To IP (".htmlspecialchars($to).") is invalid!' 'Bis IP (".htmlspecialchars($to).") ist ungültig!' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'Router IP (".htmlspecialchars($router).") is invalid!' 'Die IP des Routers (".htmlspecialchars($router).") ist ungültig!' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'Domain name ".htmlspecialchars($domain)." is invalid!' 'Der Domian Name ".htmlspecialchars($domain)." ist ungültig!' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'Lease time ".htmlspecialchars($leasetime)." is invalid!' 'Die Lease Zeit ".htmlspecialchars($leasetime)." ist ungültig!' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'The privacy level has been decreased and the DNS resolver has been restarted' 'Die Datenschutzstufe wurde gesenkt und der DNS-Resolver wurde neu gestartet.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'The privacy level has been increased' 'Die Datenschutzstufe wurde erhöht.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'The privacy level has been not been changed' 'Die Datenschutzstufe wurde nicht geändert.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'Invalid privacy level (".$level.")!' 'Ungültige Datenschutzstufe (".$level.")!' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl '"MAC address (".htmlspecialchars($mac).") is invalid!<br>"' '"Die MAC-Adresse (".htmlspecialchars($mac).") ist ungültig!<br>"' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl '"You can not omit both the IP address and the host name!<br>"' '"Sie können nicht sowohl die IP-Adresse als auch den Hostnamen weglassen!<br>"' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl '"There was a problem applying your settings.<br>Debugging information:<br>PHP error' '"Es gab ein Problem bei der Anwendung Ihrer Einstellungen.<br>Informationen zur Fehlersuche:<br>PHP Fehler' /var/www/html/admin/settings.php
sudo rpl '<p>Specifying the MAC address is mandatory and only one entry per MAC' '<p>Die Angabe der MAC-Adresse ist obligatorisch und nur ein Eintrag' /var/www/html/admin/settings.php
sudo rpl 'address is allowed. If the IP address is omitted and a host name is' 'pro MAC-Adresse ist erlaubt. Wenn die IP-Adresse weggelassen wird' /var/www/html/admin/settings.php
sudo rpl 'given, the IP address will still be generated dynamically and the' 'und ein Hostname angegeben wird, wird die IP-Adresse weiterhin dynamisch' /var/www/html/admin/settings.php
sudo rpl 'specified host name will be used. If the host name is omitted, only' 'generiert und der angegebene Hostname verwendet. Wenn der Hostname' /var/www/html/admin/settings.php
sudo rpl 'a static lease will be added.</p>' 'weggelassen wird, wird nur eine statisches Lease hinzugefügt.</p>' /var/www/html/admin/settings.php
sudo rpl 'The DHCP server has been activated' 'Der DHCP-Server wurde aktiviert.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'The DHCP server has been deactivated' 'Der DHCP-Server wurde deaktiviert.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php

  # API / Web interface
sudo rpl 'API / Web interface' 'API / Weboberfläche' /var/www/html/admin/settings.php
sudo rpl 'API settings' 'API Einstellungen' /var/www/html/admin/settings.php
sudo rpl 'Top Lists' 'Top Listen' /var/www/html/admin/settings.php
sudo rpl 'Exclude the following domains from being shown in' 'Schließen Sie die folgenden Domänen von der Anzeige aus:' /var/www/html/admin/settings.php
sudo rpl 'Top Domains / Top Advertisers' 'Top Domains / Top Inserenten' /var/www/html/admin/settings.php
sudo rpl '<label>Top Clients</label>' '<label>Top Geräte</label>' /var/www/html/admin/settings.php
sudo rpl 'Enter one domain per line' 'Geben Sie eine Domain pro Zeile ein' /var/www/html/admin/settings.php
sudo rpl 'Enter one IP address or host name per line' 'Geben Sie eine IP Adresse oder einen Hostnamen pro Zeile ein' /var/www/html/admin/settings.php
sudo rpl 'Web interface settings' 'Einstellungen für die Weboberfläche' /var/www/html/admin/settings.php
sudo rpl 'Interface appearance' 'Erscheinungsbild der Weboberfläche' /var/www/html/admin/settings.php
sudo rpl 'Use boxed layout (helpful when working on large screens)' 'Boxed Layout verwenden (hilfreich bei der Arbeit auf großen Bildschirmen)' /var/www/html/admin/settings.php
sudo rpl 'CPU Temperature Unit' 'Einheit für die CPU Temperaturanzeige' /var/www/html/admin/settings.php
sudo rpl 'Administrator Email Address' 'E-Mail des Administrators' /var/www/html/admin/settings.php
sudo rpl 'Query Log' 'Anfrageprotokoll' /var/www/html/admin/settings.php
sudo rpl 'Show permitted domain entries' 'Zulässige Domain-Einträge anzeigen' /var/www/html/admin/settings.php
sudo rpl 'Show blocked domain entries' 'Geblockte Domain-Einträge anzeigen' /var/www/html/admin/settings.php
sudo rpl 'Show API token' 'API-Token anzeigen' /var/www/html/admin/settings.php
sudo rpl 'The API settings have been updated' 'Die API-Einstellungen wurden aktualisiert.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'All entries will be shown in Query Log' 'Alle Einträge werden im Anfrageprotokoll angezeigt.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'Only blocked entries will be shown in Query Log' 'Im Anfrageprotokoll werden nur gesperrte Einträge angezeigt.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'Only permitted will be shown in Query Log' 'Nur erlaubte werden im Abfrageprotokoll angezeigt.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'No entries will be shown in Query Log' 'Es werden keine Einträge im Anfrageprotokoll angezeigt.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'Administrator email address (".htmlspecialchars($adminemail).") is invalid!<br>' 'Die E-Mail des Administrators (".htmlspecialchars($adminemail).") ist ungültig!<br>' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'The webUI settings have been updated' 'Die Einstellungen der Weboberfläche wurden aktualisiert.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php



  # Privacy
sudo rpl '>Privacy<' '>Privatsphäre<' /var/www/html/admin/settings.php
sudo rpl 'Privacy settings' 'Einstellungen für Privatsphäre' /var/www/html/admin/settings.php
sudo rpl 'DNS resolver privacy level' 'DNS-Resolver Datenschutzstufe' /var/www/html/admin/settings.php
sudo rpl 'Specify if DNS queries should be anonymized, available options are:' 'Geben Sie an, ob DNS-Anfragen anonymisiert werden sollen. Folgende Optionen sind verfügbar:' /var/www/html/admin/settings.php
sudo rpl 'Show everything and record everything<br>Gives maximum amount of statistics' 'Alles anzeigen und alles aufzeichnen. Gibt die maximale Anzahl von Statistiken aus.' /var/www/html/admin/settings.php
sudo rpl 'Hide domains: Display and store all domains as "hidden"<br>This disables the Top Domains and Top Ads tables on the dashboard' 'Domains verbergen: Alle Domains werden als "versteckt" angezeigt und gespeichert.<br>Dadurch werden die Tabellen "Top Domains" und "Top Ads" im Dashboard deaktiviert.' /var/www/html/admin/settings.php
sudo rpl 'Hide domains and clients: Display and store all domains as "hidden" and all clients as "0.0.0.0"<br>This disables all tables on the dashboard' 'Domains verbergen: Anzeigen und Speichern aller Domains als "versteckt".<br>Dadurch werden die Tabellen "Top Domains" und "Top Ads" im Dashboard deaktiviert' /var/www/html/admin/settings.php
sudo rpl 'Anonymous mode: This disables basically everything except the live anonymous statistics<br>No history is saved at all to the database, and nothing is shown in the query log. Also, there are no top item lists.' 'Anonymer Modus: Deaktiviert im Grunde alles außer den anonymen Live-Statistiken.<br>Es wird überhaupt kein Verlauf in der Datenbank gespeichert und im Anfrageprotokoll wird nichts angezeigt. Es gibt auch keine Top-Item-Listen.' /var/www/html/admin/settings.php
sudo rpl 'No Statistics mode: This disables all statistics processing. Even the query counters will not be available.<br><strong>Note that regex blocking is not available when query analyzing is disabled.</strong><br>Additionally, you can disable logging to the file <code>/var/log/pihole.log</code> using <code>sudo pihole logging off</code>.</label>' 'Kein Statistikmodus: Hiermit wird die gesamte Statistikverarbeitung deaktiviert. Sogar die Anfragezähler sind nicht verfügbar.<br><strong> Beachten Sie, dass die Regex-Blockierung nicht verfügbar ist, wenn die Anfrageanalyse deaktiviert ist.</Strong><br>Darüber hinaus können Sie die Protokollierung in der Datei<code>/var/log/pihole.log</code> mit <code> sudo pihole logout</code> deaktivieren.</label>' /var/www/html/admin/settings.php
sudo rpl 'The privacy level may be increased at any time without having to restart the DNS resolver. However, note that the DNS resolver needs to be restarted when lowering the privacy level. This restarting is automatically done when saving.' 'Die Datenschutzstufe kann jederzeit erhöht werden, ohne dass der DNS-Resolver neu gestartet werden muss. Beachten Sie jedoch, dass der DNS-Resolver neu gestartet werden muss, wenn die Datenschutzstufe gesenkt wird. Dieser Neustart erfolgt automatisch beim Speichern.' /var/www/html/admin/settings.php
sudo rpl 'Apply' 'Anwenden' /var/www/html/admin/settings.php

  # Teleporter
sudo rpl 'Export your Pi-hole lists as downloadable archive' 'Exportieren Sie Ihre Pi-hole-Listen als herunterladbares Archiv:' /var/www/html/admin/settings.php
sudo rpl '>Export<' '>Exportieren<' /var/www/html/admin/settings.php
sudo rpl 'Import ...' 'Importieren ...' /var/www/html/admin/settings.php
sudo rpl 'File input' 'Dateieingabe' /var/www/html/admin/settings.php
sudo rpl '(exact)' '(genau)' /var/www/html/admin/settings.php
sudo rpl 'Regex filters' 'Regex Filter' /var/www/html/admin/settings.php
sudo rpl 'Audit log' 'Prüfprotokoll' /var/www/html/admin/settings.php
sudo rpl 'Upload only Pi-hole backup files.' 'Nur Pi-hole Sicherungsdateien hochladen' /var/www/html/admin/settings.php
sudo rpl 'value="in">Import' 'value="in">Importieren' /var/www/html/admin/settings.php

  # Geschwindigkeitstest
sudo rpl '>Speedtest<' '>Geschwindigkeitstest<' /var/www/html/admin/settings.php
sudo rpl 'Speedtest settings' 'Einstellungen für Geschwindigkeitstest' /var/www/html/admin/settings.php
sudo rpl 'Speedtest Schedule' 'Zeitplan für den Geschwindigkeitstest' /var/www/html/admin/settings.php
sudo rpl '>Disabled<' '>Ausgeschaltet<' /var/www/html/admin/settings.php
sudo rpl '>Every 1 Hour<' '>Jede Stunde<' /var/www/html/admin/settings.php
sudo rpl '>Every 2 Hours<' '>Alle 2 Stunden<' /var/www/html/admin/settings.php
sudo rpl '>Every 4 Hours<' '>Alle 4 Stunden<' /var/www/html/admin/settings.php
sudo rpl '>Every 6 Hours<' '>Alle 6 Stunden<' /var/www/html/admin/settings.php
sudo rpl '>Every 12 Hours<' '>Alle 12 Stunden<' /var/www/html/admin/settings.php
sudo rpl '>Every 24 Hours<' '>Alle 24 Stunden<' /var/www/html/admin/settings.php
sudo rpl 'Speedtest Display Range' 'Geschwindigkeitstest Anzeigebereich' /var/www/html/admin/settings.php
sudo rpl 'Day<' 'Tag<' /var/www/html/admin/settings.php
sudo rpl 'Days<' 'Tage<' /var/www/html/admin/settings.php
sudo rpl 'Custom Speedtest server' 'Benutzerdefinierter Server für den Geschwindigkeitstest' /var/www/html/admin/settings.php
sudo rpl 'Expert only!!!</span>. Get list of supported servers <a href="https://www.speedtest.net/speedtest-servers.php" target="_blank"> here</a></p>' 'Nur für Experten!!!</span>. Eine Liste der unterstützten Server finden Sie <a href="https://www.speedtest.net/speedtest-servers.php" target="_blank"> hier</a>.</p>' /var/www/html/admin/settings.php
sudo rpl 'Flush Speedtest history' 'Löschen der Geschwindigkeitstest-Hitorie.' /var/www/html/admin/settings.php
sudo rpl 'The Speedtest settings have been updated' 'Die Speedtest Einstellungen wurden aktualisiert.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php


  # Hilfe
sudo rpl '<h1>Help center</h1>' '<h1>Hilfecenter</h1>' /var/www/html/admin/help.php
sudo rpl 'Header' 'Kopfzeile' /var/www/html/admin/help.php
sudo rpl 'Top left: Status display' 'Oben links: Statusanzeige' /var/www/html/admin/help.php
sudo rpl 'Shows different status messages:' 'Zeigt verschiedene Statusmeldungen an:' /var/www/html/admin/help.php
sudo rpl '<li>Status: Current status of the Pi-hole - Active (<i class="fa fa-circle" style="color:#7FFF00"></i>), Offline (<i class="fa fa-circle" style="color:#FF0000"></i>), or Starting (<i class="fa fa-circle" style="color:#ff9900"></i>)</li>' '<li>Status: Aktueller Status Pi-hole - Aktiv (<i class="fa fa-circle" style="color:#7FFF00"></i>), Aus (<i class="fa fa-circle" style="color:#FF0000"></i>), oder startet (<i class="fa fa-circle" style="color:#ff9900"></i>)</li>' /var/www/html/admin/help.php
sudo rpl 'Temp: Current CPU temperature' 'Temp: Aktuelle CPU-Temperatur' /var/www/html/admin/help.php
sudo rpl '<li>Load: load averages for the last minute, 5 minutes and 15 minutes, respectively. A load average of 1 reflects the full workload of a single processor on the system. We show a red icon if the current load exceeds the number of available processors on this machine (which is <?php echo $nproc; ?>)</li>' '<li>Auslastung: Durchschnittswerte für die letzte, letzten 5  bzw. letzten 15 Minuten laden. Ein Lastdurchschnitt von 1 gibt die volle Auslastung eines einzelnen Prozessors im System an. Wir zeigen ein rotes Symbol an, wenn die aktuelle Auslastung die Anzahl der verfügbaren Prozessoren auf diesem Computer überschreitet (Anzahl hier ist <?php echo $nproc; ?>)</li>' /var/www/html/admin/help.php
sudo rpl 'Memory usage: Shows the percentage of memory actually blocked by applications. We show a red icon if the memory usage exceeds 75%' 'Speichernutzung: Zeigt den Prozentsatz des Speichers an, der tatsächlich von Anwendungen blockiert wurde. Wir zeigen ein rotes Symbol, wenn die Speichernutzung 75% überschreitet.' /var/www/html/admin/help.php
sudo rpl 'Top right: About' 'Oben rechts: Über' /var/www/html/admin/help.php
sudo rpl 'GitHub: Link to the Pi-hole repository' 'GitHub: Link zum Pi-hole Repository' /var/www/html/admin/help.php
sudo rpl "Details: Link to Jacob Salmela's blog with some more details, describing also the concept of the Pi-hole" 'Details: Link zum Blog von Jacob Salmela mit einigen weiteren Details, der auch das Konzept von Pi-hole beschreibt.' /var/www/html/admin/help.php
sudo rpl 'Updates: Link to list of releases' 'Updates: Link zur Liste der Veröffentlichungen.' /var/www/html/admin/help.php
sudo rpl 'Update notifications: If updates are available, a link will be shown here.' 'Update-Benachrichtigungen: Wenn Updates verfügbar sind, wird hier ein Link angezeigt.' /var/www/html/admin/help.php
sudo rpl 'Dashboard' 'Hauptmenü' /var/www/html/admin/help.php
sudo rpl 'On the dashboard, you can see various Pi-hole statistics:' 'Im Hauptmenü sehen Sie verschiedene Pi-hole Statistiken:' /var/www/html/admin/help.php
sudo rpl 'Summary: A summary of statistics showing how many total DNS queries have been blocked today, what percentage of DNS queries have been blocked, and how many domains are in the compiled ad list. This summary is updated every 10 seconds.' 'Zusammenfassung: Eine Zusammenfassung der Statistiken, aus der hervorgeht, wie viele DNS-Anfragen heute insgesamt blockiert wurden, wie viel Prozent der DNS-Anfragen blockiert wurden und wie viele Domains in der kompilierten Anzeigenliste enthalten sind. Diese Zusammenfassung wird alle 10 Sekunden aktualisiert.' /var/www/html/admin/help.php
sudo rpl 'Queries over time: Graph showing DNS queries (total and blocked) over 10 minute time intervals. More information can be acquired by hovering over the lines. This graph is updated every 10 minutes.' 'Anfragen im Laufe der Zeit: Grafik mit DNS-Anfragen (insgesamt und blockiert) über 10 Minuten Zeitintervalle. Weitere Informationen erhalten Sie, wenn Sie mit der Maus über die Linien fahren. Diese Grafik wird alle 10 Minuten aktualisiert.' /var/www/html/admin/help.php
sudo rpl 'Query Types: Identifies the types of processed queries' 'Anfragetypen: Identifiziert die Arten der verarbeiteten Anfragen.' /var/www/html/admin/help.php
sudo rpl 'Forward Destinations: Shows to which upstream DNS the permitted requests have been forwarded to.' 'Weiterleitungsziele: Zeigt an, an welchen Upstream-DNS die zulässigen Anfragen weitergeleitet wurden.' /var/www/html/admin/help.php
sudo rpl 'Top Domains: Ranking of requested sites by number of DNS lookups' 'Top-Domains: Ranking der angeforderten Seiten nach Anzahl der DNS-Lookups.' /var/www/html/admin/help.php
sudo rpl 'Top Advertisers: Ranking of requested advertisements by number of DNS lookups.' 'Top-Inserenten: Rangfolge der angeforderten Werbung nach Anzahl der DNS-Lookups.' /var/www/html/admin/help.php
sudo rpl 'Top Clients: Ranking of how many DNS requests each client has made on the local network.' 'Top-Geräte: Rangfolge der DNS-Anforderungen, die jedes Gerät im lokalen Netzwerk gestellt hat.' /var/www/html/admin/help.php
sudo rpl 'The Top Domains and Top Advertisers lists may be hidden depending on the privacy Settings on the settings page' 'Die Listen "Top Domains" und "Top Inserenten" werden möglicherweise in Abhängigkeit von den Datenschutzeinstellungen auf der Einstellungsseite ausgeblendet.' /var/www/html/admin/help.php
sudo rpl '<p>Note that the login session does <em>not</em> expire on the dashboard, as the summary is updated every 10 seconds which refreshes the session.</p>' '<p>Beachten Sie, dass die Anmeldesitzung im Hauptmenü <em>nicht</em> abläuft, da die Zusammenfassung alle 10 Sekunden aktualisiert wird, wodurch die Sitzung geöffnet bleibt.</p>' /var/www/html/admin/help.php
sudo rpl 'Query Log' 'Anfrageprotokoll' /var/www/html/admin/help.php
sudo rpl "Shows the recent queries by parsing Pi-hole's log. It is possible to search through the whole list by using the \"Search\" input field. If the status is reported as \"OK\", then the DNS request has been permitted. Otherwise (\"Pi-holed\") it has been blocked. By clicking on the buttons under \"Action\" the corresponding domains can quickly be added to the white-/blacklist. The status of the action will be reported on this page. By default, only the recent 10 minutes are shown to enhance the loading speed of the query log page. All domains can be requested by clicking on the corresponding link in the header of the page. Note that the result heavily depends on your privacy settings (see Settings page)." 'Zeigt die letzten Anfragen an, indem das Protokoll von Pi-hole analysiert wird. Über das Eingabefeld "Suchen" kann die gesamte Liste durchsucht werden. Wenn der Status als "OK" gemeldet wird, wurde die DNS-Anforderung zugelassen, ansonsten wurde es gesperrt. Durch Anklicken der Buttons unter "Aktion" können die entsprechenden Domains schnell zur White- / Blacklist hinzugefügt werden. Der Status der Aktion wird auf dieser Seite angezeigt. Standardmäßig werden nur die letzten 10 Minuten angezeigt, um die Ladegeschwindigkeit der Anfrageprotokollseite zu erhöhen. Alle Domains können durch Klicken auf den entsprechenden Link in der Kopfzeile der Seite angefordert werden. Beachten Sie, dass das Ergebnis stark von Ihren Datenschutzeinstellungen abhängt (siehe Seite Einstellungen).' /var/www/html/admin/help.php
sudo rpl 'Add or remove domains (or subdomains) from the white-/blacklist. If a domain is added to e.g. the whitelist, any possible entry of the same domain will be automatically removed from the blacklist and vice versa.' 'Hinzufügen oder Entfernen von Domains (oder Subdomains) aus der White-/Blacklist. Wird eine Domain z.B. zur Whitelist hinzugefügt, wird jeder mögliche Eintrag der gleichen Domain automatisch aus der Blacklist entfernt und umgekehrt.' /var/www/html/admin/help.php
sudo rpl 'Regex blacklisting is supported (entering <samp>^example</samp> will block any domain starting with <samp>example</samp>, see also our <a href="https://docs.pi-hole.net/ftldns/regex/" target="_blank">Regex documentation</a>). You can still whitelist specific domains even if they fall under a regex pattern.' 'Die Unterstützung der Regex-Sperrliste (Eingabe von <samp>^beispiel</samp> blockiert alle Domänen, die mit <samp>beispiel</samp> beginnen. Weitere Informationen finden Sie in unserer <a href="https://docs.pi-hole.net/ftldns/regex/" target="_blank">Regex-Dokumentation</a>. Sie können weiterhin bestimmte Domains auf die Whitelist setzen, auch wenn sie einem regulären Muster unterliegen.' /var/www/html/admin/help.php
sudo rpl 'You can white-/blacklist multiple entries at a time if you separate the domains by spaces.' 'Sie können mehrere Einträge gleichzeitig auf die White- / Blacklist setzen, wenn Sie die Domänen durch Leerzeichen trennen.' /var/www/html/admin/help.php
sudo rpl 'Disable / Enable' 'Ausschalten / Einschalten' /var/www/html/admin/help.php
sudo rpl 'Disables/enables Pi-hole blocking completely. You may have to wait a few minutes for the changes to reach all of your devices. The change will be reflected by a changed status (top left)' 'Pi-hole-Blockierung vollständig deaktiviert / aktiviert. Möglicherweise müssen Sie einige Minuten warten, bis die Änderungen alle Ihre Geräte erreicht haben. Die Änderung wird durch einen geänderten Status (oben links) angezeigt.' /var/www/html/admin/help.php
sudo rpl 'Tools &rarr; Update Gravity' 'Werkzeuge &rarr; Aktualisierung Gravity' /var/www/html/admin/help.php
sudo rpl 'Will download any updates from the third-party blocklists that we source. By default, this command runs once a week via cron (Sunday).' 'Lädt alle Aktualisierungen aus den von uns bereitgestellten Sperrlisten von Drittanbietern herunter. Standardmäßig wird dieser Befehl einmal pro Woche (Sonntag) über cron ausgeführt.' /var/www/html/admin/help.php
sudo rpl 'Tools &rarr; Query Lists' 'Werkzeuge &rarr; Anfragelisten' /var/www/html/admin/help.php
sudo rpl "This function is useful to find out what list a domain appears on. Since we don't control what the third-parties put on the blocklists, you may find that a domain you normally visit stops working. If this is the case, you could run  this command to scan for strings in the list of blocked domains and it will return the list the domain is found on. This proved useful a while back when the Mahakala list was adding <samp>apple.com</samp> and <samp>microsoft.com</samp> to their block list." 'Diese Funktion ist nützlich, um herauszufinden, auf welcher Liste eine Domain erscheint. Da wir nicht kontrollieren, was die Drittanbieter auf die Sperrlisten setzen, können Sie feststellen, dass eine Domain, die Sie normalerweise besuchen, nicht mehr funktioniert. In diesem Fall können Sie diesen Befehl ausführen, um in der Liste der blockierten Domänen nach Zeichenfolgen zu suchen. Die Liste, in der sich die Domäne befindet, wird dann zurückgegeben. Dies erwies sich vor einiger Zeit als nützlich, als die Mahakala-Liste <samp>apple.com</samp> und <samp>microsoft.com</samp> zu ihrer Sperrliste hinzufügte.' /var/www/html/admin/help.php
sudo rpl 'Tools &rarr; Tail pihole.log' 'Werkzeuge &rarr; Dateiende von pihole.log' /var/www/html/admin/help.php
sudo rpl 'Live tailing of the raw Pi-hole log.' 'Live-Anzeige von pihole.log.' /var/www/html/admin/help.php
sudo rpl '<h2>Settings</h2>' '<h2>Einstellungen</h2>' /var/www/html/admin/help.php
sudo rpl 'Change settings for the Pi-hole' 'Ändern der Einstellungen für Pi-hole' /var/www/html/admin/help.php
sudo rpl 'Displays network and other system information of Pi-hole. At the bottom there is a "Danger Zone" with actions such as disable query logging and reboot.' 'Zeigt Netzwerk- und andere Systeminformationen von Pi-hole an. Unten befindet sich eine "Gefahrenzone" mit Aktionen wie dem Deaktivieren der Anfrageprotokollierung und dem Neustart.' /var/www/html/admin/help.php
sudo rpl 'Blocklists' 'Sperristen' /var/www/html/admin/help.php
sudo rpl 'View and edit the blocklists sourced for blocked domains.' 'Anzeigen und Bearbeiten der Sperrlisten für blockierte Domains.' /var/www/html/admin/help.php
sudo rpl 'Customize used upstream DNS servers + advanced settings for DNS servers. Note that any number of DNS servers may be enabled at a time.' 'Passen Sie die verwendeten Upstream-DNS-Server und die erweiterten Einstellungen für DNS-Server an. Beachten Sie, dass eine beliebige Anzahl von DNS-Servern gleichzeitig aktiviert sein kann.' /var/www/html/admin/help.php
sudo rpl 'Using this setting you can enable/disable the DHCP server of the Pi-hole. Note that you should disable any other DHCP server on your network to avoid IP addresses being used more than once. You have to give the range of IPs that DHCP will serve and the IP of the local router (gateway). If the DHCP server is active, the current leases are shown on the settings page. IPv4 DHCP will always be activated, IPv6 (stateless + statefull) can be enabled.' 'Mit dieser Einstellung können Sie den DHCP-Server des Pi-Hole aktivieren / deaktivieren. Beachten Sie, dass Sie jeden anderen DHCP-Server in Ihrem Netzwerk deaktivieren sollten, um zu vermeiden, dass IP-Adressen mehrmals verwendet werden. Sie müssen den IP-Bereich angeben, den DHCP bedienen soll, und die IP des lokalen Routers (Gateways). Wenn der DHCP-Server aktiv ist, werden die aktuellen Leases auf der Einstellungsseite angezeigt. IPv4 DHCP ist immer aktiviert, IPv6 (statuslos + vollständig) kann aktiviert werden.' /var/www/html/admin/help.php
sudo rpl 'API / Web Interface' 'API / Weboberfläche' /var/www/html/admin/help.php
sudo rpl 'Change settings which apply to the API as well as the web interface' 'Ändern Sie die Einstellungen, die sowohl für API als auch für die Weboberfläche gelten.' /var/www/html/admin/help.php
sudo rpl '<h4>Privacy</h4>' '<h4>Privatsphäre</h4>' /var/www/html/admin/help.php
sudo rpl 'Set the privacy level for queries. Note that decreasing the privacy level will not disclose previously hidden query data.' 'Legen Sie die Datenschutzstufe für Anfragen fest. Beachten Sie, dass durch das Verringern der Datenschutzstufe keine zuvor ausgeblendeten Anfragedaten angezeigt werden.' /var/www/html/admin/help.php
sudo rpl 'Import and export Pi-hole settings.' 'Importieren und Exportieren der Einstellungen von Pi-hole.' /var/www/html/admin/help.php
sudo rpl 'Authentication system (currently <?php if($authenticationsystem) { ?>enabled<?php } else { ?>disabled<?php } ?>)' 'Authentifizierungssystem (derzeit <?php if($authenticationsystem) { ?>eingeschaltet<?php } else { ?>ausgeschaltet<?php } ?>)' /var/www/html/admin/help.php
sudo rpl 'Using the command' 'Verwenden Sie den Befehl' /var/www/html/admin/help.php
sudo rpl 'and entering a password to be set, one can enable the authentication system of this web interface. Thereafter, a login is required for most pages (the dashboard will show a limited amount of statistics). Note that the authentication system may be disabled again, by setting an empty password using the command shown above. The Help center will show more details concerning the authentication system only if it is enabled' 'und der Eingabe eines einzurichtenden Passworts kann man das Authentifizierungssystem dieser Webschnittstelle aktivieren. Danach ist für die meisten Seiten ein Login erforderlich (das Dashboard zeigt eine begrenzte Anzahl von Statistiken an). Beachten Sie, dass das Authentifizierungssystem wieder deaktiviert werden kann, indem Sie mit dem oben gezeigten Befehl ein leeres Passwort festlegen. Das Hilfecenter zeigt nur dann weitere Details zum Authentifizierungssystem an, wenn es aktiviert ist.' /var/www/html/admin/help.php
sudo rpl '<h2>Login / Logout</h2>' '<h2>Anmelden / Abmelden</h2>' /var/www/html/admin/help.php
sudo rpl 'Using the Login / Logout function, a user can initiate / terminate a login session. The login page will also always be shown if a user tries to access a protected page directly without having a valid login session' 'Mit der Funktion Anmelden/Abmelden kann ein Benutzer eine Login-Sitzung starten oder beenden. Die Anmelde-Seite wird auch immer dann angezeigt, wenn ein Benutzer versucht, direkt auf eine geschützte Seite zuzugreifen, ohne eine gültige Anmelde-Sitzung zu haben.' /var/www/html/admin/help.php
sudo rpl 'Donate' 'Spenden' /var/www/html/admin/help.php
sudo rpl 'Keep in mind that Pi-hole is free. If you like Pi-hole, please consider a small donation to help support its development' 'Denken Sie daran, dass das Pi-hole frei ist. Wenn Ihnen Pi-hole gefällt, denken Sie bitte an eine kleine Spende, um die Entwicklung zu unterstützen.' /var/www/html/admin/help.php
sudo rpl 'Help (this page)' 'Hilfe (diese Seite)' /var/www/html/admin/help.php
sudo rpl 'Shows information about what is happening behind the scenes and what can be done with this web user interface (web UI). The Help center will show details concerning the authentication system only if it is enabled' 'Zeigt Informationen darüber, was hinter den Kulissen passiert und was mit dieser Web-Benutzeroberfläche (Web-UI) gemacht werden kann. Das Hilfecenter zeigt Details zum Authentifizierungssystem nur an, wenn es aktiviert ist.' /var/www/html/admin/help.php
sudo rpl 'Footer' 'Fußzeile' /var/www/html/admin/help.php
sudo rpl 'Shows the currently installed Pi-hole and Web Interface version. If an update is available, this will be indicated here' 'Zeigt die aktuell installierte Pi-Loch- und Web-Interface-Version an. Wenn eine Aktualisierung verfügbar ist, wird dies hier angezeigt.' /var/www/html/admin/help.php



# Nicht zugeordnet
sudo rpl 'No password set' 'Kein Passwort festgelegt.' /var/www/html/admin/scripts/pi-hole/php/api_token.php
sudo rpl 'Not authorized!' 'Nicht erlaubt!' /var/www/html/admin/scripts/pi-hole/php/api_token.php



# Fehlerdatei erstellen
sudo cat /tmp/error-translate.log | grep -B 2 '0 matches' > /tmp/error2-translate.log
sudo chmod 777 /tmp/erro*-translate.log
sudo mv /tmp/error2-translate.log /tmp/error-translate.log

echo
echo
echo -e "${gruenfett}   Erledigt.${standard}"
echo
echo

echo -e "${blaufett}   siehe auch /tmp/error-translate.log${standard}"
echo
echo

exit
