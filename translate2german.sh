#!/bin/bash
#
# Weboberfläche des Pi-hole auf deutsch übersetzen
# getestet auf Pi-hole Version v5.17.1 - FTL Version v5.23 - Web Interface Version v5.20.1
#
# Benutzung auf eigene Gefahr!
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

####################################################################################################################
# Start des Script's

clear

if dpkg-query -s rpl 2>/dev/null|grep -q installed; then
    echo "rpl ist schon installiert ..." >> /dev/null
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

exec > /tmp/error-translate.log

echo

sudo cp -ra /var/www/html/ /var/www/html.sicherung.vom.$date					# Sicherung des Verzeichnisses
sudo cp -a /opt/pihole/gravity.sh /opt/pihole/gravity.sh.sicherung.vom.$date    # Sicherung der gravity.sh
sudo cp -a /opt/pihole/query.sh /opt/pihole/query.sh.sicherung.vom.$date        # Sicherung der query.sh
sudo cp -a /usr/local/bin/pihole /usr/local/bin/pihole.sicherung.vom.$date		# Sicherung der pihole



# Startseite
# sudo rpl --encoding UTF-8 'Your black hole for Internet advertisements' 'Ihr schwarzes Loch für Internetwerbung' /var/www/html/pihole/index.php
# sudo rpl --encoding UTF-8 'Did you mean to go to the admin panel\?' 'Wollen Sie zum Admin-Bereich wechseln?' /var/www/html/pihole/index.php



# Anmeldeseite
sudo rpl --encoding UTF-8 'Verify that cookies are allowed for' 'Prüfen Sie, ob Cookies zugelassen sind für' /var/www/html/admin/login.php
sudo rpl --encoding UTF-8 'placeholder="Password"' 'placeholder="Passwort"' /var/www/html/admin/login.php
sudo rpl --encoding UTF-8 'Wrong password!</label>' 'Falsches Passwort!</label>' /var/www/html/admin/login.php
sudo rpl --encoding UTF-8 'Remember me for 7 days</label>' '7 Tage merken</label>' /var/www/html/admin/login.php
sudo rpl --encoding UTF-8 'Log in</button>' 'Einloggen' /var/www/html/admin/login.php
sudo rpl --encoding UTF-8 'Forgot password\?</h3' 'Passwort vergessen?</h3' /var/www/html/admin/login.php
sudo rpl --encoding UTF-8 'After installing Pi-hole for the first time, a password is generated and displayed' 'Nach der Erstinstallation von Pi-hole wird ein Passwort generiert und dem Benutzer angezeigt.' /var/www/html/admin/login.php
sudo rpl --encoding UTF-8 'to the user. The password cannot be retrieved later on, but it is possible to set' 'Das Passwort kann später nicht mehr abgerufen werden. Es ist aber möglich, ein neues Passwort' /var/www/html/admin/login.php
sudo rpl --encoding UTF-8 'a new password \(or explicitly disable the password by setting an empty password\)' 'zu setzen (oder das Passwort explizit zu deaktivieren, indem man ein leeres Passwort setzt).' /var/www/html/admin/login.php
sudo rpl --encoding UTF-8 'using the command' 'Hierzu wird folgender Befehl verwendet:' /var/www/html/admin/login.php
sudo rpl --encoding UTF-8 'Documentation</a>' 'Dokumentation</a>' /var/www/html/admin/login.php
sudo rpl --encoding UTF-8 'Github</a>' 'Github</a>' /var/www/html/admin/login.php
sudo rpl --encoding UTF-8 'Pi-hole Discourse</a>' 'Pi-hole Hilfe</a>' /var/www/html/admin/login.php
sudo rpl --encoding UTF-8 'Donate</a></strong> if you found this useful.' 'Spenden</a></strong> Sie bitte, wenn Sie Pi-hole nützlich finden.' /var/www/html/admin/login.php



# Statusanzeige oben links
sudo rpl --encoding UTF-8 'Active</span>' 'Aktiv</span>' /var/www/html/admin/scripts/pi-hole/php/sidebar.php
sudo rpl --encoding UTF-8 'Blocking disabled</span>' 'Blockierung ist aus!</span>' /var/www/html/admin/scripts/pi-hole/php/sidebar.php
sudo rpl --encoding UTF-8 '</i> Active' '</i> Aktiv' /var/www/html/admin/scripts/pi-hole/js/footer.js
sudo rpl --encoding UTF-8 'Blocking disabled' 'Blockierung ist aus!' /var/www/html/admin/scripts/pi-hole/js/footer.js
sudo rpl --encoding UTF-8 'DNS service not running</span>' 'DNS Dienst läuft nicht!</span>' /var/www/html/admin/scripts/pi-hole/php/sidebar.php
sudo rpl --encoding UTF-8 'Unknown</span>' 'Unbekannt</span>' /var/www/html/admin/scripts/pi-hole/php/sidebar.php
sudo rpl --encoding UTF-8 'DNS service on port' 'DNS Dienst läuft auf Port' /var/www/html/admin/scripts/pi-hole/php/sidebar.php
sudo rpl --encoding UTF-8 '"Detected ' '"' /var/www/html/admin/scripts/pi-hole/php/sidebar.php
sudo rpl --encoding UTF-8 'cores">' 'Kerne erkannt">' /var/www/html/admin/scripts/pi-hole/php/sidebar.php
sudo rpl --encoding UTF-8 'Temp:&nbsp;' 'Temperatur:&nbsp;' /var/www/html/admin/scripts/pi-hole/php/sidebar.php
sudo rpl --encoding UTF-8 'Load:&nbsp;&nbsp;' 'Auslastung:&nbsp;&nbsp;' /var/www/html/admin/scripts/pi-hole/php/sidebar.php
sudo rpl --encoding UTF-8 'Memory usage:&nbsp;&nbsp;' 'Speicher:&nbsp;&nbsp;' /var/www/html/admin/scripts/pi-hole/php/sidebar.php



# Statusanzeige oben rechts
sudo rpl --encoding UTF-8 '<h1>JavaScript Is Disabled</h1><p>JavaScript is required for the site to function.</p>' '<h1>JavaScript ist deaktiviert.</h1><p>JavaScript ist für das Funktionieren der Website erforderlich.</p>' /var/www/html/admin/scripts/pi-hole/php/header_authenticated.php
sudo rpl --encoding UTF-8 '<p>To learn how to enable JavaScript click' '<p>Um zu erfahren, wie Sie JavaScript aktivieren, klicken Sie ' /var/www/html/admin/scripts/pi-hole/php/header_authenticated.php
sudo rpl --encoding UTF-8 'here</a>' 'hier</a>' /var/www/html/admin/scripts/pi-hole/php/header_authenticated.php
sudo rpl --encoding UTF-8 'Close</label' 'Schließen</label' /var/www/html/admin/scripts/pi-hole/php/header_authenticated.php
sudo rpl --encoding UTF-8 'Toggle navigation</span>' 'Navigation umschalten</span>' /var/www/html/admin/scripts/pi-hole/php/header_authenticated.php
sudo rpl --encoding UTF-8 'hostname:</span>' 'Rechnername:</span>' /var/www/html/admin/scripts/pi-hole/php/header_authenticated.php
sudo rpl --encoding UTF-8 'Documentation</a>' 'Dokumentation</a>' /var/www/html/admin/scripts/pi-hole/php/header_authenticated.php
sudo rpl --encoding UTF-8 'Pi-hole Website' 'Pi-hole Webseite' /var/www/html/admin/scripts/pi-hole/php/header_authenticated.php
sudo rpl --encoding UTF-8 'Pi-hole Forum</a>' 'Pi-hole Forum</a>' /var/www/html/admin/scripts/pi-hole/php/header_authenticated.php
sudo rpl --encoding UTF-8 'GitHub</a>' 'GitHub</a>' /var/www/html/admin/scripts/pi-hole/php/header_authenticated.php
sudo rpl --encoding UTF-8 'Pi-hole Releases</a>' 'Pi-hole Veröffentlichungen</a>' /var/www/html/admin/scripts/pi-hole/php/header_authenticated.php
sudo rpl --encoding UTF-8 'Log out</a>' 'Log out</a>' /var/www/html/admin/scripts/pi-hole/php/header_authenticated.php



# Linke Menüleiste
sudo rpl --encoding UTF-8 '<span>Dashboard</span>' '<span>Übersicht</span>' /var/www/html/admin/scripts/pi-hole/php/sidebar.php
sudo rpl --encoding UTF-8 '<span>Query Log</span>' '<span>Anfragen Protokoll</span>' /var/www/html/admin/scripts/pi-hole/php/sidebar.php
sudo rpl --encoding UTF-8 '<span>Long-term Data</span>' '<span>Langzeitdaten</span>' /var/www/html/admin/scripts/pi-hole/php/sidebar.php
sudo rpl --encoding UTF-8 '</i> Graphics' '</i> Grafiken' /var/www/html/admin/scripts/pi-hole/php/sidebar.php
sudo rpl --encoding UTF-8 '</i> Query Log' '</i> Anfragen Protokoll' /var/www/html/admin/scripts/pi-hole/php/sidebar.php
sudo rpl --encoding UTF-8 '</i> Top Lists' '</i> Top Listen' /var/www/html/admin/scripts/pi-hole/php/sidebar.php
sudo rpl --encoding UTF-8 'Group Management</li>' 'Gruppen verwaltung</li>' /var/www/html/admin/scripts/pi-hole/php/sidebar.php
sudo rpl --encoding UTF-8 '<span>Groups</span>' '<span>Gruppen</span>' /var/www/html/admin/scripts/pi-hole/php/sidebar.php
sudo rpl --encoding UTF-8 '<span>Clients</span>' '<span>Geräte</span>' /var/www/html/admin/scripts/pi-hole/php/sidebar.php
sudo rpl --encoding UTF-8 '<span>Domains</span>' '<span>Domains</span>' /var/www/html/admin/scripts/pi-hole/php/sidebar.php
sudo rpl --encoding UTF-8 '<span>Adlists</span>' '<span>Blocklisten</span>' /var/www/html/admin/scripts/pi-hole/php/sidebar.php
sudo rpl --encoding UTF-8 '<span>Disable Blocking&nbsp' '<span>Blocken ausschalten&nbsp' /var/www/html/admin/scripts/pi-hole/php/sidebar.php
sudo rpl --encoding UTF-8 '</i> Indefinitely' '</i> Permanent' /var/www/html/admin/scripts/pi-hole/php/sidebar.php
sudo rpl --encoding UTF-8 '</i> For 10 seconds' '</i> Für 10 Sekunden' /var/www/html/admin/scripts/pi-hole/php/sidebar.php
sudo rpl --encoding UTF-8 'Enable Blocking' 'Blocken einschalten' /var/www/html/admin/scripts/pi-hole/js/footer.js
sudo rpl --encoding UTF-8 '</i> For 30 seconds' '</i> Für 30 Sekunden' /var/www/html/admin/scripts/pi-hole/php/sidebar.php
sudo rpl --encoding UTF-8 '</i> For 5 minutes' '</i> Für 5 Minuten' /var/www/html/admin/scripts/pi-hole/php/sidebar.php
sudo rpl --encoding UTF-8 '/i> Custom time' '/i> Benutzerdefinierte Zeit' /var/www/html/admin/scripts/pi-hole/php/sidebar.php
sudo rpl --encoding UTF-8 'Enable Blocking&nbsp;&nbsp;&nbsp;' 'Blocken einschalten&nbsp;&nbsp;&nbsp;' /var/www/html/admin/scripts/pi-hole/php/sidebar.php
sudo rpl --encoding UTF-8 'Local DNS</span>' 'Lokale DNS Einträge</span>' /var/www/html/admin/scripts/pi-hole/php/sidebar.php
sudo rpl --encoding UTF-8 '</i> DNS Records' '</i> DNS Einträge' /var/www/html/admin/scripts/pi-hole/php/sidebar.php
sudo rpl --encoding UTF-8 '</i> CNAME Records' '</i> CNAME Einträge' /var/www/html/admin/scripts/pi-hole/php/sidebar.php
sudo rpl --encoding UTF-8 '<span>Tools</span>' '<span>Werkzeuge</span>' /var/www/html/admin/scripts/pi-hole/php/sidebar.php
sudo rpl --encoding UTF-8 '</i> Pi-hole diagnosis' '</i> Pi-hole Diagnose' /var/www/html/admin/scripts/pi-hole/php/sidebar.php
sudo rpl --encoding UTF-8 '</i> Update Gravity' '</i> Aktualisierung der Blocklisten' /var/www/html/admin/scripts/pi-hole/php/sidebar.php
sudo rpl --encoding UTF-8 '</i> Search Adlists' '</i> Blocklisten durchsuchen' /var/www/html/admin/scripts/pi-hole/php/sidebar.php
sudo rpl --encoding UTF-8 '</i> Audit log' '</i> Prüfprotokoll' /var/www/html/admin/scripts/pi-hole/php/sidebar.php
sudo rpl --encoding UTF-8 'Tail pihole.log' 'pihole.log anzeigen' /var/www/html/admin/scripts/pi-hole/php/sidebar.php
sudo rpl --encoding UTF-8 '</i> Generate debug log' '</i> Erstelle Debug-Protokoll' /var/www/html/admin/scripts/pi-hole/php/sidebar.php
sudo rpl --encoding UTF-8 '</i> Network' '</i> Netzwerk' /var/www/html/admin/scripts/pi-hole/php/sidebar.php
sudo rpl --encoding UTF-8 '<span>Settings</span>' '<span>Einstellungen</span>' /var/www/html/admin/scripts/pi-hole/php/sidebar.php
sudo rpl --encoding UTF-8 '<span>Donate</span>' '<span>Spenden</span>' /var/www/html/admin/scripts/pi-hole/php/sidebar.php



# Übersicht
sudo rpl --encoding UTF-8 '<p>Total queries' '<p>Anfragen insgesamt' /var/www/html/admin/index.php
sudo rpl --encoding UTF-8 'active clients <i' 'aktive Geräte <i' /var/www/html/admin/index.php
sudo rpl --encoding UTF-8 'only A \+ AAAA queries \(" \+ data.dns_queries_all_types \+ " in total\)' 'nur A + AAAA Anfragen (" + data.dns_queries_all_types + " insgesamt)' /var/www//html/admin/scripts/pi-hole/js/index.js
sudo rpl --encoding UTF-8 '<p>Queries Blocked</p>' '<p>Geblockte Anfragen</p>' /var/www/html/admin/index.php
sudo rpl --encoding UTF-8 'List blocked queries <i' 'Liste der geblockten Anfragen <i' /var/www/html/admin/index.php
sudo rpl --encoding UTF-8 '<p>Percentage Blocked</p>' '<p>Geblockt in Prozent</p>' /var/www/html/admin/index.php
sudo rpl --encoding UTF-8 'List all queries <i' 'Liste aller Anfragen <i' /var/www/html/admin/index.php
sudo rpl --encoding UTF-8 'Domains on Adlists' 'Domains in den Blocklisten' /var/www/html/admin/index.php
sudo rpl --encoding UTF-8 'Manage adlists <i' 'Verwalten der Blocklisten <i' /var/www/html/admin/index.php
sudo rpl --encoding UTF-8 'Gravity database not available' 'Die Gravity Datenbank ist verfügbar' /var/www/html/admin/scripts/pi-hole/php/gravity.php
sudo rpl --encoding UTF-8 'Adlists updated %a days, %H:%I \(hh:mm\) ago' 'Die Blockliste wurde vor %a Tagen, %H Stunden und :%I Minuten aktualisiert' /var/www/html/admin/scripts/pi-hole/php/gravity.php
sudo rpl --encoding UTF-8 'Adlists updated one day, %H:%I \(hh:mm\) ago' 'Die Blockliste wurde vor 1 Tag, %H Stunden und %I Minuten aktualisiert' /var/www/html/admin/scripts/pi-hole/php/gravity.php
sudo rpl --encoding UTF-8 'Adlists updated %H:%I \(hh:mm\) ago' 'Die Blockliste wurde vor %H Stunden und %I Minuten aktualisiert' /var/www/html/admin/scripts/pi-hole/php/gravity.php
sudo rpl --encoding UTF-8 'data.dns_queries_today = "Lost"' 'data.dns_queries_today = "Keine"' /var/www/html/admin/scripts/pi-hole/js/index.js
sudo rpl --encoding UTF-8 'data.ads_blocked_today = "connection"' 'data.ads_blocked_today = "Verbindung"' /var/www/html/admin/scripts/pi-hole/js/index.js
sudo rpl --encoding UTF-8 'data.ads_percentage_today = "to"' 'data.ads_percentage_today = "zur"' /var/www/html/admin/scripts/pi-hole/js/index.js
sudo rpl --encoding UTF-8 '!== "to" \?' '!== "zur" ?' /var/www/html/admin/scripts/pi-hole/js/index.js
sudo rpl --encoding UTF-8 'data.domains_being_blocked = "API"' 'data.domains_being_blocked = "API"' /var/www/html/admin/scripts/pi-hole/js/index.js
sudo rpl --encoding UTF-8 'Total queries over last ' 'Gesamtzahl der Anfragen der letzten ' /var/www/html/admin/index.php
sudo rpl --encoding UTF-8 'hours' 'Stunden' /var/www/html/admin/index.php
sudo rpl --encoding UTF-8 'return "Queries from " \+ from \+ " to " \+ to' 'return "Anfragen von " + from + " Uhr bis " + to + " Uhr"' /var/www/html/admin/scripts/pi-hole/js/index.js
sudo rpl --encoding UTF-8 'Permitted DNS Queries' 'Erlaubte DNS Anfragen' /var/www/html/admin/scripts/pi-hole/js/index.js
sudo rpl --encoding UTF-8 'Blocked DNS Queries' 'Geblockte DNS Anfragen' /var/www/html/admin/scripts/pi-hole/js/index.js
sudo rpl --encoding UTF-8 'Client activity over last' 'Geräteaktivität der letzten ' /var/www/html/admin/index.php
sudo rpl --encoding UTF-8 'return "Client activity from " \+ from \+ " to " \+ to' 'return "Geräteaktivität von " + from + " Uhr bis " + to + " Uhr"'  /var/www/html/admin/scripts/pi-hole/js/index.js
sudo rpl --encoding UTF-8 '<td>No activity recorded</td>' '<td>Keine Aktivität aufgezeichnet.</td>' /var/www/html/admin/scripts/pi-hole/js/index.js
sudo rpl --encoding UTF-8 'Query Types' 'Anfragetypen' /var/www/html/admin/index.php
sudo rpl --encoding UTF-8 '"Query type"' '"Anfragetyp"' /var/www/html/admin/scripts/pi-hole/js/index.js
sudo rpl --encoding UTF-8 'Upstream servers' 'Upstream Server' /var/www/html/admin/index.php
sudo rpl --encoding UTF-8 '"Upstream server"' '"Upstream Server"' /var/www/html/admin/scripts/pi-hole/js/index.js
sudo rpl --encoding UTF-8 'title = "List' 'title="Liste der' /var/www/html/admin/scripts/pi-hole/js/index.js
sudo rpl --encoding UTF-8 ' queries"' ' Anfragen"' /var/www/html/admin/scripts/pi-hole/js/index.js
sudo rpl --encoding UTF-8 'Top Permitted Domains' 'Am meisten zugelassene Domains' /var/www/html/admin/index.php
sudo rpl --encoding UTF-8 '<th>Hits</th>' '<th>Treffer</th>' /var/www/html/admin/index.php
sudo rpl --encoding UTF-8 '<th>Frequency</th>' '<th>Häufigkeit</th>' /var/www/html/admin/index.php
sudo rpl --encoding UTF-8 '"% of " \+ total' '" % von insgesamt " + total + " Treffern"' /var/www/html/admin/scripts/pi-hole/js/utils.js
sudo rpl --encoding UTF-8 'Access "Tools' 'Weitere Einzelheiten unter "Werkzeuge' /var/www/html/admin/scripts/pi-hole/js/utils.js
sudo rpl --encoding UTF-8 'Pi-hole diganosis' 'Pi-hole Diagnose' /var/www/html/admin/scripts/pi-hole/js/utils.js
sudo rpl --encoding UTF-8 'There are " \+ data.message_count \+ " warnings.' 'Es gibt " + data.message_count + " Warnungen.' /var/www/html/admin/scripts/pi-hole/js/utils.js
sudo rpl --encoding UTF-8 'There is one warning.' 'Es gibt 1 Warnung.' /var/www/html/admin/scripts/pi-hole/js/utils.js
sudo rpl --encoding UTF-8 ' for further details.' '.' /var/www/html/admin/scripts/pi-hole/js/utils.js
sudo rpl --encoding UTF-8 '% of all queries<br>' '% aller Anfragen<br>' /var/www/html/admin/scripts/pi-hole/js/index.js
sudo rpl --encoding UTF-8 '% of shown items' '% aller Anfragetypen' /var/www/html/admin/scripts/pi-hole/js/index.js
sudo rpl --encoding UTF-8 '"Toggle visibility"' '"Sichtbarkeit umschalten"' /var/www/html/admin/scripts/pi-hole/js/index.js
sudo rpl --encoding UTF-8 'Top Blocked Domains' 'Am meisten geblockte Domains' /var/www/html/admin/index.php
sudo rpl --encoding UTF-8 'Top Clients \(total\)' 'Top Geräte (insgesamt)' /var/www/html/admin/index.php
sudo rpl --encoding UTF-8 '<th>Client</th>' '<th>Gerät</th>' /var/www/html/admin/index.php
sudo rpl --encoding UTF-8 '<th>Requests</th>' '<th>Anfragen</th>' /var/www/html/admin/index.php
sudo rpl --encoding UTF-8 'Top Clients \(blocked only\)' 'Top Geräte (nur geblockt)' /var/www/html/admin/index.php



