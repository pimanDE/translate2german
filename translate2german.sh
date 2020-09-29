#!/bin/bash
#
# Weboberfläche des Pi-hole auf deutsch übersetzen
# getestet auf Version Pi-hole Version v5.1 Web Interface Version v5.1 FTL Version v5.1
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

touch /tmp/error-translate.log
exec 2> /tmp/error-translate.log

####################################################################################################################
# Start des Script's

clear

if dpkg-query -s rpl 2>/dev/null|grep -q installed; then
    echo "rpl schon ist installiert ....." >> /dev/null
else
    echo
    echo -e "${blaufett}   rpl muss installiert werden ...${standard}"
    echo
    echo
    sudo apt install -y rpl
fi

clear

echo
echo -e "${blaufett}   Übersetze die Pi-hole Weboberfläche auf deutsch ...${standard}"
echo
echo -e "${blaufett}   Dies kann einige Minuten dauern ...${standard}"
echo

sudo cp -ra /var/www/html/ /var/www/html.sicherung.vom.$date					        # Sicherung des Verzeichnisses
sudo cp -a /opt/pihole/gravity.sh /opt/pihole/gravity.sh.sicherung.vom.$date			# Sicherung der gravity.sh
sudo cp -a /etc/.pihole/gravity.sh /etc/.pihole/gravity.sh.sicherung.vom.$date			# Sicherung der pihole
sudo cp -a /usr/local/bin/pihole /usr/local/bin/pihole.sicherung.vom.$date			    # Sicherung der pihole



# Startseite
sudo rpl '<h1>JavaScript Is Disabled</h1><p>JavaScript is required for the site to function.</p>' '<h1>JavaScript ist deaktiviert. </h1><p>JavaScript ist für das Funktionieren der Website erforderlich.</p>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl 'To learn how to enable JavaScript click' 'Um zu erfahren, wie Sie JavaScript aktivieren, klicken Sie auf ' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl 'Session is valid for ' 'Die Sitzung ist gültig für ' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl 'Your black hole for Internet advertisements' 'Ihr schwarzes Loch für Internetwerbung.' /var/www/html/pihole/index.php
sudo rpl 'Did you mean to go to the admin panel?' 'Möchten Sie zum Administrationsbereich?' /var/www/html/pihole/index.php
sudo rpl '<span>Login</span>' '<span>Anmelden</span>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl 'Sign in to start your session' 'Melden Sie sich an, um Ihre Sitzung zu starten.' /var/www/html/admin/scripts/pi-hole/php/loginpage.php
sudo rpl 'Verify that cookies are allowed for' 'Überprüfen Sie, ob Cookies zugelassen sind für' /var/www/html/admin/scripts/pi-hole/php/loginpage.php
sudo rpl 'Wrong password!' 'Falsches Passwort!' /var/www/html/admin/scripts/pi-hole/php/loginpage.php
sudo rpl 'After installing Pi-hole for the first time, a password is generated and displayed to the user. The' 'Nach der erstmaligen Installation von Pi-hole wird ein Passwort generiert und dem Benutzer angezeigt.' /var/www/html/admin/scripts/pi-hole/php/loginpage.php
sudo rpl 'password cannot be retrieved later on, but it is possible to set a new password (or explicitly disable' 'Das Passwort kann später nicht mehr abgerufen werden. Es ist jedoch möglich, ein neues Passwort festzulegen' /var/www/html/admin/scripts/pi-hole/php/loginpage.php
sudo rpl 'the password by setting an empty password) using the command' '(oder das Passwort explizit zu deaktivieren, indem Sie ein leeres Passwort festlegen). Verwenden Sie hierzu:' /var/www/html/admin/scripts/pi-hole/php/loginpage.php
sudo rpl 'Password' 'Passwort' /var/www/html/admin/scripts/pi-hole/php/loginpage.php
sudo rpl '<li><kbd>Return</kbd> &rarr; Log in and go to requested page (<?php echo $scriptname; ?>)</li>' '<li><kbd>Enter</kbd> &rarr; Anmelden (<?php echo $scriptname; ?>)</li>' /var/www/html/admin/scripts/pi-hole/php/loginpage.php
sudo rpl '<li><kbd>Ctrl</kbd>+<kbd>Return</kbd> &rarr; Log in and go to Settings page</li>' '<li><kbd>Strg</kbd>+<kbd>Enter</kbd> &rarr; Anmelden und zur Einstellungsseite gehen</li>' /var/www/html/admin/scripts/pi-hole/php/loginpage.php
sudo rpl 'Remember me for 7 days' '7 Tage merken' /var/www/html/admin/scripts/pi-hole/php/loginpage.php
sudo rpl 'Log in</button>' 'Anmelden</button' /var/www/html/admin/scripts/pi-hole/php/loginpage.php
sudo rpl 'Forgot password' 'Passwort vergessen' /var/www/html/admin/scripts/pi-hole/php/loginpage.php



# Statusanzeige oben links
sudo rpl 'Active</span>' 'Aktiv</span>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl 'Unknown</span>' 'Unbekannt</span>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl 'Temp:&nbsp;' 'Temperatur:&nbsp;' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl 'Load:&nbsp;&nbsp;' 'Auslastung:&nbsp;&nbsp;' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl 'Detected $nproc cores\' '$nproc Kerne erkannt\' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl 'Memory usage:&nbsp;&nbsp;' 'Speicher:&nbsp;&nbsp;' /var/www/html/admin/scripts/pi-hole/php/header.php



# Statusanzeige oben rechts
sudo rpl '<span class="sr-only">Toggle navigation</span>' '<span class="sr-only">Navigation umschalten</span>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl 'hostname:</span>' 'Rechnername:</span>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl 'Designed For' 'Entwickelt für den' /var/www/html/admin/scripts/pi-hole/php/header.php



# Linke Menüleiste
sudo rpl '<li class="header text-uppercase">Main navigation</li>' '<li class="header text-uppercase">Hauptmenü</li>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '<span>Dashboard</span>' '<span>Übersicht</span>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '<span>Query Log</span>' '<span>Anfragen Protokoll</span>' /var/www/html/admin/scripts/pi-hole/php/header.php
#sudo rpl '<span>Speedtest</span>' '<span>Geschwindigkeitstest</span>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '<span>Long-term data</span>' '<span>Langzeitdaten</span>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '</i> Graphics' '</i> Grafiken' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '</i> Query Log' '</i> Anfragen Protokoll' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '</i> Top Lists' '</i> Top Listen' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl 'Local DNS Records</span>' 'Lokale DNS Einträge</span>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '<span>Group Management</span>' '<span>Gruppen Verwaltung</span>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '</i> Groups' '</i> Gruppen' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '</i> Clients' '</i> Geräte' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '</i> Domains' '</i> Domains' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '</i> Adlists' '</i> Blocklisten' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '<span>Disable&nbsp;' '<span>Ausschalten&nbsp;' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '>Enable&nbsp;' '>Einschalten&nbsp;' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '</i> Indefinitely' '</i> Permanent' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '</i> For 10 seconds' '</i> Für 10 Sekunden' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '</i> For 30 seconds' '</i> Für 30 Sekunden' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '</i> For 5 minutes' '</i> Für 5 Minuten' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '<span>Custom time</span>' '<span>Benutzerdefinierte Zeit</span>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '<span>Tools</span>' '<span>Werkzeuge</span>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '</i> Pi-hole diagnosis' '</i> Pi-hole Diagnose' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '</i> Update Gravity' '</i> Aktualisierung der Blocklisten' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '</i> Query Lists' '</i> Domain in einer Liste finden' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '</i> Audit log' '</i> Prüfprotokoll' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '</i> Tail pihole.log' '</i> pihole.log anzeigen' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '</i> Tail pihole-FTL.log' '</i> pihole-FTL.log anzeigen' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '</i> Generate debug log' '</i> Erstelle Debug-Protokoll' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '</i> Network' '</i> Netzwerk' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '<span>Settings</span>' '<span>Einstellungen</span>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '<span>Logout</span>' '<span>Abmelden</span>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '<span>Donate</span>' '<span>Spenden</span>' /var/www/html/admin/scripts/pi-hole/php/header.php
sudo rpl '<span>Documentation</span>' '<span>Hilfe</span>' /var/www/html/admin/scripts/pi-hole/php/header.php



# Übersicht
sudo rpl '<p>Total queries' '<p>Anfragen insgesamt' /var/www/html/admin/index.php
sudo rpl 'clients)</p>' 'Geräte)</p>' /var/www/html/admin/index.php
sudo rpl 'only A + AAAA queries (" + data.dns_queries_all_types + " in total)' 'nur A + AAAA Anfragen (" + data.dns_queries_all_types + " insgesamt)' /var/www//html/admin/scripts/pi-hole/js/index.js
sudo rpl '<p>Queries Blocked</p>' '<p>Geblockte Anfragen</p>' /var/www/html/admin/index.php
sudo rpl '<p>Percent Blocked</p>' '<p>Geblockt in Prozent</p>' /var/www/html/admin/index.php
sudo rpl 'Domains on Blocklist' 'Domains in den Blocklisten' /var/www/html/admin/index.php
sudo rpl 'Blocking list updated %H:%I (hh:mm) ago' 'Blockliste vor %H Stunden und %I Minuten aktualisiert' /var/www/html/admin/scripts/pi-hole/php/gravity.php
sudo rpl 'Blocking list updated one day, %H:%I (hh:mm) ago' 'Blockliste vor 1 Tag, %H Stunden und %I Minuten aktualisiert' /var/www/html/admin/scripts/pi-hole/php/gravity.php
sudo rpl 'Blocking list updated %a days, %H:%I (hh:mm) ago' 'Blockliste vor %a days, %H Stunden und :%I Minuten aktualisiert' /var/www/html/admin/scripts/pi-hole/php/gravity.php
sudo rpl 'Total queries over last ' 'Gesamtzahl der Anfragen der letzten ' /var/www/html/admin/index.php
sudo rpl 'hours' 'Stunden' /var/www/html/admin/index.php
sudo rpl 'return "Queries from " + from + " to " + to' 'return "Anfragen von " + from + " Uhr bis " + to + " Uhr"' /var/www/html/admin/scripts/pi-hole/js/index.js
sudo rpl 'Permitted DNS Queries' 'Erlaubte DNS Anfragen' /var/www/html/admin/scripts/pi-hole/js/index.js
sudo rpl 'Blocked DNS Queries' 'Geblockte DNS Anfragen' /var/www/html/admin/scripts/pi-hole/js/index.js
sudo rpl 'Client activity over last' 'Geräteaktivität der letzten ' /var/www/html/admin/index.php
sudo rpl 'return "Client activity from " + from + " to " + to' 'return "Geräteaktivität von " + from + " Uhr bis " + to + " Uhr"'  /var/www/html/admin/scripts/pi-hole/js/index.js
# evtl. für Speedtest sudo rpl '"Upstreams from "+from+" to "+to' '"Upstream von "+from+" bis "+to' /var/www/html/admin/scripts/pi-hole/js/index.js
sudo rpl '<td>No activity recorded</td>' '<td>Keine Aktivität aufgezeichnet.</td>' /var/www/html/admin/scripts/pi-hole/js/index.js
sudo rpl 'Query Types' 'Anfragetypen' /var/www/html/admin/index.php
sudo rpl '"Query types"' '"Anfragetyp"' /var/www/html/admin/scripts/pi-hole/js/index.js
# evtl. für Speedtest sudo rpl 'Speedtest results over last' 'Geschwindigkeitsergebnisse der letzten' /var/www/html/admin/index.php
sudo rpl 'Queries answered by' 'Anfragen beantwortet von' /var/www/html/admin/index.php
sudo rpl '"Forward destinations"' '"Weitergeleitete Ziele"' /var/www/html/admin/scripts/pi-hole/js/index.js
sudo rpl 'Top Permitted Domains' 'Am meisten zugelassene Domains' /var/www/html/admin/index.php
sudo rpl '<th>Hits</th>' '<th>Treffer</th>' /var/www/html/admin/index.php
sudo rpl '<th>Frequency</th>' '<th>Häufigkeit</th>' /var/www/html/admin/index.php
sudo rpl '% of' '% von insgesamt' /var/www/html/admin/scripts/pi-hole/js/index.js
sudo rpl 'data.dns_queries_today +' 'data.dns_queries_today + " Anfragen" +' /var/www/html/admin/scripts/pi-hole/js/index.js
sudo rpl 'data.ads_blocked_today +' 'data.ads_blocked_today + " geblockten Domains" +' /var/www/html/admin/scripts/pi-hole/js/index.js
sudo rpl 'Top Blocked Domains' 'Am meisten geblockte Domains' /var/www/html/admin/index.php
sudo rpl 'Top Clients (total)' 'Top Geräte (insgesamt)' /var/www/html/admin/index.php
sudo rpl '<th>Client</th>' '<th>Gerät</th>' /var/www/html/admin/index.php
sudo rpl '<th>Requests</th>' '<th>Anfragen</th>' /var/www/html/admin/index.php
sudo rpl 'Top Clients (blocked only)' 'Top Geräte (nur geblockt)' /var/www/html/admin/index.php