# Anfragen Protokoll
sudo rpl --encoding UTF-8 'The server took too long to send the data.' 'Der Server hat zu lange gebraucht, um die Daten zu senden.' /var/www/html/admin/scripts/pi-hole/js/queries.js
sudo rpl --encoding UTF-8 '"Connection refused"' '"Verbindung verweigert"' /var/www/html/admin/scripts/pi-hole/js/queries.js
sudo rpl --encoding UTF-8 'An error occurred while loading the data: Connection refused. Is FTL running\?' 'Beim Laden der Daten ist ein Fehler aufgetreten: Verbindung abgelehnt. Läuft FTL?' /var/www/html/admin/scripts/pi-hole/js/queries.js
sudo rpl --encoding UTF-8 'An unknown error occurred while loading the data.' 'Beim Laden der Daten ist ein unbekannter Fehler aufgetreten.' /var/www/html/admin/scripts/pi-hole/js/queries.js
sudo rpl --encoding UTF-8 'Processing\.\.\.' 'wird bearbeitet ...' /var/www/html/admin/scripts/vendor/datatables.min.js
sudo rpl --encoding UTF-8 'sLoadingRecords:"Loading..."' 'sLoadingRecords:"Lade ..."' /var/www/html/admin/scripts/vendor/datatables.min.js
sudo rpl --encoding UTF-8 'Recent Queries' 'Letzte Anfragen' /var/www/html/admin/queries.php
sudo rpl --encoding UTF-8 "showing = 'showing'" "showing = 'zeige'" /var/www/html/admin/queries.php
sudo rpl --encoding UTF-8 "'showing permitted'" "'zeige zugelassene'" /var/www/html/admin/queries.php
sudo rpl --encoding UTF-8 "'showing blocked'" "'zeige geblockte'" /var/www/html/admin/queries.php
sudo rpl --encoding UTF-8 'showing no queries \(due to setting\)' 'keine Abfragen anzeigen (aufgrund der Einstellung)' /var/www/html/admin/queries.php
sudo rpl --encoding UTF-8 'all queries within the Pi-hole log' 'alle Abfragen des Pi-hole Protokolls' /var/www/html/admin/queries.php
sudo rpl --encoding UTF-8 'blocked queries for client' 'geblockte Anfragen für Gerät' /var/www/html/admin/queries.php
sudo rpl --encoding UTF-8 'all queries for client' 'alle Anfragen für Gerät' /var/www/html/admin/queries.php
sudo rpl --encoding UTF-8 'show blocked only</a>' 'zeige nur geblockte</a>' /var/www/html/admin/queries.php
sudo rpl --encoding UTF-8 'queries blocked by Pi-hole' 'Anfragen geblockt von Pi-hole' /var/www/html/admin/queries.php
sudo rpl --encoding UTF-8 'queries answered from cache' 'Anfragen beantwortet vom Cache' /var/www/html/admin/queries.php
sudo rpl --encoding UTF-8 'queries for upstream destination' 'Anfragen für Upstream Ziel' /var/www/html/admin/queries.php
sudo rpl --encoding UTF-8 'queries for domain' 'Anfragen für die Domain' /var/www/html/admin/queries.php
sudo rpl --encoding UTF-8 'queries within specified time interval' 'Abfragen innerhalb des angegebenen Zeitintervalls' /var/www/html/admin/queries.php
sudo rpl --encoding UTF-8 'up to 100 queries' 'bis zu 100 Anfragen' /var/www/html/admin/queries.php
sudo rpl --encoding UTF-8 'show all</a>' ' oder zeige alle Anfragen</a>' /var/www/html/admin/queries.php
sudo rpl --encoding UTF-8 'Type / Domain / Client' 'Typ / Domain / Gerät' /var/www/html/admin/scripts/pi-hole/js/queries.js
sudo rpl --encoding UTF-8 '"Search:"' '"Suche:"' /var/www/html/admin/scripts/vendor/datatables.min.js
sudo rpl --encoding UTF-8 '"Show _MENU_ entries"' '"Zeige _MENU_ Einträge"' /var/www/html/admin/scripts/vendor/datatables.min.js
sudo rpl --encoding UTF-8 '10, 25, 50, 100, "All"' '10, 25, 50, 100, "Alle"' /var/www/html/admin/scripts/pi-hole/js/queries.js
sudo rpl --encoding UTF-8 '"Next",sPrevious:"Previous"}' '"Nächste",sPrevious:"Vorherige"}' /var/www/html/admin/scripts/vendor/datatables.min.js
sudo rpl --encoding UTF-8 '<th>Time</th>' '<th>Zeit</th>' /var/www/html/admin/queries.php
sudo rpl --encoding UTF-8 '<th>Type</th>' '<th>Typ</th>' /var/www/html/admin/queries.php
sudo rpl --encoding UTF-8 '<th>Client</th>' '<th>Gerät</th>' /var/www/html/admin/queries.php
sudo rpl --encoding UTF-8 '<th>Reply</th>' '<th>Wiederholung</th>' /var/www/html/admin/queries.php
sudo rpl --encoding UTF-8 '<th>Action</th>' '<th>Aktion</th>' /var/www/html/admin/queries.php
sudo rpl --encoding UTF-8 'Blocked \(gravity\)' 'Geblockt (Gravity)' /var/www/html/admin/scripts/pi-hole/js/queries.js
sudo rpl --encoding UTF-8 '\(sent to ' '(gesendet an ' /var/www/html/admin/scripts/pi-hole/js/queries.js
sudo rpl --encoding UTF-8 '\(answered by ' '(beantwortet von ' /var/www/html/admin/scripts/pi-hole/js/queries.js
sudo rpl --encoding UTF-8 'Blocked \(gravity\)' 'Geblockt (Gravity)' /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl --encoding UTF-8 "Blocked <br class='hidden-lg'>\(regex blacklist\)" "Geblockt <br class='hidden-lg'>(RegEx Blacklist)" /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl --encoding UTF-8 "Blocked <br class='hidden-lg'>\(exact blacklist\)" "Geblockt <br class='hidden-lg'>(exakte Blacklist)" /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl --encoding UTF-8 "Blocked <br class='hidden-lg'>\(external, IP\)" "Geblockt <br class='hidden-lg'>(extern, IP)" /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl --encoding UTF-8 "Blocked <br class='hidden-lg'>\(external, NULL\)" "Geblockt <br class='hidden-lg'>(extern, NULL)" /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl --encoding UTF-8 "Blocked <br class='hidden-lg'>\(external, NXRA\)" "Geblockt <br class='hidden-lg'>(extern, NXRA)" /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl --encoding UTF-8 "Blocked <br class='hidden-lg'>\(regex blacklist, CNAME\)" "Geblockt <br class='hidden-lg'>(RegEx Blacklist, CNAME)" /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl --encoding UTF-8 "Blocked <br class='hidden-lg'>\(exact blacklist, CNAME\)" "Geblockt <br class='hidden-lg'>(exakte Blacklist, CNAME)" /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl --encoding UTF-8 'Retried</span>' 'Erneut versucht</span>' /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl --encoding UTF-8 '\(ignored\)' '(ignoriert)' /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl --encoding UTF-8 '\(already forwarded\)' '(bereits weitergeleitet)' /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl --encoding UTF-8 '\(database is busy\)' '(Datenbank ist beschäftigt)' /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl --encoding UTF-8 "\(special domain\)" "(spezielle Domain)" /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl --encoding UTF-8 "Blocked <br class='hidden-lg'>\(database is busy\)" "Geblockt <br class='hidden-lg'>(Datenbank ist beschäftigt)" /var/www/html/admin/scripts/pi-hole/js/queries.js
sudo rpl --encoding UTF-8 '>\(cache\)' '>(zwischengespeichert)' /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl --encoding UTF-8 '>\(cache\)' '>(zwischengespeichert)' /var/www/html/admin/scripts/pi-hole/js/queries.js
sudo rpl --encoding UTF-8 "Blocked <br class='hidden-lg'>\(regex blacklist\)" "Geblockt <br class='hidden-lg'>(RegEx Blacklist)" /var/www/html/admin/scripts/pi-hole/js/queries.js
sudo rpl --encoding UTF-8 "Blocked <br class='hidden-lg'>\(exact blacklist\)" "Geblockt <br class='hidden-lg'>(Exakte Blacklist)" /var/www/html/admin/scripts/pi-hole/js/queries.js
sudo rpl --encoding UTF-8 "Blocked <br class='hidden-lg'>\(external, IP\)" "Geblockt <br class='hidden-lg'>(extern, IP)" /var/www/html/admin/scripts/pi-hole/js/queries.js
sudo rpl --encoding UTF-8 "Blocked <br class='hidden-lg'>\(external, NULL\)" "Geblockt <br class='hidden-lg'>(extern, NULL)" /var/www/html/admin/scripts/pi-hole/js/queries.js
sudo rpl --encoding UTF-8 "Blocked <br class='hidden-lg'>\(external, NXRA\)" "Geblockt <br class='hidden-lg'>(extern, NXRA)" /var/www/html/admin/scripts/pi-hole/js/queries.js
sudo rpl --encoding UTF-8 "Blocked <br class='hidden-lg'>\(gravity, CNAME\)" "Geblockt <br class='hidden-lg'>(Gravity, CNAME)" /var/www/html/admin/scripts/pi-hole/js/queries.js
sudo rpl --encoding UTF-8 "Blocked <br class='hidden-lg'>\(regex blacklist, CNAME\)</span>" "Geblockt <br class='hidden-lg'>(RegEx Blacklist, CNAME)</span>" /var/www/html/admin/scripts/pi-hole/js/queries.js
sudo rpl --encoding UTF-8 "Blocked <br class='hidden-lg'>\(exact blacklist, CNAME\)" "Geblockt <br class='hidden-lg'>(Exakte Blacklist, CNAME)" /var/www/html/admin/scripts/pi-hole/js/queries.js
sudo rpl --encoding UTF-8 'Retried' 'Wiederholt' /var/www/html/admin/scripts/pi-hole/js/queries.js
sudo rpl --encoding UTF-8 'ignored' 'Ignoriert' /var/www/html/admin/scripts/pi-hole/js/queries.js
sudo rpl --encoding UTF-8 'already forwarded' 'bereits weitergeleitet' /var/www/html/admin/scripts/pi-hole/js/queries.js
sudo rpl --encoding UTF-8 '"Unknown ' '"Unbekannt ' /var/www/html/admin/scripts/pi-hole/js/queries.js
sudo rpl --encoding UTF-8 'No data available in table' 'Keine Daten in der Tabelle vorhanden.' /var/www/html/admin/scripts/vendor/datatables.min.js
sudo rpl --encoding UTF-8 'No matching records found' 'Keine passenden Datensätze gefunden.' /var/www/html/admin/scripts/vendor/datatables.min.js
sudo rpl --encoding UTF-8 'Click to add ' 'Klicken Sie hier, um nach ' /var/www/html/admin/scripts/pi-hole/js/queries.js
sudo rpl --encoding UTF-8 'to filter.' 'zu filtern.' /var/www/html/admin/scripts/pi-hole/js/queries.js
sudo rpl --encoding UTF-8 'Click to remove ' 'Klicken Sie hier, um den Filter ' /var/www/html/admin/scripts/pi-hole/js/queries.js
sudo rpl --encoding UTF-8 'class="text-green">SECURE' 'class="text-green">SICHER' /var/www/html/admin/scripts/pi-hole/js/queries.js
sudo rpl --encoding UTF-8 'class="text-orange">INSECURE' 'class="text-orange">UNSICHER' /var/www/html/admin/scripts/pi-hole/js/queries.js
sudo rpl --encoding UTF-8 'class="text-red">BOGUS' 'class="text-red">GEFÄLSCHT' /var/www/html/admin/scripts/pi-hole/js/queries.js
sudo rpl --encoding UTF-8 'class="text-red">ABANDONED' 'class="text-red">VERWAIST' /var/www/html/admin/scripts/pi-hole/js/queries.js
sudo rpl --encoding UTF-8 'class="text-orange">UNKNOWN' 'class="text-orange">UNBEKANNT' /var/www/html/admin/scripts/pi-hole/js/queries.js
sudo rpl --encoding UTF-8 ' from filter.' ' zu entfernen.' /var/www/html/admin/scripts/pi-hole/js/queries.js
sudo rpl --encoding UTF-8 'Added from Query Log' 'Vom Anfragen Protokoll hinzugefügt' /var/www/html/admin/scripts/pi-hole/js/utils.js
sudo rpl --encoding UTF-8 'Filtering options:' 'Filter Optionen:' /var/www/html/admin/queries.php
sudo rpl --encoding UTF-8 '<p>Note: Queries for <code>pi.hole</code> and the hostname are never logged.</p>' '<p>Hinweis: Abfragen für <code>pi.hole</code> und dem Hostnamen werden nicht protokolliert.</p>' /var/www/html/admin/queries.php
sudo rpl --encoding UTF-8 '<li>Click a value in a column to add/remove that value to/from the filter</li>' '<li>Klicken Sie auf einen Wert in einer Spalte, um diesen Wert zum Filter hinzuzufügen oder zu entfernen.</li>' /var/www/html/admin/queries.php
sudo rpl --encoding UTF-8 '<li>On a computer: Hold down <kbd>Ctrl</kbd>, <kbd>Alt</kbd>, or <kbd>&#8984;</kbd> to allow highlighting for copying to clipboard</li>' '<li>Auf einem Computer: Halten Sie die Taste <kbd>Strg</kbd>, <kbd>Alt</kbd> oder <kbd>&#8984;</kbd> fest, um mehrere Einträge in die Zwischenablage kopieren zu können.</li>' /var/www/html/admin/queries.php
sudo rpl --encoding UTF-8 '<li>On a mobile: Long press to highlight the text and enable copying to clipboard' '<li>Auf einem Handy: Länger drücken, um mehrere Einträge in die Zwischenablage kopieren zu können.' /var/www/html/admin/queries.php
sudo rpl --encoding UTF-8 'Showing 0 to 0 of 0 entries' 'Zeige 0 bis 0 von 0 Einträgen' /var/www/html/admin/scripts/vendor/datatables.min.js
sudo rpl --encoding UTF-8 'Showing _START_ to _END_ of _TOTAL_ entries' 'Zeige _START_ bis _END_ von _TOTAL_ Einträgen' /var/www/html/admin/scripts/vendor/datatables.min.js
sudo rpl --encoding UTF-8 '<div class="alProcessing">Adding <span id="alDomain"></span> to the <span id="alList"></span>...</div>' '<div class="alProcessing">Hinzufügen von <span id="alDomain"></span> zur <span id="alList"></span> ...</div>' /var/www/html/admin/queries.php
sudo rpl --encoding UTF-8 'successfully added to the <span id="alList"></span></div>' 'Erfolgreich zur <span id="alList"></span> hinzugefügt.</div>' /var/www/html/admin/queries.php
sudo rpl --encoding UTF-8 'Close</button>' 'Schließen</button>' /var/www/html/admin/queries.php
sudo rpl --encoding UTF-8 'Timeout or Network Connection Error!' 'Zeitüberschreitung der Netzwerkfehler!' /var/www/html/admin/queries.php
sudo rpl --encoding UTF-8 'filtered from _MAX_ total entries' 'gefiltert aus insgesamt _MAX_ Einträgen.' /var/www/html/admin/scripts/vendor/datatables.min.js
sudo rpl --encoding UTF-8 'Clear filters' 'Filter löschen' /var/www/html/admin/queries.php



# Langzeitdaten
#   Grafiken
sudo rpl --encoding UTF-8 'Compute graphical statistics from the Pi-hole query database' 'Grafische Statistiken der Pi-hole Anfragedatenbank' /var/www/html/admin/db_graph.php
sudo rpl --encoding UTF-8 'Select date and time range' 'Datum- und Zeitbereich auswählen' /var/www/html/admin/db_graph.php
sudo rpl --encoding UTF-8 'Click to select date and time range' 'Klicken Sie hier zum Auswählen des Datum- und Zeitbereichs' /var/www/html/admin/db_graph.php
sudo rpl --encoding UTF-8 'Today: \[moment\(\).startOf\("day"\)' 'Heute: [moment().startOf("day")' /var/www/html/admin/scripts/pi-hole/js/db_graph.js
sudo rpl --encoding UTF-8 'Yesterday: \[' 'Gestern: [' /var/www/html/admin/scripts/pi-hole/js/db_graph.js
sudo rpl --encoding UTF-8 'Last 7 Days": ' 'Letzten 7 Tage": ' /var/www/html/admin/scripts/pi-hole/js/db_graph.js
sudo rpl --encoding UTF-8 'Last 30 Days": ' 'Letzten 30 Tage": ' /var/www/html/admin/scripts/pi-hole/js/db_graph.js
sudo rpl --encoding UTF-8 'This Month": ' 'Dieser Monat": ' /var/www/html/admin/scripts/pi-hole/js/db_graph.js
sudo rpl --encoding UTF-8 'Last Month": ' 'Letzter Monat": ' /var/www/html/admin/scripts/pi-hole/js/db_graph.js
sudo rpl --encoding UTF-8 'This Year": ' 'Dieses Jahr": ' /var/www/html/admin/scripts/pi-hole/js/db_graph.js
sudo rpl --encoding UTF-8 'All Time": ' 'Gesamter Zeitraum": ' /var/www/html/admin/scripts/pi-hole/js/db_graph.js
sudo rpl --encoding UTF-8 'Custom Range' 'Benutzerdefiniert' /var/www/html/admin/scripts/vendor/daterangepicker.min.js
#sudo rpl --encoding UTF-8 'Jan_Feb_Mar_Apr_May_Jun_Jul_Aug_Sep_Oct_Nov_Dec' 'Jan_Feb_Mar_Apr_Mai_Jun_Jul_Aug_Sep_Okt_Nov_Dez' /var/www/html/admin/scripts/vendor/moment.min.js
sudo rpl --encoding UTF-8 'cancelLabel:"Cancel"' 'cancelLabel:"Abbrechen"' /var/www/html/admin/scripts/vendor/daterangepicker.min.js
sudo rpl --encoding UTF-8 'applyLabel:"Apply"' 'applyLabel:"Anwenden"' /var/www/html/admin/scripts/vendor/daterangepicker.min.js
sudo rpl --encoding UTF-8 'var dateformat = "MMMM Do YYYY, HH:mm";' 'var dateformat = "D. MMMM YYYY, HH:mm";' /var/www/html/admin/scripts/pi-hole/js/db_graph.js
sudo rpl --encoding UTF-8 'Su_Mo_Tu_We_Th_Fr_Sa' 'So_Mo_Di_Mi_Do_Fr_Sa' /var/www/html/admin/scripts/vendor/moment.min.js
sudo rpl --encoding UTF-8 '"January_February_March_April_May_June_July_August_September_October_November_December"' '"Januar_Februar_Marz_April_Mai_Juni_Juli_August_September_Oktober_November_Dezember"' /var/www/html/admin/scripts/vendor/moment.min.js
sudo rpl --encoding UTF-8 '" to " \+ picker.endDate.format\(dateformat\)\)' '" Uhr bis " + picker.endDate.format(dateformat) + " Uhr")' /var/www/html/admin/scripts/pi-hole/js/db_graph.js
sudo rpl --encoding UTF-8 'Depending on how large of a range you specified, the request may time out while Pi-hole tries to retrieve all the data.' 'Je nachdem, wie groß der von Ihnen angegebene Bereich ist, tritt möglicherweise eine Zeitüberschreitung auf, während Pi-hole versucht, alle Daten abzurufen.' /var/www/html/admin/db_graph.php
sudo rpl --encoding UTF-8 'Queries over the selected time period' 'Anfragen über den ausgewählten Zeitraum' /var/www/html/admin/db_graph.php

# Die folgenden zwei Zeilen dürfen in der Reihenfolge NICHT vertauscht werden!
sudo rpl --encoding UTF-8 '"Queries from " \+ fromTime \+ " to " \+ untilTime \+ " on " \+ fromDate' '"Anfragen von " + fromTime + " Uhr bis " + untilTime + " Uhr am " + fromDate' /var/www/html/admin/scripts/pi-hole/js/db_graph.js
sudo rpl --encoding UTF-8 '"Queries from " \+' '"Anfragen vom " +' /var/www/html/admin/scripts/pi-hole/js/db_graph.js

sudo rpl --encoding UTF-8 '"-" \+' '"." +' /var/www/html/admin/scripts/pi-hole/js/db_graph.js
sudo rpl --encoding UTF-8 '"Permitted DNS Queries' '"Erlaubte DNS Anfragen' /var/www/html/admin/scripts/pi-hole/js/db_graph.js
sudo rpl --encoding UTF-8 '"Blocked DNS Queries' '"Geblockte DNS Anfragen' /var/www/html/admin/scripts/pi-hole/js/db_graph.js


echo >&2
echo -e "${blaufett}   25 % ...${standard}" >&2