# Anfragen Protokoll
sudo rpl 'Processing...' 'wird bearbeitet ...' /var/www/html/admin/scripts/vendor/datatables.min.js
sudo rpl 'sLoadingRecords:"Loading..."' 'sLoadingRecords:"Lade ..."' /var/www/html/admin/scripts/vendor/datatables.min.js
sudo rpl 'Recent Queries' 'Letzte Anfragen' /var/www/html/admin/queries.php
sudo rpl '$showing = "showing";' '$showing = "zeige";' /var/www/html/admin/queries.php
sudo rpl '= "showing no queries (due to setting)"' '= "zeigte keine Anfragen an (aufgrund der Einstellungen)"' /var/www/html/admin/queries.php 
sudo rpl 'all queries within the Pi-hole log' 'alle Abfragen des Pi-hole Protokolls' /var/www/html/admin/queries.php
sudo rpl 'queries for client' 'Anfragen für Gerät' /var/www/html/admin/queries.php
sudo rpl 'queries for domain' 'Anfragen für die Domain' /var/www/html/admin/queries.php
sudo rpl 'queries within specified time interval' 'Abfragen innerhalb des angegebenen Zeitintervalls' /var/www/html/admin/queries.php
sudo rpl 'up to 100 queries' 'bis zu 100 Anfragen' /var/www/html/admin/queries.php
sudo rpl 'privacy mode enabled' 'Privatmodus aktiviert' /var/www/html/admin/queries.php
sudo rpl '<a href=\"?all\">show all</a>' ' oder <a href=\"?all\">zeige alle Anfragen</a>' /var/www/html/admin/queries.php
sudo rpl 'Type / Domain / Client' 'Typ / Domain / Gerät' /var/www/html/admin/scripts/pi-hole/js/queries.js
sudo rpl '"Search:"' '"Suche:"' /var/www/html/admin/scripts/vendor/datatables.min.js
sudo rpl '"Show _MENU_ entries"' '"Zeige _MENU_ Einträge"' /var/www/html/admin/scripts/vendor/datatables.min.js
sudo rpl '10, 25, 50, 100, "All"' '10, 25, 50, 100, "Alle"' /var/www/html/admin/scripts/pi-hole/js/queries.js
sudo rpl '"Next",sPrevious:"Previous"}' '"Nächste",sPrevious:"Vorherige"}' /var/www/html/admin/scripts/vendor/datatables.min.js
sudo rpl '<th>Time</th>' '<th>Zeit</th>' /var/www/html/admin/queries.php
sudo rpl '<th>Type</th>' '<th>Typ</th>' /var/www/html/admin/queries.php
sudo rpl '<th>Client</th>' '<th>Gerät</th>' /var/www/html/admin/queries.php
sudo rpl '<th>Reply</th>' '<th>Wiederholung</th>' /var/www/html/admin/queries.php
sudo rpl '<th>Action</th>' '<th>Aktion</th>' /var/www/html/admin/queries.php
sudo rpl 'No data available in table' 'Keine Daten in der Tabelle vorhanden.' /var/www/html/admin/scripts/vendor/datatables.min.js
sudo rpl 'Add filter on' 'Zum Filtern von' /var/www/html/admin/scripts/pi-hole/js/queries.js
sudo rpl 'using Ctrl + Click.' 'benutze Strg+Mausklick.' /var/www/html/admin/scripts/pi-hole/js/queries.js
sudo rpl 'Showing 0 to 0 of 0 entries' 'Zeige 0 bis 0 von 0 Einträgen' /var/www/html/admin/scripts/vendor/datatables.min.js
sudo rpl 'Filtering options:' 'Filter Optionen:' /var/www/html/admin/queries.php
sudo rpl '<li>Use <kbd>Ctrl</kbd> or <kbd>&#8984;</kbd> + <i class="fas fa-mouse-pointer"></i> to add columns to the current filter</li>' '<li>Benutze <kbd>Ctrl</kbd> oder <kbd>&#8984;</kbd> + <i class="fas fa-mouse-pointer"></i> um Spalten zum aktuellen Filter hinzuzufügen.</li>' /var/www/html/admin/queries.php
sudo rpl '<li>Use <kbd>Shift</kbd> + <i class="fas fa-mouse-pointer"></i> to remove columns from the current filter</li>' '<li>Benutze die<kbd>Umschalttaste</kbd> + <i class="fas fa-mouse-pointer"></i> um Spalten aus dem aktuellen Filter zu entfernen.</li>' /var/www/html/admin/queries.php
sudo rpl 'Showing _START_ to _END_ of _TOTAL_ entries' 'Zeige _START_ bis _END_ von _TOTAL_ Einträgen' /var/www/html/admin/scripts/vendor/datatables.min.js
sudo rpl '<div class="alProcessing">Adding <span id="alDomain"></span> to the <span id="alList"></span>...</div>' '<div class="alProcessing">Hinzufügen zur <span id="alDomain"></span> to the <span id="alList"></span>...</div>' /var/www/html/admin/queries.php
sudo rpl 'successfully added to the' 'erfolgreich hinzugefügt zur' /var/www/html/admin/queries.php
sudo rpl 'Timeout or Network Connection Error!' 'Zeitüberschreitung der Netzwerkfehler!' /var/www/html/admin/queries.php
sudo rpl 'filtered from _MAX_ total entries' 'gefiltert aus insgesamt _MAX_ Einträgen.' /var/www/html/admin/scripts/vendor/datatables.min.js
sudo rpl 'Clear filters' 'Filter löschen' /var/www/html/admin/queries.php



# Geschwindigkeitstest
# folgt noch
# sudo rpl 'Adding' 'Hinzufügen' /var/www/html/admin/speedtest.php
# sudo rpl 'to the' 'zum' /var/www/html/admin/speedtest.php
# sudo rpl 'Success!' 'Erfolgreich!' /var/www/html/admin/speedtest.php
# sudo rpl 'Failure! Something went wrong.' 'Fehler! Etwas ist schief gelaufen.' /var/www/html/admin/speedtest.php
# sudo rpl 'Recent Speedtests' 'Aktueller Bandbreitentest' /var/www/html/admin/speedtest.php
# sudo rpl 'Test Time' 'Testzeit' /var/www/html/admin/speedtest.php
# sudo rpl 'End Time' 'Endzeit' /var/www/html/admin/speedtest.php
# sudo rpl 'Your IP' 'Ihre IP-Adresse' /var/www/html/admin/speedtest.php
# sudo rpl 'Distance' 'Entfernung' /var/www/html/admin/speedtest.php
# sudo rpl 'Results' 'Ergebnisse' /var/www/html/admin/speedtest.php
# sudo rpl '> View Result</a' '> Ansehen</a' /var/www/html/admin/scripts/pi-hole/js/speedresults.js



# Langzeitdaten
#   Grafiken
sudo rpl 'Compute graphical statistics from the Pi-hole query database' 'Grafische Statistiken der Pi-hole Anfragedatenbank' /var/www/html/admin/db_graph.php
sudo rpl 'Select date and time range' 'Datums- und Zeitbereich auswählen' /var/www/html/admin/db_graph.php
sudo rpl 'Click to select date and time range' 'Klicken Sie hier zum Auswählen des Datums- und Zeitbereichs' /var/www/html/admin/db_graph.php
sudo rpl 'Today: [moment().startOf("day")' 'Heute: [moment().startOf("day")' /var/www/html/admin/scripts/pi-hole/js/db_graph.js
sudo rpl 'Yesterday: [' 'Gestern: [' /var/www/html/admin/scripts/pi-hole/js/db_graph.js
sudo rpl 'Last 7 Days": ' 'Letzten 7 Tage": ' /var/www/html/admin/scripts/pi-hole/js/db_graph.js
sudo rpl 'Last 30 Days": ' 'Letzten 30 Tage": ' /var/www/html/admin/scripts/pi-hole/js/db_graph.js
sudo rpl 'This Month": ' 'Dieser Monat": ' /var/www/html/admin/scripts/pi-hole/js/db_graph.js
sudo rpl 'Last Month": ' 'Letzter Monat": ' /var/www/html/admin/scripts/pi-hole/js/db_graph.js
sudo rpl 'This Year": ' 'Dieses Jahr": ' /var/www/html/admin/scripts/pi-hole/js/db_graph.js
sudo rpl 'All Time": ' 'Gesamter Zeitraum": ' /var/www/html/admin/scripts/pi-hole/js/db_graph.js
sudo rpl 'Custom Range' 'Benutzerdefiniert' /var/www/html/admin/scripts/vendor/daterangepicker.min.js
sudo rpl 'Depending on how large of a range you specified, the request may time out while Pi-hole tries to retrieve all the data.' 'Je nachdem, wie groß der von Ihnen angegebene Bereich ist, tritt möglicherweise eine Zeitüberschreitung auf, während Pi-hole versucht, alle Daten abzurufen.' /var/www/html/admin/db_graph.php
sudo rpl '"Jan_Feb_Mar_Apr_May_Jun_Jul_Aug_Sep_Oct_Nov_Dec"' '"Jan_Feb_Mar_Apr_Mai_Jun_Jul_Aug_Sep_Okt_Nov_Dez"' /var/www/html/admin/scripts/vendor/moment.min.js
sudo rpl 'Su_Mo_Tu_We_Th_Fr_Sa' 'So_Mo_Di_Mi_Do_Fr_Sa' /var/www/html/admin/scripts/vendor/moment.min.js
sudo rpl '"January_February_March_April_May_June_July_August_September_October_November_December"' '"Januar_Februar_Marz_April_Mai_Juni_Juli_August_September_Oktober_November_Dezember"' /var/www/html/admin/scripts/vendor/moment.min.js
sudo rpl 'cancelLabel:"Cancel"' 'cancelLabel:"Abbrechen"' /var/www/html/admin/scripts/vendor/daterangepicker.min.js
sudo rpl 'applyLabel:"Apply"' 'applyLabel:"Anwenden"' /var/www/html/admin/scripts/vendor/daterangepicker.min.js
sudo rpl 'Queries over the selected time period' 'Anfragen über den ausgewählten Zeitraum' /var/www/html/admin/db_graph.php
sudo rpl 'Queries from " + fromTime + " to " + untilTime + " on " + fromDate).split' 'tmp1' /var/www/html/admin/scripts/pi-hole/js/db_graph.js
sudo rpl '"Queries from " +' '"Anfragen von " +' /var/www/html/admin/scripts/pi-hole/js/db_graph.js
sudo rpl '" to " + picker' 'to-picker' /var/www/html/admin/scripts/pi-hole/js/db_graph.js
sudo rpl '" to " +' '" bis " +' /var/www/html/admin/scripts/pi-hole/js/db_graph.js
sudo rpl 'to-picker' '" to " + picker' /var/www/html/admin/scripts/pi-hole/js/db_graph.js
sudo rpl 'tmp1' 'Anfragen von " + fromTime + " bis " + untilTime + " am " + fromDate).split' /var/www/html/admin/scripts/pi-hole/js/db_graph.js
sudo rpl '"Permitted DNS Queries' '"Erlaubte DNS Anfragen' /var/www/html/admin/scripts/pi-hole/js/db_graph.js
sudo rpl '"Blocked DNS Queries' '"Geblockte DNS Anfragen' /var/www/html/admin/scripts/pi-hole/js/db_graph.js