# Langzeitdaten
#   Anfragenprotokoll
sudo rpl --encoding UTF-8 'Specify date range to be queried from the Pi-hole query database' 'Geben Sie den Datumsbereich an, der aus der Pi-hole-Anfragedatenbank abgefragt werden soll.' /var/www/html/admin/db_queries.php
sudo rpl --encoding UTF-8 'Select date and time range' 'Datum- und Zeitbereich auswählen' /var/www/html/admin/db_queries.php
sudo rpl --encoding UTF-8 'New options selected. Please reload the data or choose another time range.</span>' 'Neue Optionen ausgewählt. Bitte laden Sie die Daten neu oder wählen Sie einen anderen Zeitraum.</span>' /var/www/html/admin/db_queries.php
sudo rpl --encoding UTF-8 'Reload Data</button>' 'Daten neu laden</button>' /var/www/html/admin/db_queries.php
sudo rpl --encoding UTF-8 'Click to select date and time range' 'Klicken Sie zum Auswählen des Datum- und Zeitbereichs' /var/www/html/admin/db_queries.php
sudo rpl --encoding UTF-8 'Today: \[moment\(\).startOf\("day"' 'Heute: [moment().startOf("day"' /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl --encoding UTF-8 'Yesterday: \[' 'Gestern: [' /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl --encoding UTF-8 'Last 7 Days": ' 'Letzten 7 Tage": ' /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl --encoding UTF-8 'Last 30 Days": ' 'Letzten 30 Tage": ' /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl --encoding UTF-8 'This Month": ' 'Dieser Monat": ' /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl --encoding UTF-8 'Last Month": ' 'Letzter Monat": ' /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl --encoding UTF-8 'This Year": ' 'Dieses Jahr": ' /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl --encoding UTF-8 'All Time": ' 'Gesamter Zeitraum": ' /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl --encoding UTF-8 'var dateformat = "MMMM Do YYYY, HH:mm";' 'var dateformat = "D. MMMM YYYY, HH:mm";' /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl --encoding UTF-8 '" to " \+ picker.endDate.format\(dateformat\)\)' '" Uhr bis " + picker.endDate.format(dateformat) + " Uhr")' /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl --encoding UTF-8 'Depending on how large of a range you specified, the request may time out while Pi-hole tries to retrieve all the data.' 'Abhängig davon, wie groß der von Ihnen angegebene Bereich ist, kann die Anforderung ausfallen, während Pi-hole versucht, alle Daten abzurufen.' /var/www/html/admin/db_queries.php
sudo rpl --encoding UTF-8 'Query status' 'Status Anfragen' /var/www/html/admin/db_queries.php
sudo rpl --encoding UTF-8 'Permitted:' 'Zulässig:' /var/www/html/admin/db_queries.php
sudo rpl --encoding UTF-8 'forwarded</label>' 'weitergeleitet</label>' /var/www/html/admin/db_queries.php
sudo rpl --encoding UTF-8 'cached</label>' 'zwischengespeichert</label>' /var/www/html/admin/db_queries.php
sudo rpl --encoding UTF-8 'stale cache</label>' 'veralteter Cache</label>' /var/www/html/admin/db_queries.php
sudo rpl --encoding UTF-8 'retried</label>' 'wiederholt</label>' /var/www/html/admin/db_queries.php
sudo rpl --encoding UTF-8 'Blocked:' 'Geblockt:' /var/www/html/admin/db_queries.php
sudo rpl --encoding UTF-8 'gravity</label' 'Anfragedatenbank</label' /var/www/html/admin/db_queries.php
sudo rpl --encoding UTF-8 'external</label>' 'extern</label>' /var/www/html/admin/db_queries.php
sudo rpl --encoding UTF-8 'database busy</label>' 'Datenbank ist beschäftigt</label>' /var/www/html/admin/db_queries.php
sudo rpl --encoding UTF-8 'exact blacklist' 'exakt lt. Blacklist' /var/www/html/admin/db_queries.php
sudo rpl --encoding UTF-8 'regex blacklist' 'RegEx der Blacklist' /var/www/html/admin/db_queries.php
sudo rpl --encoding UTF-8 'special domain' 'besondere Domain' /var/www/html/admin/db_queries.php
sudo rpl --encoding UTF-8 'gravity \(CNAME\)</label>' 'Anfragedatenbank (CNAME)</label>' /var/www/html/admin/db_queries.php
sudo rpl --encoding UTF-8 'The server took too long to send the data.' 'Der Server hat zu lange gebraucht, um die Daten zu senden.' /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl --encoding UTF-8 'An error occurred while loading the data: Connection refused. Is FTL running\?' 'Beim Laden der Daten ist ein Fehler aufgetreten: Verbindung verweigert. Läuft FTL?' /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl --encoding UTF-8 'An unknown error occurred while loading the data.' 'Beim Laden der Daten ist folgender Fehler aufgetreten:' /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl --encoding UTF-8 "Check the server's log files" "Überprüfen Sie die Log-Dateien des Servers" /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl --encoding UTF-8 ' for details.' ' für mehr Informationen.' /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl --encoding UTF-8 'You may need to increase PHP memory limit.' 'Möglicherweise müssen Sie das PHP-Speicherlimit erhöhen.' /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl --encoding UTF-8 "You can find more info in pi-hole's FAQ:" "Mehr Informationen finden Sie in der Pi-hole FAQ:" /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl --encoding UTF-8 'Error. Selector status specified using an invalid format.' 'Der ausgewählte Status wurde in einem ungültigen Format gewählt.' /var/www/html/admin/api_db.php
sudo rpl --encoding UTF-8 'Queries Blocked' 'Geblockte Anfragen' /var/www/html/admin/db_queries.php
sudo rpl --encoding UTF-8 '<p>Percentage Blocked</p>' '<p>Geblockte Anfragen</p>' /var/www/html/admin/db_queries.php
sudo rpl --encoding UTF-8 'Adding <span id="alDomain"></span> to the' 'Hinzufügen <span id="alDomain"></span> zur' /var/www/html/admin/db_queries.php
sudo rpl --encoding UTF-8 'successfully added to the' 'Erfolgreich hinzugefügt zur' /var/www/html/admin/db_queries.php
sudo rpl --encoding UTF-8 'Timeout or Network Connection Error!' 'Zeitüberschreitung oder Netzwerkverbindungsfehler!' /var/www/html/admin/db_queries.php
sudo rpl --encoding UTF-8 'Total Queries' 'Alle Anfragen' /var/www/html/admin/db_queries.php
sudo rpl --encoding UTF-8 'Recent Queries' 'Letzte Anfragen' /var/www/html/admin/db_queries.php
sudo rpl --encoding UTF-8 '10, 25, 50, 100, "All"' '10, 25, 50, 100, "Alle"' /var/www/html/admin/scripts/pi-hole/js/db_queries.js
sudo rpl --encoding UTF-8 '<th>Time</th>' '<th>Zeitpunkt</th>' /var/www/html/admin/db_queries.php
sudo rpl --encoding UTF-8 '<th>Type</th>' '<th>Typ</th>' /var/www/html/admin/db_queries.php
sudo rpl --encoding UTF-8 '<th>Client</th>' '<th>Gerät</th>' /var/www/html/admin/db_queries.php
sudo rpl --encoding UTF-8 '<th>Reply</th>' '<th>Wiederhohlung</th>' /var/www/html/admin/db_queries.php
sudo rpl --encoding UTF-8 '<th>Action</th>' '<th>Aktion</th>' /var/www/html/admin/db_queries.php
sudo rpl --encoding UTF-8 'Close</button>' 'Schließen</button>' /var/www/html/admin/db_queries.php



# Langzeitdaten
#  Top Listen
sudo rpl --encoding UTF-8 'Compute Top Lists from the Pi-hole query database' 'Top Listen aus der Pi-hole-Anfragedatenbank berechnen' /var/www/html/admin/db_lists.php
sudo rpl --encoding UTF-8 'Select date and time range' 'Datum- und Zeitbereich auswählen' /var/www/html/admin/db_lists.php
sudo rpl --encoding UTF-8 'Click to select date and time range' 'Klicken Sie zum Auswählen des Datum- und Zeitbereichs' /var/www/html/admin/db_lists.php
sudo rpl --encoding UTF-8 'Today: \[' 'Heute: [' /var/www/html/admin/scripts/pi-hole/js/db_lists.js
sudo rpl --encoding UTF-8 'Yesterday: \[' 'Gestern: [' /var/www/html/admin/scripts/pi-hole/js/db_lists.js
sudo rpl --encoding UTF-8 'Last 7 Days": ' 'Letzten 7 Tage": ' /var/www/html/admin/scripts/pi-hole/js/db_lists.js
sudo rpl --encoding UTF-8 'Last 30 Days": ' 'Letzten 30 Tage": ' /var/www/html/admin/scripts/pi-hole/js/db_lists.js
sudo rpl --encoding UTF-8 'This Month": ' 'Dieser Monat": ' /var/www/html/admin/scripts/pi-hole/js/db_lists.js
sudo rpl --encoding UTF-8 'Last Month": ' 'Letzter Monat": ' /var/www/html/admin/scripts/pi-hole/js/db_lists.js
sudo rpl --encoding UTF-8 'This Year": ' 'Dieses Jahr": ' /var/www/html/admin/scripts/pi-hole/js/db_lists.js
sudo rpl --encoding UTF-8 'All Time": ' 'Gesamter Zeitraum": ' /var/www/html/admin/scripts/pi-hole/js/db_lists.js
sudo rpl --encoding UTF-8 'var dateformat = "MMMM Do YYYY, HH:mm";' 'var dateformat = "D. MMMM YYYY, HH:mm";' /var/www/html/admin/scripts/pi-hole/js/db_lists.js
sudo rpl --encoding UTF-8 '" to " \+ picker.endDate.format\(dateformat\)\)' '" Uhr bis " + picker.endDate.format(dateformat) + " Uhr")' /var/www/html/admin/scripts/pi-hole/js/db_lists.js
sudo rpl --encoding UTF-8 'Depending on how large of a range you specified, the request may time out while Pi-hole tries to retrieve all the data.' 'Abhängig davon, wie groß der von Ihnen angegebene Bereich ist, kann die Anforderung ausfallen, während Pi-hole versucht, alle Daten abzurufen.' /var/www/html/admin/db_lists.php
sudo rpl --encoding UTF-8 'Top Blocked Domains' 'Top geblockte Domains' /var/www/html/admin/db_lists.php
sudo rpl --encoding UTF-8 'Top Clients' 'Top Geräte' /var/www/html/admin/db_lists.php
sudo rpl --encoding UTF-8 '<th>Hits</th>' '<th>Treffer</th>' /var/www/html/admin/db_lists.php
sudo rpl --encoding UTF-8 'Frequency' 'Häufigkeit' /var/www/html/admin/db_lists.php
sudo rpl --encoding UTF-8 '<th>Client</th>' '<th>Gerät</th>' /var/www/html/admin/db_lists.php
sudo rpl --encoding UTF-8 '<th>Requests</th>' '<th>Anfragen</th>' /var/www/html/admin/db_lists.php



# Gruppen
sudo rpl --encoding UTF-8 '<h1>Group management</h1>' '<h1>Gruppen Verwaltung</h1>' /var/www/html/admin/groups.php
sudo rpl --encoding UTF-8 'Add a new group' 'Neue Gruppe hinzufügen' /var/www/html/admin/groups.php
sudo rpl --encoding UTF-8 'Description:' 'Beschreibung:' /var/www/html/admin/groups.php
sudo rpl --encoding UTF-8 'Group name or space-separated group names' 'Gruppenname oder durch Leerzeichen getrennte Gruppennamen' /var/www/html/admin/groups.php
sudo rpl --encoding UTF-8 'Group description \(optional\)' 'Beschreibung der Gruppe (optional)' /var/www/html/admin/groups.php
sudo rpl --encoding UTF-8 'Hints' 'Hinweise' /var/www/html/admin/groups.php
sudo rpl --encoding UTF-8 'Multiple groups can be added by separating each group name with a space' 'Mehrere Gruppen können hinzugefügt werden, indem jeder Gruppenname durch ein Leerzeichen getrennt wird.' /var/www/html/admin/groups.php
sudo rpl --encoding UTF-8 'Group names can have spaces if entered in quotes. e.g "My New Group"' 'Gruppennamen können Leerzeichen enthalten, wenn sie in Anführungszeichen eingegeben werden. z.B. "Meine neue Gruppe".' /var/www/html/admin/groups.php
sudo rpl --encoding UTF-8 'Add</button>' 'Hinzufügen</button>' /var/www/html/admin/groups.php
sudo rpl --encoding UTF-8 'List of groups' 'Übersicht der Gruppen'  /var/www/html/admin/groups.php
sudo rpl --encoding UTF-8 '10, 25, 50, 100, "All"' '10, 25, 50, 100, "Alle"' /var/www/html/admin/scripts/pi-hole/js/groups.js
sudo rpl --encoding UTF-8 'Warning", "Please specify a group name' 'Achtung!", "Bitte geben Sie einen Gruppenanamen an!' /var/www/html/admin/scripts/pi-hole/js/groups.js
sudo rpl --encoding UTF-8 'utils.showAlert\("info", "", "Adding group...", name\);' 'utils.showAlert("info", "", "Füge Gruppe hinzu ...", name);' /var/www/html/admin/scripts/pi-hole/js/groups.js
sudo rpl --encoding UTF-8 'utils.showAlert\("success", "fas fa-plus", "Successfully added group", name\);' 'utils.showAlert("success", "fas fa-plus", "Gruppe erfolgreich hinzugefügt.", name);' /var/www/html/admin/scripts/pi-hole/js/groups.js
sudo rpl --encoding UTF-8 'Error while adding new group' 'Fehler beim Hinzufügen einer neuen Gruppe.' /var/www/html/admin/scripts/pi-hole/js/groups.js
sudo rpl --encoding UTF-8 'titleAttr: "Select All"' 'titleAttr: "Alle auswählen"' /var/www/html/admin/scripts/pi-hole/js/groups.js
sudo rpl --encoding UTF-8 'titleAttr: "Deselect All"' 'titleAttr: "Alle abwählen"' /var/www/html/admin/scripts/pi-hole/js/groups.js
sudo rpl --encoding UTF-8 'titleAttr: "Delete Selected"' 'titleAttr: "Ausgewählte löschen"' /var/www/html/admin/scripts/pi-hole/js/groups.js
sudo rpl --encoding UTF-8 '<th>Description</th>' '<th>Beschreibung</th>' /var/www/html/admin/groups.php
sudo rpl --encoding UTF-8 'Added: ' 'Hinzugefügt am: ' /var/www/html/admin/scripts/pi-hole/js/groups.js
sudo rpl --encoding UTF-8 'nLast modified:' 'nZuletzt bearbeitet am:' /var/www/html/admin/scripts/pi-hole/js/groups.js
sudo rpl --encoding UTF-8 'nDatabase ID: ' 'nDatenbank ID: ' /var/www/html/admin/scripts/pi-hole/js/groups.js
sudo rpl --encoding UTF-8 'on: "Enabled"' 'on: "Aktiviert"' /var/www/html/admin/scripts/pi-hole/js/groups.js
sudo rpl --encoding UTF-8 'off: "Disabled"' 'off: "Deaktiviert"' /var/www/html/admin/scripts/pi-hole/js/groups.js
sudo rpl --encoding UTF-8 'Editing group...' 'Gruppe wird bearbeitet ...' /var/www/html/admin/scripts/pi-hole/js/groups.js
sudo rpl --encoding UTF-8 'Successfully " \+ done \+ " group' 'Gruppe erfolgreich bearbeitet!' /var/www/html/admin/scripts/pi-hole/js/groups.js
sudo rpl --encoding UTF-8 '"Error while " \+ notDone' '"Fehler während " + notDone' /var/www/html/admin/scripts/pi-hole/js/groups.js
sudo rpl --encoding UTF-8 'Deleting group\(s\)...' 'Lösche Gruppe(n) ...' /var/www/html/admin/scripts/pi-hole/js/groups.js
sudo rpl --encoding UTF-8 'Successfully deleted group\(s\)' 'Gruppe(n) erfolgreich gelöscht! Objektnummer' /var/www/html/admin/scripts/pi-hole/js/groups.js
sudo rpl --encoding UTF-8 'Reset sorting</button>' 'Sortierung zurücksetzen</button>' /var/www/html/admin/groups.php
sudo rpl --encoding UTF-8 'Error while deleting group\(s\)' 'Fehler beim Löschen von Gruppe(n).' /var/www/html/admin/scripts/pi-hole/js/groups.js



# Geräte
sudo rpl --encoding UTF-8 '<h1>Client group management</h1>' '<h1>Gerätegruppenverwaltung</h1>' /var/www/html/admin/groups-clients.php
sudo rpl --encoding UTF-8 'Add a new client' 'Neues Gerät hinzufügen' /var/www/html/admin/groups-clients.php
sudo rpl --encoding UTF-8 'Known clients:' 'Bekannte Geräte:' /var/www/html/admin/groups-clients.php
sudo rpl --encoding UTF-8 'Loading...</option>' 'Wird geladen ...</option>' /var/www/html/admin/groups-clients.php
sudo rpl --encoding UTF-8 'Remove all items' 'Alle Einträge entfernen' /var/www/html/admin/scripts/vendor/select2.min.js
sudo rpl --encoding UTF-8 'Select client...' 'Gerät auswählen ...' /var/www/html/admin/scripts/pi-hole/js/groups-clients.js
sudo rpl --encoding UTF-8 'Comment:' 'Kommentar:' /var/www/html/admin/groups-clients.php
sudo rpl --encoding UTF-8 'Client description \(optional\)' 'Geräte Beschreibung (optional)' /var/www/html/admin/groups-clients.php
sudo rpl --encoding UTF-8 '<p>You can select an existing client or add a custom one by typing into the field above and confirming your entry with <kbd>&#x23CE;</kbd>.</p>' '<p>Sie können ein vorhandenes Gerät auswählen oder fügen Sie ein benutzerdefiniertes Gerät hinzu. Tragen Sie dies in das obere Feld ein und bestätigen Sie Ihre Eingabe mit <kbd>&#x23CE;</kbd>.</p>' /var/www/html/admin/groups-clients.php
sudo rpl --encoding UTF-8 '<p>Clients may be described either by their IP addresses \(IPv4 and IPv6 are supported\),' '<p>Geräte können entweder durch ihre IP-Adressen (IPv4 und IPv6 werden unterstützt), IP-Subnetze ' /var/www/html/admin/groups-clients.php
sudo rpl --encoding UTF-8 'IP subnets \(CIDR notation, like <code>192.168.2.0/24</code>\),' '(CIDR-Notation, z.B. <code>192.168.2.0/24</code>), ihre MAC-Adressen (wie <code>12:34:56:78:9A:BC</code>), ' /var/www/html/admin/groups-clients.php
sudo rpl --encoding UTF-8 'their MAC addresses \(like <code>12:34:56:78:9A:BC</code>\),' 'durch ihre Hostnamen (wie <code>localhost</code>) oder durch die Schnittstelle, mit der sie verbunden ' /var/www/html/admin/groups-clients.php
sudo rpl --encoding UTF-8 'by their hostnames \(like <code>localhost</code>\), or by the interface they are connected to \(prefaced with a colon, like <code>:eth0</code>\).' 'sind (mit einem Doppelpunkt vorangestellt, (z. B. <code>:eth0</code>) beschrieben werden.' /var/www/html/admin/groups-clients.php
sudo rpl --encoding UTF-8 '<p>Note that client recognition by IP addresses \(incl. subnet ranges\) are preferred over MAC address, host name or interface recognition as' '<p>Beachten Sie, dass die Geräte-Erkennung anhand von IP-Adressen (inkl. Subnetzbereiche), der MAC-Adresse, dem Hostnamen oder ' /var/www/html/admin/groups-clients.php
sudo rpl --encoding UTF-8 'the two latter will only be available after some time.' 'der Schnittstellenerkennung vorgezogen wird, da die beiden letzteren erst nach einiger Zeit verfügbar sind. Außerdem ' /var/www/html/admin/groups-clients.php
sudo rpl --encoding UTF-8 'Furthermore, MAC address recognition only works for devices at most one networking hop away from your Pi-hole.' 'funktioniert die MAC-Adressenerkennung nur für Geräte, die höchstens einen Netzwerksprung von Ihrem Pi-hole entfernt sind.' /var/www/html/admin/groups-clients.php
sudo rpl --encoding UTF-8 '>Client</th>' '>Gerät</th>' /var/www/html/admin/groups-clients.php
sudo rpl --encoding UTF-8 'Acceptable values are: IP address, subnet \(CIDR notation\), MAC address \(AA:BB:CC:DD:EE:FF format\) or host names.' 'Akzeptable Werte sind: IP-Adresse, Subnetz (CIDR-Notation), MAC-Adresse (Format AA:BB:CC:DD:DD:EE:FF) oder Hostnamen.' /var/www/html/admin/groups-clients.php
sudo rpl --encoding UTF-8 '>Add</button>' '>Hinzufügen</button>' /var/www/html/admin/groups-clients.php
sudo rpl --encoding UTF-8 '"Warning", "Please specify a client IP or MAC address"' '"Achtung!", "Bitte geben Sie eine Geräte IP- oder MAC-Adresse an!"' /var/www/html/admin/scripts/pi-hole/js/groups-clients.js
sudo rpl --encoding UTF-8 'Adding client...' 'Füge Gerät hinzu ...' /var/www/html/admin/scripts/pi-hole/js/groups-clients.js
sudo rpl --encoding UTF-8 'Successfully added client' 'Gerät erfolgreich hinzugefügt.' /var/www/html/admin/scripts/pi-hole/js/groups-clients.js
sudo rpl --encoding UTF-8 'List of configured clients' 'Übersicht der konfigurierten Geräte' /var/www/html/admin/groups-clients.php
sudo rpl --encoding UTF-8 '10, 25, 50, 100, "All"' '10, 25, 50, 100, "Alle"' /var/www/html/admin/scripts/pi-hole/js/groups-clients.js
sudo rpl --encoding UTF-8 'titleAttr: "Select All"' 'titleAttr: "Alle auswählen"' /var/www/html/admin/scripts/pi-hole/js/groups-clients.js
sudo rpl --encoding UTF-8 'titleAttr: "Deselect All"' 'titleAttr: "Alle abwählen"' /var/www/html/admin/scripts/pi-hole/js/groups-clients.js
sudo rpl --encoding UTF-8 'titleAttr: "Delete Selected"' 'titleAttr: "Ausgewählte löschen"' /var/www/html/admin/scripts/pi-hole/js/groups-clients.js
sudo rpl --encoding UTF-8 '<th>Comment</th>' '<th>Kommentar</th>' /var/www/html/admin/groups-clients.php
sudo rpl --encoding UTF-8 '<th>Group assignment</th>' '<th>Gruppenzuordnung</th>' /var/www/html/admin/groups-clients.php
sudo rpl --encoding UTF-8 'Added:' 'Hinzugefügt am:' /var/www/html/admin/scripts/pi-hole/js/groups-clients.js
sudo rpl --encoding UTF-8 'nLast modified:' 'nZuletzt bearbeitet am:' /var/www/html/admin/scripts/pi-hole/js/groups-clients.js
sudo rpl --encoding UTF-8 'nDatabase ID:' 'nDatenbank ID:' /var/www/html/admin/scripts/pi-hole/js/groups-clients.js
sudo rpl --encoding UTF-8 'none selected' 'Es wird nichts geblockt!' /var/www/html/admin/scripts/pi-hole/js/utils.js
sudo rpl --encoding UTF-8 'Editing client...' 'Gerät wird bearbeitet ...' /var/www/html/admin/scripts/pi-hole/js/groups-clients.js
sudo rpl --encoding UTF-8 '"Successfully " \+ done \+ " client"' '"Gerät erfolgreich bearbeitet!"' /var/www/html/admin/scripts/pi-hole/js/groups-clients.js
sudo rpl --encoding UTF-8 '>Apply</button>' '>Anwenden</button>' /var/www/html/admin/scripts/pi-hole/js/groups-clients.js
sudo rpl --encoding UTF-8 'bsSelectDefaults.selectAllText = "All"' 'bsSelectDefaults.selectAllText = "Alle"' /var/www/html/admin/scripts/pi-hole/js/utils.js
sudo rpl --encoding UTF-8 'bsSelectDefaults.deselectAllText = "None"' 'bsSelectDefaults.deselectAllText = "Keine"' /var/www/html/admin/scripts/pi-hole/js/utils.js
sudo rpl --encoding UTF-8 'Deleting client\(s\)...' 'Lösche Gerät(e) ...' /var/www/html/admin/scripts/pi-hole/js/groups-clients.js
sudo rpl --encoding UTF-8 'Successfully deleted client\(s\)' 'Gerät(e) erfolgreich gelöscht' /var/www/html/admin/scripts/pi-hole/js/groups-clients.js
sudo rpl --encoding UTF-8 'Reset sorting</button>' 'Sortierung zurücksetzen</button>' /var/www/html/admin/groups-clients.php