# Langzeitdaten
#   Anfragenprotokoll
sudo rpl 'Specify date range to be queried from the Pi-hole query database' 'Geben Sie den Datumsbereich an, der aus der Pi-hole-Anfragedatenbank abgefragt werden soll.' /var/www/html/admin/db_queries.php
sudo rpl 'Select date and time range' 'Datums- und Zeitbereich auswählen' /var/www/html/admin/db_queries.php
sudo rpl 'Click to select date and time range' 'Klicken Sie zum Auswählen des Datums- und Zeitbereichs' /var/www/html/admin/db_queries.php
sudo rpl 'Today: [moment().startOf("day"' 'Heute: [moment().startOf("day"' /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl 'Yesterday: [' 'Gestern: [' /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl 'Last 7 Days": ' 'Letzten 7 Tage": ' /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl 'Last 30 Days": ' 'Letzten 30 Tage": ' /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl 'This Month": ' 'Dieser Monat": ' /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl 'Last Month": ' 'Letzter Monat": ' /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl 'This Year": ' 'Dieses Jahr": ' /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl 'All Time": ' 'Gesamter Zeitraum": ' /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl 'Depending on how large of a range you specified, the request may time out while Pi-hole tries to retrieve all the data.' 'Abhängig davon, wie groß der von Ihnen angegebene Bereich ist, kann die Anforderung ausfallen, während Pi-hole versucht, alle Daten abzurufen.' /var/www/html/admin/db_queries.php
sudo rpl 'Query status' 'Status Anfragen' /var/www/html/admin/db_queries.php
sudo rpl 'Permitted:' 'Zulässig:' /var/www/html/admin/db_queries.php
sudo rpl 'forwarded</label>' 'weitergeleitet</label>' /var/www/html/admin/db_queries.php
sudo rpl 'cached</label>' 'zwischengespeichert</label>' /var/www/html/admin/db_queries.php
sudo rpl 'Blocked:' 'Geblockt:' /var/www/html/admin/db_queries.php
sudo rpl 'external</label>' 'extern</label>' /var/www/html/admin/db_queries.php
sudo rpl 'exact blacklist' 'exakt lt. Blacklist' /var/www/html/admin/db_queries.php
sudo rpl 'regex blacklist' 'RegEx der Blacklist' /var/www/html/admin/db_queries.php
sudo rpl 'An unknown error occurred while loading the data.' 'Beim Laden der Daten ist folgender Fehler aufgetreten:' /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl 'Error. Selector types specified using an invalid format.' 'Es wurde keine Auswahl einer Status Anfrage getroffen.' /var/www/html/admin/api_db.php
sudo rpl 'Queries Blocked' 'Geblockte Anfragen' /var/www/html/admin/db_queries.php
sudo rpl 'Queries Total' 'Alle Anfragen' /var/www/html/admin/db_queries.php
sudo rpl 'Recent Queries' 'Letzte Anfragen' /var/www/html/admin/db_queries.php
sudo rpl '10, 25, 50, 100, "All"' '10, 25, 50, 100, "Alle"' /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl '<th>Time</th>' '<th>Zeitpunkt</th>' /var/www/html/admin/db_queries.php
sudo rpl '<th>Type</th>' '<th>Typ</th>' /var/www/html/admin/db_queries.php
sudo rpl '<th>Client</th>' '<th>Gerät</th>' /var/www/html/admin/db_queries.php
sudo rpl '<th>Action</th>' '<th>Aktion</th>' /var/www/html/admin/db_queries.php



# Langzeitdaten
#  Top Listen
sudo rpl 'Compute Top Lists from the Pi-hole query database' 'Top Listen aus der Pi-hole-Anfragedatenbank berechnen' /var/www/html/admin/db_lists.php
sudo rpl 'Select date and time range' 'Datums- und Zeitbereich auswählen' /var/www/html/admin/db_lists.php
sudo rpl 'Click to select date and time range' 'Klicken Sie zum Auswählen des Datums- und Zeitbereichs' /var/www/html/admin/db_lists.php
sudo rpl 'Today: [moment().startOf("day"' 'Heute: [moment().startOf("day"' /var/www/html/admin/scripts/pi-hole/js/db_lists.js
sudo rpl 'Yesterday: [' 'Gestern: [' /var/www/html/admin/scripts/pi-hole/js/db_lists.js
sudo rpl 'Last 7 Days": ' 'Letzten 7 Tage": ' /var/www/html/admin/scripts/pi-hole/js/db_lists.js
sudo rpl 'Last 30 Days": ' 'Letzten 30 Tage": ' /var/www/html/admin/scripts/pi-hole/js/db_lists.js
sudo rpl 'This Month": ' 'Dieser Monat": ' /var/www/html/admin/scripts/pi-hole/js/db_lists.js
sudo rpl 'Last Month": ' 'Letzter Monat": ' /var/www/html/admin/scripts/pi-hole/js/db_lists.js
sudo rpl 'This Year": ' 'Dieses Jahr": ' /var/www/html/admin/scripts/pi-hole/js/db_lists.js
sudo rpl 'All Time": ' 'Gesamter Zeitraum": ' /var/www/html/admin/scripts/pi-hole/js/db_lists.js
sudo rpl 'Depending on how large of a range you specified, the request may time out while Pi-hole tries to retrieve all the data.' 'Abhängig davon, wie groß der von Ihnen angegebene Bereich ist, kann die Anforderung ausfallen, während Pi-hole versucht, alle Daten abzurufen.' /var/www/html/admin/db_lists.php
sudo rpl 'Top Blocked Domains' 'Top geblockte Domains' /var/www/html/admin/db_lists.php
sudo rpl 'Top Clients' 'Top Geräte' /var/www/html/admin/db_lists.php
sudo rpl '<th>Hits</th>' '<th>Treffer</th>' /var/www/html/admin/db_lists.php
sudo rpl 'Frequency' 'Häufigkeit' /var/www/html/admin/db_lists.php
sudo rpl "'</td> <td> <div class=\"progress progress-sm\" title=\"' +" " " /var/www/html/admin/scripts/pi-hole/js/db_lists.js
sudo rpl 'percentage.toFixed(1) +' " " /var/www/html/admin/scripts/pi-hole/js/db_lists.js
sudo rpl 'sum += data.top_domains[domain];' 'sum plus= data.top_domains[domain];' /var/www/html/admin/scripts/pi-hole/js/db_lists.js
sudo rpl 'sum += data.top_ads[ad];' 'sum plus= data.top_ads[ad];' /var/www/html/admin/scripts/pi-hole/js/db_lists.js
sudo rpl 'sum += data.top_sources[client];' 'sum plus= data.top_sources[client];' /var/www/html/admin/scripts/pi-hole/js/db_lists.js
sudo rpl 'data.top_domains[domain] +' "data.top_domains[domain] + '</td> <td> <div class=\"progress progress-sm\" title=\"' + percentage.toFixed(1) + \"% von insgesamt \" + sum plus \" Treffern\" +" /var/www/html/admin/scripts/pi-hole/js/db_lists.js
sudo rpl 'data.top_ads[ad] +' "data.top_ads[ad] + '</td> <td> <div class=\"progress progress-sm\" title=\"' + percentage.toFixed(1) + \"% von insgesamt \" + sum plus \" Treffern\" +" /var/www/html/admin/scripts/pi-hole/js/db_lists.js
sudo rpl 'data.top_sources[client] +' "data.top_sources[client] + '</td> <td> <div class=\"progress progress-sm\" title=\"' + percentage.toFixed(1) + \"% von insgesamt \" + sum plus \" Anfragen\" +" /var/www/html/admin/scripts/pi-hole/js/db_lists.js
sudo rpl 'sum +' " " /var/www/html/admin/scripts/pi-hole/js/db_lists.js
sudo rpl 'sum plus' 'sum +' /var/www/html/admin/scripts/pi-hole/js/db_lists.js
sudo rpl '"% of " +' " " /var/www/html/admin/scripts/pi-hole/js/db_lists.js
sudo rpl '<th>Client</th>' '<th>Gerät</th>' /var/www/html/admin/db_lists.php
sudo rpl '<th>Requests</th>' '<th>Anfragen</th>' /var/www/html/admin/db_lists.php



# Whitelist
sudo rpl 'management</h1>' 'Verwaltung</h1>' /var/www/html/admin/groups-domains.php
sudo rpl 'Add a new' 'Hinzufügen einer neuen ' /var/www/html/admin/groups-domains.php
sudo rpl 'domain or regex filter' ' Domain oder eines RegEx Filters ' /var/www/html/admin/groups-domains.php
sudo rpl 'RegEx filter</a' 'RegEx Filter</a' /var/www/html/admin/groups-domains.php
sudo rpl 'Comment:</label>' 'Kommentar:</label>' /var/www/html/admin/groups-domains.php
sudo rpl 'Domain to be added' 'Hinzuzufügende Domain' /var/www/html/admin/groups-domains.php
sudo rpl 'Description (optional)' 'Beschreibung (optional)' /var/www/html/admin/groups-domains.php
sudo rpl 'Add domain as wildcard' 'Domain als Platzhalter hinzufügen' /var/www/html/admin/groups-domains.php
sudo rpl 'Check this box if you want to involve all subdomains. The entered domain will be converted to a RegEx filter while adding.' 'Markieren Sie dieses Feld, wenn Sie alle Unterdomänen einbeziehen möchten. Die eingegebene Domäne wird beim Hinzufügen in einen RegEx-Filter umgewandelt.' /var/www/html/admin/groups-domains.php
sudo rpl 'Add to Whitelist</button>' 'Zur Whitelist hinzufügen</button>' /var/www/html/admin/groups-domains.php
sudo rpl 'utils.showAlert("warning", "", "Warning", "Please specify a " + domainRegex)' 'utils.showAlert("warning", "", "Achtung!", "Bitte geben Sie eine Domain ein!")' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl 'utils.showAlert("info", "", "Adding " + domainRegex + "...", domain);' 'utils.showAlert("info", "", "Füge die Domain hinzu ...", domain);' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl 'utils.showAlert("success", "fas fa-plus", "Success!", response.message);' 'utils.showAlert("success", "fas fa-plus", "Domain erfolgreich hinzugefügt!", response.message);' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl '"Added " . htmlentities(utf8_encode($domain));' '"Hinzugefügt: " . htmlentities(utf8_encode($domain));' /var/www/html/admin/scripts/pi-hole/php/groups.php
sudo rpl 'RegEx to be added' 'RegEx hinzufügen' /var/www/html/admin/groups-domains.php
sudo rpl '<strong>Hint:</strong> Need help to write a proper RegEx rule?' '<strong>Hinweis:</strong> Benötigen Sie Hilfe beim Schreiben einer richtigen RegEx-Regel?' /var/www/html/admin/groups-domains.php
sudo rpl 'Have a look at our online' 'Werfen Sie einen Blick auf unsere' /var/www/html/admin/groups-domains.php 
sudo rpl 'regular expressions tutorial</a>' 'Online Hilfe</a> zu regulären Ausdrücken' /var/www/html/admin/groups-domains.php
sudo rpl 'List of <?php echo $adjective; ?> entries' 'Liste der <?php echo $adjective; ?> Einträge' /var/www/html/admin/groups-domains.php
sudo rpl '10, 25, 50, 100, "All"' '10, 25, 50, 100, "Alle"' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl '<th>Comment</th>' '<th>Kommentar</th>' /var/www/html/admin/groups-domains.php
sudo rpl '<th>Action</th>' '<th>Aktion</th>' /var/www/html/admin/groups-domains.php
sudo rpl '">Exact whitelist</option>' '">Exakte Whitelist</option>' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl '>Regex whitelist</option>' '>RegEx Whitelist</option>' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl 'utils.showAlert("info", "", "Editing " + domainRegex + "...", name' 'utils.showAlert("info", "", "Bearbeite die Domain ..." , name' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl '"Successfully " + done + " " + domainRegex' '"Domain erfolgreich bearbeitet! "' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js



# Blacklist
sudo rpl 'Add to Blacklist</button>' 'Zur Blacklist hinzufügen</button>' /var/www/html/admin/groups-domains.php
sudo rpl 'Exact blacklist</option>' 'Exakte Blacklist</option>' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl '">Regex blacklist</option>' '">RegEx Blacklist</option>' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js



# Lokale DNS Einträge
sudo rpl '<h1>Local DNS Records</h1>' '<h1>Lokale DNS Einträge</h1>' /var/www/html/admin/dns_records.php
sudo rpl 'On this page, you can add domain/IP associations' 'Auf dieser Seite können Sie Domänen- bzw. IP-Zuordnungen hinzufügen.' /var/www/html/admin/dns_records.php
sudo rpl 'Add a new domain/IP combination' 'Fügen Sie eine neue Domain/IP Kombination hinzu' /var/www/html/admin/dns_records.php
sudo rpl 'Add a domain (example.com or sub.example.com)' 'Domain hinzufügen (beispiel.com oder mobil.example.com)' /var/www/html/admin/dns_records.php
sudo rpl '<label for="ip">IP Address:</label>' '<label for="ip">IP Adresse:</label>' /var/www/html/admin/dns_records.php
sudo rpl 'placeholder="Associated IP address"' 'placeholder="Zugehörige IP Adresse"' /var/www/html/admin/dns_records.php
sudo rpl 'Add</button>' 'Hinzufügen</button>' /var/www/html/admin/dns_records.php
sudo rpl 'Updating the custom DNS entries...' 'Aktualisieren der benutzerdefinierten DNS-Einträge ...' /var/www/html/admin/dns_records.php
sudo rpl 'Success! The list will refresh.' 'Erfolgreich! Die Liste wurde aktualisiert.' /var/www/html/admin/dns_records.php
sudo rpl 'Failure! Something went wrong, see output below' 'Fehler! Irgendwas hat nicht funktioniert, siehe weiter unten' /var/www/html/admin/dns_records.php
sudo rpl '"Domain must be valid"' '"Die Domain muss gültig sein."' /var/www/html/admin/scripts/pi-hole/php/func.php
sudo rpl 'List of local DNS domains' 'Liste der lokalen DNS-Domains' /var/www/html/admin/dns_records.php
sudo rpl '<th>IP</th>' '<th>IP Adresse</th>' /var/www/html/admin/dns_records.php
sudo rpl 'Error while adding this custom DNS entry' 'Fehler beim Hinzufügen dieses benutzerdefinierten DNS-Eintrags.' /var/www/html/admin/scripts/pi-hole/js/customdns.js
sudo rpl '<th>Action</th>' '<th>Aktion</th>' /var/www/html/admin/dns_records.php



# Gruppenmanagement
#  Gruppen
sudo rpl '<h1>Group management</h1>' '<h1>Gruppen Verwaltung</h1>' /var/www/html/admin/groups.php
sudo rpl 'Add a new group' 'Neue Gruppe hinzufügen' /var/www/html/admin/groups.php
sudo rpl 'Description:' 'Beschreibung:' /var/www/html/admin/groups.php
sudo rpl 'Group name or space-separated group names' 'Gruppenname oder durch Leerzeichen getrennte Gruppennamen' /var/www/html/admin/groups.php
sudo rpl 'Group description (optional)' 'Beschreibung der Gruppe (optional)' /var/www/html/admin/groups.php
sudo rpl 'Hints' 'Hinweise' /var/www/html/admin/groups.php
sudo rpl 'Multiple groups can be added by separating each group name with a space' 'Mehrere Gruppen können hinzugefügt werden, indem jeder Gruppenname durch ein Leerzeichen getrennt wird.' /var/www/html/admin/groups.php
sudo rpl 'Group names can have spaces if entered in quotes. e.g "My New Group"' 'Gruppennamen können Leerzeichen enthalten, wenn sie in Anführungszeichen eingegeben werden. z.B. "Meine neue Gruppe".' /var/www/html/admin/groups.php
sudo rpl 'Add</button>' 'Hinzufügen</button>' /var/www/html/admin/groups.php
sudo rpl 'List of configured groups' 'Liste der konfigurierten Gruppen'  /var/www/html/admin/groups.php
sudo rpl 'Warning", "Please specify a group name' 'Achtung!", "Bitte geben Sie einen Gruppenanamen an!' /var/www/html/admin/scripts/pi-hole/js/groups.js
sudo rpl 'utils.showAlert("info", "", "Adding group...", name);' 'utils.showAlert("info", "", "Füge Gruppe hinzu ...", name);' /var/www/html/admin/scripts/pi-hole/js/groups.js
sudo rpl 'utils.showAlert("success", "fas fa-plus", "Successfully added group", name);' 'utils.showAlert("success", "fas fa-plus", "Gruppe erolgreich hinzugefügt.", name);' /var/www/html/admin/scripts/pi-hole/js/groups.js
sudo rpl '<th>Description</th>' '<th>Beschreibung</th>' /var/www/html/admin/groups.php
sudo rpl '<th>Action</th>' '<th>Aktion</th>' /var/www/html/admin/groups.php
sudo rpl 'Added: ' 'Hinzugefügt am: ' /var/www/html/admin/scripts/pi-hole/js/groups.js
sudo rpl 'nLast modified:' 'nZuletzt bearbeitet am:' /var/www/html/admin/scripts/pi-hole/js/groups.js
sudo rpl 'nDatabase ID: ' 'nDatenbank ID: ' /var/www/html/admin/scripts/pi-hole/js/groups.js
sudo rpl 'on: "Enabled"' 'on: "Aktiviert"' /var/www/html/admin/scripts/pi-hole/js/groups.js
sudo rpl 'off: "Disabled"' 'off: "Deaktiviert"' /var/www/html/admin/scripts/pi-hole/js/groups.js
sudo rpl 'Editing group...' 'Gruppe wird bearbeitet ...' /var/www/html/admin/scripts/pi-hole/js/groups.js
sudo rpl 'Successfully " + done + " group' 'Gruppe erfolgreich bearbeitet!' /var/www/html/admin/scripts/pi-hole/js/groups.js
sudo rpl 'Deleting group...' 'Gruppe wird gelöscht ...' /var/www/html/admin/scripts/pi-hole/js/groups.js
sudo rpl 'Successfully deleted group ' 'Gruppe erfolgreich gelöscht!' /var/www/html/admin/scripts/pi-hole/js/groups.js
sudo rpl 'Reset sorting</button>' 'Sortierung zurücksetzen</button>' /var/www/html/admin/groups.php



# Gruppenmanagement
#  Geräte
sudo rpl '<h1>Client group management</h1>' '<h1>Gerätegruppenverwaltung</h1>' /var/www/html/admin/groups-clients.php
sudo rpl 'Add a new client' 'Neues Gerät hinzufügen' /var/www/html/admin/groups-clients.php
sudo rpl 'Known clients:' 'Bekannt Geräte:' /var/www/html/admin/groups-clients.php
sudo rpl 'Custom, specified below...' 'Benutzerdefiniert, unten angegeben ...' /var/www/html/admin/scripts/pi-hole/js/groups-clients.js
sudo rpl 'Comment:' 'Kommentar:' /var/www/html/admin/groups-clients.php
sudo rpl 'Client description (optional)' 'Geräte Beschreibung (optional)' /var/www/html/admin/groups-clients.php
sudo rpl 'Client IP address (IPv4 or IPv6, CIDR subnetting available, optional)' 'Geräte IP Adresse (IPv4 oder IPv6, CIDR Subnetz verfügbar, optional)' /var/www/html/admin/groups-clients.php
sudo rpl '>Add</button>' '>Hinzufügen</button>' /var/www/html/admin/groups-clients.php
sudo rpl '"Warning", "Please specify a client IP address"' '"Achtung!", "Bitte geben Sie eine Geräte IP-Adresse an!"' /var/www/html/admin/scripts/pi-hole/js/groups-clients.js
sudo rpl 'Adding client...' 'Füge Gerät hinzu ...' /var/www/html/admin/scripts/pi-hole/js/groups-clients.js
sudo rpl 'Successfully added client' 'Gerät erfolgreich hinzugefügt!' /var/www/html/admin/scripts/pi-hole/js/groups-clients.js
sudo rpl 'List of configured clients' 'Liste der konfigurierten Geräte' /var/www/html/admin/groups-clients.php
sudo rpl '10, 25, 50, 100, "All"' '10, 25, 50, 100, "Alle"' /var/www/html/admin/scripts/pi-hole/js/groups-clients.js
sudo rpl '<th>IP address</th>' '<th>IP Adresse</th>' /var/www/html/admin/groups-clients.php
sudo rpl '<th>Comment</th>' '<th>Kommentar</th>' /var/www/html/admin/groups-clients.php
sudo rpl '<th>Group assignment</th>' '<th>Gruppenzuordnung</th>' /var/www/html/admin/groups-clients.php
sudo rpl '<th>Action</th>' '<th>Aktion</th>' /var/www/html/admin/groups-clients.php
sudo rpl 'Added:' 'Hinzugefügt am:' /var/www/html/admin/scripts/pi-hole/js/groups-clients.js
sudo rpl 'nLast modified:' 'nZuletzt bearbeitet am:' /var/www/html/admin/scripts/pi-hole/js/groups-clients.js
sudo rpl 'nDatabase ID:' 'nDatenbank ID:' /var/www/html/admin/scripts/pi-hole/js/groups-clients.js
sudo rpl 'Editing client...' 'Gerät wird bearbeitet ...' /var/www/html/admin/scripts/pi-hole/js/groups-clients.js
sudo rpl '"Successfully " + done + " client"' '"Gerät erfolgreich bearbeitet!"' /var/www/html/admin/scripts/pi-hole/js/groups-clients.js
sudo rpl '>Apply</button>' '>Anwenden</button>' /var/www/html/admin/scripts/pi-hole/js/groups-clients.js
sudo rpl 'bsSelectDefaults.selectAllText = "All"' 'bsSelectDefaults.selectAllText = "Alle"' /var/www/html/admin/scripts/pi-hole/js/utils.js
sudo rpl 'bsSelectDefaults.deselectAllText = "None"' 'bsSelectDefaults.deselectAllText = "Keine"' /var/www/html/admin/scripts/pi-hole/js/utils.js
sudo rpl 'Deleting client...' 'Lösche Gerät ...' /var/www/html/admin/scripts/pi-hole/js/groups-clients.js
sudo rpl 'Successfully deleted client' 'Gerät erfolgreich gelöscht.' /var/www/html/admin/scripts/pi-hole/js/groups-clients.js
sudo rpl 'Reset sorting</button>' 'Sortierung zurücksetzen</button>' /var/www/html/admin/groups-clients.php



# Gruppenmanagement
#  Domains
sudo rpl '<th>Group assignment</th>' '<th>Gruppenzuordnung</th>' /var/www/html/admin/groups-domains.php
sudo rpl 'Added: ' 'Hinzugefügt am: ' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl 'nLast modified: ' 'nZuletzt bearbeitet am: ' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl 'Database ID:' 'Datenbank ID:' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl 'on: "Enabled"' 'on: "Aktiviert"' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl 'off: "Disabled"' 'off: "Deaktiviert"' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl 'Apply</button>' 'Anwenden</button>' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl 'return "All selected (" + num + ")";' 'return "Alle ausgewählt (" + num + ")";' /var/www/html/admin/scripts/pi-hole/js/utils.js
sudo rpl 'utils.showAlert("info", "", "Deleting " + domainRegex + "...", domain)' 'utils.showAlert("info", "", "Lösche die Domain ...", domain)' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl '"Successfully deleted " + domainRegex,' '"Domain erfolgreich gelöscht!" ,' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl 'Reset sorting</button>' 'Sortierung zurücksetzen</button>' /var/www/html/admin/groups-domains.php



# Gruppenmanagement
#  Blocklisten
sudo rpl '<h1>Adlist group management</h1>' '<h1>Blocklisten Gruppen Verwaltung</h1>' /var/www/html/admin/groups-adlists.php
sudo rpl 'Add a new adlist' 'Neue Blockliste hinzufügen' /var/www/html/admin/groups-adlists.php
sudo rpl 'Address:</label>' 'Adresse:</label>' /var/www/html/admin/groups-adlists.php
sudo rpl 'Comment:</label>' 'Kommentar:</label>' /var/www/html/admin/groups-adlists.php
sudo rpl 'URL or space-separated URLs' 'URL oder durch Leerzeichen getrennte URLs' /var/www/html/admin/groups-adlists.php
sudo rpl 'Adlist description (optional)' 'Beschreibung der Blockliste (optional)' /var/www/html/admin/groups-adlists.php
sudo rpl 'Hints' 'Hinweise' /var/www/html/admin/groups-adlists.php
sudo rpl '<li>Please run <code>pihole -g</code> or update your gravity list <a href="gravity.php">online</a> after modifying your adlists.</li>' '<li>Bitte führen Sie <code>pihole -g</code> aus oder aktualisieren Sie Ihre Gravity Liste <a href="gravity.php">online</a> nachdem Sie Ihre Blockliste geändert haben.</li>' /var/www/html/admin/groups-adlists.php
sudo rpl '<li>Multiple adlists can be added by separating each <i>unique</i> URL with a space</li>' '<li>Mehrere Adlists können hinzugefügt werden, indem jede <i>eindeutige</i> URL durch ein Leerzeichen getrennt wird.</li>' /var/www/html/admin/groups-adlists.php
sudo rpl 'Add</button>' 'Hinzufügen</button>' /var/www/html/admin/groups-adlists.php
sudo rpl 'utils.showAlert("warning", "", "Warning", "Please specify an adlist address")' 'utils.showAlert("warning", "", "Achtung!", "Bitte geben Sie eine Adresse der Blockliste an!")' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl 'Adding adlist...' 'Füge Blockliste hinzu ...' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl 'Successfully added adlist' 'Blockliste erfolgreich hinzugefügt!' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl 'List of configured adlists' 'Liste der konfigurierten Blocklisten' /var/www/html/admin/groups-adlists.php
sudo rpl '10, 25, 50, 100, "All"' '10, 25, 50, 100, "All"' '10, 25, 50, 100, "All"' '10, 25, 50, 100, "Alle"' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl '<th>Address</th>' '<th>Addresse</th>' /var/www/html/admin/groups-adlists.php
sudo rpl '<th>Comment</th>' '<th>Kommentar</th>' /var/www/html/admin/groups-adlists.php
sudo rpl '<th>Group assignment</th>' '<th>Gruppenzuordnung</th>' /var/www/html/admin/groups-adlists.php
sudo rpl '<th>Action</th>' '<th>Aktion</th>' /var/www/html/admin/groups-adlists.php
sudo rpl 'Added:' 'Hinzugefügt am:' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl 'nLast modified:' 'nZuletzt bearbeitet:' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl 'nDatabase ID:' 'nDatabase ID:' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl 'on: "Enabled"' 'on: "Aktiviert"' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl 'off: "Disabled"' 'off: "Deaktiviert"' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl 'Editing adlist...' 'Bearbeite die Blockliste ...' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl 'Successfully " + done + " adlist ' 'Blockliste erfolgreich bearbeitet!' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl 'Apply</button>' 'Anwenden</button>' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl 'Deleting adlist...' 'Lösche die Blockliste ...' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl 'Successfully deleted adlist' 'Blockliste erfolgreich gelöscht.' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl 'Reset sorting</button>' 'Sortierung zurücksetzen</button' /var/www/html/admin/groups-adlists.php