# Domains
sudo rpl --encoding UTF-8 'management</h1>' 'Verwaltung</h1>' /var/www/html/admin/groups-domains.php
sudo rpl --encoding UTF-8 'Add a new' 'Hinzufügen einer neuen ' /var/www/html/admin/groups-domains.php
sudo rpl --encoding UTF-8 'domain or regex filter' ' Domain oder eines RegEx Filters ' /var/www/html/admin/groups-domains.php
sudo rpl --encoding UTF-8 'RegEx filter</a' 'RegEx Filter</a' /var/www/html/admin/groups-domains.php
sudo rpl --encoding UTF-8 'Comment:</label>' 'Kommentar:</label>' /var/www/html/admin/groups-domains.php
sudo rpl --encoding UTF-8 'Domain to be added' 'Hinzuzufügende Domain' /var/www/html/admin/groups-domains.php
sudo rpl --encoding UTF-8 'Description \(optional\)' 'Beschreibung (optional)' /var/www/html/admin/groups-domains.php
sudo rpl --encoding UTF-8 'Add domain as wildcard' 'Domain als Platzhalter hinzufügen' /var/www/html/admin/groups-domains.php
sudo rpl --encoding UTF-8 'Check this box if you want to involve all subdomains. The entered domain will be converted to a RegEx filter while adding.' 'Markieren Sie dieses Feld, wenn Sie alle Unterdomänen einbeziehen möchten. Die eingegebene Domäne wird beim Hinzufügen in einen RegEx-Filter umgewandelt.' /var/www/html/admin/groups-domains.php
sudo rpl --encoding UTF-8 'Note:' 'Hinweis:' /var/www/html/admin/groups-domains.php
sudo rpl --encoding UTF-8 'The  Domain oder eines RegEx Filters  will be automatically assigned to the Default Group' 'Die Domäne oder ein RegEx-Filter wird automatisch der Standardgruppe zugewiesen' /var/www/html/admin/groups-domains.php
sudo rpl --encoding UTF-8 'Other groups can optionally be assigned' 'Andere Gruppen können optional zugewiesen werden' /var/www/html/admin/groups-domains.php
sudo rpl --encoding UTF-8 'in the list below \(using ' 'in der folgenden Liste (mit ' /var/www/html/admin/groups-domains.php
sudo rpl --encoding UTF-8 'Add to Blacklist</button>' 'Zur Blacklist hinzufügen</button>' /var/www/html/admin/groups-domains.php
sudo rpl --encoding UTF-8 'Add to Whitelist</button>' 'Zur Whitelist hinzufügen</button>' /var/www/html/admin/groups-domains.php
sudo rpl --encoding UTF-8 '"Adding " \+ domainRegex' '"Hinzufügen der " + domainRegex' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl --encoding UTF-8 'is not a valid domain because' 'ist keine gültige Domain, weil' /var/www/html/admin/scripts/pi-hole/php/groups.php
sudo rpl --encoding UTF-8 " domains'" " Domain'" /var/www/html/admin/scripts/pi-hole/php/groups.php
sudo rpl --encoding UTF-8 'Invalid adlist URL' 'Ungültige URL für die Liste:' /var/www/html/admin/scripts/pi-hole/php/groups.php
sudo rpl --encoding UTF-8 '"Success!"' '"Erfolgreich!"' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl --encoding UTF-8 '"Warning", "Please specify a " \+ domainRegex\)\;' '"Achtung!", "Bitte geben Sie eine Domain ein!");' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js 
sudo rpl --encoding UTF-8 'Error, something went wrong!</strong>' 'Fehler, es ist etwas schief gelaufen!</strong>' /var/www/html/admin/scripts/pi-hole/js/utils.js
sudo rpl --encoding UTF-8 "'Not adding '" "'Nicht hinzugefügt '" /var/www/html/admin/scripts/pi-hole/php/groups.php
sudo rpl --encoding UTF-8 ' as it is already on the list' ' weil die Domain bereits in der Liste enthalten ist.' /var/www/html/admin/scripts/pi-hole/php/groups.php
sudo rpl --encoding UTF-8 ' domains \(skipped duplicates\)' ' Domains (übersprungene Duplikate)' /var/www/html/admin/scripts/pi-hole/php/groups.php
sudo rpl --encoding UTF-8 '"Error while adding new ' '"Fehler beim Hinzufügen neuer ' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl --encoding UTF-8 '"edited"' '"bearbeitet"' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl --encoding UTF-8 '"editing"' '"bearbeite"' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl --encoding UTF-8 '"disabling"' '"deaktiviere"' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl --encoding UTF-8 '"enabling"' '"aktiviere"' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl --encoding UTF-8 '"edited name of"' '"bearbeitet den Namen von der"' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl --encoding UTF-8 '"editing name of"' '"bearbeite den Namen von der"' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl --encoding UTF-8 '"edited comment of"' '"den Kommentar bearbeitet von der"' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl --encoding UTF-8 '"editing comment of"' '"bearbeite den Kommentar von der"' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl --encoding UTF-8 '"edited type of"' '"bearbeitet den Typ der"' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl --encoding UTF-8 '"editing type of"' '"bearbeite den Typ der"' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl --encoding UTF-8 ' out of ' ' von ' /var/www/html/admin/scripts/pi-hole/php/groups.php
sudo rpl --encoding UTF-8 '<br>Added ' '<br>Hinzugefügt: ' /var/www/html/admin/scripts/pi-hole/php/groups.php
sudo rpl --encoding UTF-8 "'Added '" "'Hinzugefügt: '" /var/www/html/admin/scripts/pi-hole/php/groups.php
sudo rpl --encoding UTF-8 'Successfully deleted domain\(s\): ' 'Erfolgreich gelöschte Domain(s): ' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl --encoding UTF-8 'Error while deleting domain\(s\): ' 'Fehler während des Löschens der Domain(s): ' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl --encoding UTF-8 'List of domains' 'Übersicht der Domains' /var/www/html/admin/groups-domains.php
sudo rpl --encoding UTF-8 'Exact whitelist</label>' 'Exakte Whitelist</label>' /var/www/html/admin/groups-domains.php
sudo rpl --encoding UTF-8 'Regex whitelist</label>' 'RegEx Whitelist</label>' /var/www/html/admin/groups-domains.php
sudo rpl --encoding UTF-8 'Exact blacklist</label>' 'Exakte Blacklist</label>' /var/www/html/admin/groups-domains.php
sudo rpl --encoding UTF-8 'Regex blacklist</label>' 'RegEx Blacklist</label>' /var/www/html/admin/groups-domains.php
sudo rpl --encoding UTF-8 '10, 25, 50, 100, "All"' '10, 25, 50, 100, "Alle"' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl --encoding UTF-8 '"Select All"' '"Alle auswählen"' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl --encoding UTF-8 '"Deselect All"' '"Alle abwählen"' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl --encoding UTF-8 '"Delete Selected"' '"Ausgewählte löschen"' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl --encoding UTF-8 '"Deleting domain\(s\)..."' '"Lösche Domain(s): "' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl --encoding UTF-8 '<i>domain</i>' '<i>Domain</i>' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl --encoding UTF-8 '<i>regex</i>' '<i>RegEx</i>' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl --encoding UTF-8 'Editing " \+ domainRegex' 'Bearbeite " + domainRegex' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl --encoding UTF-8 '<th>Type</th>' '<th>Typ</th>' /var/www/html/admin/groups-domains.php
sudo rpl --encoding UTF-8 '<th>Comment</th>' '<th>Kommentar</th>' /var/www/html/admin/groups-domains.php
sudo rpl --encoding UTF-8 'Group assignment' 'Gruppenzuordnung' /var/www/html/admin/groups-domains.php
sudo rpl --encoding UTF-8 'Exact whitelist</option>' 'Exakte Whitelist</option>' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl --encoding UTF-8 'Regex whitelist</option>' 'RegEx Whitelist</option>' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl --encoding UTF-8 'Exact blacklist</option>' 'Exakte Blacklist</option>' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl --encoding UTF-8 'Regex blacklist</option>' 'RegEx Blacklist</option>' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl --encoding UTF-8 '"Successfully "' '"Erfolgreich "' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl --encoding UTF-8 'done = "disabled"' 'done = "deaktiviert die"' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl --encoding UTF-8 'done = "enabled"' 'done = "aktiviert die"' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl --encoding UTF-8 '"edited groups of"' '"bearbeitete Gruppe der"' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl --encoding UTF-8 '"editing groups of"' '"bearbeite Gruppe der"' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl --encoding UTF-8 'Reset sorting</button' 'Sortierung löschen</button' /var/www/html/admin/groups-domains.php
sudo rpl --encoding UTF-8 'Regular Expression:</label>' 'Regulärer Ausdruck:</label>' /var/www/html/admin/groups-domains.php
sudo rpl --encoding UTF-8 '"RegEx to be added"' '"Regulären Ausdruck hinzufügen"' /var/www/html/admin/groups-domains.php
sudo rpl --encoding UTF-8 'Hint:</strong>' 'Hinweis:</strong>' /var/www/html/admin/groups-domains.php
sudo rpl --encoding UTF-8 'Need help to write a proper RegEx rule\? Have a look at our online' 'Benötigen Sie Hilfe beim Schreiben einer geeigneten RegEx-Regel? Werfen Sie einen Blick auf unsere ' /var/www/html/admin/groups-domains.php
sudo rpl --encoding UTF-8 'regular expressions tutorial' 'Online Hilfe zu regulären Ausdrücken' /var/www/html/admin/groups-domains.php
sudo rpl --encoding UTF-8 'Added: ' 'Hinzugefügt am: ' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl --encoding UTF-8 'nLast modified: ' 'nZuletzt bearbeitet am: ' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl --encoding UTF-8 'Database ID:' 'Datenbank ID:' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl --encoding UTF-8 'on: "Enabled"' 'on: "Aktiviert"' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl --encoding UTF-8 'off: "Disabled"' 'off: "Deaktiviert"' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl --encoding UTF-8 'Apply</button>' 'Anwenden</button>' /var/www/html/admin/scripts/pi-hole/js/groups-domains.js
sudo rpl --encoding UTF-8 'return "All selected \(" \+ num \+ "\)";' 'return "Alle ausgewählt (" + num + ")";' /var/www/html/admin/scripts/pi-hole/js/utils.js
sudo rpl --encoding UTF-8 'return num \+ " selected"' 'return num + " ausgewählt"' /var/www/html/admin/scripts/pi-hole/js/utils.js



# Blocklisten
sudo rpl --encoding UTF-8 '<h1>Adlist group management</h1>' '<h1>Blocklisten Gruppen Verwaltung</h1>' /var/www/html/admin/groups-adlists.php
sudo rpl --encoding UTF-8 'Add a new adlist' 'Neue Blockliste hinzufügen' /var/www/html/admin/groups-adlists.php
sudo rpl --encoding UTF-8 'Address:</label>' 'Adresse:</label>' /var/www/html/admin/groups-adlists.php
sudo rpl --encoding UTF-8 'Comment:</label>' 'Kommentar:</label>' /var/www/html/admin/groups-adlists.php
sudo rpl --encoding UTF-8 'URL or space-separated URLs' 'URL oder durch Leerzeichen getrennte URLs' /var/www/html/admin/groups-adlists.php
sudo rpl --encoding UTF-8 'Adlist description \(optional\)' 'Beschreibung der Blockliste (optional)' /var/www/html/admin/groups-adlists.php
sudo rpl --encoding UTF-8 'Hints' 'Hinweise' /var/www/html/admin/groups-adlists.php
sudo rpl --encoding UTF-8 '<li>Please run <code>pihole -g</code> or update your gravity list <a href="gravity.php">online</a> after modifying your adlists.</li>' '<li>Bitte führen Sie <code>pihole -g</code> aus oder aktualisieren Sie Ihre Gravity Liste <a href="gravity.php">online</a> nachdem Sie Ihre Blockliste geändert haben.</li>' /var/www/html/admin/groups-adlists.php
sudo rpl --encoding UTF-8 '<li>Multiple adlists can be added by separating each <i>unique</i> URL with a space</li>' '<li>Es können mehrere Blocklisten hinzugefügt werden, indem jede <i>eindeutige</i> URL durch ein Leerzeichen getrennt wird.</li>' /var/www/html/admin/groups-adlists.php
sudo rpl --encoding UTF-8 '<li>Click on the icon in the first column to get additional information about your lists. The icons correspond to the health of the list.</li>' '<li>Klicken Sie auf das Symbol in der ersten Spalte, um zusätzliche Informationen über Ihre Listen zu erhalten. Die Symbole entsprechen dem Zustand der Liste.</li>' /var/www/html/admin/groups-adlists.php
sudo rpl --encoding UTF-8 'Add</button>' 'Hinzufügen</button>' /var/www/html/admin/groups-adlists.php
sudo rpl --encoding UTF-8 'utils.showAlert\("warning", "", "Warning", "Please specify an adlist address"\)' 'utils.showAlert("warning", "", "Achtung!", "Bitte geben Sie eine Adresse der Blockliste an!")' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl --encoding UTF-8 '"fas fa-plus", "Warning"' '"fas fa-plus", "Achtung!"' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl --encoding UTF-8 'Adding adlist...' 'Füge Blockliste hinzu ...' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl --encoding UTF-8 'Successfully added adlist' 'Blockliste erfolgreich hinzugefügt!' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl --encoding UTF-8 '<br><b>Total:' '<br><b>Insgesamt:' /var/www/html/admin/scripts/pi-hole/php/groups.php
sudo rpl --encoding UTF-8 'Ignored duplicated adlists: ' 'Doppelte Blocklisten wurden ignoriert: ' /var/www/html/admin/scripts/pi-hole/php/groups.php
sudo rpl --encoding UTF-8 '<b>Added adlists: ' '<b>Hinzugefügte Blocklisten: ' /var/www/html/admin/scripts/pi-hole/php/groups.php
sudo rpl --encoding UTF-8 'adlist\(s\) processed.</b>' 'Blockliste(n) bearbeitet.</b>' /var/www/html/admin/scripts/pi-hole/php/groups.php
sudo rpl --encoding UTF-8 'List of adlists' 'Übersicht der Blocklisten' /var/www/html/admin/groups-adlists.php
sudo rpl --encoding UTF-8 '10, 25, 50, 100, "All"' '10, 25, 50, 100, "Alle"' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl --encoding UTF-8 'titleAttr: "Select All"' 'titleAttr: "Alle auswählen"' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl --encoding UTF-8 'titleAttr: "Deselect All"' 'titleAttr: "Alle abwählen"' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl --encoding UTF-8 'titleAttr: "Delete Selected"' 'titleAttr: "Ausgewählte löschen"' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl --encoding UTF-8 '<th>Address</th>' '<th>Addresse</th>' /var/www/html/admin/groups-adlists.php
sudo rpl --encoding UTF-8 '<th>Comment</th>' '<th>Kommentar</th>' /var/www/html/admin/groups-adlists.php
sudo rpl --encoding UTF-8 '<th>Group assignment</th>' '<th>Gruppenzuordnung</th>' /var/www/html/admin/groups-adlists.php
sudo rpl --encoding UTF-8 'Click for details about this list' 'Klicken Sie hier für detailierte Informationen.' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl --encoding UTF-8 '<td>Health status of this list:</td>' '<td>Status der Liste:</td>' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl --encoding UTF-8 'var statusText = "Unknown";' 'var statusText = "Unbekannt";' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl --encoding UTF-8 'List is disabled and not checked' 'Liste ist deaktiviert und nicht geprüft.' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl --encoding UTF-8 'List was not downloaded so far' 'Liste wurde bisher nicht heruntergeladen.' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl --encoding UTF-8 'List download was successful \(<span class="list-status-1">OK</span>\)' 'Das Herunterladen der Liste war erfolgreich. (<span class="list-status-1">OK</span>)' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl --encoding UTF-8 'List unchanged upstream, Pi-hole used a local copy \(<span class="list-status-2">OK</span>\)' 'Liste unverändert, Pi-hole verwendet eine lokale Kopie. (<span class="list-status-2">OK</span>)' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl --encoding UTF-8 'List unavailable, Pi-hole used a local copy \(<span class="list-status-3">check list</span>\)' 'Diese Liste ist nicht vorhanden, Pi-hole verwendet eine lokale Kopie. (<span class="list-status-3">Kontrollliste</span>)' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl --encoding UTF-8 'List unavailable, there is no local copy of this list available on your Pi-hole \(<span class="list-status-4">replace list</span>\)' 'Liste ist nicht verfügbar, es ist auch keine lokale Kopie auf dem Pi-hole vorhanden. (<span class="list-status-4">Liste ersetzen!</span>)' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl --encoding UTF-8 'Unknown \(<span class="list-status-0"' 'Unbekannt (<span class="list-status-0"' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl --encoding UTF-8 '<td>This list was added to Pi-hole&nbsp;&nbsp;</td>' '<td>Diese Liste wurde zum Pi-hole hinzugefügt:&nbsp;&nbsp;</td>' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl --encoding UTF-8 'ago' 'zuvor' /var/www/html/admin/scripts/vendor/moment.min.js
sudo rpl --encoding UTF-8 'a month' '1 Monat' /var/www/html/admin/scripts/vendor/moment.min.js
sudo rpl --encoding UTF-8 'd minutes' 'd Minuten' /var/www/html/admin/scripts/vendor/moment.min.js
sudo rpl --encoding UTF-8 'a few seconds' 'ein paar Sekunden' /var/www/html/admin/scripts/vendor/moment.min.js
sudo rpl --encoding UTF-8 'd seconds' 'Sekunden' /var/www/html/admin/scripts/vendor/moment.min.js
sudo rpl --encoding UTF-8 'a minute' '1 Minute' /var/www/html/admin/scripts/vendor/moment.min.js
sudo rpl --encoding UTF-8 'an hour' '1 Stunde' /var/www/html/admin/scripts/vendor/moment.min.js
sudo rpl --encoding UTF-8 'd hours' 'd Stunden' /var/www/html/admin/scripts/vendor/moment.min.js
sudo rpl --encoding UTF-8 'a day' '1 Tag' /var/www/html/admin/scripts/vendor/moment.min.js
sudo rpl --encoding UTF-8 'd days' 'd Tage' /var/www/html/admin/scripts/vendor/moment.min.js
sudo rpl --encoding UTF-8 'd months' 'd Monate' /var/www/html/admin/scripts/vendor/moment.min.js
sudo rpl --encoding UTF-8 'a year' '1 Jahr' /var/www/html/admin/scripts/vendor/moment.min.js
sudo rpl --encoding UTF-8 'd years' 'd Jahre' /var/www/html/admin/scripts/vendor/moment.min.js
sudo rpl --encoding UTF-8 '<td>Database entry was last modified&nbsp;&nbsp;</td>' '<td>Datenbankeintrag wurde zuletzt geändert:&nbsp;&nbsp;</td>' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl --encoding UTF-8 '<td>The list contents were last updated&nbsp;&nbsp;</td>' '<td>Letzte Aktualisierung des Listeninhalts:&nbsp;&nbsp;</td>' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl --encoding UTF-8 '<td>Number of domains on this list:&nbsp;&nbsp;</td>' '<td>Anzahl der Domains in dieser Liste:&nbsp;&nbsp;</td>' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl --encoding UTF-8 '<td>Number of non-domains on this list:&nbsp;&nbsp;</td>' '<td>Anzahl der ungültigen Domains in dieser Liste:&nbsp;&nbsp;</td>' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl --encoding UTF-8 '<td>Database ID of this list:</td>' '<td>Datenbank-ID der Liste:</td>' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl --encoding UTF-8 'on: "Enabled"' 'on: "Aktiviert"' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl --encoding UTF-8 'off: "Disabled"' 'off: "Deaktiviert"' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl --encoding UTF-8 'Editing adlist...' 'Bearbeite die Blockliste ...' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl --encoding UTF-8 'Successfully " \+ done \+ " adlist ' 'Blockliste erfolgreich bearbeitet!' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl --encoding UTF-8 'Apply</button>' 'Anwenden</button>' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl --encoding UTF-8 '"Deleting adlist\(s\) ..."' '"Lösche die Blockliste: "' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl --encoding UTF-8 'Successfully deleted adlist\(s\)' 'Blockliste(n) erfolgreich gelöscht' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl --encoding UTF-8 'Error while deleting adlist\(s\)' 'Fehler beim Löschen der Blockliste(n).' /var/www/html/admin/scripts/pi-hole/js/groups-adlists.js
sudo rpl --encoding UTF-8 'Reset sorting</button>' 'Sortierung zurücksetzen</button' /var/www/html/admin/groups-adlists.php



# Ausschalten
sudo rpl --encoding UTF-8 'Custom disable timeout' 'Benutzerdefinierte Zeit' /var/www/html/admin/scripts/pi-hole/php/footer.php
sudo rpl --encoding UTF-8 '> Secs' '> Sekunden' /var/www/html/admin/scripts/pi-hole/php/footer.php
sudo rpl --encoding UTF-8 '> Mins' '> Minuten' /var/www/html/admin/scripts/pi-hole/php/footer.php
sudo rpl --encoding UTF-8 'Close</button>' 'Schließen</button>' /var/www/html/admin/scripts/pi-hole/php/footer.php
sudo rpl --encoding UTF-8 'Submit</button>' 'Absenden</button>' /var/www/html/admin/scripts/pi-hole/php/footer.php


echo -e "${blaufett}   50 % ...${standard}" >&2



# Werkzeuge
#  Pi-hole Diagnose
sudo rpl --encoding UTF-8 '<h1>Pi-hole diagnosis</h1>' '<h1>Pi-hole Diagnose</h1>' /var/www/html/admin/messages.php
sudo rpl --encoding UTF-8 'On this page, you can see messages from your Pi-hole concerning possible issues.' 'Auf dieser Seite können Sie Nachrichten von Pi-hole bezüglich möglicher Probleme sehen.' /var/www/html/admin/messages.php
sudo rpl --encoding UTF-8 '10, 25, 50, 100, "All"' '10, 25, 50, 100, "Alle"' /var/www/html/admin/scripts/pi-hole/js/messages.js
sudo rpl --encoding UTF-8 '<th>Time</th>' '<th>Zeit</th>' /var/www/html/admin/messages.php
sudo rpl --encoding UTF-8 '<th>Type</th>' '<th>Typ</th>' /var/www/html/admin/messages.php
sudo rpl --encoding UTF-8 '<th>Message</th>' '<th>Nachricht</th>' /var/www/html/admin/messages.php
sudo rpl --encoding UTF-8 'Encountered an error when processing <a href=' 'Fehler bei der Verarbeitung der <a href=' /var/www/html/admin/scripts/pi-hole/js/messages.js
sudo rpl --encoding UTF-8 '" regex filter with ID "' '" RegEx Filter mit der ID "' /var/www/html/admin/scripts/pi-hole/js/messages.js
sudo rpl --encoding UTF-8 '</pre>Error message: <pre>' '</pre>Fehlermeldung: <pre>' /var/www/html/admin/scripts/pi-hole/js/messages.js
sudo rpl --encoding UTF-8 'Client <code' 'Gerät <code' /var/www/html/admin/scripts/pi-hole/js/messages.js
sudo rpl --encoding UTF-8 '</code> is managed by' '</code> wird verwaltet von' /var/www/html/admin/scripts/pi-hole/js/messages.js
sudo rpl --encoding UTF-8 'FTL chose the most recent entry <pre>' 'FTL wählte den letzten Eintrag <pre>' /var/www/html/admin/scripts/pi-hole/js/messages.js
sudo rpl --encoding UTF-8 '</pre> to get the group configuration for this client.' '</pre> um die Gruppenkonfiguration für dieses Gerät zu erhalten.' /var/www/html/admin/scripts/pi-hole/js/messages.js
sudo rpl --encoding UTF-8 'Hostname contains invalid character <code>' 'Hostname enthält ungültiges Zeichen <code>' /var/www/html/admin/scripts/pi-hole/js/messages.js
sudo rpl --encoding UTF-8 '"FTL failed to start due to "' '"FTL konnte nicht starten wegen "' /var/www/html/admin/scripts/pi-hole/js/messages.js
sudo rpl --encoding UTF-8 '"Client "' '"Für das Gerät "' /var/www/html/admin/scripts/pi-hole/js/messages.js
sudo rpl --encoding UTF-8 '" has been rate-limited \(current config allows up to "' '" wurde eine Geschwindigkeitsbegrenzung eingeführt (die aktuelle Konfiguration erlaubt bis zu "' /var/www/html/admin/scripts/pi-hole/js/messages.js
sudo rpl --encoding UTF-8 '" queries in "' '" Abfragen in "' /var/www/html/admin/scripts/pi-hole/js/messages.js
sudo rpl --encoding UTF-8 '" seconds\)"' '" Sekunden\)."' /var/www/html/admin/scripts/pi-hole/js/messages.js
sudo rpl --encoding UTF-8 'Warning in <code>dnsmasq</code> core:<pre>' 'Warnung im <code>dnsmasq</code> Kern:<pre>' /var/www/html/admin/scripts/pi-hole/js/messages.js
sudo rpl --encoding UTF-8 'Check out ' 'Für mehr Informationen sehen Sie sich unsere ' /var/www/html/admin/scripts/pi-hole/js/messages.js
sudo rpl --encoding UTF-8 'our documentation' 'Dokumentation ' /var/www/html/admin/scripts/pi-hole/js/messages.js
sudo rpl --encoding UTF-8 ' for further information' 'an' /var/www/html/admin/scripts/pi-hole/js/messages.js
sudo rpl --encoding UTF-8 'Long-term load \(15min avg\) larger than number of processors' 'Langfristige Belastung (15min Durchschnitt) ist größer als die Anzahl der Prozessoren' /var/www/html/admin/scripts/pi-hole/js/messages.js
sudo rpl --encoding UTF-8 'This may slow down DNS resolution and can cause bottlenecks.' 'Dies kann die DNS-Auflösung verlangsamen und zu Engpässen führen.' /var/www/html/admin/scripts/pi-hole/js/messages.js
sudo rpl --encoding UTF-8 'RAM shortage ' 'Zu wenig Arbeitsspeicher ' /var/www/html/admin/scripts/pi-hole/js/messages.js
sudo rpl --encoding UTF-8 'ahead:' 'es werden annähernd' /var/www/html/admin/scripts/pi-hole/js/messages.js
sudo rpl --encoding UTF-8 '% used' ' % benutzt' /var/www/html/admin/scripts/pi-hole/js/messages.js
sudo rpl --encoding UTF-8 'Adlist with ID ' 'Die Blockliste mit der ID ' /var/www/html/admin/scripts/pi-hole/js/messages.js
sudo rpl --encoding UTF-8 'was inaccessible during last gravity run.' 'war während der letzten Aktualisierung nicht erreichbar.' /var/www/html/admin/scripts/pi-hole/js/messages.js
sudo rpl --encoding UTF-8 'Disk shortage' 'Zu wenig Festplattenspeicher' /var/www/html/admin/scripts/pi-hole/js/messages.js
sudo rpl --encoding UTF-8 '"Select All"' '"Alle auswählen"' /var/www/html/admin/scripts/pi-hole/js/messages.js
sudo rpl --encoding UTF-8 '"Deselect All"' '"Alle abwählen"' /var/www/html/admin/scripts/pi-hole/js/messages.js
sudo rpl --encoding UTF-8 '"Delete Selected"' '"Ausgewählte löschen"' /var/www/html/admin/scripts/pi-hole/js/messages.js
sudo rpl --encoding UTF-8 'Unknown message type<pre>' 'Unbekannte Mitteilung type<pre>' /var/www/html/admin/scripts/pi-hole/js/messages.js
sudo rpl --encoding UTF-8 'Deleting message\(s\)...' 'Lösche Mitteilung ...' /var/www/html/admin/scripts/pi-hole/js/messages.js
sudo rpl --encoding UTF-8 'Successfully deleted message\(s\)' 'Erfolgreich gelöschte Mitteilunge(n)' /var/www/html/admin/scripts/pi-hole/js/messages.js
sudo rpl --encoding UTF-8 'Error while deleting message\(s\):' 'Fehler beim Löschen der Mitteilung(en):' /var/www/html/admin/scripts/pi-hole/js/messages.js
sudo rpl --encoding UTF-8 'No issues found.' 'Keine Probleme gefunden.' /var/www/html/admin/scripts/pi-hole/js/messages.js
sudo rpl --encoding UTF-8 '<p>Note: If errors are shown, you can <a href="debug.php">generate a debug log</a>, which will do a thorough Pi-hole evaluation.</p>' '<p>Hinweis: Wenn Fehler angezeigt werden, können Sie ein <a href="debug.php">Debug-Protokoll erstellen</a>, das eine gründliche Pi-hole Auswertung vornimmt.</p>' /var/www/html/admin/messages.php



# Werkzeuge
#  Aktualisierung Gravity Liste
sudo rpl --encoding UTF-8 'Update Gravity \(list of blocked domains\)' 'Aktualisieren der Gravity Liste (Liste der geblockten Domains)' /var/www/html/admin/gravity.php
sudo rpl --encoding UTF-8 '>Update<' '>Aktualisieren<' /var/www/html/admin/gravity.php
sudo rpl --encoding UTF-8 'Updating... this may take a while. <strong>Please do not navigate away from or close this page.</strong>' 'Aktualisiere ... dies kann eine Weile dauern. <strong>Bitte verlassen oder schließen Sie diese Seite nicht.</strong>' /var/www/html/admin/gravity.php
sudo rpl --encoding UTF-8 'Success!' 'Erfolgreich aktualisiert!' /var/www/html/admin/gravity.php
sudo rpl --encoding UTF-8 'Unable to build gravity tree in ' 'Die Gravity Liste kann nicht erstellt werden in ' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Migrated from ' 'Migriert von ' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'DNS resolution is now available' 'DNS-Auflösung ist jetzt verfügbar' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'DNS resolution is not available' 'DNS-Auflösung ist nicht verfügbar' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'DNS resolution is currently unavailable' 'Die DNS-Auflösung ist derzeitig nicht verfügbar!' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'DNS service is not running' 'Der DNS-Dienst läuft nicht!' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Time until retry: ' 'Zeit bis zum nächsten Versuch: ' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Neutrino emissions detected\${COL_NC}...' 'Neutrino Emissions erkannt${COL_NC} ...' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Storing gravity database in ' 'Speicherung der Datenbank in ' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Pulling blocklist source list into range' 'Heranziehen der Blocklisten Quelle' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'No source list found, or it is empty' 'Keine Quellenliste gefunden, oder sie ist leer' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Preparing new gravity database' 'Aufbereitung einer neuen Gravity Datenbank' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Unable to create new database ' 'Neue Datenbank kann nicht erstellt werden ' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Creating new gravity databases' 'Erstellen einer neuen Gravity Datenbank' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Using libz compression' 'Verwenden der libz-Komprimierung' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Libz compression not available' 'Libz-Komprimierung ist nicht verfügbar!' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Target:' 'Quelle:' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'str="Status:"' 'str="Ergebnis:"' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Retrieval successful"' 'Abruf erfolgreich"' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'No changes detected"' 'Keine Änderungen erkannt"' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Connection Refused"' 'Verbindung abgelehnt"' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Forbidden"' 'Verboten"' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Not found"' 'Die Liste wurde nicht gefunden"' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Time-out"' 'Zeitüberschreitung"' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Unavailable For Legal Reasons"' 'Aus rechtlichen Gründen nicht verfügbar"' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Internal Server Error"' 'Interner Server Fehler"' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Connection Timed Out \(Gateway\)"' 'Zeitüberschreitung der Verbindung (Gateway)"' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Web Server Is Down \(Cloudflare\)"' 'Webserver ist ausgefallen (Cloudflare)"' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Connection Timed Out \(Cloudflare\)"' 'Zeitüberschreitung der Verbindung (Cloudflare)"' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 '\${INFO} List stayed unchanged' '${INFO} Die Liste hat sich nicht geändert' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 '\${INFO} List has been updated' '${INFO} Die Liste wurde aktualisiert' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 '\${CROSS} List download failed: \${COL_LIGHT_GREEN}using previously cached list' '${CROSS} Herunterladen der Liste nicht möglich: \${COL_LIGHT_GREEN}benutze zwischengespeicherte Liste' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 '\${CROSS} List download failed: \${COL_LIGHT_RED}no cached list available' '${CROSS} Herunterladen der Liste nicht möglich: ${COL_LIGHT_RED}keine zwischengespeicherte Liste vorhanden' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Creating new gravity database' 'Erstellen einer neuen Gravity Datenbank' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 ' Invalid Target' ' Ungültiges Ziel' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Building tree' 'Datenbaum wurde aufgebaut' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Swapping databases' 'Austausch der Datenbanken' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'The old database remains available' 'Die alte Datenbank ist weiterhin verfügbar' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Unable to copy data from' 'Daten konnten nicht kopiert werden von' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'gravityDBfile} to' 'gravityDBfile} bis' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 '\${CROSS} Unable to update gravity timestamp in database' '${CROSS} Zeitstempel der Gravity kann nicht in der Datenbank aktualisiert werden' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Number of \${str}:' 'Anzahl der ${str}:' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 '"gravity domains"' '"Gravity Domains"' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'unique domains' 'einzelne Domains' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 '"exact blacklisted domains"' '"exakt blockierten Domains"' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 '"regex blacklist filters"' '"RegEx blockierten Domains"' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 '"exact whitelisted domains"' '"exakt erlaubten Domains"' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 '"regex whitelist filters"' '"RegEx erlaubten Domains"' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 '\${INFO} \${COL_LIGHT_RED}User-abort detected\${COL_NC}"; gravity_Cleanup "error"' '${INFO} ${COL_LIGHT_RED}Abbruch durch Benutzer festgestellt${COL_NC}"; gravity_Cleanup "Fehler"' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 '\${CROSS} Failed to remove' '${CROSS} Nicht entfernt' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Usage: pihole -g' 'Verwende: pihole -g' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Update domains from blocklists specified in adlists.list' 'Domains aus den in adlists.list angegebenen Blocklisten aktualisieren' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Options:' 'Optionen:' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Force the download of all specified blocklists' 'Erzwingt den Download aller angegebenen Blocklisten' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Show this help dialog' 'Zeigt die Hilfe an' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Deleting existing list cache' 'Löschen des bestehenden List-Caches' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 '"Cleaning up stray matter"' '"Aufräumen"' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'DNS service is NOT running' 'DNS Dienst läuft nicht!' /usr/local/bin/pihole
sudo rpl --encoding UTF-8 'DNS service is NOT listening' 'DNS Dienst hört NICHT!' /usr/local/bin/pihole
sudo rpl --encoding UTF-8 'FTL is listening on port' 'FTL hört am Port' /usr/local/bin/pihole
sudo rpl --encoding UTF-8 'Pi-hole blocking is enabled' 'Pi-hole ist aktiviert' /usr/local/bin/pihole
sudo rpl --encoding UTF-8 'Pi-hole blocking is disabled' 'Pi-hole ist deaktiviert!' /usr/local/bin/pihole
sudo rpl --encoding UTF-8 'Pi-hole blocking will be enabled' 'Pi-hole wird aktiviert' /usr/local/bin/pihole
sudo rpl --encoding UTF-8 'Warning: Query logging is disabled' 'Warnung: Anfrageprotokollierung ist deaktiviert' /usr/local/bin/pihole



# Werkzeuge
#  Domain in einer Liste finden
sudo rpl --encoding UTF-8 'Find Blocked Domain In Lists' 'Gesperrte Domain in einer Liste finden' /var/www/html/admin/queryads.php
sudo rpl --encoding UTF-8 'Domain to look for \(example.com or sub.example.com\)' 'zu suchende Domain (beispiel.com oder mobil.beispiel.com)' /var/www/html/admin/queryads.php
sudo rpl --encoding UTF-8 'Search partial match</button>' 'Suche teilweise Übereinstimmung</button>' /var/www/html/admin/queryads.php
sudo rpl --encoding UTF-8 'Search exact match</button>' 'genaue Übereinstimmung</button>' /var/www/html/admin/queryads.php
sudo rpl --encoding UTF-8 'Show unlimited results.' 'Zeige alle Ergebnisse an.' /var/www/html/admin/queryads.php
sudo rpl --encoding UTF-8 'This can be very slow if too many domains are returned.' 'Dies kann sehr lange dauern, wenn zu viele Domänen zurückgegeben werden.' /var/www/html/admin/queryads.php
sudo rpl --encoding UTF-8 'Use with caution' 'Mit Vorsicht zu verwenden' /var/www/html/admin/queryads.php
sudo rpl --encoding UTF-8 'Not authorized' 'Nicht autorisiert!' /var/www/html/admin/scripts/pi-hole/php/queryads.php
sudo rpl --encoding UTF-8 'is an invalid domain!' 'ist eine ungültige Domain!' /var/www/html/admin/scripts/pi-hole/php/queryads.php
sudo rpl --encoding UTF-8 'No domain provided' 'Keine Domain angegeben!' /var/www/html/admin/scripts/pi-hole/php/queryads.php
sudo rpl --encoding UTF-8 'matchType="match"' 'matchType="Ergebnis"' /opt/pihole/query.sh
sudo rpl --encoding UTF-8 'plural="es"' 'plural=""' /opt/pihole/query.sh
sudo rpl --encoding UTF-8 'matchType="exact ' 'matchType="Genaues ' /opt/pihole/query.sh

# Die folgenden drei Zeilen dürfen nicht vertauscht werden
sudo rpl --encoding UTF-8 'found in \$\{COL_BOLD\}exact' 'gefunden in der${COL_BOLD}' /opt/pihole/query.sh
sudo rpl --encoding UTF-8 'found in \$\{COL_BOLD\}regex' 'gefunden in der ${COL_BOLD}RegEx' /opt/pihole/query.sh
sudo rpl --encoding UTF-8 'found in \$' 'gefunden in $' /opt/pihole/query.sh

sudo rpl --encoding UTF-8 'No \$\{exact' 'Kein ${exact' /opt/pihole/query.sh
sudo rpl --encoding UTF-8 'results found for \$' 'Ergebnis für $' /opt/pihole/query.sh
sudo rpl --encoding UTF-8 '\} within the adlists' '} in den Blocklisten gefunden.' /opt/pihole/query.sh
sudo rpl --encoding UTF-8 'Over 100 \$' 'Über 100 $' /opt/pihole/query.sh
sudo rpl --encoding UTF-8 'This can be overridden using the -all option' 'Dies kann mit der Option -all umgangen werden.' /opt/pihole/query.sh
sudo rpl --encoding UTF-8 'for \$\{COL_BOLD\}\${domainQuery\}\$\{COL_NC\} found in' 'für ${COL_BOLD}${domainQuery}${COL_NC} gefunden in' /opt/pihole/query.sh
sudo rpl --encoding UTF-8 'Over \$\{count\} results found, skipping rest of file' 'Über ${count} Ergebnisse, Rest der Datei wurde übersprungen.' /opt/pihole/query.sh



# Werkzeuge
#  Prüfprotokoll
sudo rpl --encoding UTF-8 'Audit log \(showing live data\)' 'Prüfprotokoll (zeige Live-Daten)' /var/www/html/admin/auditlog.php
sudo rpl --encoding UTF-8 'Allowed queries' 'Erlaubte Anfragen' /var/www/html/admin/auditlog.php
sudo rpl --encoding UTF-8 'Blocked queries' 'Geblockte Anfragen' /var/www/html/admin/auditlog.php
sudo rpl --encoding UTF-8 '<th>Hits</th>' '<th>Treffer</th>' /var/www/html/admin/auditlog.php
sudo rpl --encoding UTF-8 '<th>Actions</th>' '<th>Aktionen</th>' /var/www/html/admin/auditlog.php
sudo rpl --encoding UTF-8 'Audit</button>' 'Prüfung</button>' /var/www/html/admin/scripts/pi-hole/js/auditlog.js
sudo rpl --encoding UTF-8 'Added from Audit Log' 'Vom Audit Protokoll hinzugefügt' /var/www/html/admin/scripts/pi-hole/js/auditlog.js



# Werkzeuge
#  pihole.log anzeigen
sudo rpl --encoding UTF-8 'Output the last lines of the pihole.log file \(live\)' 'Ausgabe der letzten Zeilen der Datei pihole.log (live)' /var/www/html/admin/taillog.php
sudo rpl --encoding UTF-8 'Automatic scrolling on update' 'Automatisches Scrollen beim Update' /var/www/html/admin/taillog.php
sudo rpl --encoding UTF-8 'Failed to open log file. Check permissions!' 'Fehler beim Öffnen der Protokolldatei. Bitte Berechtigungen prüfen! ' /var/www/html/admin/scripts/pi-hole/php/tailLog.php



# Werkzeuge
#  pihole-FTL.log anzeigen
sudo rpl --encoding UTF-8 'Output the last lines of the FTL.log file \(live\)' 'Ausgabe der letzten Zeilen der Datei FTL.log (live)' /var/www/html/admin/taillog-FTL.php
sudo rpl --encoding UTF-8 'Automatic scrolling on update' 'Automatisches Scrollen beim Update' /var/www/html/admin/taillog-FTL.php