# Ausschalten
sudo rpl 'Custom disable timeout' 'Benutzerdefinierte Zeit' /var/www/html/admin/scripts/pi-hole/php/footer.php
sudo rpl '> Secs' '> Sekunden' /var/www/html/admin/scripts/pi-hole/php/footer.php
sudo rpl '> Mins' '> Minuten' /var/www/html/admin/scripts/pi-hole/php/footer.php
sudo rpl 'Close</button>' 'Schließen</button>' /var/www/html/admin/scripts/pi-hole/php/footer.php
sudo rpl 'Submit</button>' 'Absenden</button>' /var/www/html/admin/scripts/pi-hole/php/footer.php



# Werkzeuge
#  Pi-hole Diagnose
sudo rpl '<h1>Pi-hole diagnosis</h1>' '<h1>Pi-hole Diagnose</h1>' /var/www/html/admin/messages.php
sudo rpl 'On this page, you can see messages from your Pi-hole concerning possible issues.' 'Auf dieser Seite können Sie Nachrichten von pi-hole bezüglich möglicher Probleme sehen.' /var/www/html/admin/messages.php
sudo rpl '<th>Time</th>' '<th>Zeit</th>' /var/www/html/admin/messages.php
sudo rpl '<th>Type</th>' '<th>Typ</th>' /var/www/html/admin/messages.php
sudo rpl '<th>Message</th>' '<th>Nachricht</th>' /var/www/html/admin/messages.php
sudo rpl 'No issues found.' 'Keine Probleme gefunden.' /var/www/html/admin/scripts/pi-hole/js/messages.js



#  Aktualisierung Gravity Liste
sudo rpl 'Update Gravity (list of blocked domains)' 'Aktualisieren der Gravity Liste (Liste der geblockten Domains)' /var/www/html/admin/gravity.php
sudo rpl '>Update<' '>Aktualisieren<' /var/www/html/admin/gravity.php
sudo rpl 'Updating... this may take a while. <strong>Please do not navigate away from or close this page.</strong>' 'Aktualisiere... dies kann eine Weile dauern. <strong>Bitte verlassen oder schließen Sie diese Seite nicht.</strong>' /var/www/html/admin/gravity.php
sudo rpl 'Success!' 'Erfolgreich aktualisiert!' /var/www/html/admin/gravity.php
sudo rpl 'Neutrino emissions detected${COL_NC}...' 'Neutrino emissions erkannt${COL_NC}...' /opt/pihole/gravity.sh
sudo rpl 'Pulling blocklist source list into range' 'Heranziehen der Blocklisten Quelle' /opt/pihole/gravity.sh
sudo rpl 'Preparing new gravity database' 'Aufbereitung einer neuen Gravity Datenbank' /opt/pihole/gravity.sh
sudo rpl 'Target:' 'Ziel:' /opt/pihole/gravity.sh
sudo rpl 'str="Status:"' 'str="Ergebnis:"' /opt/pihole/gravity.sh
sudo rpl 'Retrieval successful"' 'Abruf erfolgreich"' /opt/pihole/gravity.sh
sudo rpl 'No changes detected"' 'Keine Änderungen erkannt"' /opt/pihole/gravity.sh
sudo rpl 'Connection Refused"' 'Verbindung abgelehnt"' /opt/pihole/gravity.sh
sudo rpl 'Forbidden"' 'Verboten"' /opt/pihole/gravity.sh
sudo rpl 'Not found"' 'Nicht gefunden"' /opt/pihole/gravity.sh
sudo rpl 'Time-out"' 'Zeitüberschreitung"' /opt/pihole/gravity.sh
sudo rpl 'Unavailable For Legal Reasons"' 'Aus rechtlichen Gründen nicht verfügbar"' /opt/pihole/gravity.sh
sudo rpl 'Internal Server Error"' 'Interner Server Fehler"' /opt/pihole/gravity.sh
sudo rpl 'Connection Timed Out (Gateway)"' 'Zeitüberschreitung der Verbindung (Gateway)"' /opt/pihole/gravity.sh
sudo rpl 'Web Server Is Down (Cloudflare)"' 'Webserver ist ausgefallen (Cloudflare)"' /opt/pihole/gravity.sh
sudo rpl 'Connection Timed Out (Cloudflare)"' 'Zeitüberschreitung der Verbindung (Cloudflare)"' /opt/pihole/gravity.sh

# Nachfolgenden zwei Zeilen dürfen nicht getauscht werden
sudo rpl '${INFO} Received ${num_lines} domains, ${num_invalid} domains invalid!' '${INFO} ${num_lines} Domains empfangen, davon sind ${num_invalid} Domains ungültig!' /opt/pihole/gravity.sh
sudo rpl '${INFO} Received ${num_lines} domains' '${INFO} ${num_lines} Domains empfangen' /opt/pihole/gravity.sh

sudo rpl 'Sample of invalid domains:' 'Beispiel für ungültige Domains:' /opt/pihole/gravity.sh
sudo rpl 'Storing downloaded domains in new gravity database' 'Speichern der heruntergeladenen Domains in einer neuen Gravity Datenbank' /opt/pihole/gravity.sh
sudo rpl 'Building tree' 'Datenbaum wurde aufgebaut' /opt/pihole/gravity.sh
sudo rpl 'Swapping databases' 'Austausch der Datenbanken' /opt/pihole/gravity.sh
sudo rpl 'Number of ${str}:' 'Anzahl der ${str}:' /opt/pihole/gravity.sh
sudo rpl '"gravity domains"' '"Gravity Domains"' /opt/pihole/gravity.sh
sudo rpl 'unique domains' 'einzelne Domains'  /opt/pihole/gravity.sh
sudo rpl '"exact blacklisted domains"' '"exakt blockierten Domains"' /opt/pihole/gravity.sh
sudo rpl '"regex blacklist filters"' '"RegEx blockierten Domains"' /opt/pihole/gravity.sh
sudo rpl '"exact whitelisted domains"' '"exakt erlaubten Domains"' /opt/pihole/gravity.sh
sudo rpl '"regex whitelist filters"' '"RegEx erlaubten Domains"' /opt/pihole/gravity.sh
sudo rpl '"Cleaning up stray matter"' '"Aufräumen"' /opt/pihole/gravity.sh
sudo rpl '"  ${TICK} DNS service is running"' '"  ${TICK} DNS-Dienst läuft"' /usr/local/bin/pihole
sudo rpl '"  ${CROSS} DNS service is NOT running"' '"  ${CROSS} DNS-Dienst läuft NICHT!"' /usr/local/bin/pihole
sudo rpl '"  ${TICK} Pi-hole blocking is Enabled"' '"  ${TICK} Pi-hole ist aktiviert"' /usr/local/bin/pihole
sudo rpl '"  ${CROSS} Pi-hole blocking is Disabled"' '"  ${CROSS} Pi-hole ist deaktiviert!"' /usr/local/bin/pihole
sudo rpl '"  ${INFO} Pi-hole blocking will be enabled"' '"  ${INFO} Pi-hole wird aktiviert"' /usr/local/bin/pihole



# Werkzeuge
#  Abfragelisten
sudo rpl 'Find Blocked Domain In Lists' 'Gesperrte Domain in einer Liste finden' /var/www/html/admin/queryads.php
sudo rpl 'Domain to look for (example.com or sub.example.com)' 'zu suchende Domain (beispiel.com oder mobile.beispiel.com)' /var/www/html/admin/queryads.php
sudo rpl 'Search partial match</button>' 'Suche teilweise Übereinstimmung</button>' /var/www/html/admin/queryads.php
sudo rpl 'Search exact match</button>' 'genaue Übereinstimmung</button>' /var/www/html/admin/queryads.php
# matched aber keine Wirkung sudo rpl 'Match found in ' 'Übereinstimmung in ' /opt/pihole/gravity.sh



# Werkzeuge
#  Prüfprotokoll
sudo rpl 'Audit log (showing live data)' 'Prüfprotokoll (zeige Live-Daten)' /var/www/html/admin/auditlog.php
sudo rpl 'Allowed queries' 'Erlaubte Anfragen' /var/www/html/admin/auditlog.php
sudo rpl 'Blocked queries' 'Geblockte Anfragen' /var/www/html/admin/auditlog.php
sudo rpl '<th>Hits</th>' '<th>Treffer</th>' /var/www/html/admin/auditlog.php
sudo rpl '<th>Actions</th>' '<th>Aktionen</th>' /var/www/html/admin/auditlog.php
sudo rpl 'Audit</button>' 'Prüfung</button>' /var/www/html/admin/scripts/pi-hole/js/auditlog.js



# Werkzeuge
#  pihole.log anzeigen
sudo rpl 'Output the last lines of the pihole.log file (live)' 'Ausgabe der letzten Zeilen der Datei pihole.log (live)' /var/www/html/admin/taillog.php
sudo rpl 'Automatic scrolling on update' 'Automatisches Scrollen beim Update' /var/www/html/admin/taillog.php



# Werkzeuge
#  pihole-FTL.log anzeigen
sudo rpl 'Output the last lines of the pihole-FTL.log file (live)' 'Ausgabe der letzten Zeilen der Datei pihole-FTL.log (live)' /var/www/html/admin/taillog-FTL.php
sudo rpl 'Automatic scrolling on update' 'Automatisches Scrollen beim Update' /var/www/html/admin/taillog-FTL.php



# Werkzeuge
#  Erstelle Debug-Protokoll
sudo rpl 'Generate debug log' 'Erstelle ein Debug-Protokoll' /var/www/html/admin/debug.php
sudo rpl 'Upload debug log and provide token once finished' 'Laden Sie das Debug-Protokoll hoch und stellen Sie das Token bereit, sobald es fertig ist.' /var/www/html/admin/debug.php
sudo rpl 'Once you click this button a debug log will be generated and can automatically be uploaded if we detect a working internet connection.' 'Sobald Sie auf diese Schaltfläche klicken, wird ein Debug-Protokoll erstellt, das automatisch hochgeladen werden kann, wenn eine funktionierende Internetverbindung erkannt wird.' /var/www/html/admin/debug.php



# Werzeuge
#  Netzwerk
sudo rpl '<h3 class="box-title">Network overview</h3>' '<h3 class="box-title">Netzwerkübersicht</h3>' /var/www/html/admin/network.php
sudo rpl '10, 25, 50, 100, "All"' '10, 25, 50, 100, "Alle"' /var/www/html/admin/scripts/pi-hole/js/network.js
sudo rpl '<th>IP address</th>' '<th>IP Adresse</th>' /var/www/html/admin/network.php
sudo rpl '<th>Hardware address</th>' '<th>Hardware Adresse</th>' /var/www/html/admin/network.php
sudo rpl '<th>Interface</th>' '<th>Schnittstelle</th>' /var/www/html/admin/network.php
sudo rpl '<th>First seen</th>' '<th>Zum ersten Mal gesehen</th>' /var/www/html/admin/network.php
sudo rpl '<th>Last Query</th>' '<th>Letzte Anfrage</th>' /var/www/html/admin/network.php
sudo rpl '<th>Number of queries</th>' '<th>Anzahl der Anfragen</th>' /var/www/html/admin/network.php
sudo rpl '<th>Uses Pi-hole</th>' '<th>Verwendet Pi-hole</th>' /var/www/html/admin/network.php
sudo rpl '<em>unknown</em>' '<em>unbekannt</em>' /var/www/html/admin/scripts/pi-hole/js/network.js
sudo rpl '<label>Background color: Last query from this device seen ...</label>' '<label>Hintergrundfarbe: Letzte Anfrage von diesem Gerät gesehen ...</label>' /var/www/html/admin/network.php
sudo rpl '>just now<' '>Im Moment<' /var/www/html/admin/network.php
sudo rpl '... to ...' '... zu ...' /var/www/html/admin/network.php
sudo rpl '>24 hours ago' '>vor 24 Stunden' /var/www/html/admin/network.php
sudo rpl '>&gt; 24 hours ago' '>vor mehr als 24 Stunden' /var/www/html/admin/network.php
sudo rpl 'Device does not use Pi-hole' 'Gerät verwendet nicht Pi-hole' /var/www/html/admin/network.php



# Einstellungen
sudo rpl 'Info<' 'Information<' /var/www/html/admin/settings.php
sudo rpl 'Error<' 'Fehler<' /var/www/html/admin/settings.php