# Werkzeuge
#  Erstelle Debug-Protokoll
sudo rpl --encoding UTF-8 'Generate debug log' 'Erstelle ein Debug-Protokoll' /var/www/html/admin/debug.php
sudo rpl --encoding UTF-8 'Options:</h1>' 'Optionen:</h1>' /var/www/html/admin/debug.php
sudo rpl --encoding UTF-8 'Execute database integrity check.</strong>' 'Datenbankintegritätsprüfung durchführen.</strong>' /var/www/html/admin/debug.php
sudo rpl --encoding UTF-8 'This can add several minutes to debug log time.</span>' 'Dies kann die Debug-Protokollzeit um mehrere Minuten verlängern.</span>' /var/www/html/admin/debug.php
sudo rpl --encoding UTF-8 'Upload debug log and provide Debug Token.</strong>' 'Debug-Protokoll hochladen und Debug-Token angeben.</strong>' /var/www/html/admin/debug.php
sudo rpl --encoding UTF-8 'The URL token will be shown at the end of the report, once finished.</span>' 'Das URL-Token wird am Ende des Berichts angezeigt, sobald dieser fertig ist.</span>' /var/www/html/admin/debug.php
sudo rpl --encoding UTF-8 'Once you click this button a debug log will be generated and can automatically be uploaded if we detect a working internet connection.' 'Sobald Sie auf diese Schaltfläche klicken, wird ein Debug-Protokoll erstellt, das automatisch hochgeladen werden kann, wenn eine funktionierende Internetverbindung erkannt wird.' /var/www/html/admin/debug.php



# Werzeuge
#  Netzwerk
sudo rpl --encoding UTF-8 '<h3 class="box-title">Network overview</h3>' '<h3 class="box-title">Netzwerkübersicht</h3>' /var/www/html/admin/network.php
sudo rpl --encoding UTF-8 '10, 25, 50, 100, "All"' '10, 25, 50, 100, "Alle"' /var/www/html/admin/scripts/pi-hole/js/network.js
sudo rpl --encoding UTF-8 '<th>IP address</th>' '<th>IP Adresse</th>' /var/www/html/admin/network.php
sudo rpl --encoding UTF-8 '<th>Hardware address</th>' '<th>Hardware Adresse</th>' /var/www/html/admin/network.php
sudo rpl --encoding UTF-8 '<th>Interface</th>' '<th>Schnittstelle</th>' /var/www/html/admin/network.php
sudo rpl --encoding UTF-8 '<th>First seen</th>' '<th>Zum ersten Mal gesehen</th>' /var/www/html/admin/network.php
sudo rpl --encoding UTF-8 '<th>Last Query</th>' '<th>Letzte Anfrage</th>' /var/www/html/admin/network.php
sudo rpl --encoding UTF-8 '<th>Number of queries</th>' '<th>Anzahl der Anfragen</th>' /var/www/html/admin/network.php
sudo rpl --encoding UTF-8 '<th>Uses Pi-hole</th>' '<th>Verwendet Pi-hole</th>' /var/www/html/admin/network.php
sudo rpl --encoding UTF-8 '<th>Action</th>' '<th>Aktion</th>' /var/www/html/admin/network.php
sudo rpl --encoding UTF-8 '"Deleting network table entry..."' '"Lösche den Eintrag der Netzwerktabelle mit der ID ..."' /var/www/html/admin/scripts/pi-hole/js/network.js
sudo rpl --encoding UTF-8 'Successfully deleted network table entry' 'Eintrag der Netzwerktablle erfolgreich gelöscht.' /var/www/html/admin/scripts/pi-hole/js/network.js
sudo rpl --encoding UTF-8 'Error while network table entry with ID ' 'Fehler beim Netzwerktabelleneintrag mit der ID ' /var/www/html/admin/scripts/pi-hole/js/network.js
sudo rpl --encoding UTF-8 'Error while deleting network table entry with ID ' 'Fehler beim Löschen des Netzwerktabelleneintrags mit der ID ' /var/www/html/admin/scripts/pi-hole/js/network.js
sudo rpl --encoding UTF-8 'No host name for' 'Kein Hostname für' /var/www/html/admin/scripts/pi-hole/js/network.js
sudo rpl --encoding UTF-8 '" known"\)' '" bekannt")' /var/www/html/admin/scripts/pi-hole/js/network.js
sudo rpl --encoding UTF-8 '<em>unknown</em>' '<em>unbekannt</em>' /var/www/html/admin/scripts/pi-hole/js/network.js
sudo rpl --encoding UTF-8 '\("Never"\)' '("bisher keine")' /var/www/html/admin/scripts/pi-hole/js/network.js
sudo rpl --encoding UTF-8 '<label>Background color: Last query from this device seen ...</label>' '<label>Hintergrundfarbe: Letzte Anfrage von diesem Gerät gesehen ...</label>' /var/www/html/admin/network.php
sudo rpl --encoding UTF-8 '>just now<' '>Im Moment<' /var/www/html/admin/network.php
sudo rpl --encoding UTF-8 '... to ...' '... zu ...' /var/www/html/admin/network.php
sudo rpl --encoding UTF-8 '>24 hours ago' '>vor 24 Stunden' /var/www/html/admin/network.php
sudo rpl --encoding UTF-8 '>&gt; 24 hours ago' '>vor mehr als 24 Stunden' /var/www/html/admin/network.php
sudo rpl --encoding UTF-8 'Device does not use Pi-hole' 'Gerät verwendet nicht Pi-hole' /var/www/html/admin/network.php



# Einstellungen
sudo rpl --encoding UTF-8 'Info</h4>' 'Information</h4>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Error</h4>' 'Fehler</h4>' /var/www/html/admin/settings.php



# Einstellungen
#  System
sudo rpl --encoding UTF-8 'The PHP extension <code>Phar</code> is not loaded. Please ensure it is installed and loaded if you want to use the Pi-hole teleporter.' 'Die PHP-Erweiterung <code>Phar</code> ist nicht geladen. Bitte stellen Sie sicher, dass es installiert und geladen ist, wenn Sie den Pi-hole-Teleporter verwenden möchten.' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<h3 class="box-title">FTL Information</h3>' '<h3 class="box-title">FTL Informationen</h3>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<th scope="row">FTL version:</th>' '<th scope="row">FTL Version:</th>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<th scope="row">Process identifier \(PID\):</th>' '<th scope="row">Prozesskennung (PID):</th>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<th scope="row">Time FTL started:</th>' '<th scope="row">FTL gestartet am:</th>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<th scope="row">User / Group:</th>' '<th scope="row">Benutzer / Gruppe:</th>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<th scope="row">Total CPU utilization:</th>' '<th scope="row">Gesamte CPU Auslastung:</th>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<th scope="row">Memory utilization:</th>' '<th scope="row">Speicher Auslastung:</th>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<span title="Resident memory is the portion of memory occupied by a process that is held in main memory \(RAM\). The rest of the occupied memory exists in the swap space or file system.">Used memory:</span>' '<span title="Der residente Speicher ist der Teil des Speichers, der von einem Prozess belegt wird, der im Hauptspeicher (RAM) gespeichert ist. Der Rest des belegten Speichers befindet sich im Auslagerungsspeicher oder im Dateisystem.">Benutzter Speicher:</span>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<span title="Size of the DNS domain cache">DNS cache size:</span>' '<span title="Size of the DNS domain cache">DNS Cache Größe:</span>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<span title="Number of cache insertions">DNS cache insertions:</span>' '<span title="Anzahl der Einträge im Cache">DNS Cache Einträge:</span>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Number of cache entries that had to be removed although they are not expired \(increase cache size to reduce this number\)" lookatme-text="DNS cache evictions:">DNS cache evictions:' 'Anzahl der Cache-Einträge, die entfernt werden mussten, obwohl sie noch nicht abgelaufen sind (erhöhen Sie die Cache-Größe, um diese Anzahl zu verringern)" lookatme-text="DNS-Cache-Löschungen:">DNS-Cache-Löschungen:' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'See also our <a href="https://docs.pi-hole.net/ftldns/dns-cache/" rel="noopener" target="_blank">DNS cache documentation</a>.' 'Siehe auch unsere <a href="https://docs.pi-hole.net/ftldns/dns-cache/" rel="noopener" target="_blank">DNS Cache Dokumentation</a>.' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'The FTL service is offline!' 'Der FTL Service ist offline!' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Disable query logging</button>' 'Deaktiviere Anfrageprotokollierung</button>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Confirmation required' 'Bestätigung erforderlich!' /var/www/html/admin/scripts/pi-hole/js/settings.js
sudo rpl --encoding UTF-8 'Are you sure you want to disable logging\?' 'Möchten Sie die Anfrageprotokollierung wirklich deaktivieren?' /var/www/html/admin/scripts/pi-hole/js/settings.js
sudo rpl --encoding UTF-8 '"Yes, disable logs"' '"Ja, Anfrageprotokollierung deaktivieren"' /var/www/html/admin/scripts/pi-hole/js/settings.js
sudo rpl --encoding UTF-8 'No, go back' 'Nein, zurück' /var/www/html/admin/scripts/pi-hole/js/settings.js
sudo rpl --encoding UTF-8 'Logging has been disabled, your logs have <strong>not</strong> been flushed' 'Die Anfrageprotokollierung wurde deaktiviert, Ihre Protokolle wurden <strong>nicht</strong> gelöscht.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 'Enable query logging' 'Aktiviere Anfrageprotokollierung' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Logging has been enabled' 'Die Protokollierung wurde aktiviert.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 'Flush network table</button>' 'Lösche die Netzwerk Tabelle</button>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Are you sure you want to flush your network table\?' 'Sind Sie sich sicher, die Netzwerk Tabelle zu löschen?' /var/www/html/admin/scripts/pi-hole/js/settings.js
sudo rpl --encoding UTF-8 'Yes, flush my network table' 'Ja, lösche die Netzwerk Tabelle' /var/www/html/admin/scripts/pi-hole/js/settings.js
sudo rpl --encoding UTF-8 'The network table has been flushed' 'Die Netzwerk Tabelle wurde gelöscht.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 'Invalid option' 'Ungültige Option' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 '>Restart DNS resolver</button>' '>DNS-Server neu starten</button>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Are you sure you want to send a restart command to your DNS server\?' 'Möchten Sie wirklich den DNS-Server neu starten?' /var/www/html/admin/scripts/pi-hole/js/settings.js
sudo rpl --encoding UTF-8 'Yes, restart DNS' 'Ja, DNS-Server neu starten' /var/www/html/admin/scripts/pi-hole/js/settings.js
sudo rpl --encoding UTF-8 'The DNS server has been restarted' 'Der DNS Server wurde neu gestartet.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 '>Flush logs \(last 24 hours\)</button>' '>Protokolle löschen (letzten 24 Stunden)</button>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Are you sure you want to flush your logs\?' 'Sind Sie sicher, dass Sie Ihre Protokolle löschen möchten?' /var/www/html/admin/scripts/pi-hole/js/settings.js
sudo rpl --encoding UTF-8 'Yes, flush logs' 'Ja, Protokolle löschen' /var/www/html/admin/scripts/pi-hole/js/settings.js
sudo rpl --encoding UTF-8 'The Pi-hole log file has been flushed' 'Die Pi-hole Protokolle wurden gelöscht.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 'Power off system</button>' 'System ausschalten</button>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Are you sure you want to send a poweroff command to your Pi-hole\?' 'Möchten Sie den Computer ausschalten?' /var/www/html/admin/scripts/pi-hole/js/settings.js
sudo rpl --encoding UTF-8 'Yes, poweroff' 'Ja, Computer ausschalten' /var/www/html/admin/scripts/pi-hole/js/settings.js
sudo rpl --encoding UTF-8 'The system will poweroff in 5 seconds...' 'Der Computer schaltet sich in 5 Sekunden aus ...' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 '>Restart system</button>' '>System neu starten</button>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Are you sure you want to send a reboot command to your Pi-hole\?' 'Möchten Sie wirklich das System neu starten?' /var/www/html/admin/scripts/pi-hole/js/settings.js
sudo rpl --encoding UTF-8 'Yes, reboot' 'Ja, neu starten' /var/www/html/admin/scripts/pi-hole/js/settings.js
sudo rpl --encoding UTF-8 'The system will reboot in 5 seconds...' 'Das System startet in 5 Sekunden neu ...' /var/www/html/admin/scripts/pi-hole/php/savesettings.php