# Einstellungen
#  System
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
sudo rpl 'See also our <a href="https://docs.pi-hole.net/ftldns/dns-cache/" rel="noopener" target="_blank">DNS cache documentation</a>.' 'Siehe auch unsere <a href="https://docs.pi-hole.net/ftldns/dns-cache/" rel="noopener" target="_blank">DNS Cache Dokumentation</a>.' /var/www/html/admin/settings.php
sudo rpl 'The FTL service is offline!' 'Der FTL Service ist offline!' /var/www/html/admin/settings.php
sudo rpl 'Disable query logging</button>' 'Deaktiviere Anfrageprotokollierung</button>' /var/www/html/admin/settings.php
sudo rpl 'Confirmation required' 'Bestätigung erforderlich!' /var/www/html/admin/scripts/pi-hole/js/settings.js
sudo rpl 'Are you sure you want to disable logging?' 'Möchten Sie die Anfrageprotokollierung wirklich deaktivieren?' /var/www/html/admin/scripts/pi-hole/js/settings.js
sudo rpl '"Yes, disable logs"' '"Ja, Anfrageprotokollierung deaktivieren"' /var/www/html/admin/scripts/pi-hole/js/settings.js
sudo rpl 'No, go back' 'Nein, zurück' /var/www/html/admin/scripts/pi-hole/js/settings.js
sudo rpl 'Logging has been disabled, your logs have <strong>not</strong> been flushed' 'Die Anfrageprotokollierung wurde deaktiviert, Ihre Protokolle wurden <strong>nicht</strong> gelöscht.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'Enable query logging' 'Aktiviere Anfrageprotokollierung' /var/www/html/admin/settings.php
sudo rpl 'Logging has been enabled' 'Die Protokollierung wurde aktiviert.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'Flush network table</button>' 'Lösche die Netzwerk Tabelle</button>' /var/www/html/admin/settings.php
sudo rpl 'Are you sure you want to flush your network table?' 'Sind Sie sich sicher, die Netzwerk Tabelle zu löschen?' /var/www/html/admin/scripts/pi-hole/js/settings.js
sudo rpl 'Yes, flush my network table' 'Ja, lösche die Netzwerk Tabelle' /var/www/html/admin/scripts/pi-hole/js/settings.js
sudo rpl 'The network table has been flushed' 'Die Netzwerk Tabelle wurde gelöscht.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl '>Restart DNS resolver</button>' '>DNS-Server neu starten</button>' /var/www/html/admin/settings.php
sudo rpl 'Are you sure you want to send a restart command to your DNS server?' 'Möchten Sie wirklich den DNS-Server neu starten?' /var/www/html/admin/scripts/pi-hole/js/settings.js
sudo rpl 'Yes, restart DNS' 'Ja, DNS-Server neu starten' /var/www/html/admin/scripts/pi-hole/js/settings.js
sudo rpl 'The DNS server has been restarted' 'Der DNS Server wurde neu gestartet.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl '>Flush logs</button>' '>Protokolle löschen</button>' /var/www/html/admin/settings.php
sudo rpl 'Are you sure you want to flush your logs?' 'Sind Sie sicher, dass Sie Ihre Protokolle löschen möchten?' /var/www/html/admin/scripts/pi-hole/js/settings.js
sudo rpl 'Yes, flush logs' 'Ja, Protokolle löschen' /var/www/html/admin/scripts/pi-hole/js/settings.js
sudo rpl 'The Pi-hole log file has been flushed' 'Die Pi-hole Protokolle wurden gelöscht.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'Power off system</button>' 'System ausschalten</button>' /var/www/html/admin/settings.php
sudo rpl 'Are you sure you want to send a poweroff command to your Pi-hole?' 'Möchten Sie den Computer ausschalten?' /var/www/html/admin/scripts/pi-hole/js/settings.js
sudo rpl 'Yes, poweroff' 'Ja, Computer ausschalten' /var/www/html/admin/scripts/pi-hole/js/settings.js
sudo rpl 'The system will poweroff in 5 seconds...' 'Der Computer schaltet sich in 5 Sekunden aus ...' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl '>Restart system</button>' '>System neu starten</button>' /var/www/html/admin/settings.php
sudo rpl 'Are you sure you want to send a reboot command to your Pi-hole?' 'Möchten Sie wirklich das System neu starten?' /var/www/html/admin/scripts/pi-hole/js/settings.js
sudo rpl 'Yes, reboot' 'Ja, neu starten' /var/www/html/admin/scripts/pi-hole/js/settings.js
sudo rpl 'The system will reboot in 5 seconds...' 'Das System startet in 5 Sekunden neu ...' /var/www/html/admin/scripts/pi-hole/php/savesettings.php



# Einstellungen
#  Blocklisten

sudo rpl '>Adlists</a>' '>Blocklisten</a>' /var/www/html/admin/settings.php
sudo rpl "Adlists used to generate Pi-hole's Gravity" "Blocklisten zur Erstellung der Pi-hole Gravity-Datenbank" /var/www/html/admin/settings.php
sudo rpl '<p>Please use the <a href="groups-adlists.php">group management pages</a> to edit the adlists used by Pi-hole.</p>' '<p>Bitte verwenden Sie die Seite <a href="groups-adlists.php">Gruppen-Management</a>, um die von pi-hole verwendeten Blocklisten zu bearbeiten.</p>' /var/www/html/admin/settings.php



# Einstellungen
# DNS
sudo rpl '<h1 class="box-title">Upstream DNS Servers</h1>' '<h1 class="box-title">Upstream DNS-Server</h1>' /var/www/html/admin/settings.php
sudo rpl '<strong>Custom 1 (IPv4)</strong>' '<strong>Benutzerdefiniert 1 (IPv4)</strong>' /var/www/html/admin/settings.php
sudo rpl '<strong>Custom 2 (IPv4)</strong>' '<strong>Benutzerdefiniert 2 (IPv4)</strong>' /var/www/html/admin/settings.php
sudo rpl '<strong>Custom 3 (IPv6)</strong>' '<strong>Benutzerdefiniert 3 (IPv6)</strong>' /var/www/html/admin/settings.php
sudo rpl '<strong>Custom 4 (IPv6)</strong>' '<strong>Benutzerdefiniert 4 (IPv6)</strong>' /var/www/html/admin/settings.php
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
sudo rpl '<strong>Never forward non-FQDNs</strong>' '<strong>Niemals Nicht-FQDNs weiterleiten</strong>' /var/www/html/admin/settings.php
sudo rpl '<strong>Never forward reverse lookups for private IP ranges</strong>' '<strong>Niemals Reverse-Lookups für private IP-Bereiche weiterleiten</strong>' /var/www/html/admin/settings.php
sudo rpl '<p>Note that enabling these two options may increase your privacy' '<p>Beachten Sie, dass das Aktivieren dieser beiden Optionen Ihre Privatsphäre' /var/www/html/admin/settings.php
sudo rpl 'slightly, but may also prevent you from being able to access' 'geringfügig verbessern kann, Sie jedoch auch daran hindern kann, auf lokale' /var/www/html/admin/settings.php
sudo rpl 'local hostnames if the Pi-hole is not used as DHCP server</p>' 'Hostnamen zuzugreifen, wenn Pi-hole nicht als DHCP-Server verwendet wird.</p>' /var/www/html/admin/settings.php
sudo rpl '<strong>Use DNSSEC</strong>' '<strong>Verwende DNSSEC</strong>' /var/www/html/admin/settings.php
sudo rpl '<p>Validate DNS replies and cache DNSSEC data. When forwarding DNS' '<p>Überprüfen Sie die DNS-Antworten und speichern Sie die DNSSEC-Daten im Cache.' /var/www/html/admin/settings.php
sudo rpl 'queries, Pi-hole requests the DNSSEC records needed to validate' 'Bei der Weiterleitung von DNS Anfragen fordert Pi-hole die zur Validierung' /var/www/html/admin/settings.php
sudo rpl 'the replies. If a domain fails validation or the upstream does not' 'erforderlichen DNSSEC-Datensätze Einträge an. Wenn eine Domain die' /var/www/html/admin/settings.php
sudo rpl 'support DNSSEC, this setting can cause issues resolving domains.' 'Validierung nicht besteht oder der Upstream DNSSEC nicht unterstützt,' /var/www/html/admin/settings.php
sudo rpl 'Use Google, Cloudflare, DNS.WATCH, Quad9, or another DNS' 'kann diese Einstellung Probleme beim Auflösen von Domains verursachen. Verwenden' /var/www/html/admin/settings.php
sudo rpl 'server which supports DNSSEC when activating DNSSEC. Note that' 'Sie Google, Cloudflare, DNS.WATCH, Quad9 oder einen anderen DNS Server,' /var/www/html/admin/settings.php
sudo rpl 'the size of your log might increase significantly' 'der DNSSEC unterstützt, wenn DNSSEC aktiviert wird. Beachten Sie, dass die Größe' /var/www/html/admin/settings.php
sudo rpl 'when enabling DNSSEC. A DNSSEC resolver test can be found' 'Ihres Protokolls erheblich beim Aktivieren von DNSSEC zunehmen kann.' /var/www/html/admin/settings.php
sudo rpl '<a href="https://dnssec.vs.uni-due.de/" rel="noopener" target="_blank">here</a>' 'Einen Resolvertest für DNSSEC finden Sie <a href="https://dnssec.vs.uni-due.de/" rel="noopener" target="_blank">hier</a>' /var/www/html/admin/settings.php
sudo rpl '<h4>Conditional forwarding</h4>' '<h4>Bedingte Weiterleitung</h4>' /var/www/html/admin/settings.php
sudo rpl "<p>If not configured as your DHCP server, Pi-hole  typically won't be able to" '<p>Wenn Pi-hole nicht als DHCP-Server konfiguriert ist, kann' /var/www/html/admin/settings.php
sudo rpl 'determine the names of devices on your local network.  As a' 'es die Namen der Geräte in Ihrem lokalen Netzwerk nicht ermitteln. Daher' /var/www/html/admin/settings.php
sudo rpl 'result, tables such as Top Clients will only show IP addresses.</p>' 'werden in den Tabellen der Top Geräte nur die IP-Adressen angezeigt.</p>' /var/www/html/admin/settings.php
sudo rpl '<p>One solution for this is to configure Pi-hole to forward these' '<p>Eine Lösung hierfür besteht darin, Pi-hole so zu konfigurieren, dass die Anfragen' /var/www/html/admin/settings.php
sudo rpl 'requests to your DHCP server (most likely your router), but only for devices on your' 'an Ihren DHCP-Server (höchstwahrscheinlich an Ihren Router) weitergeleitet werden, jedoch' /var/www/html/admin/settings.php
sudo rpl 'home network.  To configure this we will need to know the IP' 'nur für Geräte in Ihrem Heimnetzwerk. Um dies zu konfigurieren, müssen wir die IP-Adresse' /var/www/html/admin/settings.php
sudo rpl 'address of your DHCP server and which addresses belong to your local network.' 'Ihres DHCP-Servers und den Namen Ihres lokalen Netzwerks kennen.</p>' /var/www/html/admin/settings.php
sudo rpl 'Exemplary inout is given below as placeholder in the text boxes (if empty).</p>' 'Beispielhaftes Inout wird unten als Platzhalter in den Textfeldern angegeben (falls leer).</p>' /var/www/html/admin/settings.php
sudo rpl '<p>If your local network spans 192.168.0.1 - 192.168.0.255, then you will have to input' 'Wenn sich Ihr lokales Netzwerk über 192.168.0.1 - 192.168.0.255 erstreckt, müssen Sie' /var/www/html/admin/settings.php
sudo rpl '<code>192.168.0.0/24</code>. If your local network is 192.168.47.1 - 192.168.47.255, it will' '<code>192.168.0.0/24</code> eingeben. Wenn Ihr lokales Netzwerk 192.168.47.1 - 192.168.47.255 ist,' /var/www/html/admin/settings.php
sudo rpl 'be <code>192.168.47.0/24</code> and similar. If your network is larger, the CIDR has to be' ' ist es <code>192.168.47.0/24</code>  und ähnlich. Wenn Ihr Netzwerk größer ist, muss der ' /var/www/html/admin/settings.php
sudo rpl 'different, for instance a range of 10.8.0.1 - 10.8.255.255 results in <code>10.8.0.0/16</code>' 'CIDR unterschiedlich sein. Beispielsweise ergibt ein Bereich von 10.8.0.1 - 10.8.255.255' /var/www/html/admin/settings.php
sudo rpl 'whereas an even wider network of 10.0.0.1 - 10.255.255.255 results in <code>10.0.0.0/8</code>' ' <code>10.8.0.0/16</code>, während ein noch breiteres Netzwerk von 10.0.0.1 - 10.255.255.255' /var/www/html/admin/settings.php
sudo rpl 'Setting up IPv6 ranges is exactly similar to setting up IPv4 here and fully supported.' ' <code>10.0.0.0/8</code> ergibt. Das Einrichten von IPv6-Bereichen ähnelt genau dem Einrichten ' /var/www/html/admin/settings.php
sudo rpl 'Feel free to reach out to us on our' 'von IPv4 hier und wird vollständig unterstützt. Sie können sich gerne in unserem ' /var/www/html/admin/settings.php
sudo rpl 'Discourse forum' '<a href="https://discourse.pi-hole.net" target="_blank">Diskussionsforum<a> an uns wenden, ' /var/www/html/admin/settings.php
sudo rpl 'in case you need any assistance setting up local host name resolution for your particular system.' 'falls Sie Hilfe beim Einrichten der lokalen Hostnamenauflösung für Ihr bestimmtes System benötigen.' /var/www/html/admin/settings.php
sudo rpl 'You can also specify a local domain name (like <code>fritz.box</code>) to ensure queries to' 'Sie können auch einen lokalen Domänennamen (wie <code>fritz.box</code>) angeben, um sicherzustellen, ' /var/www/html/admin/settings.php
sudo rpl 'devices ending in your local domain name will not leave your network, however, this is optional.' 'dass Abfragen an Geräte, die mit Ihrem lokalen Domänennamen enden, Ihr Netzwerk nicht verlassen. ' /var/www/html/admin/settings.php
sudo rpl 'The local domain name must match the domain name specified' 'Dies ist jedoch optional. Der lokale Domänenname muss mit dem auf Ihrem DHCP-Server angegebenen ' /var/www/html/admin/settings.php
sudo rpl 'in your DHCP server for this to work. You can likely find it within the DHCP settings.' 'Domänennamen übereinstimmen, damit dies funktioniert. Sie finden es wahrscheinlich in den DHCP-Einstellungen.' /var/www/html/admin/settings.php
sudo rpl '<strong>Use Conditional Forwarding</strong' '<strong>Verwende Bedingte Weiterleitung</strong' /var/www/html/admin/settings.php
sudo rpl 'Local network in ' 'Lokales Netzwerk in ' /var/www/html/admin/settings.php
sudo rpl 'CIDR notation' 'CIDR Notation'  /var/www/html/admin/settings.php
sudo rpl 'IP address of your DHCP server (router)' 'IP Adresse des DHCP Servers (Router)' /var/www/html/admin/settings.php
sudo rpl 'Local domain name (optional)' 'Lokaler Domänenname (optional)' /var/www/html/admin/settings.php
sudo rpl '>Save</button>' '>Speichern</button>' /var/www/html/admin/settings.php
sudo rpl 'The DNS settings have been updated (using ".$DNSservercount." DNS servers)' 'Die DNS Einstellungen wurden aktualisiert (es wird/werden ".$DNSservercount." DNS Server benutzt).' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'MAC address (".htmlspecialchars($mac).") is invalid!<br>' 'Die MAC Adresse (".htmlspecialchars($mac).") ist ungültig!<br>' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'IP address (".htmlspecialchars($ip).") is invalid!<br>' 'Die IP Addresse (".htmlspecialchars($ip).") ist ungültig!<br>' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'Host name (".htmlspecialchars($hostname).") is invalid!<br>' 'Der Hostname (".htmlspecialchars($hostname).") ist ungültig!<br>' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'You can not omit both the IP address and the host name!<br>' 'Sie können sowohl die IP-Adresse als auch den Hostnamen nicht weglassen!<br>' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'Static release for MAC address (".htmlspecialchars($mac).") already defined!<br>' 'Die statische MAC Addresse (".htmlspecialchars($mac).") ist bereits definiert!<br>' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'Static lease for IP address (".htmlspecialchars($ip).") already defined!' 'Die statische IP Adresse (".htmlspecialchars($ip).") ist bereits definiert!' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'Static lease for hostname (".htmlspecialchars($hostname).") already defined!<br>' 'Die statische Vergabe des Hostnamens (".htmlspecialchars($hostname).") ist bereits definiert!<br>' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'A new static address has been added' 'Eine neue statische Adresse wurde hinzugefügt.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'IP (".htmlspecialchars($IP).") is invalid!<br>' 'Die IP (".htmlspecialchars($IP).") ist ungültig!<br>' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'Port (".htmlspecialchars($port).") is invalid!<br>' 'Der Port (".htmlspecialchars($port).") ist ungültig!<br>' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'No DNS server has been selected.<br>' 'Es wurde kein DNS Server ausgewählt.<br>' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'Conditional forwarding subnet (\"".htmlspecialchars($cidr)."\") is invalid!<br>' 'Das Subnetz (\"".htmlspecialchars($cidr)."\") für die bedingte Weiterleitung ist ungültig!<br>' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'This field requires CIDR notation for local subnets (e.g., 192.168.0.0/16).<br>' 'Dieses Feld erfordert eine CIDR Notation für das lokale Subnetz (z.B. 192.168.0.0/16).<br>' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'Please use only subnets /8, /16, /24, and /32.<br>' 'Bitte benutzen Sie nur die Subnetze /8, /16, /24 oder /32.<br>' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'Conditional forwarding domain name (\"".htmlspecialchars($domain)."\") is invalid!<br>' 'Der Domainname (\"".htmlspecialchars($domain)."\") für die bedingte Weiterleitung ist ungültig!<br>' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'Conditional forwarding target IP (\"".htmlspecialchars($target)."\") is invalid!<br>' 'Die Ziel-IP (\"".htmlspecialchars($target)."\") für die bedingte Weiterleitung ist ungültig!<br>' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'The settings have been reset to their previous values' 'Die Einstellungen wurden auf ihre vorherigen Werte zurückgesetzt.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'Logging has been disabled and logs have been flushed' 'Die Protokollierung wurde deaktiviert und die Protokolle wurden gelöscht.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'Top Domains/Ads entry ".htmlspecialchars($domain)." is invalid (use only domains)!<br>' 'Top Domain Eintrag ".htmlspecialchars($domain)." ist ungültig (nur Domains verwenden)!<br>' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'Top Clients entry ".htmlspecialchars($client)." is invalid (use only host names and IP addresses)!<br>' 'Top Client Eintrag ".htmlspecialchars($client)." ist ungültig (verwende nur Hostnamen und IP-Adressen)!<br>' /var/www/html/admin/scripts/pi-hole/php/savesettings.php



# Einstellungen
#  DHCP
sudo rpl '<h3 class="box-title">DHCP Settings</h3>' '<h3 class="box-title">DHCP Einstellungen</h3>' /var/www/html/admin/settings.php
sudo rpl '<strong>DHCP server enabled</strong>' '<strong>DHCP Server einschalten</strong></label>' /var/www/html/admin/settings.php
sudo rpl "Make sure your router's DHCP server is disabled when using the Pi-hole DHCP server!" 'Vergewissern Sie sich, dass der DHCP-Server Ihres Routers deaktiviert ist, wenn Sie den Pi-hole als DHCP-Server verwenden!' /var/www/html/admin/settings.php
sudo rpl '<label>Range of IP addresses to hand out</label>' '<label>Bereich der zu verteilenden IP-Adressen</label>' /var/www/html/admin/settings.php
sudo rpl '<div class="input-group-addon">From</div>' '<div class="input-group-addon">Von</div>' /var/www/html/admin/settings.php
sudo rpl '<div class="input-group-addon">To</div>' '<div class="input-group-addon">Bis</div>' /var/www/html/admin/settings.php
sudo rpl '<label>Router (gateway) IP address</label>' '<label>IP Adresse des Routers (z.B. 192.168.178.1)</label>' /var/www/html/admin/settings.php
sudo rpl '<h3 class="box-title">Advanced DHCP settings</h3>' '<h3 class="box-title">Erweiterte DHCP Einstellungen</h3>' /var/www/html/admin/settings.php
sudo rpl 'Pi-hole domain name' 'Pi-hole Domänenname' /var/www/html/admin/settings.php
sudo rpl 'DHCP lease time' 'DHCP Leasingzeit' /var/www/html/admin/settings.php
sudo rpl 'Lease time in hours' 'Leasingzeit in Stunden' /var/www/html/admin/settings.php
sudo rpl 'Hint: 0 = infinite, 24 = one day, 168 = one week, 744 = one month, 8760 = one year' 'Hinweis: 0 = unendlich, 24 = ein Tag, 168 = eine Woche, 744 = ein Monat, 8760 = ein Jahr' /var/www/html/admin/settings.php
sudo rpl 'Enable IPv6 support (SLAAC + RA)' 'Aktiviere IPv6 Unterstützung (SLAAC + RA)' /var/www/html/admin/settings.php
sudo rpl 'Enable DHCP rapid commit (fast address assignment)' 'DHCP-Schnellübertragung aktivieren (schnelle Adresszuweisung)' /var/www/html/admin/settings.php
sudo rpl '<h3 class="box-title">DHCP leases</h3>' '<h3 class="box-title">DHCP Leases</h3>' /var/www/html/admin/settings.php
sudo rpl '<label>Currently active DHCP leases</label>' '<label>Derzeit aktive DHCP-Leases</label>' /var/www/html/admin/settings.php
sudo rpl '<th>MAC address</th>' '<th>MAC Addresse</th>' /var/www/html/admin/settings.php
sudo rpl '<th>IP address</th>' '<th>IP Adresse</th>' /var/www/html/admin/settings.php
sudo rpl 'Static DHCP leases configuration' 'Einstellungen für statische DHCP Leases' /var/www/html/admin/settings.php
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
sudo rpl 'There was a problem applying your settings.<br>Debugging information:<br>PHP error' 'Es gab ein Problem bei der Anwendung Ihrer Einstellungen.<br>Informationen zur Fehlersuche:<br>PHP Fehler' /var/www/html/admin/settings.php
sudo rpl '<p>Specifying the MAC address is mandatory and only one entry per MAC' '<p>Die Angabe der MAC-Adresse ist obligatorisch und nur ein Eintrag' /var/www/html/admin/settings.php
sudo rpl 'address is allowed. If the IP address is omitted and a host name is' 'pro MAC-Adresse ist erlaubt. Wenn die IP-Adresse weggelassen wird' /var/www/html/admin/settings.php
sudo rpl 'given, the IP address will still be generated dynamically and the' 'und ein Hostname angegeben wird, wird die IP-Adresse weiterhin dynamisch' /var/www/html/admin/settings.php
sudo rpl 'specified host name will be used. If the host name is omitted, only' 'generiert und der angegebene Hostname verwendet. Wenn der Hostname' /var/www/html/admin/settings.php
sudo rpl 'a static lease will be added.</p>' 'weggelassen wird, wird nur eine statisches Lease hinzugefügt.</p>' /var/www/html/admin/settings.php
sudo rpl 'The DHCP server has been activated' 'Der DHCP-Server wurde aktiviert.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'The DHCP server has been deactivated' 'Der DHCP-Server wurde deaktiviert.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php



# Einstellungen
#  API / Web Interface
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
sudo rpl 'Pi-hole default theme (light, default)' 'Pi-hole Standard Theme (hell, standard)' /var/www/html/admin/scripts/pi-hole/php/theme.php
sudo rpl 'Pi-hole midnight theme (dark)' 'Pi-hole Nacht Theme (dunkel)' /var/www/html/admin/scripts/pi-hole/php/theme.php
sudo rpl 'Use boxed layout (for large screens)' 'Boxed Layout verwenden (für große Bildschirme)' /var/www/html/admin/settings.php
sudo rpl 'Administrator Email Address' 'E-Mail Adresse des Administrators:' /var/www/html/admin/settings.php
sudo rpl 'Query Log' 'Anfrageprotokoll' /var/www/html/admin/settings.php
sudo rpl 'Show permitted domain entries' 'Zulässige Domain-Einträge anzeigen' /var/www/html/admin/settings.php
sudo rpl 'Show blocked domain entries' 'Geblockte Domain-Einträge anzeigen' /var/www/html/admin/settings.php
sudo rpl 'Show API token' 'API-Token anzeigen' /var/www/html/admin/settings.php
sudo rpl 'Make sure that nobody else can scan this code around you. They will have full access to the API without having to know the password. Note that the generation of the QR code will take some time.' 'Stellen Sie sicher, dass niemand diesen Code um Sie herum scannen kann. Sie haben vollen Zugriff auf die API, ohne das Kennwort kennen zu müssen. Beachten Sie, dass die Generierung des QR-Codes einige Zeit dauern wird.' /var/www/html/admin/scripts/pi-hole/js/settings.js
sudo rpl 'Yes, show API token' 'Ja, zeige API-Token' /var/www/html/admin/scripts/pi-hole/js/settings.js
sudo rpl 'The API settings have been updated' 'Die API-Einstellungen wurden aktualisiert.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'All entries will be shown in Query Log' 'Alle Einträge werden im Anfrageprotokoll angezeigt.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'Only blocked entries will be shown in Query Log' 'Im Anfrageprotokoll werden nur gesperrte Einträge angezeigt.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'Only permitted will be shown in Query Log' 'Nur erlaubte werden im Abfrageprotokoll angezeigt.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'No entries will be shown in Query Log' 'Es werden keine Einträge im Anfrageprotokoll angezeigt.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'Administrator email address (".htmlspecialchars($adminemail).") is invalid!<br>' 'Die E-Mail Adresse des Administrators (".htmlspecialchars($adminemail).") ist ungültig!<br>' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl 'Styling (auto saved, per-browser)' 'Aussehen (wird automatisch gespeichert)' /var/www/html/admin/settings.php
sudo rpl 'Checkbox and radio buttons' 'Kontrollkästchen und Optionsfelder' /var/www/html/admin/settings.php
sudo rpl 'CPU Temperature Unit' 'Einheit für die CPU Temperaturanzeige' /var/www/html/admin/settings.php
sudo rpl 'Use new Bar charts on dashboard' 'Verwenden Sie die neuen Balkendiagramme im Dashboard' /var/www/html/admin/settings.php
sudo rpl 'The webUI settings have been updated' 'Die Einstellungen der Weboberfläche wurden aktualisiert.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php



# Einstellungen
#  Privacy
sudo rpl '>Privacy<' '>Privatsphäre<' /var/www/html/admin/settings.php
sudo rpl 'Privacy settings' 'Einstellungen für Privatsphäre' /var/www/html/admin/settings.php
sudo rpl 'DNS resolver privacy level' 'DNS-Resolver Datenschutzstufe' /var/www/html/admin/settings.php
sudo rpl 'Specify if DNS queries should be anonymized, available options are:' 'Geben Sie an, ob DNS-Anfragen anonymisiert werden sollen. Folgende Optionen sind verfügbar:' /var/www/html/admin/settings.php
sudo rpl 'Show everything and record everything' 'Alles anzeigen und alles aufzeichnen' /var/www/html/admin/settings.php
sudo rpl 'Gives maximum amount of statistics' 'Gibt die maximale Anzahl von Statistiken aus.' /var/www/html/admin/settings.php

sudo rpl 'Hide domains: Display and store all domains as "hidden"' 'Domains verbergen: Alle Domains werden als "versteckt" angezeigt und gespeichert' /var/www/html/admin/settings.php
sudo rpl 'This disables the Top Domains and Top Ads tables on the dashboard' 'Dadurch werden die Tabellen Top Domains und Top Ads auf dem Dashboard deaktiviert' /var/www/html/admin/settings.php
sudo rpl 'Hide domains and clients: Display and store all domains as "hidden" and all clients as "0.0.0.0"' 'Domains und Clients ausblenden: Alle Domains werden als "versteckt" und alle Clients als "0.0.0.0" angezeigt und gespeichert' /var/www/html/admin/settings.php
sudo rpl 'This disables all tables on the dashboard' 'Dadurch werden alle Tabellen im Dashboard deaktiviert' /var/www/html/admin/settings.php
sudo rpl 'Anonymous mode: This disables basically everything except the live anonymous statistics' 'Anonymer Modus: Dies deaktiviert im Grunde alles außer den anonymen Live-Statistiken'  /var/www/html/admin/settings.php
sudo rpl 'No history is saved at all to the database, and nothing is shown in the query log. Also, there are no top item lists.' 'In der Datenbank wird kein Verlauf gespeichert und im Abfrageprotokoll wird nichts angezeigt. Es gibt auch keine Top-Listen.' /var/www/html/admin/settings.php
sudo rpl 'The privacy level may be increased at any time without having to restart the DNS resolver. However, note that the DNS resolver needs to be restarted when lowering the privacy level.' 'Die Datenschutzstufe kann jederzeit erhöht werden, ohne dass der DNS-Resolver neu gestartet werden muss. Beachten Sie jedoch, dass der DNS-Resolver neu gestartet werden muss, wenn die Datenschutzstufe gesenkt wird.' /var/www/html/admin/settings.php
sudo rpl 'This restarting is automatically done when saving.' 'Dieser Neustart erfolgt beim Speichern automatisch.' /var/www/html/admin/settings.php
sudo rpl "Warning: Pi-hole's query logging is activated. Although the dashboard will hide the requested details, all queries are still fully logged to the pihole.log file." 'Warnung: Die Abfrageprotokollierung von Pi-hole ist aktiviert. Obwohl das Dashboard die angeforderten Details ausblendet, werden alle Abfragen weiterhin vollständig in der Datei pihole.log protokolliert' /var/www/html/admin/settings.php
sudo rpl 'Apply</button>' 'Anwenden</button>' /var/www/html/admin/settings.php



# Einstellungen
#  Teleporter
sudo rpl 'Backup</h3>' 'Sicherung</h3>' /var/www/html/admin/settings.php
sudo rpl 'Backup your Pi-hole configuration (settings &amp; lists) as a downloadable archive' 'Sicherung Ihrer Pi-hole Konfiguration (Einstellungen &amp; Listen) als herunterladbares Archiv' /var/www/html/admin/settings.php
sudo rpl 'Backup</button>' 'Sicherung</button>' /var/www/html/admin/settings.php
sudo rpl 'Restore</h3>' 'Wiederherstellen</h3>' /var/www/html/admin/settings.php
sudo rpl 'Restore...</label>' 'Wiederherstellen ...</label>' /var/www/html/admin/settings.php

sudo rpl '(exact)</label>' '(exakt)</label>' /var/www/html/admin/settings.php
sudo rpl '(regex/wildcard)</label>' '(RegEx/Wildcard)</label>' /var/www/html/admin/settings.php
sudo rpl 'Adlists</label>' 'Blocklisten</label>' /var/www/html/admin/settings.php
sudo rpl 'Client</label>' 'Gerät</label>' /var/www/html/admin/settings.php
sudo rpl 'Group</label>' 'Gruppen</label>' /var/www/html/admin/settings.php
sudo rpl 'Audit log</label>' 'Prüfprotokoll</label>' /var/www/html/admin/settings.php
sudo rpl 'Static DHCP Leases</label>' 'Statische DHCP-Leases</label>' /var/www/html/admin/settings.php
sudo rpl 'Local DNS Records</label>' 'Lokale DNS-Einträge</label>' /var/www/html/admin/settings.php
sudo rpl 'File input</label>' 'Dateieingabe</label>' /var/www/html/admin/settings.php
sudo rpl 'Upload only Pi-hole backup files.</p>' 'Nur Pi-hole Sicherungsdateien hochladen</p>' /var/www/html/admin/settings.php
sudo rpl 'Clear existing data</label>' 'Vorhandene Daten löschen</label>' /var/www/html/admin/settings.php
sudo rpl 'Restore</button>' 'Wiederherstellen</button>' /var/www/html/admin/settings.php



# Einstellungen
#  Geschwindigkeitstest
#  folgt noch
#sudo rpl '>Speedtest<' '>Geschwindigkeitstest<' /var/www/html/admin/settings.php
#sudo rpl 'Speedtest settings' 'Einstellungen für Geschwindigkeitstest' /var/www/html/admin/settings.php
#sudo rpl 'Speedtest Schedule' 'Zeitplan für den Geschwindigkeitstest' /var/www/html/admin/settings.php
#sudo rpl '>Disabled<' '>Ausgeschaltet<' /var/www/html/admin/settings.php
#sudo rpl '>Every 1 Hour<' '>Jede Stunde<' /var/www/html/admin/settings.php
#sudo rpl '>Every 2 Hours<' '>Alle 2 Stunden<' /var/www/html/admin/settings.php
#sudo rpl '>Every 4 Hours<' '>Alle 4 Stunden<' /var/www/html/admin/settings.php
#sudo rpl '>Every 6 Hours<' '>Alle 6 Stunden<' /var/www/html/admin/settings.php
#sudo rpl '>Every 12 Hours<' '>Alle 12 Stunden<' /var/www/html/admin/settings.php
#sudo rpl '>Every 24 Hours<' '>Alle 24 Stunden<' /var/www/html/admin/settings.php
#sudo rpl 'Speedtest Display Range' 'Geschwindigkeitstest Anzeigebereich' /var/www/html/admin/settings.php
#sudo rpl 'Day<' 'Tag<' /var/www/html/admin/settings.php
#sudo rpl 'Days<' 'Tage<' /var/www/html/admin/settings.php
#sudo rpl 'Custom Speedtest server' 'Benutzerdefinierter Server für den Geschwindigkeitstest' /var/www/html/admin/settings.php
#sudo rpl 'Expert only!!!</span>. Get list of supported servers <a href="https://www.speedtest.net/speedtest-servers.php" target="_blank"> here</a></p>' 'Nur für Experten!!!</span>. Eine Liste der unterstützten Server finden Sie <a href="https://www.speedtest.net/speedtest-servers.php" target="_blank"> hier</a>.</p>' /var/www/html/admin/settings.php
#sudo rpl 'Flush Speedtest history' 'Löschen der Geschwindigkeitstest-Hitorie.' /var/www/html/admin/settings.php
#sudo rpl 'The Speedtest settings have been updated' 'Die Speedtest Einstellungen wurden aktualisiert.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php



# Blockseite
sudo rpl 'Website Blocked' 'Webseite gesperrt' /var/www/html/pihole/blockingpage.css
sudo rpl 'Why am I here?' 'Warum bin ich hier?' /var/www/html/pihole/blockingpage.css
sudo rpl 'About Pi-hole' 'Über Pi-hole' /var/www/html/pihole/blockingpage.css
sudo rpl 'Contact Admin' 'Kontakt Administrator' /var/www/html/pihole/blockingpage.css
sudo rpl 'The domain is being whitelisted...' 'Die Domain wird in die Whitelist aufgenommen ...' /var/www/html/pihole/blockingpage.css
sudo rpl '"Error"' '"Fehler"' /var/www/html/pihole/blockingpage.css
sudo rpl 'An unhandled exception occurred. This may happen when your browser is unable to load jQuery, or when the webserver is denying access to the Pi-hole API.' 'Eine nicht behandelte Ausnahme ist aufgetreten. Dies kann vorkommen, wenn Ihr Browser jQuery nicht laden kann oder wenn der Webserver den Zugriff auf die Pi-Hole-API verweigert.' /var/www/html/pihole/blockingpage.css
sudo rpl '"Success"' '"Erfolgreich"' /var/www/html/pihole/blockingpage.css
sudo rpl 'Website has been whitelisted! You may need to flush your DNS cache' 'Website wurde auf die Whitelist gesetzt! Möglicherweise müssen Sie Ihren DNS-Cache leeren.' /var/www/html/pihole/blockingpage.css
sudo rpl 'This site has been whitelisted. Please flush your DNS cache and/or restart your browser.' 'Diese Seite wurde auf die Whitelist gesetzt. Bitte leeren Sie Ihren DNS-Cache und/oder starten Sie Ihren Browser neu.' /var/www/html/pihole/blockingpage.css
sudo rpl "This website is not found in any of Pi-hole's blacklists. The reason you have arrived here is unknown." 'Diese Website wurde in keiner der Blacklists von Pi-hole gefunden. Der Grund, warum Sie hier angekommen sind, ist unbekannt.' /var/www/html/pihole/blockingpage.css
sudo rpl 'This site is an alias for ' 'Diese Seite ist ein Alias für ' /var/www/html/pihole/blockingpage.css
sudo rpl 'which may be blocked by Pi-hole.' 'das kann durch Pi-hole blockiert werden.' /var/www/html/pihole/blockingpage.css
# die zwei nachfolgenden Zeilen dürfen in der Reihenfolge nicht getauscht werden
sudo rpl 'Manually Blacklisted by Wildcard' 'Manuell durch Wildcard auf die Blacklist gesetzt.' /var/www/html/pihole/blockingpage.css
sudo rpl 'Manually Blacklisted' 'Manuell auf die Blacklist gesetzt.' /var/www/html/pihole/blockingpage.css
sudo rpl 'Not found on any Blacklist' 'Auf keiner Blacklist gefunden.' /var/www/html/pihole/blockingpage.css
sudo rpl 'Access to the following website has been denied:' 'Der Zugriff auf die folgende Website wurde verweigert:' /var/www/html/pihole/blockingpage.css
sudo rpl 'This is primarily due to being flagged as:' 'Dies ist in erster Linie darauf zurückzuführen, dass sie folgendermaßen gekennzeichnet ist:' /var/www/html/pihole/blockingpage.css
sudo rpl 'If you have an ongoing use for this website, please ' 'Wenn Sie diese Website nutzen möchten, dann fragen ' /var/www/html/pihole/blockingpage.css
sudo rpl 'ask the administrator' 'Sie bitte den Administrator' /var/www/html/pihole/blockingpage.css
sudo rpl ' of the Pi-hole on this network to have it whitelisted' " des Pi-hole's in diesem Netzwerk, damit er die Website auf die Whitelist setzt." /var/www/html/pihole/blockingpage.css
sudo rpl 'Back to safety' 'Zurück zur Sicherheit' /var/www/html/pihole/blockingpage.css
sudo rpl 'Technical Info' 'Technische Information' /var/www/html/pihole/blockingpage.css
sudo rpl 'This site is found in ' 'Diese Seite befindet sich in ' /var/www/html/pihole/blockingpage.css
sudo rpl '" of "' '" von "' /var/www/html/pihole/blockingpage.css
sudo rpl '" lists:"' '" Listen:"' /var/www/html/pihole/blockingpage.css
sudo rpl '"Whitelist"' '"auf die Whitelist setzen"' /var/www/html/pihole/blockingpage.css
sudo rpl 'Page generated on ' 'Seite generiert am ' /var/www/html/pihole/blockingpage.css



# Fußleiste
sudo rpl '<strong><a href="https://pi-hole.net/donate/" rel="noopener" target="_blank"><i class="fa fa-heart text-red"></i> Donate</a></strong> if you found this useful.' '<strong><a href="https://pi-hole.net/donate/" rel="noopener" target="_blank"><i class="fa fa-heart text-red"></i> Spenden</a></strong> Sie bitte, wenn Sie Pi-hole nützlich finden.<br><a href="" <i class="fa fa-edit"></a></i>Übersetzt von <a href="https://github.com/pimanDE"><strong>pimanDE</strong></a>.' /var/www/html/admin/scripts/pi-hole/php/footer.php
sudo rpl 'Update available' 'Aktualisierung vorhanden' /var/www/html/admin/scripts/pi-hole/php/footer.php



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