# Einstellungen
#  DNS
sudo rpl --encoding UTF-8 '<h1 class="box-title">Upstream DNS Servers</h1>' '<h1 class="box-title">Upstream DNS-Server</h1>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<strong>Custom 1 \(IPv4\)</strong>' '<strong>Benutzerdefiniert 1 (IPv4)</strong>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<strong>Custom 2 \(IPv4\)</strong>' '<strong>Benutzerdefiniert 2 (IPv4)</strong>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<strong>Custom 3 \(IPv6\)</strong>' '<strong>Benutzerdefiniert 3 (IPv6)</strong>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<strong>Custom 4 \(IPv6\)</strong>' '<strong>Benutzerdefiniert 4 (IPv6)</strong>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<h1 class="box-title">Interface settings</h1>' '<h1 class="box-title">Einstellungen der Schnittstelle</h1>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<h4>Recommended setting</h4>' '<h4>Empfohlene Einstellung</h4>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<strong>Allow only local requests</strong>' '<strong>Nur lokale Anfragen zulassen</strong>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Allows only queries from devices that are at most one hop away \(local devices\)</label>' 'Erlaubt nur Anfragen von Geräten, die höchstens einen Sprung entfernt sind (lokale Geräte).</label> ' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<h4>Potentially dangerous options</h4>' '<h4>Potenziell gefährliche Optionen</h4>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Make sure your Pi-hole is properly firewalled!' 'Stellen Sie sicher, dass Ihr Pi-hole ordnungsgemäß mit einer Firewall ausgestattet ist!' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<strong>Respond only on interface' '<strong>Reagiere nur an Schnittstelle' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<strong>Bind only to interface' '<strong>Binde nur an Schnittstelle' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<strong>Permit all origins</strong>' '<strong>Reagiere auf jede Quelle</strong>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<p>These options are dangerous on devices' 'Diese Optionen sind gefährlich für Geräte, die direkt mit dem Internet verbunden' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'directly connected to the Internet such as cloud instances and are only safe if your' 'sind, wie z. B. Cloud-Instanzen und sind nur sicher, wenn Ihr Pi-hole über eine' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Pi-hole is properly firewalled. In a typical at-home setup where your Pi-hole is' 'ordnungsgemäße Firewall verfügt. In einem typischen Heim-Setup, bei der sich Ihr' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'located within your local network \(and you have <strong>not</strong> forwarded port 53' 'Pi-hole in Ihrem lokalen Netzwerk befindet (und Sie Port 53 in Ihrem Router <strong>nicht</strong>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'in your router!\) they are safe to use.</p>' 'weitergeleitet haben!), können sie sicher verwendet werden.</p>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<p>See <a href="https://docs.pi-hole.net/ftldns/interfaces/" target="_blank">our documentation</a> for further technical details.</p>' '<p>Siehe auch <a href="https://docs.pi-hole.net/ftldns/interfaces/" target="_blank">unsere Dokumentation</a> für weitere technische Details.</p>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<p>ECS \(Extended Client Subnet\) defines a mechanism for recursive resolvers to send partial client IP address information to authoritative DNS name servers. Content Delivery Networks \(CDNs\) and latency-sensitive services use this to give geo-located responses when responding to name lookups coming through public DNS resolvers. <em>Note that ECS may result in reduced privacy.</em></p>' '<p>ECS (Extended Client Subnet) definiert einen Mechanismus für rekursive Resolver, um teilweise IP-Adressinformationen des Clients an autorisierende DNS-Nameserver zu senden. Content Delivery Networks (CDNs) und latenzempfindliche Dienste verwenden diese Option, um geografische Antworten auf Namenssuchen zu geben, die über öffentliche DNS-Resolver eingehen. <em>Beachten Sie, dass ECS die Privatsphäre beeinträchtigen kann.</em></p>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<h3 class="box-title">Advanced DNS settings</h3>' '<h3 class="box-title">Erweiterte DNS-Einstellungen</h3>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Never forward non-FQDN <code>A</code> and <code>AAAA</code> queries' 'Niemals Nicht-FQDN weiterleiten <code>A</code> und <code>AAAA</code> Anfragen' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<p>When there is a Pi-hole domain set and this box is' '<p>Wenn es eine Pi-hole-Domain gibt und dieses Kästchen angekreuzt ist, ' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'ticked, this asks FTL that this domain is purely' 'wird die FTL gefragt, ob diese Domain rein lokal ist. Die FTL kann Anfragen ' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'local and FTL may answer queries from <code>/etc/hosts</code> or DHCP leases' 'von <code>/etc/hosts</code> oder DHCP-Leases beantworten, sollte aber ' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'but should never forward queries on that domain to any upstream servers.' 'niemals Anfragen zu dieser Domain an irgendwelche Upstream-Server weiterleiten.' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<strong>Never forward reverse lookups for private IP ranges</strong>' '<strong>Niemals Reverse-Lookups für private IP-Bereiche weiterleiten</strong>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'If Conditional Forwarding is enabled, unticking this box may cause a partial' 'Wenn die bedingte Weiterleitung aktiviert ist, kann das Deaktivieren dieses Kästchens unter bestimmten ' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'DNS loop under certain circumstances \(e.g. if a client would send TLD DNSSEC queries\).' 'Umständen zu einer teilweisen DNS-Schleife führen (z. B. wenn ein Client TLD-DNSSEC-Anfragen senden würde).' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<p>All reverse lookups for private IP ranges \(i.e., <code>192.168.0.x/24</code>, etc.\)' '<p>Alle Reverse-Lookups für private IP-Bereiche (d.h. 192.168.0.x/24 usw.), ' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'which are not found in <code>/etc/hosts</code> or the DHCP leases are answered' 'die nicht in <code>/etc/hosts</code> oder den DHCP-Leases gefunden werden, werden mit ' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'with "no such domain" rather than being forwarded upstream. The set' '"no such domain" beantwortet, anstatt upstream weitergeleitet zu werden. ' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'of prefixes affected is the list given in <a href="https://tools.ietf.org/html/rfc6303">RFC6303</a>.</p>' 'Der betroffene Satz von Präfixen ist die in RFC6303 angegebene Liste.</a>.</p>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<p><strong>Important</strong>: Enabling these two options may increase your privacy,' '<p><strong>Wichtig</strong>: Die Aktivierung dieser beiden Optionen kann ' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'but may also prevent you from being able to access' 'Ihre Privatsphäre erhöhen, Sie jedoch auch daran hindern kann, dass Sie auf lokale ' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'local hostnames if the Pi-hole is not used as DHCP server.</p>' 'Hostnamen zuzugreifen, wenn Pi-hole nicht als DHCP-Server verwendet wird.</p>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<strong>Use DNSSEC</strong>' '<strong>Verwende DNSSEC</strong>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<p>Validate DNS replies and cache DNSSEC data. When forwarding DNS' '<p> Überprüfen Sie die DNS-Antworten und speichern Sie die DNSSEC-Daten zwischen. Bei der ' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'queries, Pi-hole requests the DNSSEC records needed to validate' 'Weiterleitung von DNS-Abfragen fordert Pi-hole die DNSSEC-Einträge an, die zur Validierung ' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'the replies. If a domain fails validation or the upstream does not' 'der Antworten erforderlich sind. Wenn eine Domain die Validierung nicht besteht oder der ' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'support DNSSEC, this setting can cause issues resolving domains.' 'Upstream DNSSEC nicht unterstützt, kann diese Einstellung Probleme beim Auflösen von ' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Use an upstream DNS server which supports DNSSEC when activating DNSSEC. Note that' 'Domains verursachen. Verwenden Sie einen Upstream-DNS-Server, der DNSSEC unterstützt, ' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'the size of your log might increase significantly' 'wenn Sie DNSSEC aktivieren. Beachten Sie, dass die Größe Ihres Protokolls beim Aktivieren ' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'when enabling DNSSEC. A DNSSEC resolver test can be found' 'von DNSSEC möglicherweise erheblich zunimmt. Ein DNSSEC-Resolver-Test finden Sie ' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '>here</a>.</p>' '>hier</a>.</p>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Rate-limiting' 'Anfragebeschränkung' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Block clients making more than' 'Blockieren Sie Geräte, die mehr als ' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'queries within' 'Anfragen innerhalb von ' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'seconds.</p>' 'Sekunden stellen.</p>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'When a client makes too many queries in too short time, it' 'Wenn ein Gerät in kurzer Zeit zu viele Anfragen stellt, werden Anfragen' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'gets rate-limited. Rate-limited queries are answered with a' 'begrenzt. Begrenzte Anfragen werden mit Antwort <code>VERWEIGERT</code>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<code>REFUSED<\/code> reply and not further processed by FTL' 'beantwortet und von der FTL nicht weiter bearbeitet, um zu verhindern,' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'and prevent Pi-holes getting overwhelmed by rogue clients.' 'dass Pi-hole von bösartigen Geräten überwältigt werden kann. Es ist wichtig' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'It is important to note that rate-limiting is happening on a' 'zu beachten, dass die Anfragebegrenzung pro Gerät erfolgt. Andere Geräte können' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'per-client basis. Other clients can continue to use FTL while' 'FTL währenddessen weiterhin verwenden. Anfragebegrenzte Geräte werden gleichzeitig' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'rate-limited clients are short-circuited at the same time.' 'kurzgeschlossen.' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Anfragebeschränkung may be disabled altogether by setting both' 'Die Anfragebeschränkung kann vollständig deaktiviert werden,' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'values to zero. See' 'indem beide Werte auf Null gesetzt werden.' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<a href="https://docs.pi-hole.net/ftldns/configfile/#rate_limit" target="_blank">our documentation</a>' 'Siehe <a href="https://docs.pi-hole.net/ftldns/configfile/#rate_limit"target="_blank">unsere Dokumentation</a>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'for further details.' 'für weitere Details.' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<h4>Conditional forwarding</h4>' '<h4>Bedingte Weiterleitung</h4>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 "If not configured as your DHCP server, Pi-hole typically won't be able to" 'Wenn Pi-hole nicht als DHCP-Server konfiguriert ist, kann' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'determine the names of devices on your local network.  As a' 'es die Namen der Geräte in Ihrem lokalen Netzwerk nicht ermitteln. Daher' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'result, tables such as Top Clients will only show IP addresses.</p>' 'werden in den Tabellen der Top Geräte nur die IP-Adressen angezeigt.</p>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<p>One solution for this is to configure Pi-hole to forward these' '<p>Eine Lösung hierfür besteht darin, Pi-hole so zu konfigurieren, dass die Anfragen' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'requests to your DHCP server \(most likely your router\), but only for devices on your' 'an Ihren DHCP-Server (höchstwahrscheinlich an Ihren Router) weitergeleitet werden, jedoch' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'home network.  To configure this we will need to know the IP' 'nur für Geräte in Ihrem Heimnetzwerk. Um dies zu konfigurieren, müssen wir die IP-Adresse' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'address of your DHCP server and which addresses belong to your local network.' 'Ihres DHCP-Servers und den Namen Ihres lokalen Netzwerks kennen.</p>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Exemplary input is given below as placeholder in the text boxes \(if empty\).</p>' 'Beispiele werden unten als Platzhalter in den Textfeldern angegeben (falls leer).</p>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<p>If your local network spans 192.168.0.1 - 192.168.0.255, then you will have to input' 'Wenn sich Ihr lokales Netzwerk über 192.168.0.1 - 192.168.0.255 erstreckt, müssen Sie' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<code>192.168.0.0/24</code>. If your local network is 192.168.47.1 - 192.168.47.255, it will' '<code>192.168.0.0/24</code> eingeben. Wenn Ihr lokales Netzwerk 192.168.47.1 - 192.168.47.255 ist,' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'be <code>192.168.47.0/24</code> and similar. If your network is larger, the CIDR has to be' ' ist es <code>192.168.47.0/24</code>  und ähnlich. Wenn Ihr Netzwerk größer ist, muss der ' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'different, for instance a range of 10.8.0.1 - 10.8.255.255 results in <code>10.8.0.0/16</code>' 'CIDR unterschiedlich sein. Beispielsweise ergibt ein Bereich von 10.8.0.1 - 10.8.255.255' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'whereas an even wider network of 10.0.0.1 - 10.255.255.255 results in <code>10.0.0.0/8</code>' ' <code>10.8.0.0/16</code>, während ein noch breiteres Netzwerk von 10.0.0.1 - 10.255.255.255' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Setting up IPv6 ranges is exactly similar to setting up IPv4 here and fully supported.' ' <code>10.0.0.0/8</code> ergibt. Das Einrichten von IPv6-Bereichen ähnelt genau dem Einrichten ' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Feel free to reach out to us on our' 'von IPv4 hier und wird vollständig unterstützt. Sie können sich gerne in unserem ' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Discourse forum' '<a href="https://discourse.pi-hole.net" target="_blank">Diskussionsforum</a> an uns wenden, ' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'in case you need any assistance setting up local host name resolution for your particular system.' 'falls Sie Hilfe beim Einrichten der lokalen Hostnamenauflösung für Ihr bestimmtes System benötigen.' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'You can also specify a local domain name \(like <code>fritz.box</code>\) to ensure queries to' 'Sie können auch einen lokalen Domänennamen (wie z.B. <code>fritz.box</code>) angeben, um sicherzustellen, ' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'devices ending in your local domain name will not leave your network, however, this is optional.' 'dass Abfragen an Geräte, die mit Ihrem lokalen Domänennamen enden, Ihr Netzwerk nicht verlassen. ' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'The local domain name must match the domain name specified' 'Dies ist jedoch optional. Der lokale Domänenname muss mit dem auf Ihrem DHCP-Server angegebenen ' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'in your DHCP server for this to work. You can likely find it within the DHCP settings.' 'Domänennamen übereinstimmen, damit dies funktioniert. Sie finden es wahrscheinlich in den DHCP-Einstellungen.' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Enabling Conditional Forwarding will also forward all hostnames \(i.e., non-FQDNs\) to the router' 'Wenn Sie die bedingte Weiterleitung aktivieren, werden auch alle Hostnamen (d. h. Nicht-FQDNs) an den Router weitergeleitet,' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'when "Never forward non-FQDNs" is <em>not</em> enabled.' 'wenn "Niemals weitergeleitete Nicht-FQDN" <em>nicht</em> aktiviert ist.' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<strong>Use Conditional Forwarding</strong' '<strong>Verwende Bedingte Weiterleitung</strong' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Local network in ' 'Lokales Netzwerk in ' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'CIDR notation' 'CIDR Notation'  /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'IP address of your DHCP server \(router\)' 'IP Adresse des DHCP Servers (Router)' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing' 'https://de.wikipedia.org/wiki/Classless_Inter-Domain_Routing' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Local domain name \(optional\)' 'Lokaler Domänenname (optional)' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Save</button>' 'Speichern</button>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'The DNS settings have been updated \(using ' 'Die DNS Einstellungen wurden aktualisiert (es wird/werden ' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 'DNS servers\)' 'DNS Server benutzt.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 "'MAC address \(" "'Die MAC Adresse (" /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 'is invalid!<br>' 'ist ungültig!<br>' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 "'IP address \(" "'Die IP Adresse (" /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 "'Host name \(" "'Der Hostname (" /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 'Static lease for MAC address ' 'Statisches Lease für MAC Adresse ' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 'already defined!<br>' 'ist bereits definiert!<br>' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 'Static lease for IP address ' 'Statisches Lease für die IP Adresse ' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 'Static lease for hostname ' 'Statisches Lease für den Hostnamen ' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 'You can not omit both the IP address and the host name!<br>' 'Sie können sowohl die IP-Adresse als auch den Hostnamen nicht weglassen!<br>' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 'A new static address has been added' 'Eine neue statische Adresse wurde hinzugefügt.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 "'Port \(" "'Der Port (" /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 'No DNS server has been selected.<br>' 'Es wurde kein DNS Server ausgewählt.<br>' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 'Conditional forwarding subnet ' 'Subnetz für bedingte Weiterleitung ' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 'This field requires CIDR notation for local subnets \(e.g., 192.168.0.0/16\).<br>' 'Dieses Feld erfordert eine CIDR Notation für das lokale Subnetz (z.B. 192.168.0.0/16).<br>' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 'The settings have been reset to their previous values' 'Die Einstellungen wurden auf ihre vorherigen Werte zurückgesetzt.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 'Logging has been disabled and logs have been flushed' 'Die Protokollierung wurde deaktiviert und die Protokolle wurden gelöscht.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 'Top Domains/Ads entry ' 'Der Top Domain Eintrag ' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 'is invalid \(use only domains\)!<br>' 'ist nicht gültig (verwenden Sie nur Domainnamen)!<br>' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 'Top Clients entry ' 'Der Top Geräte Eintrag ' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 'is invalid \(use only host names and IP addresses\)!' 'ist ungültig (verwenden Sie nur Hostnamen und IP Adressen)!' /var/www/html/admin/scripts/pi-hole/php/savesettings.php


echo -e "${blaufett}   75 % ...${standard}" >&2



# Einstellungen
#  DHCP
sudo rpl --encoding UTF-8 '<h3 class="box-title">DHCP Settings</h3>' '<h3 class="box-title">DHCP Einstellungen</h3>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<strong>DHCP server enabled</strong>' '<strong>DHCP Server einschalten</strong></label>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 "Make sure your router's DHCP server is disabled when using the Pi-hole DHCP server!" 'Vergewissern Sie sich, dass der DHCP-Server Ihres Routers deaktiviert ist, wenn Sie den Pi-hole als DHCP-Server verwenden!' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<label>Range of IP addresses to hand out</label>' '<label>Bereich der zu verteilenden IP-Adressen</label>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<div class="input-group-addon">From</div>' '<div class="input-group-addon">Von</div>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<div class="input-group-addon">To</div>' '<div class="input-group-addon">Bis</div>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<label>Router \(gateway\) IP address</label>' '<label>IP Adresse des Routers (z.B. 192.168.178.1)</label>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<h3 class="box-title">Advanced DHCP settings</h3>' '<h3 class="box-title">Erweiterte DHCP Einstellungen</h3>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Pi-hole domain name' 'Pi-hole Domänenname' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'DHCP lease time' 'DHCP Leasingzeit' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Lease time in hours' 'Leasingzeit in Stunden' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Hint: 0 = infinite, 24 = one day, 168 = one week, 744 = one month, 8760 = one year' 'Hinweis: 0 = unendlich, 24 = ein Tag, 168 = eine Woche, 744 = ein Monat, 8760 = ein Jahr' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<i>unknown</i>' '<i>unbekannt</i>' /var/www/html/admin/scripts/pi-hole/js/settings.js
sudo rpl --encoding UTF-8 'Deleting DHCP lease...' 'Lösche DHCP Lease...' /var/www/html/admin/scripts/pi-hole/js/settings.js
sudo rpl --encoding UTF-8 'Successfully deleted DHCP lease for ' 'Erfolgreich DHCP Lease gelöscht für ' /var/www/html/admin/scripts/pi-hole/js/settings.js
sudo rpl --encoding UTF-8 'Error while deleting DHCP lease for ' 'Fehler während des Löschens des DHCP Lease für ' /var/www/html/admin/scripts/pi-hole/js/settings.js
sudo rpl --encoding UTF-8 'Enable IPv6 support \(SLAAC \+ RA\)' 'Aktiviere IPv6 Unterstützung (SLAAC + RA)' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<strong>Enable DHCPv4 rapid commit \(fast address assignment\)</strong>' '<strong>Aktiviere DHCPv4 Schnellübertragung (schnelle Adresszuweisung)</strong>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Currently active DHCP leases</h3>' 'Derzeitig aktive DHCP Leases</h3>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<th>MAC address</th>' '<th>MAC Addresse</th>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<th>IP address</th>' '<th>IP Adresse</th>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Static DHCP leases configuration' 'Einstellungen für statische DHCP Leases' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'The static address with MAC address ' 'Die statische Adresse mit der MAC Adresse' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 ' has been removed' ' wurde entfernt.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 'From IP \(' 'Von IP (' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 'To IP \(' 'Bis IP (' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 'Router IP \(' 'Die IP des Routers (' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 "'Domain name '" "'Der Domain Name '" /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 "'Lease time '" "'Die Lease Zeit '" /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 'There was a problem applying your settings.<br>Debugging information:<br>PHP error' 'Es gab ein Problem bei der Anwendung Ihrer Einstellungen.<br>Informationen zur Fehlersuche:<br>PHP Fehler' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<p>Specifying the MAC address is mandatory and only one entry per MAC' '<p>Die Angabe der MAC-Adresse ist obligatorisch und nur ein Eintrag' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'address is allowed. If the IP address is omitted and a host name is' 'pro MAC-Adresse ist erlaubt. Wenn die IP-Adresse weggelassen wird' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'given, the IP address will still be generated dynamically and the' 'und ein Hostname angegeben wird, wird die IP-Adresse weiterhin dynamisch' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'specified host name will be used. If the host name is omitted, only' 'generiert und der angegebene Hostname verwendet. Wenn der Hostname' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'a static lease will be added.</p>' 'weggelassen wird, wird nur eine statisches Lease hinzugefügt.</p>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'The DHCP server has been activated' 'Der DHCP-Server wurde aktiviert.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 'The DHCP server has been deactivated' 'Der DHCP-Server wurde deaktiviert.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php



# Einstellungen
#  Web Interface
sudo rpl --encoding UTF-8 'Web interface' 'Weboberfläche' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Theme and Layout' 'Theme und Layout' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Interface settings \(auto saved\)' 'Einstellungen der Schnittstelle (speichert automatisch)' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Global Settings' 'Globale Einstellungen' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Pi-hole default theme \(light, default\)' 'Pi-hole Standard Thema (hell, Standard)' /var/www/html/admin/scripts/pi-hole/php/theme.php
sudo rpl --encoding UTF-8 'Pi-hole midnight theme \(dark\)' 'Pi-hole Nacht Thema (dunkel)' /var/www/html/admin/scripts/pi-hole/php/theme.php
sudo rpl --encoding UTF-8 'Pi-hole deep-midnight theme \(dark\)' 'Pi-hole Mitternacht Thema (sehr dunkel)' /var/www/html/admin/scripts/pi-hole/php/theme.php
sudo rpl --encoding UTF-8 'High contrast light' 'Hoher Kontrast hell' /var/www/html/admin/scripts/pi-hole/php/theme.php
sudo rpl --encoding UTF-8 'High contrast dark' 'Hoher Kontrast dunkel' /var/www/html/admin/scripts/pi-hole/php/theme.php
sudo rpl --encoding UTF-8 'Pi-hole auto theme \(light/dark\)' 'Pi-hole Auto Thema (hell)' /var/www/html/admin/scripts/pi-hole/php/theme.php
sudo rpl --encoding UTF-8 'Star Trek LCARS theme \(dark\)' 'Star Trek LCARS Thema (dunkel)' /var/www/html/admin/scripts/pi-hole/php/theme.php
sudo rpl --encoding UTF-8 'Use boxed layout \(for large screens\)' 'Boxed Layout verwenden (für große Bildschirme)' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Make sure that nobody else can scan this code around you. They will have full access to the API without having to know the password. Note that the generation of the QR code will take some time.' 'Stellen Sie sicher, dass niemand diesen Code um Sie herum scannen kann. Sie haben vollen Zugriff auf die API, ohne das Kennwort kennen zu müssen. Beachten Sie, dass die Generierung des QR-Codes einige Zeit dauern wird.' /var/www/html/admin/scripts/pi-hole/js/settings.js
sudo rpl --encoding UTF-8 'Yes, show API token' 'Ja, zeige API-Token' /var/www/html/admin/scripts/pi-hole/js/settings.js
sudo rpl --encoding UTF-8 'The API settings have been updated' 'Die API-Einstellungen wurden aktualisiert.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 'All entries will be shown in Query Log' 'Alle Einträge werden im Anfrageprotokoll angezeigt.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 'Only blocked entries will be shown in Query Log' 'Im Anfrageprotokoll werden nur gesperrte Einträge angezeigt.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 'Only permitted will be shown in Query Log' 'Nur erlaubte werden im Abfrageprotokoll angezeigt.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 'No entries will be shown in Query Log' 'Es werden keine Einträge im Anfrageprotokoll angezeigt.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 'Per Browser Settings' 'Aussehen des Browsers' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Checkbox and radio buttons' 'Kontrollkästchen und Optionsfelder' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<option>default</option>' '<option>standard</option>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'CPU Temperature Unit' 'Einheit für die CPU Temperaturanzeige' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Use new Bar charts on dashboard' 'Verwenden Sie die neuen Balkendiagramme im Dashboard' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<strong>Colorful Query Log</strong>' '<strong>Buntes Anfrage Protokoll</strong>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Hide non-fatal ' 'Unproblematische ' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'warnings \(warnings listed' 'Warnungen ausblenden (Warnungen siehe ' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '>here' '>hier' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'The webUI settings have been updated' 'Die Einstellungen der Weboberfläche wurden aktualisiert.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php



# Einstellungen
#  API
sudo rpl --encoding UTF-8 'API settings' 'API Einstellungen' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Top Lists' 'Top Listen' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Exclude the following domains from being shown in' 'Schließen Sie die folgenden Domänen von der Anzeige aus:' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Top Domains / Top Advertisers' 'Top Domains / Top Inserenten' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<label>Top Clients</label>' '<label>Top Geräte</label>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Enter one domain per line' 'Geben Sie eine Domain pro Zeile ein.' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Enter one IP address or host name per line' 'Geben Sie eine IP Adresse oder einen Hostnamen pro Zeile ein.' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '<h4>Query Log</h4' '<h4>Anfrageprotokoll</h4' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Show permitted domain entries' 'Zulässige Domain-Einträge anzeigen' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Show blocked domain entries' 'Geblockte Domain-Einträge anzeigen' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Show API token' 'API-Token anzeigen' /var/www/html/admin/settings.php



# Einstellungen
#  Privacy
sudo rpl --encoding UTF-8 '>Privacy<' '>Privatsphäre<' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Privacy settings' 'Einstellungen für Privatsphäre' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'DNS resolver privacy level' 'DNS-Resolver Datenschutzstufe' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Specify if DNS queries should be anonymized, available options are:' 'Geben Sie an, ob DNS-Anfragen anonymisiert werden sollen. Folgende Optionen sind verfügbar:' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Show everything and record everything' 'Alles anzeigen und alles aufzeichnen' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Gives maximum amount of statistics' 'Gibt die maximale Anzahl von Statistiken aus.' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Hide domains: Display and store all domains as "hidden"' 'Domains verbergen: Alle Domains werden als "versteckt" angezeigt und gespeichert' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'This disables the Top Permitted Domains and Top Blocked Domains tables on the dashboard</p>' "Dies deaktiviert die Tabellen 'Top Erlaubte Domains' und 'Top Geblockte Domains' auf dem Dashboard.</p>" /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Hide domains and clients: Display and store all domains as "hidden" and all clients as "0.0.0.0"' 'Domains und Clients ausblenden: Alle Domains werden als "versteckt" und alle Clients als "0.0.0.0" angezeigt und gespeichert' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'This disables all tables on the dashboard' 'Dadurch werden alle Tabellen im Dashboard deaktiviert' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Anonymous mode: This disables basically everything except the live anonymous statistics' 'Anonymer Modus: Dies deaktiviert im Grunde alles außer den anonymen Live-Statistiken'  /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'No history is saved at all to the database, and nothing is shown in the query log. Also, there are no top item lists.' 'In der Datenbank wird kein Verlauf gespeichert und im Abfrageprotokoll wird nichts angezeigt. Es gibt auch keine Top-Listen.' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'The privacy level may be increased at any time without having to restart the DNS resolver. However, note that the DNS resolver needs to be restarted when lowering the privacy level.' 'Die Datenschutzstufe kann jederzeit erhöht werden, ohne dass der DNS-Resolver neu gestartet werden muss. Beachten Sie jedoch, dass der DNS-Resolver neu gestartet werden muss, wenn die Datenschutzstufe gesenkt wird.' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'This restarting is automatically done when saving.' 'Dieser Neustart erfolgt beim Speichern automatisch.' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 "Warning: Pi-hole's query logging is activated. Although the dashboard will hide the requested details, all queries are still fully logged to the pihole.log file." 'Warnung: Die Abfrageprotokollierung von Pi-hole ist aktiviert. Obwohl das Dashboard die angeforderten Details ausblendet, werden alle Abfragen weiterhin vollständig in der Datei pihole.log protokolliert' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Apply</button>' 'Anwenden</button>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'The privacy level has been decreased and the DNS resolver has been restarted' 'Die Datenschutzstufe wurde gesenkt und der DNS-Resolver wurde neu gestartet.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 'The privacy level has been increased' 'Die Datenschutzstufe wurde erhöht.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 'The privacy level has not been changed' 'Die Datenschutzstufe wurde nicht geändert.' /var/www/html/admin/scripts/pi-hole/php/savesettings.php
sudo rpl --encoding UTF-8 'Invalid privacy level ' 'Ungültige Datenschutzstufe ' /var/www/html/admin/scripts/pi-hole/php/savesettings.php



# Einstellungen
#  Teleporter
sudo rpl --encoding UTF-8 'Backup</h3>' 'Sicherung</h3>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Backup your Pi-hole configuration \(settings &amp; lists\) as a downloadable archive' 'Sicherung Ihrer Pi-hole Konfiguration (Einstellungen &amp; Listen) als herunterladbares Archiv:' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Backup</button>' 'Sicherung</button>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Restore</h3>' 'Wiederherstellen</h3>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Restore...</label>' 'Wiederherstellen ...</label>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '\(exact\)</label>' '(exakt)</label>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '\(regex/wildcard\)</label>' '(RegEx/Wildcard)</label>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Adlists</label>' 'Blocklisten</label>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Client</label>' 'Gerät</label>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Group</label>' 'Gruppen</label>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Audit log</label>' 'Prüfprotokoll</label>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Static DHCP Leases</label>' 'Statische DHCP-Leases</label>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Local DNS Records</label>' 'Lokale DNS-Einträge</label>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Local CNAME Records</label>' 'Lokale CNAME Einträge</label>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'File input</label>' 'Dateieingabe:</label>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '>Browse\.\.\.' '>Durchsuchen ...' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'placeholder="no file selected"' 'placeholder="keine Datei ausgewählt"' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Upload only Pi-hole backup files.</p>' 'Nur Pi-hole Sicherungsdateien hochladen</p>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'Clear existing data</label>' 'Vorhandene Daten löschen</label>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '>Restore' '>Wiederherstellen' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'The file you are trying to upload is not a .tar.gz file \(filename: ' 'Die Datei, die Sie versuchen hochzuladen, ist keine .tar.gz Datei (Dateiname: ' /var/www/html/admin/scripts/pi-hole/php/teleporter.php
sudo rpl --encoding UTF-8 ', type: ' ', Dateityp: ' /var/www/html/admin/scripts/pi-hole/php/teleporter.php
sudo rpl --encoding UTF-8 'Please try again.' 'Bitte versuchen Sie es nochmal.' /var/www/html/admin/scripts/pi-hole/php/teleporter.php
sudo rpl --encoding UTF-8 'Processed blacklist \(exact\)' 'Verarbeitete Blacklist (genau)' /var/www/html/admin/scripts/pi-hole/php/teleporter.php
sudo rpl --encoding UTF-8 ' entries' ' Einträge' /var/www/html/admin/scripts/pi-hole/php/teleporter.php
sudo rpl --encoding UTF-8 'Processed whitelist \(exact\)' 'Verarbeitete Whitelist (genau)' /var/www/html/admin/scripts/pi-hole/php/teleporter.php
sudo rpl --encoding UTF-8 'Processed blacklist \(regex\)' 'Verarbeitete Blacklist (RegEx)' /var/www/html/admin/scripts/pi-hole/php/teleporter.php
sudo rpl --encoding UTF-8 'Processed blacklist \(regex, wildcard style\)' 'Verarbeitete Blacklist (RegEx, Wildcard Style)' /var/www/html/admin/scripts/pi-hole/php/teleporter.php
sudo rpl --encoding UTF-8 'Processed audit log' 'Verarbeitete Audit Log' /var/www/html/admin/scripts/pi-hole/php/teleporter.php
sudo rpl --encoding UTF-8 'Processed adlists' 'Verarbeitete Sperrlisten' /var/www/html/admin/scripts/pi-hole/php/teleporter.php
sudo rpl --encoding UTF-8 'Processed whitelist \(regex\)' 'Verarbeitete Whitelist (RegEx)' /var/www/html/admin/scripts/pi-hole/php/teleporter.php
sudo rpl --encoding UTF-8 'Processed adlist group assignments' 'Verarbeitete Sperrlisten Gruppenzuordnungen' /var/www/html/admin/scripts/pi-hole/php/teleporter.php
sudo rpl --encoding UTF-8 'Processed adlist ' 'Verarbeitete Sperrlisten ' /var/www/html/admin/scripts/pi-hole/php/teleporter.php
sudo rpl --encoding UTF-8 'Processed domain_audit' 'Verarbeitete Domain Prüfungen' /var/www/html/admin/scripts/pi-hole/php/teleporter.php
sudo rpl --encoding UTF-8 'Processed group' 'Verarbeitete Gruppen' /var/www/html/admin/scripts/pi-hole/php/teleporter.php
sudo rpl --encoding UTF-8 'Processed client group assignments' 'Verarbeitete Geräte Gruppenzuordnungen' /var/www/html/admin/scripts/pi-hole/php/teleporter.php
sudo rpl --encoding UTF-8 'Processed client' 'Verarbeitete Geräte' /var/www/html/admin/scripts/pi-hole/php/teleporter.php
sudo rpl --encoding UTF-8 'Processed black-/whitelist group assignments' 'Verarbeitete Black-/Whitelist Gruppenzuordnungen' /var/www/html/admin/scripts/pi-hole/php/teleporter.php
sudo rpl --encoding UTF-8 'Processed static DHCP leases' 'Verarbeitete statische DHCP Vergabe' /var/www/html/admin/scripts/pi-hole/php/teleporter.php
sudo rpl --encoding UTF-8 'Processed local DNS records' 'Verarbeitete lokale DNS Einträge' /var/www/html/admin/scripts/pi-hole/php/teleporter.php
sudo rpl --encoding UTF-8 'Processed local CNAME records' 'Verarbeitete lokale CNAME Einträge' /var/www/html/admin/scripts/pi-hole/php/teleporter.php
sudo rpl --encoding UTF-8 '<label class="control-label">Output:</label>' '<label class="control-label">Ausgabe:</label>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'No file transmitted or parameter error.' 'Keine Datei übertragen oder Parameter Fehler.' /var/www/html/admin/scripts/pi-hole/php/teleporter.php
sudo rpl --encoding UTF-8 'cannot open/create ' 'kann nicht geöffnet oder erstellt werden ' /var/www/html/admin/scripts/pi-hole/php/teleporter.php
sudo rpl --encoding UTF-8 'Close</button>' 'Schließen</button>' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 '</i> Reload page' '</i> Seite neu laden' /var/www/html/admin/settings.php
sudo rpl --encoding UTF-8 'nPHP user: ' 'nPHP Benutzer: ' /var/www/html/admin/scripts/pi-hole/php/teleporter.php


echo >&2
echo -e "${blaufett}   Fast fertig ...${standard}" >&2



# Lokale DNS Einträge
#  DNS Einträge
sudo rpl --encoding UTF-8 '<h1>Local DNS Records \[A\/AAAA\]</h1>' '<h1>Lokale DNS Einträge [A/AAAA]</h1>' /var/www/html/admin/dns_records.php
sudo rpl --encoding UTF-8 'On this page, you can add domain/IP associations' 'Auf dieser Seite können Sie Domänen- bzw. IP-Zuordnungen hinzufügen.' /var/www/html/admin/dns_records.php
sudo rpl --encoding UTF-8 'Add a new domain/IP combination' 'Fügen Sie eine neue Domain/IP Kombination hinzu' /var/www/html/admin/dns_records.php
sudo rpl --encoding UTF-8 'Domain or comma-separated list of domains' 'Domäne oder durch Komma getrennte Liste von Domänen' /var/www/html/admin/dns_records.php
sudo rpl --encoding UTF-8 '<label for="ip">IP Address:</label>' '<label for="ip">IP Adresse:</label>' /var/www/html/admin/dns_records.php
sudo rpl --encoding UTF-8 'placeholder="Associated IP address"' 'placeholder="Zugehörige IP Adresse"' /var/www/html/admin/dns_records.php
sudo rpl --encoding UTF-8 '<strong>Note:</strong>' '<strong>Hinweis:</strong>' /var/www/html/admin/dns_records.php
sudo rpl --encoding UTF-8 'The order of locally defined DNS records is:' 'Die Reihenfolge der lokal definierten DNS-Einträge ist:' /var/www/html/admin/dns_records.php
sudo rpl --encoding UTF-8 "The device's host name and " 'Der Hostname des Gerätes und ' /var/www/html/admin/dns_records.php
sudo rpl --encoding UTF-8 'Configured in a config file in ' 'Konfiguriert in einer Konfigurationsdatei in ' /var/www/html/admin/dns_records.php
sudo rpl --encoding UTF-8 'Read from <code>' 'Gelesen aus der <code>' /var/www/html/admin/dns_records.php
sudo rpl --encoding UTF-8 'Read from the "Local \(custom\) DNS" list \(stored in' 'Gelesen aus der lokalen (benutzerdefinierten) DNS-Liste (gespeichert in' /var/www/html/admin/dns_records.php
sudo rpl --encoding UTF-8 'Only the first record will trigger an address-to-name association.' 'Nur der erste Datensatz löst eine Adresse-zu-Name-Zuordnung aus.' /var/www/html/admin/dns_records.php
sudo rpl --encoding UTF-8 'Add</button>' 'Hinzufügen</button>' /var/www/html/admin/dns_records.php
sudo rpl --encoding UTF-8 'List of local DNS domains' 'Übersicht der lokalen DNS-Domains' /var/www/html/admin/dns_records.php
sudo rpl --encoding UTF-8 'Clear Filters</button>' 'Filter löschen</button>' /var/www/html/admin/dns_records.php
sudo rpl --encoding UTF-8 '10, 25, 50, 100, "All"' '10, 25, 50, 100, "Alle"' /var/www/html/admin/scripts/pi-hole/js/customdns.js
sudo rpl --encoding UTF-8 '<th>IP</th>' '<th>IP Adresse</th>' /var/www/html/admin/dns_records.php
sudo rpl --encoding UTF-8 'Adding custom DNS entry...' 'Hinzufügen eines eigenen DNS-Eintrags ...' /var/www/html/admin/scripts/pi-hole/js/customdns.js
sudo rpl --encoding UTF-8 'Custom DNS added' 'Eigener DNS hinzugefügt' /var/www/html/admin/scripts/pi-hole/js/customdns.js
sudo rpl --encoding UTF-8 'Failure! Something went wrong' 'Fehler! Etwas ging schief.' /var/www/html/admin/scripts/pi-hole/js/customdns.js
sudo rpl --encoding UTF-8 'Error while adding custom DNS entry' 'Fehler beim Hinzufügen eines eigene DNS-Eintrags.' /var/www/html/admin/scripts/pi-hole/js/customdns.js
sudo rpl --encoding UTF-8 'Deleting custom DNS entry...' 'Löschen des eigenen DNS-Eintrags ...' /var/www/html/admin/scripts/pi-hole/js/customdns.js
sudo rpl --encoding UTF-8 'Custom DNS deleted' 'Eigener DNS-Eintrag gelöscht.' /var/www/html/admin/scripts/pi-hole/js/customdns.js
sudo rpl --encoding UTF-8 'Error while deleting custom DNS entry' 'Fehler beim Löschen des eigenen DNS-Eintrags.' /var/www/html/admin/scripts/pi-hole/js/customdns.js
sudo rpl --encoding UTF-8 '' '' /var/www/html/admin/scripts/pi-hole/js/customdns.js
sudo rpl --encoding UTF-8 '<th>Action</th>' '<th>Aktion</th>' /var/www/html/admin/dns_records.php



# Lokale DNS Einträge
#  CNAME Einträge
sudo rpl --encoding UTF-8 '<h1>Local CNAME Records</h1>' '<h1>Lokale CNAME Einträge</h1>' /var/www/html/admin/cname_records.php
sudo rpl --encoding UTF-8 '<small>On this page, you can add CNAME records.</small>' '<small>Auf dieser Seite können Sie CNAME Einträge hinzufügen.</small>' /var/www/html/admin/cname_records.php
sudo rpl --encoding UTF-8 'Add a new CNAME record' 'Neuen CNAME Eintrag hinzufügen' /var/www/html/admin/cname_records.php
sudo rpl --encoding UTF-8 'Domain or comma-separated list of domains' 'Domäne oder durch Komma getrennte Liste von Domänen' /var/www/html/admin/cname_records.php
sudo rpl --encoding UTF-8 'Target Domain:</label>' 'Zieldomain:</label>' /var/www/html/admin/cname_records.php
sudo rpl --encoding UTF-8 'Associated Target Domain' 'Zugehörige Zieldomain' /var/www/html/admin/cname_records.php
sudo rpl --encoding UTF-8 '>Add</button>' '>Hinzufügen</button>' /var/www/html/admin/cname_records.php
sudo rpl --encoding UTF-8 '<strong>Note:</strong>' '<strong>Hinweis:</strong>' /var/www/html/admin/cname_records.php
sudo rpl --encoding UTF-8 '<p>The target of a <code>CNAME</code> must be a domain that the Pi-hole already has in its cache or is authoritative for. This is a universal limitation of <code>CNAME</code> records.</p>' '<p>Das Ziel eines <code>CNAME</code> muss eine Domäne sein, die der Pi-hole bereits in seinem Cache hat oder für die es maßgeblich ist. Dies ist eine universelle Einschränkung von <code>CNAME</code> Datensätzen.</p>' /var/www/html/admin/cname_records.php
sudo rpl --encoding UTF-8 "<p>The reason for this is that Pi-hole will not send additional queries upstream when serving <code>CNAME</code> replies. As consequence, if you set a target that isn't already known, the reply" '<p>Der Grund dafür ist, dass Pi-hole keine zusätzlichen Anfragen stromaufwärts sendet, wenn <code>CNAME</code>-Antworten zugestellt werden. Wenn Sie ein Ziel festlegen, das noch nicht bekannt ist, ist die' /var/www/html/admin/cname_records.php
sudo rpl --encoding UTF-8 'to the client may be incomplete. Pi-hole just returns the information it knows at the time of the query. This results in certain limitations for <code>CNAME</code> targets,' 'Antwort an das Gerät möglicherweise unvollständig. Pi-hole gibt nur die Informationen zurück, die es zum Zeitpunkt der Abfrage kennt. Dies führt zu bestimmten Einschränkungen für <code>CNAME</code> Ziele.' /var/www/html/admin/cname_records.php
sudo rpl --encoding UTF-8 "for instance, only <i>active</i> DHCP leases work as targets - mere DHCP <i>leases</i> aren't sufficient as they aren't \(yet\) valid DNS records.</p>" 'Beispielsweise fungieren nur <i>aktive </i> DHCP-Leases als Ziele - bloße DHCP <i>-Leases</i> sind nicht ausreichend, da sie (noch) keine gültigen DNS-Einträge sind.</p>' /var/www/html/admin/cname_records.php
sudo rpl --encoding UTF-8 "<p>Additionally, you can't <code>CNAME</code> external domains \(<code>bing.com</code> to <code>google.com</code>\) successfully as this could result in invalid SSL certificate errors when the" '<p>Darüber hinaus können externe Domänen (<code>bing.com</code> bis <code>google.com</code>) nicht erfolgreich <code>CNAME</code> verwenden, da dies zu ungültigem SSL führen kann, wenn der Zielserver' /var/www/html/admin/cname_records.php
sudo rpl --encoding UTF-8 'target server does not serve content for the requested domain.</p>' 'keinen Inhalt für die angeforderte Domain bereitstellt.</p>' /var/www/html/admin/cname_records.php
sudo rpl --encoding UTF-8 'it contains invalid characters' 'sie ungültige Zeichen enthält' /var/www/html/admin/scripts/pi-hole/php/func.php
sudo rpl --encoding UTF-8 'its length is invalid' 'ihre Länge ungültig ist' /var/www/html/admin/scripts/pi-hole/php/func.php
sudo rpl --encoding UTF-8 'at least one label is of invalid length' 'mindestens ein Kennzeichen eine ungültige Länge hat' /var/www/html/admin/scripts/pi-hole/php/func.php
sudo rpl --encoding UTF-8 'IP must be set' 'IP muss eingestellt sein!' /var/www/html/admin/scripts/pi-hole/php/func.php
sudo rpl --encoding UTF-8 'IP must be valid' 'IP muss gültig sein!' /var/www/html/admin/scripts/pi-hole/php/func.php
sudo rpl --encoding UTF-8 'Target must be set' 'Das Ziel muss festeglegt werden' /var/www/html/admin/scripts/pi-hole/php/func.php
sudo rpl --encoding UTF-8 'Domain must be set' 'Domain muss eingetragen sein!' /var/www/html/admin/scripts/pi-hole/php/func.php
sudo rpl --encoding UTF-8 'This domain/ip association does not exist' 'Diese Domäne/IP-Zuordnung existiert nicht!' /var/www/html/admin/scripts/pi-hole/php/func.php
sudo rpl --encoding UTF-8 'Target must be valid' 'Ziel muss gültig sein!' /var/www/html/admin/scripts/pi-hole/php/func.php
sudo rpl --encoding UTF-8 'is not valid' 'ist nicht gültig' /var/www/html/admin/scripts/pi-hole/php/func.php
sudo rpl --encoding UTF-8 '"The domain ' '"Die Domain ' /var/www/html/admin/scripts/pi-hole/php/func.php
sudo rpl --encoding UTF-8 ' already has a custom DNS entry for an IPv' 'hat bereits einen eigenen DNS-Eintrag für eine IPv' /var/www/html/admin/scripts/pi-hole/php/func.php
sudo rpl --encoding UTF-8 'There is already a CNAME record for' 'Es gibt bereits einen CNAME-Eintrag für' /var/www/html/admin/scripts/pi-hole/php/func.php
sudo rpl --encoding UTF-8 'Domain and target cannot be the same' 'Domäne und Ziel können nicht identisch sein,' /var/www/html/admin/scripts/pi-hole/php/func.php
sudo rpl --encoding UTF-8 'List of local CNAME records' 'Übersicht der lokalen CNAME Einträge' /var/www/html/admin/cname_records.php
sudo rpl --encoding UTF-8 '10, 25, 50, 100, "All"' '10, 25, 50, 100, "Alle"' /var/www/html/admin/scripts/pi-hole/js/customcname.js
sudo rpl --encoding UTF-8 '<th>Target</th>' '<th>Ziel</th>' /var/www/html/admin/cname_records.php
sudo rpl --encoding UTF-8 '<th>Action</th>' '<th>Aktion</th>' /var/www/html/admin/cname_records.php
sudo rpl --encoding UTF-8 '>Clear Filters</button>' '>Filter löschen</button>' /var/www/html/admin/cname_records.php



# Fußleiste
sudo rpl --encoding UTF-8 '<strong><a href="https://pi-hole.net/donate/" rel="noopener" target="_blank"><i class="fa fa-heart text-red"></i> Donate</a></strong> if you found this useful.' '<strong><a href="https://pi-hole.net/donate/" rel="noopener" target="_blank"><i class="fa fa-heart text-red"></i> Spenden</a></strong> Sie bitte, wenn Sie Pi-hole nützlich finden.<br><a href="http://www.github.com/pimanDE/translate2german" rel="noopener" target="_blank"</a> <i class="fa fa-edit"></a></i> Übersetzt von <a href="https://github.com/pimanDE" rel="noopener" target="_blank"><strong>pimanDE</strong></a>.' /var/www/html/admin/scripts/pi-hole/php/footer.php
sudo rpl --encoding UTF-8 'Update available' 'Aktualisierung vorhanden' /var/www/html/admin/scripts/pi-hole/php/footer.php
sudo rpl --encoding UTF-8 'To install updates, <a href' 'Zum Installieren der Aktualisierungen, <a href' /var/www/html/admin/scripts/pi-hole/php/footer.php
sudo rpl --encoding UTF-8 'replace this old container with a fresh upgraded image' 'ersetzen Sie dieses alte Image durch ein frisches, aktualisiertes Image.' /var/www/html/admin/scripts/pi-hole/php/footer.php
sudo rpl --encoding UTF-8 'To install updates, run' 'Um die Aktualisierungen zu installieren, starten Sie bitte' /var/www/html/admin/scripts/pi-hole/php/footer.php



# Nicht zugeordnet
sudo rpl --encoding UTF-8 'No password set' 'Kein Passwort festgelegt.' /var/www/html/admin/scripts/pi-hole/php/api_token.php
sudo rpl --encoding UTF-8 'Not authorized!' 'Nicht erlaubt!' /var/www/html/admin/scripts/pi-hole/php/api_token.php
sudo rpl --encoding UTF-8 'Not allowed \(login session invalid or expired, please relogin on the Pi-hole dashboard\)!' 'Nicht erlaubt (Die Anmeldesitzung ist ungültig oder abgelaufen, bitte melden Sie sich im Hauptmenü des Pi-hole neu an)!' /var/www/html/admin/scripts/pi-hole/php/groups.php
sudo rpl --encoding UTF-8 'Not allowed \(login session invalid or expired, please relogin on the Pi-hole dashboard\)!' 'Nicht erlaubt (Die Anmeldesitzung ist ungültig oder abgelaufen, bitte melden Sie sich im Hauptmenü des Pi-hole neu an)!' /var/www/html/admin/scripts/pi-hole/php/customdns.php
sudo rpl --encoding UTF-8 'Not allowed \(login session invalid or expired, please relogin on the Pi-hole dashboard\)!' 'Nicht erlaubt (Die Anmeldesitzung ist ungültig oder abgelaufen, bitte melden Sie sich im Hauptmenü des Pi-hole neu an)!' /var/www/html/admin/scripts/pi-hole/php/customcname.php
sudo rpl --encoding UTF-8 'Not allowed \(login session invalid or expired, please relogin on the Pi-hole dashboard\)!' 'Nicht erlaubt (Die Anmeldesitzung ist ungültig oder abgelaufen, bitte melden Sie sich im Hauptmenü des Pi-hole neu an)!' /var/www/html/admin/scripts/pi-hole/php/message.php
sudo rpl --encoding UTF-8 'Not allowed \(login session invalid or expired, please relogin on the Pi-hole dashboard\)!' 'Nicht erlaubt (Die Anmeldesitzung ist ungültig oder abgelaufen, bitte melden Sie sich im Hauptmenü des Pi-hole neu an)!' /var/www/html/admin/scripts/pi-hole/php/network.php
sudo rpl --encoding UTF-8 'Session expired! Please re-login on the Pi-hole dashboard.' 'Die Sitzung ist abgelaufen! Bitte loggen Sie sich erneut auf der Weboberfläche ein.' /var/www/html/admin/scripts/pi-hole/php/auth.php
sudo rpl --encoding UTF-8 'Empty token! Check if cookies are enabled on your system.' 'Leeres Token! Prüfen Sie, ob Cookies auf Ihrem System aktiviert sind.' /var/www/html/admin/scripts/pi-hole/php/auth.php
sudo rpl --encoding UTF-8 'Wrong token! Please re-login on the Pi-hole dashboard.' 'Falsches Token! Bitte loggen Sie sich erneut auf der Weboberfläche ein.' /var/www/html/admin/scripts/pi-hole/php/auth.php
sudo rpl --encoding UTF-8 'is not a valid domain' 'ist keine gültige Domain' /var/www/html/admin/scripts/pi-hole/php/auth.php



# Fehlerdatei erstellen
echo > /tmp/error2-translate.log
echo "Folgende Begrifflichkeiten wurden nicht übersetzt:" >> /tmp/error2-translate.log
echo "--------------------------------------------------" >> /tmp/error2-translate.log
echo >> /tmp/error2-translate.log
echo >> /tmp/error2-translate.log
sudo cat /tmp/error-translate.log | grep -B 2 '0 matches' > /tmp/error3-translate.log
cat /tmp/error3-translate.log | grep Replacing >> /tmp/error2-translate.log
rpl --encoding UTF-8 'Replacing ' ' ' /tmp/error2-translate.log
rpl --encoding UTF-8 '\(case sensitive\; partial words matched\)' ' ' /tmp/error2-translate.log
rpl --encoding UTF-8 '" with "' '"   nicht ersetzt durch   "' /tmp/error2-translate.log
echo >> /tmp/error2-translate.log
echo >> /tmp/error2-translate.log
sudo chmod 777 /tmp/erro*-translate.log
sudo rm /tmp/error3-translate.log
sudo mv /tmp/error2-translate.log /tmp/error-translate.log

exec >&2

echo
echo
echo -e "${gruenfett}   Erledigt.${standard}"
echo
echo

cat /tmp/error-translate.log
echo

exit
