#!/bin/bash
#
# Weboberfläche des Pi-hole auf deutsch übersetzen
# getestet auf Raspberry Pi OS Lite Debian Version 13 (trixie) vom 01.10.2025
# getestet auf Pi-hole Version Core v6.3 - FTL Version v6.4.1 - Web Interface Version v6.4
# https://pi-hole.net/
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
    echo -e "${blaufett}   Das Programm rpl muss installiert werden ...${standard}"
    echo
    echo
    sudo apt install -y rpl
fi

clear

echo
echo -e "${blaufett}   Übersetze die Pi-hole Weboberfläche auf deutsch ...${standard}"
echo
echo -e "${blaufett}   Dies kann einige Minuten dauern ...${standard}"

exec 2> /tmp/error-translate.log

echo

sudo cp -ra /var/www/html/ /var/www/html.sicherung.vom.$date                    # Sicherung des Verzeichnisses
sudo cp -a /opt/pihole/gravity.sh /opt/pihole/gravity.sh.sicherung.vom.$date    # Sicherung der gravity.sh
sudo cp -a /usr/local/bin/pihole /usr/local/bin/pihole.sicherung.vom.$date      # Sicherung der pihole



# Start der Übersetzung
#######################



# /var/www/html/index.lighttpd.html
sudo rpl --encoding UTF-8 'Placeholder page </h1>' 'Platzhalterseite </h1>' /var/www/html/index.lighttpd.html
sudo rpl --encoding UTF-8 'The owner of this web site has not put up any web pages yet. Please come back later.' 'Der Eigentümer dieser Website hat noch nichts eingerichtet. Bitte kommen Sie später wieder.' /var/www/html/index.lighttpd.html
sudo rpl --encoding UTF-8 'You should replace this page with your own web pages as soon as possible.' 'Sie sollten diese Seite so bald wie möglich durch Ihre eigenen Webseiten ersetzen.' /var/www/html/index.lighttpd.html
sudo rpl --encoding UTF-8 'Unless you changed its configuration, your new server is configured as follows:' 'Sofern Sie die Einstellungen nicht geändert haben, ist Ihr neuer Server wie folgt konfiguriert:' /var/www/html/index.lighttpd.html
sudo rpl --encoding UTF-8 'Configuration files can be found in <span class="tt">/etc/lighttpd</span>. Please read  <span class="tt">/etc/lighttpd/conf-available/README</span> file.' 'Konfigurationsdateien finden Sie in <span class="tt">/etc/lighttpd</span>. Bitte lesen Sie die <span class="tt">/etc/lighttpd/conf-available/README</span>' /var/www/html/index.lighttpd.html
sudo rpl --encoding UTF-8 'The DocumentRoot, which is the directory under which all your HTML files should exist, is set to <span class="tt">/var/www/html</span>.' 'Das Root-Verzeichnis, in dem sich alle Ihre HTML-Dateien befinden sollten, ist <span class="tt">/var/www/html</span>' /var/www/html/index.lighttpd.html
sudo rpl --encoding UTF-8 'CGI scripts are looked for in <span class="tt">/usr/lib/cgi-bin</span>, which is where Debian packages will place their scripts. You can enable cgi module by using command <span class="bold tt">&quot;lighty-enable-mod cgi&quot;</span>.' 'CGI-Skripte werden in <span class="tt">/usr/lib/cgi-bin</span> gesucht, wo Debian-Pakete ihre Skripte ablegen. Sie können das CGI-Modul mit dem Befehl <span class="bold tt">&quot;lighty-enable-mod cgi&quot;</span> aktivieren.' /var/www/html/index.lighttpd.html
sudo rpl --encoding UTF-8 'Log files are placed in <span class="tt">/var/log/lighttpd</span>, and will be rotated weekly. The frequency of rotation can be easily changed by editing <span class="tt">/etc/logrotate.d/lighttpd</span>.' 'Protokolldateien werden in <span class="tt">/var/log/lighttpd</span> gespeichert und wöchentlich rotiert. Die Rotationsfrequenz kann einfach durch Bearbeiten von <span class="tt">/etc/logrotate.d/lighttpd</span> geändert werden.' /var/www/html/index.lighttpd.html
sudo rpl --encoding UTF-8 'The default directory index is <span class="tt">index.html</span>, meaning that requests for a directory <span class="tt">/foo/bar/</span> will give the contents of the file /var/www/html/foo/bar/index.html if it exists \(assuming that <span class="tt">/var/www/html</span> is your DocumentRoot\).' 'Die Standard-Index-Datei ist <span class="tt">index.html</span>, was bedeutet, dass Anfragen für ein Verzeichnis <span class="tt">/foo/bar/</span> den Inhalt des Verzeichnisses liefern Datei /var/www/html/foo/bar/index.html, falls vorhanden (vorausgesetzt, dass <span class="tt">/var/www/html</span> Ihr Root-Verzeichnis ist).' /var/www/html/index.lighttpd.html
sudo rpl --encoding UTF-8 'You can enable user directories by using command <span class="bold tt">&quot;lighty-enable-mod userdir&quot;</span></li>' 'Sie können Benutzerverzeichnisse mit dem Befehl <span class="bold tt">&quot;lighty-enable-mod userdir&quot;</span> aktivieren.</li>' /var/www/html/index.lighttpd.html
sudo rpl --encoding UTF-8 'About this page</h2>' 'Über diese Seite</h2>' /var/www/html/index.lighttpd.html
sudo rpl --encoding UTF-8 'This is a placeholder page installed by the Debian release of the <a href="http://packages.debian.org/lighttpd">Lighttpd server package.' 'Dies ist eine Platzhalterseite, die von der Debian-Version des <a href="http://packages.debian.org/lighttpd">Lighttpd-Serverpakets installiert wurde.' /var/www/html/index.lighttpd.html
sudo rpl --encoding UTF-8 'This computer has installed the Debian GNU/Linux operating system, but it has nothing to do with the Debian Project. Please do not contact the Debian Project about it.' 'Auf diesem Computer ist das Betriebssystem Debian GNU/Linux installiert, es hat jedoch nichts mit dem Debian-Projekt zu tun. Bitte kontaktieren Sie diesbezüglich nicht das Debian-Projekt.' /var/www/html/index.lighttpd.html
sudo rpl --encoding UTF-8 'If you find a bug in this Lighttpd package, or in Lighttpd itself, please file a bug report on it. Instructions on doing this, and the list of known bugs of this package, can be found in the' 'Wenn Sie einen Fehler in diesem Lighttpd-Paket oder in Lighttpd selbst finden, reichen Sie bitte einen Fehlerbericht darüber ein. Anweisungen dazu und die Liste der bekannten Fehler dieses Pakets finden Sie im' /var/www/html/index.lighttpd.html
sudo rpl --encoding UTF-8 'Debian Bug Tracking System.' 'Debian-Fehler-Tracking-System.' /var/www/html/index.lighttpd.html



# /var/www/html/admin/error403.lp
sudo rpl --encoding UTF-8 'Oops! Access denied.' 'Ups! Zugriff verweigert.' /var/www/html/admin/error403.lp
sudo rpl --encoding UTF-8 "You don\'t have permission to access this URL.<br>" "Sie haben keine Berechtigung, auf diese URL zuzugreifen.<br>" /var/www/html/admin/error403.lp
sudo rpl --encoding UTF-8 'Did you mean to go to ' 'Wollen Sie zum ' /var/www/html/admin/error403.lp
sudo rpl --encoding UTF-8 "your Pi-hole\'s dashboard</a> instead\?" "Hauptmenü Ihres Pi-hole's</a> wechseln?" /var/www/html/admin/error403.lp



# /var/www/html/admin/error404.lp
sudo rpl --encoding UTF-8 'Oops! Page not found.' 'Ups! Seite nicht gefunden.' /var/www/html/admin/error404.lp
sudo rpl --encoding UTF-8 'We could not find the page you were looking for.' 'Wir konnten die gesuchte Seite nicht finden.' /var/www/html/admin/error404.lp
sudo rpl --encoding UTF-8 'Meanwhile, you may want to return to ' 'In der Zwischenzeit können Sie zum ' /var/www/html/admin/error404.lp
sudo rpl --encoding UTF-8 'the dashboard</a>' 'Hauptmenü</a> wechseln' /var/www/html/admin/error404.lp



# /var/www/html/admin/gravity.lp
sudo rpl --encoding UTF-8 'Update Gravity \(list of blocked domains\)' 'Update der Gravity-Datenbank (Liste der geblockten Domains)' /var/www/html/admin/gravity.lp
sudo rpl --encoding UTF-8 'Close' 'Schließen' /var/www/html/admin/gravity.lp
sudo rpl --encoding UTF-8 'Updating... this may take a while.' 'Aktualisiere ... dies kann eine Weile dauern.' /var/www/html/admin/gravity.lp
sudo rpl --encoding UTF-8 'Please do not navigate away from or close this page.' 'Bitte verlassen oder schließen Sie diese Seite nicht!' /var/www/html/admin/gravity.lp
sudo rpl --encoding UTF-8 'Success!' 'Erfolgreich!' /var/www/html/admin/gravity.lp
sudo rpl --encoding UTF-8 'Update</button>' 'Aktualisieren</button>' /var/www/html/admin/gravity.lp



# /var/www/html/admin/groups.lp
sudo rpl --encoding UTF-8 'Group management' 'Gruppenverwaltung' /var/www/html/admin/groups.lp
sudo rpl --encoding UTF-8 'Add a new group' 'Hinzufügen einer neuen Gruppe' /var/www/html/admin/groups.lp
sudo rpl --encoding UTF-8 'placeholder="Group name"' 'placeholder="Gruppenname"' /var/www/html/admin/groups.lp
sudo rpl --encoding UTF-8 'Comment:' 'Kommentar:' /var/www/html/admin/groups.lp
sudo rpl --encoding UTF-8 'Group comment \(optional\)' 'Gruppenkommentar (optional)' /var/www/html/admin/groups.lp
sudo rpl --encoding UTF-8 'Hints:' 'Hinweise:' /var/www/html/admin/groups.lp
sudo rpl --encoding UTF-8 'Multiple groups can be added by separating each group name with a space or comma' 'Sie können mehrere Gruppen gleichzeitig hinzufügen, indem Sie jeden Gruppenname getrennt durch ein Leerzeichen oder ein Komma eingeben.' /var/www/html/admin/groups.lp
sudo rpl --encoding UTF-8 'Group names can have spaces if entered in quotes. e.g "My New Group"' 'Gruppennamen können Leerzeichen enthalten, wenn sie in Anführungszeichen eingegeben werden, z. B. "Meine neue Gruppe".' /var/www/html/admin/groups.lp
sudo rpl --encoding UTF-8 'Add</button>' 'Hinzufügen</button>' /var/www/html/admin/groups.lp
sudo rpl --encoding UTF-8 'List of groups' 'Liste der Gruppen' /var/www/html/admin/groups.lp
sudo rpl --encoding UTF-8 'Comment</th>' 'Kommentar</th>' /var/www/html/admin/groups.lp
sudo rpl --encoding UTF-8 'Reset sorting' 'Sortierung zurücksetzen' /var/www/html/admin/groups.lp



# /var/www/html/admin/groups-clients.lp
sudo rpl --encoding UTF-8 '<h1>Client group management</h1>' '<h1>Verwaltung der Gerätegruppen</h1>' /var/www/html/admin/groups-clients.lp
sudo rpl --encoding UTF-8 'Add a new client' 'Neues Gerät hinzufügen' /var/www/html/admin/groups-clients.lp
sudo rpl --encoding UTF-8 'Known clients:' 'Bekannte Geräte:' /var/www/html/admin/groups-clients.lp
sudo rpl --encoding UTF-8 'Loading...' 'Lade ...' /var/www/html/admin/groups-clients.lp
sudo rpl --encoding UTF-8 'Comment:' 'Kommentar:' /var/www/html/admin/groups-clients.lp
sudo rpl --encoding UTF-8 'Client description \(optional\)' 'Gerätebeschreibung (optional)' /var/www/html/admin/groups-clients.lp
sudo rpl --encoding UTF-8 'Group assignment:' 'Gruppenzuordnung:' /var/www/html/admin/groups-clients.lp
sudo rpl --encoding UTF-8 'You can select an existing client or add a custom one by typing into the field above and confirming your entry with' 'Sie können ein vorhandenes Gerät auswählen oder ein benutzerdefiniertes Gerät hinzufügen, indem Sie in das obige Feld tippen und Ihre Eingabe mit' /var/www/html/admin/groups-clients.lp
sudo rpl --encoding UTF-8 '</kbd>.' '</kbd> bestätigen.' /var/www/html/admin/groups-clients.lp
sudo rpl --encoding UTF-8 'Multiple clients can be added by separating each client with a space or comma.' 'Es können mehrere Geräte hinzugefügt werden, indem jedes Gerät durch ein Leerzeichen oder Komma getrennt wird.' /var/www/html/admin/groups-clients.lp
sudo rpl --encoding UTF-8 'Clients may be described either by their' 'Geräte können entweder beschrieben werden anhand ihrer' /var/www/html/admin/groups-clients.lp
sudo rpl --encoding UTF-8 'IP addresses \(IPv4 and IPv6 are supported\),' 'IP Adresse (IPv4 und IPv6 werden unterstützt), ihrer' /var/www/html/admin/groups-clients.lp
sudo rpl --encoding UTF-8 'IP subnets \(CIDR notation, like <code>192.168.2.0/24</code>\), their' 'IP Subnetze (CIDR Notation, z.B. <code>192.168.2.0/24</code>), ihrer' /var/www/html/admin/groups-clients.lp
sudo rpl --encoding UTF-8 'MAC addresses \(like <code>12:34:56:78:9A:BC</code>\), by their' 'MAC Adresse (z.B. <code>12:34:56:78:9A:BC</code>), ihrer' /var/www/html/admin/groups-clients.lp
sudo rpl --encoding UTF-8 'hostnames \(like <code>localhost</code>\), or by the' 'Gerätenamen (z.B. <code>localhost</code>) oder durch ihre' /var/www/html/admin/groups-clients.lp
sudo rpl --encoding UTF-8 'interface they are connected to \(prefaced with a colon, like' 'Schnittstelle, mit der sie verbunden sind (mit einem Doppelpunkt davor, wie' /var/www/html/admin/groups-clients.lp
sudo rpl --encoding UTF-8 'The first match \(from top to down\) wins. Note that client recognition by host name or interface recognition as' 'Der erste Treffer (von oben nach unten) gewinnt. Beachten Sie, dass die Geräte-Erkennung anhand des Hostnamens oder der Schnittstellenerkennung möglicherweise erst' /var/www/html/admin/groups-clients.lp
sudo rpl --encoding UTF-8 'the two latter may only be available after some time. Furthermore, MAC address recognition only works for devices at most one networking hop away from your Pi-hole.' 'nach einiger Zeit verfügbar ist. Darüber hinaus funktioniert die MAC-Adresserkennung nur für Geräte, die höchstens einen Netzwerk-Sprung von Ihrem Pi-hole entfernt sind.' /var/www/html/admin/groups-clients.lp



sudo rpl --encoding UTF-8 'Add</button>' 'Hinzufügen</button>' /var/www/html/admin/groups-clients.lp
sudo rpl --encoding UTF-8 'List of configured clients' 'Liste der konfigurierten Geräte' /var/www/html/admin/groups-clients.lp
sudo rpl --encoding UTF-8 'Acceptable values are: IP address, subnet \(CIDR notation\), MAC address \(AA:BB:CC:DD:EE:FF format\) or host names.' 'Zulässige Werte sind: IP-Adresse, Subnetz (CIDR-Notation), MAC-Adresse (Format AA:BB:CC:DD:EE:FF) oder Hostnamen.' /var/www/html/admin/groups-clients.lp
sudo rpl --encoding UTF-8 'Client</th>' 'Gerät</th>' /var/www/html/admin/groups-clients.lp
sudo rpl --encoding UTF-8 'Comment</th>' 'Kommentar</th>' /var/www/html/admin/groups-clients.lp
sudo rpl --encoding UTF-8 'Group assignment</th>' 'Gruppenzuordnung</th>' /var/www/html/admin/groups-clients.lp
sudo rpl --encoding UTF-8 'Reset sorting</button>' 'Sortierung zurücksetzen</button>' /var/www/html/admin/groups-clients.lp



# /var/www/html/admin/groups-domains.lp
sudo rpl --encoding UTF-8 'Domain management</h1>' 'Domain Verwaltung</h1>' /var/www/html/admin/groups-domains.lp
sudo rpl --encoding UTF-8 'Add a new domain or regex filter' 'Füge eine neue Domain oder einen neuen RegEx-Filter hinzu' /var/www/html/admin/groups-domains.lp
sudo rpl --encoding UTF-8 'RegEx filter</a>' 'RegEx Filter</a>' /var/www/html/admin/groups-domains.lp
sudo rpl --encoding UTF-8 'Domain to be added' 'Hinzuzufügende Domain' /var/www/html/admin/groups-domains.lp
sudo rpl --encoding UTF-8 'Comment:</label>' 'Kommentar:</label>' /var/www/html/admin/groups-domains.lp
sudo rpl --encoding UTF-8 'Description \(optional\)' 'Beschreibung (optional)' /var/www/html/admin/groups-domains.lp
sudo rpl --encoding UTF-8 'Add domain as wildcard</strong>' 'Domain als Platzhalter hinzufügen</strong>' /var/www/html/admin/groups-domains.lp
sudo rpl --encoding UTF-8 'Check this box if you want to involve all subdomains. The entered domain will be converted to a RegEx filter while adding.' 'Aktivieren Sie dieses Kontrollkästchen, wenn Sie alle Subdomains einbeziehen möchten. Die eingegebene Domain wird beim Hinzufügen in einen RegEx-Filter umgewandelt.' /var/www/html/admin/groups-domains.lp
sudo rpl --encoding UTF-8 'Regular Expression:</label>' 'Regulärer Ausdruck:</label>' /var/www/html/admin/groups-domains.lp
sudo rpl --encoding UTF-8 'RegEx to be added' 'Regulären Ausdruck hinzufügen' /var/www/html/admin/groups-domains.lp
sudo rpl --encoding UTF-8 'Hint:</strong> Need help to write a proper RegEx rule\? Have a look at our online' 'Tipp:</strong> Benötigen Sie Hilfe beim Schreiben einer geeigneten RegEx-Regel? Werfen Sie einen Blick auf unser online' /var/www/html/admin/groups-domains.lp
sudo rpl --encoding UTF-8 'regular expressions tutorial' 'Tutorial zu RegEx-Ausdrücken' /var/www/html/admin/groups-domains.lp
sudo rpl --encoding UTF-8 'Note:</strong>' 'Hinweis:</strong>' /var/www/html/admin/groups-domains.lp
sudo rpl --encoding UTF-8 'The domain or regex filter will be automatically assigned to the Default Group.' 'Die Domain oder der RegEx-Filter wird automatisch der Standardgruppe zugewiesen.' /var/www/html/admin/groups-domains.lp
sudo rpl --encoding UTF-8 'Other groups can optionally be assigned in the list below \(using <strong>Group assignment</strong>\).' 'Andere Gruppen können optional in der Liste unten zugewiesen werden (mit <strong>Gruppenzuweisung</strong>).' /var/www/html/admin/groups-domains.lp
sudo rpl --encoding UTF-8 'You can add multiple entries at once by separating them with spaces \(e.g. <code>example.com example.org</code>\)' 'Sie können mehrere Einträge gleichzeitg hinzufügen, indem Sie jeden Eintrag getrennt mit Leerzeichen eingeben (z.B. <code>beispiel.com beispiel.org</code>)' /var/www/html/admin/groups-domains.lp
sudo rpl --encoding UTF-8 'Add to denied domains</button>' 'Zur Blacklist hinzufügen</button>' /var/www/html/admin/groups-domains.lp
sudo rpl --encoding UTF-8 'Add to allowed domains</button>' 'Zur Whitelist hinzufügen</button>' /var/www/html/admin/groups-domains.lp
sudo rpl --encoding UTF-8 'List of domains' 'Liste der Domains' /var/www/html/admin/groups-domains.lp
sudo rpl --encoding UTF-8 'Exact allow</label>' 'Exakt erlaubt</label>' /var/www/html/admin/groups-domains.lp
sudo rpl --encoding UTF-8 'Regex allow</label>' 'RegEx erlaubt</label>' /var/www/html/admin/groups-domains.lp
sudo rpl --encoding UTF-8 'Exact deny</label>' 'Exakt verboten</label>' /var/www/html/admin/groups-domains.lp
sudo rpl --encoding UTF-8 'Regex deny</label>' 'RegEx verboten</label>' /var/www/html/admin/groups-domains.lp
sudo rpl --encoding UTF-8 'Comment</th>' 'Kommentar</th>' /var/www/html/admin/groups-domains.lp
sudo rpl --encoding UTF-8 'Group assignment' 'Gruppenzuordnung' /var/www/html/admin/groups-domains.lp
sudo rpl --encoding UTF-8 'Reset sorting</button>' 'Sortierung zurücksetzen</button>' /var/www/html/admin/groups-domains.lp



# /var/www/html/admin/groups-lists.lp
sudo rpl --encoding UTF-8 'Subscribed lists group management' 'Blocklisten Gruppen Verwaltung' /var/www/html/admin/groups-lists.lp
sudo rpl --encoding UTF-8 'Add a new subscribed list' 'Neue Blockliste hinzufügen' /var/www/html/admin/groups-lists.lp
sudo rpl --encoding UTF-8 'Address:</label>' 'Adresse:</label>' /var/www/html/admin/groups-lists.lp
sudo rpl --encoding UTF-8 'placeholder="URL"' 'placeholder="URL oder durch Leerzeichen getrennte URLs"' /var/www/html/admin/groups-lists.lp
sudo rpl --encoding UTF-8 'Comment:</label>' 'Kommentar:</label>' /var/www/html/admin/groups-lists.lp
sudo rpl --encoding UTF-8 'List description \(optional\)' 'Listenbeschreibung (optional)' /var/www/html/admin/groups-lists.lp
sudo rpl --encoding UTF-8 'Group assignment:' 'Gruppenzuordnung:' /var/www/html/admin/groups-lists.lp
sudo rpl --encoding UTF-8 'Hints:</strong>' 'Tipps:</strong>' /var/www/html/admin/groups-lists.lp
sudo rpl --encoding UTF-8 'Please run <code>pihole -g</code> or update your gravity list <a href="<\?=webhome\?>gravity">online</a> after modifying your lists.' 'Nach dem Ändern der Listen führen Sie bitte im Terminal <code>pihole -g</code> aus oder aktualisieren Sie die Gravity-Liste <a href="<?=webhome?>gravity">direkt hier</a>.' /var/www/html/admin/groups-lists.lp
sudo rpl --encoding UTF-8 'Multiple lists can be added by separating each <em>unique</em> URL with a space or comma' 'Sie können mehrere Listen gleichzeitig hinzufügen, indem Sie jede <em>eindeutige</em> URL getrennt mit einem Leerzeichen eingeben.' /var/www/html/admin/groups-lists.lp
sudo rpl --encoding UTF-8 'Click on the icon in the first column to get additional information about your lists. The icons correspond to the health of the list.' 'Klicken Sie auf das Symbol in der zweiten Spalte, um zusätzliche Informationen über Ihre Listen zu erhalten. Die Symbole entsprechen dem Zustand der Liste.' /var/www/html/admin/groups-lists.lp
sudo rpl --encoding UTF-8 'Add blocklist</button>' 'Zur Blacklist hinzufügen</button>' /var/www/html/admin/groups-lists.lp
sudo rpl --encoding UTF-8 'Add allowlist</button>' 'Zur Whitelist hinzufügen</button>' /var/www/html/admin/groups-lists.lp
sudo rpl --encoding UTF-8 'Subscribed lists' 'Abonnierte Listen' /var/www/html/admin/groups-lists.lp
sudo rpl --encoding UTF-8 'Address</th>' 'Adresse</th>' /var/www/html/admin/groups-lists.lp
sudo rpl --encoding UTF-8 'Comment</th>' 'Kommentar</th>' /var/www/html/admin/groups-lists.lp
sudo rpl --encoding UTF-8 'Group assignment</th>' 'Gruppenzuordnung</th>' /var/www/html/admin/groups-lists.lp
sudo rpl --encoding UTF-8 'Reset sorting</button>' 'Sorting zurücksetzen</button>' /var/www/html/admin/groups-lists.lp



# /var/www/html/admin/index.lp
sudo rpl --encoding UTF-8 '"Total number of queries"' '"Gesamtzahl der Anfragen"' /var/www/html/admin/index.lp
sudo rpl --encoding UTF-8 'Total Queries</p>' 'Anfragen insgesamt</p>' /var/www/html/admin/index.lp
sudo rpl --encoding UTF-8 'active clients <i' 'aktive Geräte <i' /var/www/html/admin/index.lp
sudo rpl --encoding UTF-8 'Queries Blocked</p>' 'Geblockte Anfragen</p>' /var/www/html/admin/index.lp
sudo rpl --encoding UTF-8 'List blocked queries ' 'Liste der geblockten Anfragen ' /var/www/html/admin/index.lp
sudo rpl --encoding UTF-8 'Percentage Blocked</p>' 'Geblockt in Prozent</p>' /var/www/html/admin/index.lp
sudo rpl --encoding UTF-8 'List all queries' 'Liste aller Anfragen' /var/www/html/admin/index.lp
sudo rpl --encoding UTF-8 'Domains on Lists</p>' 'Domains in den Blocklisten</p>' /var/www/html/admin/index.lp
sudo rpl --encoding UTF-8 'Manage lists <i' 'Verwalten der Blocklisten <i' /var/www/html/admin/index.lp
sudo rpl --encoding UTF-8 'Total queries</h3>' 'Anfragen insgesamt</h3>' /var/www/html/admin/index.lp
sudo rpl --encoding UTF-8 'Client activity</h3>' 'Geräteaktivität</h3>' /var/www/html/admin/index.lp
sudo rpl --encoding UTF-8 'Reset zoom</button>' 'Auflösung zurücksetzen</button>' /var/www/html/admin/index.lp
sudo rpl --encoding UTF-8 'You can zoom this graph by either holding down the \[Ctrl\] key and using your mouse wheel or by using the &quot;pinch&quot; multi-touch gesture. You can furthermore click and drag to pan the graph.' 'Sie können das Diagramm zoomen, indem Sie entweder die [Strg]-Taste gedrückt halten und das Mausrad verwenden oder die Multi-Touch-Geste Aufziehen benutzen. Sie können auch klicken und ziehen, um das Diagramm zu verschieben.' /var/www/html/admin/index.lp
sudo rpl --encoding UTF-8 'Query Types</h3>' 'Anfragetypen</h3>' /var/www/html/admin/index.lp
sudo rpl --encoding UTF-8 'Upstream servers</h3>' 'Upstream Server</h3>' /var/www/html/admin/index.lp
sudo rpl --encoding UTF-8 'Top Permitted Domains</h3>' 'Am meisten zugelassene Domains</h3>' /var/www/html/admin/index.lp
sudo rpl --encoding UTF-8 'Hits</th>' 'Treffer</th>' /var/www/html/admin/index.lp
sudo rpl --encoding UTF-8 'Frequency</th>' 'Häufigkeit</th>' /var/www/html/admin/index.lp
sudo rpl --encoding UTF-8 'Top Blocked Domains</h3>' 'Am meisten geblockte Domains</h3>' /var/www/html/admin/index.lp
sudo rpl --encoding UTF-8 'Top Clients \(total\)</h3>' 'Top Geräte (insgesamt)' /var/www/html/admin/index.lp
sudo rpl --encoding UTF-8 'Client</th>' 'Gerät</th>' /var/www/html/admin/index.lp
sudo rpl --encoding UTF-8 'Requests</th>' 'Anfragen</th>' /var/www/html/admin/index.lp
sudo rpl --encoding UTF-8 'Top Clients \(blocked only\)</h3>' 'Top Geräte (nur geblockt)</h3>' /var/www/html/admin/index.lp



# /var/www/html/admin/login.lp
sudo rpl --encoding UTF-8 'Verify that cookies are allowed</div>' 'Überprüfen Sie, ob Cookies erlaubt sind!</div>' /var/www/html/admin/login.lp
sudo rpl --encoding UTF-8 'DNS Server failure detected, log in to see Pi-hole diagnosis messages' 'DNS-Server-Fehler erkannt, melden Sie sich an, um Pi-hole-Diagnosemeldungen zu sehen.' /var/www/html/admin/login.lp
sudo rpl --encoding UTF-8 'Consider upgrading to ' 'Erwägen Sie ein Update auf ' /var/www/html/admin/login.lp
sudo rpl --encoding UTF-8 '\(end-to-end encryption\)' '(Ende-zu-Ende Verschlüsselung)' /var/www/html/admin/login.lp
sudo rpl --encoding UTF-8 'placeholder="Password"' 'placeholder="Passwort"' /var/www/html/admin/login.lp
sudo rpl --encoding UTF-8 'Show password as plain text. Warning: this will display your password on the screen.' 'Passwort als Klartext anzeigen. Achtung: Dadurch wird Ihr Passwort auf dem Bildschirm auch für andere sichtbar angezeigt.' /var/www/html/admin/login.lp
sudo rpl --encoding UTF-8 'title="TOTP verification code"' 'title="TOTP Verifizierungscode"' /var/www/html/admin/login.lp
sudo rpl --encoding UTF-8 'Log in \(uses cookie\)</button>' 'Einloggen (benutzt Cookies)</button>' /var/www/html/admin/login.lp
sudo rpl --encoding UTF-8 'Wrong 2FA token</h3>' 'Falscher 2FA Token</h3></h3>' /var/www/html/admin/login.lp
sudo rpl --encoding UTF-8 'Your Pi-hole has two-factor authentication enabled. You have to' 'Ihr Pi-hole hat die Zwei-Faktor-Authentifizierung aktiviert. Sie müssen ' /var/www/html/admin/login.lp
sudo rpl --encoding UTF-8 'enter a valid <a href="https://en.wikipedia.org/wiki/Time-based_One-time_Password_algorithm" rel="noopener noreferrer" target="_blank">TOTP</a>' 'zusätzlich zu Ihrem Passwort ein gültiges Token <a href="https://de.wikipedia.org/wiki/Time-based_One-time_Password_algorithm" rel="noopener noreferrer" target="_blank">TOTP</a> eingeben.' /var/www/html/admin/login.lp
sudo rpl --encoding UTF-8 'token in addition to your password. You see this message because your' 'Sie sehen diese Meldung, weil Ihr Token falsch war oder bereits abgelaufen ist' /var/www/html/admin/login.lp
sudo rpl --encoding UTF-8 'token was incorrect or has already expired.</p>' '.</p>' /var/www/html/admin/login.lp
sudo rpl --encoding UTF-8 'Forgot password\?</h3>' 'Passwort vergessen?</h3>' /var/www/html/admin/login.lp
sudo rpl --encoding UTF-8 'After installing Pi-hole for the first time, a password is generated and displayed' 'Nach der Erstinstallation von Pi-hole wird ein Passwort generiert und dem Benutzer angezeigt.' /var/www/html/admin/login.lp
sudo rpl --encoding UTF-8 'to the user. The password cannot be retrieved later on, but it is possible to set' 'Das Passwort kann später nicht mehr abgerufen werden, aber es ist möglich, ein neues Passwort ' /var/www/html/admin/login.lp
sudo rpl --encoding UTF-8 'a new password \(or explicitly disable the password by setting an empty password\)' 'zu setzen (oder das Passwort explizit zu deaktivieren, indem man ein leeres Passwort setzt), ' /var/www/html/admin/login.lp
sudo rpl --encoding UTF-8 'using the command' 'indem man den Befehl' /var/www/html/admin/login.lp
sudo rpl --encoding UTF-8 'Documentation</a>' 'Dokumentation</a>' /var/www/html/admin/login.lp
sudo rpl --encoding UTF-8 'Pi-hole Discourse</a>' 'Pi-hole Forum</a>' /var/www/html/admin/login.lp
sudo rpl --encoding UTF-8 '<strong><a href="https://pi-hole.net/donate/" rel="noopener noreferrer" target="_blank"><i class="fa fa-heart text-red"></i> Donate</a></strong> if you found this useful.' '<strong><a href="https://pi-hole.net/donate/" rel="noopener noreferrer" target="_blank"><i class="fa fa-heart text-red"></i> Spenden</a></strong> Sie bitte, wenn Sie Pi-hole nützlich finden.<br><a href="http://www.github.com/pimanDE/translate2german" rel="noopener noreferrer" target="_blank"</a> <i class="fa fa-edit"></a></i> Übersetzt von <a href="https://github.com/pimanDE" rel="noopener noreferrer" target="_blank"><strong>pimanDE</strong></a>.' /var/www/html/admin/login.lp



# /var/www/html/admin/messages.lp
sudo rpl --encoding UTF-8 'Pi-hole diagnosis' 'Pi-hole Diagnose' /var/www/html/admin/messages.lp
sudo rpl --encoding UTF-8 'On this page, you can see messages from your Pi-hole concerning possible issues.' 'Auf dieser Seite können Sie Meldungen Ihres Pi-hole zu möglichen Problemen einsehen.' /var/www/html/admin/messages.lp
sudo rpl --encoding UTF-8 'Time</th>' 'Zeit</th>' /var/www/html/admin/messages.lp
sudo rpl --encoding UTF-8 'Type</th>' 'Typ</th>' /var/www/html/admin/messages.lp
sudo rpl --encoding UTF-8 'Message</th>' 'Nachricht</th>' /var/www/html/admin/messages.lp
sudo rpl --encoding UTF-8 'Note: If errors are shown, you generate a debug log \(use <code>pihole -d</code>\), which will do a thorough Pi-hole evaluation.' 'Hinweis: Wenn Fehler angezeigt werden, erzeugen Sie bitte mittels <code>pihole -d</code> ein Debug-Protokoll. Dieses Protokoll nimmt eine eine gründliche Pi-hole Auswertung vor.' /var/www/html/admin/messages.lp



# /var/www/html/admin/network.lp
sudo rpl --encoding UTF-8 'Network overview</h3>' 'Netzwerk Übersicht</h3>' /var/www/html/admin/network.lp
sudo rpl --encoding UTF-8 'IP address \(hostname\)</th>' 'IP-Adresse (Rechnername)</th>' /var/www/html/admin/network.lp
sudo rpl --encoding UTF-8 'Hardware address</th>' 'Hardware-Adresse</th>' /var/www/html/admin/network.lp
sudo rpl --encoding UTF-8 'Interface</th>' 'Schnittstelle</th>' /var/www/html/admin/network.lp
sudo rpl --encoding UTF-8 'First seen</th>' 'Zuerst gesehen</th>' /var/www/html/admin/network.lp
sudo rpl --encoding UTF-8 'Last Query</th>' 'Letzte Anfrage</th>' /var/www/html/admin/network.lp
sudo rpl --encoding UTF-8 'Number of queries</th>' 'Anzahl der Anfragen</th>' /var/www/html/admin/network.lp
sudo rpl --encoding UTF-8 'Uses Pi-hole</th>' 'Verwendet Pi-hole</th>' /var/www/html/admin/network.lp
sudo rpl --encoding UTF-8 'Action</th>' 'Aktion</th>' /var/www/html/admin/network.lp
sudo rpl --encoding UTF-8 'Background color: Last query from this device seen ...' 'Hintergrundfarbe: Letzte Anfrage von diesem Gerät gesehen ...' /var/www/html/admin/network.lp
sudo rpl --encoding UTF-8 'just now</td>' 'gerade eben</td>' /var/www/html/admin/network.lp
sudo rpl --encoding UTF-8 '... to ...</td>' '... bis ...</td>' /var/www/html/admin/network.lp
sudo rpl --encoding UTF-8 '>24 hours ago</td>' '>vor 24 Stunden</td>' /var/www/html/admin/network.lp
sudo rpl --encoding UTF-8 '>&gt; 24 hours ago</td>' '>&gt; mehr als 24 Stunden</td>' /var/www/html/admin/network.lp
sudo rpl --encoding UTF-8 'Device does not use Pi-hole</td>' 'Gerät verwendet Pi-hole nicht</td>' /var/www/html/admin/network.lp



# /var/www/html/admin/queries.lp
sudo rpl --encoding UTF-8 'Adding <span' 'Hinzufügen von <span' /var/www/html/admin/queries.lp
sudo rpl --encoding UTF-8 '</span> to the <span ' '</span> zur Liste <span ' /var/www/html/admin/queries.lp
sudo rpl --encoding UTF-8 'successfully added to the <span' 'Erfolgreich hinzugefügt zur <span' /var/www/html/admin/queries.lp
sudo rpl --encoding UTF-8 'Timeout or Network Connection Error!' 'Zeitüberschreitung oder Netzwerkverbindungsfehler!' /var/www/html/admin/queries.lp
sudo rpl --encoding UTF-8 'Close</button>' 'Schließen</button>' /var/www/html/admin/queries.lp
sudo rpl --encoding UTF-8 'Advanced filtering</h3>' 'Erweiterte Filterfunktion</h3>' /var/www/html/admin/queries.lp
sudo rpl --encoding UTF-8 'Click to select date and time range' 'Klicken Sie, um Datum und Zeitbereich auszuwählen' /var/www/html/admin/queries.lp
sudo rpl --encoding UTF-8 'Query on-disk data. This is <em>a lot</em> slower but necessary if you want to obtain queries older than 24 hours. This option disables live update.' 'Die Daten werden von der Festplatte abgerufen. Dies ist <em>viel</em> langsamer aber notwendig, wenn Sie Anfragen erhalten möchten, die älter als 24 Stunden sind. Mit dieser Option wird die Live-Aktualisierung deaktiviert.' /var/www/html/admin/queries.lp
sudo rpl --encoding UTF-8 'Loading...</option>' 'Lädt ...</option>' /var/www/html/admin/queries.lp
sudo rpl --encoding UTF-8 'Domain\*</label>' 'Domain*</label>' /var/www/html/admin/queries.lp
sudo rpl --encoding UTF-8 'Client \(by IP\)\*</label>' 'Gerät (per IP)*</label>' /var/www/html/admin/queries.lp
sudo rpl --encoding UTF-8 'Client \(by name\)\*</label>' 'Gerät (per Name)*</label>' /var/www/html/admin/queries.lp
sudo rpl --encoding UTF-8 'Type</label>' 'Typ</label>' /var/www/html/admin/queries.lp
sudo rpl --encoding UTF-8 'Reply</label>' 'Wiederholung</label>' /var/www/html/admin/queries.lp
sudo rpl --encoding UTF-8 'DNSSEC status</label>' 'DNSSEC-Status</label>' /var/www/html/admin/queries.lp
sudo rpl --encoding UTF-8 'These input fields allow manual input as well. Use <code>\*<\/code> for wildcard search. An <code>_<\/code> can be used as a single-character wildcard. If you want to search for <code>_<\/code> explicitly, then you must escape it like ' 'Diese Eingabefelder ermöglichen auch die manuelle Eingabe. Verwenden Sie <code>*</code> für die Platzhaltersuche. Ein <code>_</code> kann als Einzelzeichen-Platzhalter verwendet werden. Wenn Sie explizit nach <code>_</code> suchen möchten, müssen Sie es escapen, wie z.B. ' /var/www/html/admin/queries.lp
sudo rpl --encoding UTF-8 'Click "Refresh" below to apply.' 'Klicken Sie auf "Aktualisieren", damit die Änderungen wirksam werden.' /var/www/html/admin/queries.lp
sudo rpl --encoding UTF-8 'Recent Queries</h3>' 'Aktuelle Anfragen</h3>' /var/www/html/admin/queries.lp
sudo rpl --encoding UTF-8 'Live update</label>' 'Laufende Aktualisierung</label>' /var/www/html/admin/queries.lp
sudo rpl --encoding UTF-8 'Refresh</button>' 'Aktualisieren</button>' /var/www/html/admin/queries.lp
sudo rpl --encoding UTF-8 'Click on a query log item to obtain additional information for this query.' 'Klicken Sie auf ein Anfrageprotokollelement, um zusätzliche Informationen zu dieser Anfrage zu erhalten.' /var/www/html/admin/queries.lp
sudo rpl --encoding UTF-8 'Time</th>' 'Zeit</th>' /var/www/html/admin/queries.lp
sudo rpl --encoding UTF-8 'Type</th>' 'Typ</th>' /var/www/html/admin/queries.lp
sudo rpl --encoding UTF-8 'Client</th>' 'Gerät</th>' /var/www/html/admin/queries.lp
sudo rpl --encoding UTF-8 'Query reply time' 'Antwortzeit der Anfrage' /var/www/html/admin/queries.lp
sudo rpl --encoding UTF-8 'Note: Queries for <code>pi.hole</code> and the hostname are never logged.' 'Hinweis: Anfragen an <code>pi.hole</code> und dem Hostnamen werden nie protokolliert.' /var/www/html/admin/queries.lp



echo
echo -e "${blaufett}   25 % ...${standard}"



# /var/www/html/admin/search.lp
sudo rpl --encoding UTF-8 'Find Domains In Lists</h1>' 'Gesperrte Domain in einer Liste finden' /var/www/html/admin/search.lp
sudo rpl --encoding UTF-8 'Domain to look for \(example.com or sub.example.com\)' 'zu suchende Domain (beispiel.com oder mobil.beispiel.com)' /var/www/html/admin/search.lp
sudo rpl --encoding UTF-8 'Search</button>' 'Suche</button>' /var/www/html/admin/search.lp
sudo rpl --encoding UTF-8 'Use partial matching</strong> \(may not find complex regex entries\)' 'teilweise Übereinstimmung verwenden</strong> (findet möglicherweise keine komplexen regulären Ausdrücke)' /var/www/html/admin/search.lp
sudo rpl --encoding UTF-8 'Maximum number of results to be returned:' 'Maximale Anzahl von Ergebnissen:' /var/www/html/admin/search.lp



# /var/www/html/admin/settings-all.lp
sudo rpl --encoding UTF-8 'All Settings' 'Alle Einstellungen' /var/www/html/admin/settings-all.lp
sudo rpl --encoding UTF-8 'Save & Apply</button>' 'Speichern & Anwenden</button>' /var/www/html/admin/settings-all.lp



# /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'Web Interface - API Settings' 'Weboberfläche - API Einstellungen' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'Theme settings</h3>' 'Themen Einstellung</h3>' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'Theme:</label>' 'Thema:</label>' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'Loading...</option>' 'Lade ...</option>' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'Use the boxed layout</strong>' 'Verwende das Boxed-Layout</strong>' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'The boxed layout is helpful when working on large screens because it prevents the site from stretching very wide.' 'Das Box-Layout ist bei der Arbeit auf großen Bildschirmen hilfreich, da es verhindert, dass sich die Website sehr weit ausdehnt.' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'Advanced Settings</h3>' 'Erweiterte Einstellungen</h3>' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'Prettify API output for human-readability' 'API-Ausgabe für bessere Lesbarkeit' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'This will make the API output more human-readable, but will increase the size of the output and make the API a bit slower.' 'Dadurch wird die API-Ausgabe besser lesbar, der Umfang der Ausgabe nimmt jedoch zu und die API wird etwas langsamer.' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'Permit destructive actions via API' 'Kritische Aktionen über API zulassen' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'This will allow clients to perform destructive actions via the API, such as rebooting or shutting down the system Pi-hole is running on.' 'Dies ermöglicht es den Benutzern, über die API kritische Aktionen durchzuführen, z. B. das System, auf dem Pi-hole läuft, neu zu starten oder herunterzufahren.' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'Enable 2FA</button>' 'Aktiviere die 2FA</button>' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'Disable 2FA</button>' 'Deaktiviere die 2FA</button>' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'Configure app password</button>' 'Passwort für die App einstellen</button>' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'Exclusions</h3>' 'Ausnahmen</h3>' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'Domains to be excluded from Top Domain Lists and Query Log' 'Auszuschließende Domains aus den Top-Domains und den Ad-Listen:' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'Enter regex domains, one per line' 'Geben Sie eine RegEx Domain pro Zeile ein.' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'Domains may be described by their domain name \(like' 'Domains können durch ihren Domainnamen beschrieben werden (z.B.' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'example\\.com' 'beispiel\.de' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'Clients to be excluded from Top Client Lists and Query Log' 'Geräte die von der Liste der Top-Geräte und den Ad-Listen ausgeschlossen werden sollen:' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'Enter regex clients, one per line' 'Geben Sie ein Gerät per RegEx pro Zeile ein.' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'Clients may be described either by their IP addresses \(IPv4 and IPv6 are supported\), or hostnames \(like ' 'Geräte können entweder durch ihre IP-Adressen (IPv4 und IPv6 werden unterstützt) oder durch Hostnamen beschrieben werden (wie z.B. ' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'Important</strong>:<br>Those input fields accept regex entries only.<br>Please refer to  <a href="https://docs.pi-hole.net/regex/tutorial/" rel="noopener noreferrer" target="_blank">our guide</a> how to construct valid regex entries.' 'Wichtig</strong>:<br>Diese Eingabefelder akzeptieren nur RegEx-Einträge. Weitere Hilfe zum Erstellen gültiger RegEx-Einträge finden Sie in unserem <a href="https://docs.pi-hole.net/regex/tutorial/" rel="noopener noreferrer" target="_blank">Leitfaden</a>.' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'Query Log</h3>' 'Anfragen Protokoll/h3>' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'Show permitted domain entries.' 'Erlaubte Domain-Einträge anzeigen.' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'This will show all permitted domain entries in the query log.' 'Dadurch werden alle zulässigen Domain-Einträge im Anfrageprotokoll angezeigt.' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'Show blocked domain entries' 'Gesperrte Domain-Einträge anzeigen' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'This will show all blocked domain entries in the query log.' 'Dadurch werden alle blockierten Domain-Einträge im Anfrageprotokoll angezeigt.' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'Currently active sessions</h3>' 'Aktuell aktive Sitzungen</h3>' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'Session ID used internally by our Pi-hole">ID</th>' 'Sitzungs-ID, die intern von Pi-hole verwendet wird">ID</th>' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'Session is still valid \(neither expired nor closed\)">Valid</th>' 'Sitzung ist noch gültig (weder abgelaufen noch geschlossen)">Gültig</th>' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'Connection between client and Pi-hole is end-to-end encrypted">TLS</th>' 'Verbindung zwischen Gerät und Pi-hole ist Ende-zu-Ende-verschlüsselt">TLS</th>' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'Session used application password during authentication' 'Sitzung verwendet Anwendungspasswort während der Authentifizierung' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'Session used CLI password during authentication' 'Sitzung verwendet ein CLI-Passwort während der Authentifizierung' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'Time at which the client created the session">Login at</th>' 'Zeitpunkt, zu dem das Gerät die Sitzung erstellt hat">Anmeldung am</th>' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'Time at which the session expires \(if not prolonged\)">Valid until</th>' 'Zeitpunkt, an dem die Sitzung abläuft (falls nicht verlängert)">Gültig bis</th>' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'The client that created this session \(the current connection is highlighted in bold-face\)">Client IP</th>' 'Das Gerät, das diese Sitzung erstellt hat (die aktuelle Verbindung ist fett hervorgehoben)">Geräte-IP</th>' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'User agent of the client to ease client identifiability \(if available\)">User Agent</th>' 'Benutzer-Agent des Gerätes, um die Identifizierbarkeit des Gerätes zu erleichtern (falls vorhanden)">Benutzer-Agent</th>' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'Save & Apply</button>' 'Speichern & Anwenden</button>' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'Enable two-factor authentication' 'Aktiviere die Zwei-Faktor Authentifizierung (2FA)' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'Use a phone app like Google Authenticator, 2FA Authenticator, FreeOTP or Bitwarden, etc. to get 2FA codes when prompted during login.' 'Verwenden Sie eine Telefon-App wie Google Authenticator, 2FA Authenticator, FreeOTP oder Bitwarden usw., um 2FA-Codes zu erhalten, wenn Sie bei der Anmeldung dazu aufgefordert werden.' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'Scan the QR code below with your app or enter the secret manually.' 'Scannen Sie den QR-Code mit Ihrer App oder geben Sie das Passwort manuell ein.' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'Enter the 2FA code from your app below to confirm that you have set up 2FA correctly.' 'Geben Sie den 2FA-Code aus Ihrer App ein, um zu bestätigen, dass Sie 2FA korrekt eingerichtet haben.' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'TOTP verification code' 'TOTP Verifizierungscode' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'IMPORTANT: If you lose your 2FA token, you will not be able to login. You will need to disable 2FA on the command line and re-enable 2FA to generate a new secret.' 'WICHTIG: Wenn Sie Ihren 2FA-Token verlieren, können Sie sich nicht mehr anmelden. Sie müssen die 2FA in der Befehlszeile deaktivieren und die 2FA erneut aktivieren, um ein neues Passwort zu erzeugen.' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'Close</button>' 'Schließen</button>' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'Configure application password' 'Passwort für die Anwendung konfigurieren' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'After you turn on two-factor \(2FA\) verification and set up an' 'Nachdem Sie die Zwei-Faktor-Verifizierung (2FA) aktiviert und eine' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'Authenticator app, you may run into issues if you use apps or' 'Authenticator-App eingerichtet haben, kann es zu Problemen kommen, wenn Sie Apps oder' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 "other services that don't support two-step verification. In this" "oder andere Dienste verwenden, die die zweistufige Verifizierung nicht unterstützen. In diesem" /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'case, you can create and use an app password to sign in.' 'Fall können Sie ein App-Passwort erstellen und verwenden, um sich anzumelden.' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'An app password is a long, randomly generated password that' 'Ein App-Passwort ist ein langes, zufällig generiertes Kennwort, das' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'can be used instead of your regular password \+ 2FA token when' 'anstelle Ihres regulären Passworts + 2FA-Token verwendet werden kann, wenn eine' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'signing in to the API. You can revoke the app password at any' 'Anmeldung bei der API verwendet werden kann. Sie können das App-Passwort jederzeit' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'time. The app password can also be used when 2FA is not enabled.' 'widerrufen. Das App-Passwort kann auch verwendet werden, wenn 2FA nicht aktiviert ist.' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'Your new app password is:' 'Ihr neues Passwort ist:' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'IMPORTANT: The app password generated here will only be shown' 'WICHTIG: Das hier generierte App-Passwort wird nur einmal' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'once and cannot be recovered. Make sure to store it in a safe' 'angezeigt und kann nicht wiederhergestellt werden. Achten Sie' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'place!</p>' 'darauf, es an einem sicheren Ort zu speichern!</p>' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'Application password already configured</h4>Enabling the new app password will forcefully log out all existing applications.' 'Das Passwort ist bereits konfiguriert.</h4>Das Aktivieren des neuen Passworts wird alle vorhandenen Anwendungen zwangsweise abmelden.' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'Remove currently set app password</button>' 'Das aktuelle Passwort der App entfernen</button>' /var/www/html/admin/settings-api.lp
sudo rpl --encoding UTF-8 'Enable new app password</button>' 'Neues Passwort für die App aktivieren</button>' /var/www/html/admin/settings-api.lp



# /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 '"DHCP Settings"' '"DHCP-Einstellungen"' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 '>DHCP Settings</h3>' '>DHCP-Einstellungen</h3>' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'DHCP server enabled</strong>' 'DHCP-Server aktivieren</strong>' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 "Make sure your router's DHCP server is disabled when using the Pi-hole DHCP server!" "Stellen Sie sicher, dass der DHCP-Server Ihres Routers deaktiviert ist, wenn Sie den Pi-hole als DHCP-Server verwenden!" /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'Range of IP addresses to hand out' 'Bereich der zu vergebenden IP-Adressen:' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'Start</div>' 'von</div>' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'End</div>' 'bis</div>' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'Router \(gateway\) IP address' 'IP-Adresse des Routers (Gateway):' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'Netmask</label>' 'Netzmaske:</label>' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'Netmask</div>' 'Netzmaske</div>' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'placeholder="automatic"' 'placeholder="automatisch"' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'Leave the netmask field empty to have Pi-hole infer it from the configured IP address of your device. If you want to specify a netmask, you can use the format' 'Lassen Sie das Feld für die Netzmaske leer, damit Pi-hole sie von der konfigurierten IP-Adresse Ihres Geräts ableitet. Wenn Sie eine Netzmaske angeben möchten, können Sie das folgende Format verwenden:' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'Enable additional IPv6 support \(SLAAC \+ RA\)' 'Aktivieren Sie zusätzliche IPv6-Unterstützung (SLAAC + RA)' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'Enable this option to enable IPv6 support for the Pi-hole DHCP server. This will allow the Pi-hole to hand out IPv6 addresses to clients and also provide IPv6 router advertisements \(RA\) to clients. This option is only useful if the Pi-hole is configured with an IPv6 address.' 'Aktivieren Sie diese Option, um die IPv6-Unterstützung für den Pi-hole-DHCP-Server zu aktivieren. Dadurch kann Pi-hole IPv6-Adressen an Geräte vergeben und auch IPv6-Router-Ankündigungen (RA) für Geräte bereitstellen. Diese Option ist nur sinnvoll, wenn Pi-hole mit einer IPv6-Adresse konfiguriert ist.' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'Advanced DHCP Settings</h3>' 'Erweiterte DHCP-Einstellungen</h3>' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'DHCP lease time</label>' 'DHCP-Vergabezeit</label>' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'Lease time</div>' 'Vergabezeit</div>' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 "The lease time can be in seconds, minutes \(e.g., \"45m\"\), hours \(e.g., \"1h\"\), days \(like \"2d\"\), or even weeks \(\"1w\"\). If no lease time is specified \(empty\), <code>dnsmasq</code>\'s default lease time is one hour for IPv4 and one day for IPv6. You may also use \"infinite\" as string but be aware of the drawbacks: assigned addresses are will only be made available again after the lease time has passed or when leases are manually deleted below." "Die Vergabezeit kann in Sekunden, Minuten (z. B. „45 m“), Stunden (z. B. „1 h“), Tagen (z. B. „2 d“) oder sogar Wochen („1 w“) angegeben werden. Wenn keine Lease-Zeit angegeben ist (keine Vergabezeit), beträgt die Standard-Vergabe-Zeit von <code>dnsmasq</code> für IPv4 eine Stunde und für IPv6 einen Tag. Sie können auch „infinite“ (unbegrenzt) als Zeichenfolge verwenden, beachten Sie jedoch die Nachteile: Zugewiesene Adressen werden erst wieder verfügbar, wenn die Vergabezeit abgelaufen ist oder wenn Vergaben unten manuell gelöscht werden." /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'Enable DHCPv4 rapid commit \(fast address assignment\)' 'DHCPv4 Schnellübertragung aktivieren (schnelle Adresszuweisung)' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'The DHCPv4 rapid commit option allows the Pi-hole DHCP server to assign an IP address to a client right away. This can notably speed up the address assignment process and you will notice, e.g., faster WiFi joins in your network. This option should only be enabled if the Pi-hole DHCP server is the only DHCP server in your network.' 'Die Option DHCPv4 Schnellübertragung ermöglicht es dem Pi-hole-DHCP-Server, einem Gerät sofort eine IP-Adresse zuzuweisen. Dies kann den Prozess der Adresszuweisung erheblich beschleunigen und Sie werden z. B. schnellere WiFi-Verbindungen in Ihrem Netzwerk feststellen. Diese Option sollte nur aktiviert werden, wenn der Pi-hole der einzige DHCP-Server in Ihrem Netzwerk ist.' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'Advertise DNS server multiple times</strong>' 'DNS-Server mehrmals ankündigen</strong>' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'Advertise DNS server multiple times to clients. Some devices will add their own proprietary DNS servers to the list of DNS servers, which can cause issues with Pi-hole. This option will advertise the Pi-hole DNS server multiple times to clients, which should prevent this from happening.' 'DNS-Server mehrfach an Geräte weitergeben. Einige Geräte fügen ihre eigenen DNS-Server zur Liste der DNS-Server hinzu, was zu Problemen mit Pi-hole führen kann. Mit dieser Option wird der Pi-hole-DNS-Server den Geräten mehrfach angezeigt, was dies verhindern sollte.' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'Ignore unknown DHCP clients</strong>' 'Ignoriere unbekannte DHCP-Geräte</strong>' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'If this option is set, Pi-hole ignores all clients which are not explicitly configured through dhcp.hosts. This can be useful to prevent unauthorized clients from getting an IP address from the DHCP server.' 'Wenn diese Option aktiviert ist, ignoriert Pi-hole alle Geräte, die nicht explizit über dhcp.hosts konfiguriert sind. Dies kann nützlich sein, um zu verhindern, dass nicht zugelassene Geräte eine IP-Adresse vom DHCP-Server erhalten.' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'It should be noted that this option is not a security feature, as clients can still assign themselves an IP address and use the network. It is merely a convenience feature to prevent unknown clients from getting a valid IP configuration assigned automatically.' 'Bitte beachten Sie, dass diese Option keine Sicherheitsfunktion ist, da Geräte sich immer noch selbst eine IP-Adresse zuweisen und das Netzwerk nutzen können. Es handelt sich lediglich um eine Komfortfunktion, die verhindern soll, dass unbekannte Geräte automatisch eine gültige IP-Konfiguration zugewiesen bekommen.' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 '<b>Note:</b> When this feature is enabled <b>you will need to configure new clients manually</b> in <code>dhcp.hosts</code> before they can use the network.' '<b>Hinweis:</b> Wenn diese Funktion aktiviert ist, müssen Sie <b>neue Geräte manuell in der Datei</b> <code>dhcp.hosts</code> <b>konfigurieren</b>, bevor sie das Netzwerk nutzen können.' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'Currently active DHCP leases' 'Derzeit aktive DHCP-Vergaben' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'IP address</th>' 'IP Adresse</th>' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'Hostname</th>' 'Rechnername</th>' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'MAC address</th>' 'MAC Adresse</th>' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'Expiration</th>' 'Ablauf</th>' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'Client ID</th>' 'Geräte-ID</th>' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'Static DHCP configuration</h3>' 'Statische DHCP-Konfiguration</h3>' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'Specify per host parameters for the DHCP server. This allows a machine with a particular hardware address to be always allocated the same hostname, IP address and lease time. A hostname specified like this overrides any supplied by the DHCP client on the machine. It is also allowable to omit the hardware address and include the hostname, in which case the IP address and lease times will apply to any machine claiming that name.' 'Geben Sie für den DHCP-Server Parameter pro Host an. Dadurch kann einem Gerät mit einer bestimmten Hardware-Adresse immer derselbe Hostname, dieselbe IP-Adresse und dieselbe Vergabezeit zugewiesen werden. Ein auf diese Weise angegebener Hostname hat Vorrang vor allen anderen, die der DHCP-Client auf dem Rechner angibt. Es ist auch möglich, die Hardware-Adresse wegzulassen und den Hostnamen anzugeben. In diesem Fall gelten die IP-Adresse und die Vergabezeit für jeden Rechner, der diesen Namen trägt.' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'Each entry should be on a separate line, and should be of the form:' 'Jeder Eintrag sollte in einer separaten Zeile stehen und in der Form erfolgen:' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'Only one entry per MAC address is allowed.' 'Pro MAC-Adresse ist nur ein Eintrag zulässig.' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'Examples:' 'Beispiele:' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'tells Pi-hole to give the machine with hardware address <code>00:20:e0:3b:13:af</code> the address <code>192.168.0.123</code><br>&nbsp;</li>' 'Weist Pi-hole an, dem Gerät mit der Hardware-Adresse <code>00:20:e0:3b:13:af</code> die Adresse <code>192.168.0.123</code>zu geben.<br>&nbsp;</li>' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'tells Pi-hole to give the machine with hardware address <code>00:20:e0:3b:13:af</code> the name <code>laptop</code><br>&nbsp;</li>' 'Weist Pi-hole an, dem Gerät mit der Hardware-Adresse <code>00:20:e0:3b:13:af</code> den Namen <code>laptop</code> zu geben.<br>&nbsp;</li>' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'tells Pi-hole to give the machine with hardware address <code>00:20:e0:3b:13:af</code> the address <code>192.168.0.123</code>, the name <code>laptop</code>, and an infinite DHCP lease<br>&nbsp;</li>' 'Weist Pi-hole an, dem Gerät mit der Hardware-Adresse <code>00:20:e0:3b:13:af</code> den Namen <code>laptop</code> und eine dauerhafte DHCP-Vergabezeit zu geben.<br>&nbsp;</li>' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'Advanced description</h3>' 'Erweiterte Beschreibung</h3>' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 "Addresses allocated like this are not constrained to be in the DHCP range specified above but they must be in the same subnet. For subnets which don't need a pool of dynamically allocated addresses, you can set a one-address range above and specify only static leases here." "Adressen, die auf diese Weise zugewiesen werden, müssen nicht unbedingt in dem oben angegebenen DHCP-Bereich liegen, aber sie müssen sich im selben Subnetz befinden. Für Teilnetze, die keinen Pool von dynamisch zugewiesenen Adressen benötigen, können Sie oben einen Bereich mit einer Adresse festlegen und hier nur statische Vergaben angeben." /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'It is allowed to use client identifiers \(called client DUID in IPv6-land\) rather than hardware addresses to identify hosts by prefixing with <code>id:</code>. Thus lines like <code>id:01:02:03:04,.....</code> refer to the host with client identifier <code>01:02:03:04</code>. It is also allowed to specify the client ID as text, like this:' 'Es ist erlaubt, Geräte-IDs (im IPv6-Bereich Geräte-DUID genannt) anstelle von Hardwareadressen zu verwenden, um Hosts zu identifizieren, indem <code>id:</code> vorangestellt wird. Somit beziehen sich Zeilen wie <code>id:01:02:03:04,.....</code> auf den Host mit der Geräte-ID <code>01:02:03:04</code>. Es ist auch zulässig, die Geräte-ID als Text anzugeben, etwa so:' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'A single line may contain an IPv4 address or one or more IPv6 addresses, or both. IPv6 addresses must be bracketed by square brackets thus: <code>laptop,\[1234::56\]</code> IPv6 addresses may contain only the host-identifier part: <code>laptop,\[::56\]</code> in which case they act as wildcards in constructed DHCP ranges, with the appropriate network part inserted. For IPv6, an address may include a prefix length: <code>laptop,\[1234:50/126\]</code> which \(in this case\) specifies four addresses, <code>1234::50</code> to <code>1234::53</code>. This \(and the ability to specify multiple addresses\) is useful when a host presents either a consistent name or hardware-ID, but varying DUIDs, since it allows dnsmasq to honour the static address allocation but assign a different address for each DUID. This typically occurs when chain netbooting, as each stage of the chain gets in turn allocates an address.' 'Eine einzelne Zeile kann eine IPv4-Adresse oder eine oder mehrere IPv6-Adressen oder beides enthalten. IPv6-Adressen müssen in eckige Klammern gesetzt werden, also: <code>laptop,[1234::56]</code> IPv6-Adressen dürfen nur den Host-ID-Teil enthalten: <code>laptop,[::56]</code> In diesem Fall fungieren sie als Platzhalter in erstellten DHCP-Bereichen, wobei der entsprechende Netzwerkteil eingefügt wird. Für IPv6 kann eine Adresse eine Präfixlänge enthalten: <code>laptop,[1234:50/126]</code>, die (in diesem Fall) vier Adressen angibt, <code>1234::50</code> bis <code>1234::53</code>. Dies (und die Möglichkeit, mehrere Adressen anzugeben) ist nützlich, wenn ein Host entweder einen konsistenten Namen oder eine Hardware-ID, aber unterschiedliche DUIDs präsentiert, da es dnsmasq ermöglicht, die statische Adresszuweisung zu berücksichtigen, aber jeder DUID eine andere Adresse zuzuweisen. Dies tritt typischerweise beim Ketten-Netbooting auf, da jede Stufe der Kette nacheinander eine Adresse zuweist.' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'Note that in IPv6 DHCP, the hardware address may not be available, though it normally is for direct-connected clients, or clients using DHCP relays which support RFC 6939.' 'Beachten Sie, dass bei IPv6-DHCP die Hardware-Adresse möglicherweise nicht verfügbar ist, obwohl sie normalerweise für direkt angeschlossene Geräte oder Geräte, die DHCP-Relays verwenden, die RFC 6939 unterstützen, verfügbar ist.' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'For DHCPv4, the special option <code>id:' 'Bei DHCPv4 bedeutet die spezielle Option <code>id:' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 '</code> means "ignore any client-id and use MAC addresses only." This is useful when a client presents a client-id sometimes but not others.' '</code> "ignoriere jede Geräte-ID und verwende nur MAC-Adressen". Dies ist nützlich, wenn ein Gerät manchmal eine Geräte-ID angibt, andere jedoch nicht.' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'If a name appears in <code>/etc/hosts</code>, the associated address can be allocated to a DHCP lease, but only if a separate line specifying the name also exists. Only one hostname can be given per line, but aliases are possible by using CNAMEs. Note that <code>/etc/hosts</code> is NOT used when the DNS server side of dnsmasq is disabled by setting the DNS server port to zero.' 'Wenn ein Name in <code>/etc/hosts</code> erscheint, kann die zugehörige Adresse einer DHCP-Vergabe zugewiesen werden, allerdings nur, wenn auch eine separate Zeile mit der Angabe des Namens vorhanden ist. Pro Zeile kann nur ein Hostname angegeben werden, durch die Verwendung von CNAMEs sind jedoch Aliase möglich. Beachten Sie, dass <code>/etc/hosts</code> NICHT verwendet wird, wenn die DNS-Serverseite von dnsmasq deaktiviert ist, indem der DNS-Server-Port auf Null gesetzt wird.' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'More than one line can be associated \(by name, hardware address or UID\) with a host. Which one is used \(and therefore which address is allocated by DHCP and appears in the DNS\) depends on the subnet on which the host last obtained a DHCP lease: the line with an address within the subnet is used. If more than one address is within the subnet, the result is undefined. <strong>A corollary to this is that the name associated with a host defined here does not appear in the DNS until the host obtains a DHCP lease.' 'Einem Host kann mehr als eine Leitung zugeordnet werden (nach Name, Hardwareadresse oder UID). Welche verwendet wird (und damit welche Adresse vom DHCP zugewiesen wird und im DNS erscheint), hängt von dem Subnetz ab, für das der Host zuletzt eine DHCP-Vergabe erhalten hat: Es wird die Zeile mit einer Adresse innerhalb des Subnetzes verwendet. Befinden sich mehr als eine Adresse im Subnetz, ist das Ergebnis undefiniert. <strong>Eine Folge davon ist, dass der mit einem hier definierten Host verknüpfte Name erst dann im DNS erscheint, wenn der Host eine DHCP-Vergabe erhält.' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'The special keyword <code>ignore</code> tells Pi-hole to never offer a DHCP lease to a machine. The machine can be specified by hardware address, client ID or hostname, for instance <code>00:20:e0:3b:13:af,ignore</code>. This is useful when there is another DHCP server on the network which should be used by some machines.' 'Das spezielle Schlüsselwort <code>ignore</code> weist Pi-hole an, niemals eine DHCP-Vergabe für eine Maschine anzubieten. Die Geräte können durch Hardwareadresse, Geräte-ID oder Hostnamen angegeben werden, zum Beispiel <code>00:20:e0:3b:13:af,ignore</code>. Dies ist nützlich, wenn es im Netzwerk einen anderen DHCP-Server gibt, der von einigen Geräten verwendet werden soll.' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'The <code>set:&lt;tag&gt;</code> construct sets the tag whenever this line is in use. This can be used to selectively send DHCP options just for this host. More than one tag can be set per line directive \(but not in other places where "set:&lt;tag&gt;" is allowed\). When a host matches any directive \(or one implied by <code>/etc/ethers</code>\) then the special tag "<code>known</code>"" is set. This allows Pi-hole to be configured to ignore requests from unknown machines using a custom config option <code>dhcp-ignore=tag:!known</code> in your own config file. If the host matches only a directive which cannot be used because it specifies an address on different subnet, the tag "<code>known-othernet</code>" is set.' 'Das Konstrukt <code>set:&lt;tag&gt;</code> legt den Tag immer dann fest, wenn diese Zeile verwendet wird. Dies kann verwendet werden, um selektiv DHCP-Optionen nur für diesen Host zu senden. Pro Zeilenanweisung kann mehr als ein Tag gesetzt werden (jedoch nicht an anderen Stellen, an denen „set:&lt;tag&gt;“ zulässig ist). Wenn ein Host mit einer Direktive (oder einer durch <code>/etc/ethers</code> implizierten) übereinstimmt, wird der spezielle Tag „<code>known</code>“ gesetzt. Dies ermöglicht die Konfiguration von Pi-hole. Ignorieren Sie Anfragen von unbekannten Geräten mit Hilfe einer benutzerdefinierten Konfigurationsoption <code>dhcp-ignore=tag:!known</code> in Ihrer eigenen Konfigurationsdatei. Wenn der Host nur mit einer Direktive übereinstimmt, die nicht verwendet werden kann, da sie eine Adresse in einem anderen Subnetz angibt, wird das Tag „<code>known-othernet</code>“ gesetzt.' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'The <code>tag:&lt;tag&gt;</code> construct filters which directives are used; more than one can be provided, in this case the request must match all of them. Tagged directives are used in preference to untagged ones. Note that one of <code>&lt;hwaddr&gt;</code>, <code>&lt;client_id&gt;</code> or <code>&lt;hostname&gt;</code> still needs to be specified \(can be a wildcard\).' 'Das <code>tag:&lt;tag&gt;</code>-Konstrukt filtert, welche Direktiven verwendet werden; es können mehrere angegeben werden. In diesem Fall muss die Anfrage mit allen übereinstimmen. Mit Tags versehene Anweisungen werden gegenüber nicht mit Tags versehenen Anweisungen bevorzugt verwendet. Beachten Sie, dass einer von <code>&lt;hwaddr&gt</code>, <code>&lt;client_id&gt</code> oder <code>&lt;hostname&gt</code> noch angegeben werden muss (kann ein Platzhalter sein).' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'Ethernet addresses \(but not client-ids\) may have wildcard bytes, so for example <code>00:20:e0:3b:13:' 'Ethernet-Adressen (aber nicht Geräte-IDs) können Wildcard-Bytes enthalten, so dass zum Beispiel <code>00:20:e0:3b:13:' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 ',ignore</code> will cause Pi-hole to ignore a range of hardware addresses.' ',ignore</code> Pi-hole veranlasst, einen Bereich von Hardware-Adressen zu ignorieren.' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'Hardware addresses normally match any network \(ARP\) type, but it is possible to restrict them to a single ARP type by preceding them with the ARP-type \(in HEX\) and "<code>-</code>". so the line <code>06-00:20:e0:3b:13:af,1.2.3.4</code> will only match a Token-Ring hardware address, since the ARP-address type for token ring is <code>6</code>.' 'Hardwareadressen stimmen normalerweise mit jedem Netzwerktyp (ARP) überein, es ist jedoch möglich, sie auf einen einzelnen ARP-Typ zu beschränken, indem ihnen der ARP-Typ (in HEX) und „<code>-</code>“ vorangestellt wird. Daher stimmt die Zeile <code>06-00:20:e0:3b:13:af,1.2.3.4</code> nur mit einer Token-Ring-Hardwareadresse überein, da der ARP-Adresstyp für Token Ring ist <code>6</code>.' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'As a special case, in DHCPv4, it is possible to include more than one hardware address. eg: <code>11:22:33:44:55:66,12:34:56:78:90:12,192.168.0.2</code>. This allows an IP address to be associated with multiple hardware addresses, and gives Pi-hole permission to abandon a DHCP lease to one of the hardware addresses when another one asks for a lease. Beware that this is a dangerous thing to do, it will only work reliably if only one of the hardware addresses is active at any time and there is no way for dnsmasq to enforce this. It is, for instance, useful to allocate a stable IP address to a laptop which has both wired and wireless interfaces.' 'Als Sonderfall ist es bei DHCPv4 möglich, mehr als eine Hardwareadresse einzubeziehen. Beispiel: <code>11:22:33:44:55:66,12:34:56:78:90:12,192.168.0.2</code>. Dies ermöglicht die Verknüpfung einer IP-Adresse mit mehreren Hardware-Adressen und gibt Pi-hole die Berechtigung, eine DHCP-Vergabezeit für eine der Hardware-Adressen aufzugeben, wenn eine andere um eine Vergabezeit bittet. Beachten Sie, dass dies gefährlich ist. Es funktioniert nur dann zuverlässig, wenn jeweils nur eine der Hardwareadressen aktiv ist, und dnsmasq hat keine Möglichkeit, dies durchzusetzen. Es ist beispielsweise nützlich, einem Laptop, der sowohl über kabelgebundene als auch kabellose Schnittstellen verfügt, eine stabile IP-Adresse zuzuweisen.' /var/www/html/admin/settings-dhcp.lp
sudo rpl --encoding UTF-8 'Save & Apply</button>' 'Speichern & Anwenden</button>' /var/www/html/admin/settings-dhcp.lp



# /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 '"DNS Settings"' '"DNS Einstellungen"' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'Upstream DNS Servers</h1>' 'Upstream DNS Server</h1>' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'ECS \(Extended Client Subnet\) defines a mechanism for recursive resolvers to send partial client IP address information to authoritative DNS name servers. Content Delivery Networks \(CDNs\) and latency-sensitive services use this to give geo-located responses when responding to name lookups coming through public DNS resolvers. <em>Note that ECS may result in reduced privacy.' 'ECS (Extended Client Subnet) definiert einen Mechanismus für rekursive Resolver, um Teilinformationen der Geräte-IP-Adresse an autorisierende DNS-Nameserver zu senden. Content Delivery Networks (CDNs) und latenzempfindliche Dienste nutzen dies, um geolokalisierte Antworten zu geben, wenn sie auf Namenssuchen reagieren, die über öffentliche DNS-Resolver erfolgen. <em>Beachten Sie, dass ECS zu einer eingeschränkten Privatsphäre führen kann.' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 '>Custom DNS servers ' '>Benutzerdefinierter DNS Server ' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'The following list contains all DNS servers selected above. Furthermore, you can add your own custom DNS servers here. The expected format is one server per line in form of <code>IP#port</code>, where the <code>port</code> is optional. If given, it has to be separated by a hash <code>#</code> from the address \(e.g. <code>127.0.0.1#5335</code> for a local <code>unbound</code> instance running on port <code>5335</code>\). The port defaults to 53 if omitted.' 'Die folgende Liste enthält alle oben ausgewählten DNS-Server. Darüber hinaus können Sie hier Ihre eigenen benutzerdefinierten DNS-Server hinzufügen. Das erwartete Format ist ein Server pro Zeile in Form von <code>IP#port</code>, wobei der <code>port</code> optional ist. Falls angegeben, muss er durch einen Hash <code>#</code> von der Adresse getrennt werden (z. B. <code>127.0.0.1#5335</code> für eine lokale <code>unbound</code>-Instanz, die auf Port <code>5335</code> ausgeführt wird). Wird die Portnummer weggelassen, wird der Standardport 53 verwendet.' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'Enter upstream DNS servers, one per line' 'Geben Sie einen DNS-Server pro Zeile ein' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'Conditional forwarding</h3>' 'Bedingte Weiterleitung</h3>' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 "If not configured as your DHCP server, Pi-hole typically won't be able to" "Wenn Pi-hole nicht als DHCP-Server konfiguriert ist, ist es normalerweise" /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'determine the names of devices on your local network.  As a' 'nicht möglich, die Namen der Geräte in Ihrem lokalen Netzwerk zu ermitteln.' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'result, tables such as Top Clients will only show IP addresses.' 'Infolgedessen werden in Tabellen wie <i>Top Geräte</i> nur IP-Adressen angezeigt.' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'One solution for this is to configure Pi-hole to forward these' 'Eine Lösung hierfür besteht darin, Pi-hole so zu konfigurieren, dass es diese Anfragen' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'requests to your DHCP server \(most likely your router\), but only for devices on your' 'an Ihren DHCP-Server weiterleitet (höchstwahrscheinlich Ihren Router), jedoch nur für Geräte' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'home network.  To configure this we will need to know the IP' 'in Ihrem Heimnetzwerk. Um dies zu konfigurieren, müssen wir die IP-Adresse Ihres DHCP-Servers' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'address of your DHCP server and which addresses belong to your local network.' 'kennen und wissen, welche Adressen zu Ihrem lokalen Netzwerk gehören. Nachfolgend finden Sie' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'Exemplary input is given below as placeholder in the text boxes \(if empty\).' 'beispielhafte Eingaben als Platzhalter in den Textfeldern (falls leer).' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'If your local network spans 192.168.0.1 - 192.168.0.255, then you will have to input' 'Wenn Ihr lokales Netzwerk 192.168.0.1 bis 192.168.0.255 umfasst, müssen Sie' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 '<code>192.168.0.0/24</code>. If your local network is 192.168.47.1 - 192.168.47.255, it will' '<code>192.168.0.0/24</code> eingeben. Wenn Ihr lokales Netzwerk 192.168.47.1 - 192.168.47.255 ist,' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'be <code>192.168.47.0/24</code> and similar. If your network is larger, the CIDR has to be' 'müssen Sie <code>192.168.47.0/24</code> oder ähnliches eingeben. Wenn Ihr Netzwerk größer ist,' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'different, for instance a range of 10.8.0.1 - 10.8.255.255 results in <code>10.8.0.0/16</code>,' 'muss das CIDR unterschiedlich sein. Beispielsweise ergibt ein Bereich von 10.8.0.1 – 10.8.255.255' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'whereas an even wider network of 10.0.0.1 - 10.255.255.255 results in <code>10.0.0.0/8</code>.' '<code>10.8.0.0/16</code>. Hingegen führt ein noch größeres Netzwerk von 10.0.0.1 – 10.255.255.255 zu <code>10.0.0.0/8</code> führt.' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'Setting up IPv6 ranges is exactly similar to setting up IPv4 here and fully supported.' 'Das Einrichten von IPv6-Bereichen ähnelt hier genau dem Einrichten von IPv4 und wird vollständig unterstützt.' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'Feel free to reach out to us on our' 'Kontaktieren Sie uns gerne in unserem' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 '<a href="https://discourse.pi-hole.net" rel="noopener noreferrer" target="_blank">Discourse forum</a>' '<a href="https://discourse.pi-hole.net" rel="noopener noreferrer" target="_blank">Diskussionsforum</a>,' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'in case you need any assistance setting up local host name resolution for your particular system.' 'falls Sie Hilfe beim Einrichten der lokalen Hostnamenauflösung für Ihr spezielles System benötigen.' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'You can also specify a local domain name \(like <code>fritz.box</code>\) to ensure queries to' 'Sie können auch einen lokalen Domainnamen angeben (z. B. <code>fritz.box</code>), um sicherzustellen,' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'devices ending in your local domain name will not leave your network, however, this is optional.' 'dass Anfragen an Geräte, die auf Ihren lokalen Domainnamen enden, Ihr Netzwerk nicht verlassen. Dies' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'The local domain name must match the domain name specified' 'ist jedoch optional. Damit dies funktioniert, muss der lokale Domainname mit dem in Ihrem DHCP-Server' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'in your DHCP server for this to work. You can likely find it within the DHCP settings.' 'angegebenen Domainamen übereinstimmen. Sie können es wahrscheinlich in den DHCP-Einstellungen finden.' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'Enabling Conditional Forwarding will also forward all hostnames \(i.e., non-FQDNs\) to the router' 'Durch die Aktivierung der bedingten Weiterleitung werden auch alle Hostnamen (d. h. Nicht-FQDNs)' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'when "Never forward non-FQDNs" is <em>not</em> enabled.' 'an den Router weitergeleitet, wenn „Niemals Nicht-FQDNs weiterleiten“ aktiviert ist.' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'Interface settings</h1>' 'Einstellungen der Schnittstelle</h1>' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'Recommended setting</h4>' 'Empfohlene Einstellung</h4>' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'Allow only local requests' 'Nur lokale Anfragen zulassen' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'Allows only queries from devices that are at most one hop away \(local devices\)' 'Erlaubt nur Anfragen von Geräten, die höchstens einen Sprung entfernt sind (lokale Geräte).' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'Potentially dangerous options' 'Potenziell gefährliche Optionen' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'Make sure your Pi-hole is properly firewalled!' 'Stellen Sie sicher, dass Ihr Pi-hole ordnungsgemäß durch eine Firewall geschützt ist!' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'Respond only on interface ' 'Reagiere nur an Schnittstelle ' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'Bind only to interface ' 'Binde nur an Schnittstelle ' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'Permit all origins' 'Reagiere auf jede Schnittstelle' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'These options are dangerous on devices' 'Diese Optionen sind gefährlich für Geräte, die direkt mit dem Internet verbunden' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'directly connected to the Internet such as cloud instances and are only safe if your' 'sind, wie z. B. Cloud-Instanzen und sind nur sicher, wenn Ihr Pi-hole über eine' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'Pi-hole is properly firewalled. In a typical at-home setup where your Pi-hole is' 'ordnungsgemäße Firewall verfügt. In einem typischen Heim-Setup, bei der sich Ihr' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'located within your local network \(and you have <strong>not</strong> forwarded port 53' 'Pi-hole in Ihrem lokalen Netzwerk befindet (und Sie Port 53 in Ihrem Router <strong>nicht</strong>' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'in your router!\) they are safe to use.' 'weitergeleitet haben!), können sie sicher verwendet werden.' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'See <a href="https://docs.pi-hole.net/ftldns/interfaces/" rel="noopener noreferrer" target="_blank">our documentation</a> for further technical details.' 'Für weitere technische Details schauen Sie sich bitte <a href="https://docs.pi-hole.net/ftldns/interfaces/" rel="noopener noreferrer" target="_blank">unsere Dokumenation</a> an.' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'DNS domain settings</h3>' 'DNS Domain Einstellungen</h3>' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'Pi-hole domain name</label>' 'Pi-hole Domain Name</label>' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 "The DNS domains for your Pi-hole. This DNS domain is purely local. FTL may answer queries from its local cache and configuration but \*never\* forwards any requests upstream \*unless\* you have configured a dns.revServer exactly for this domain. If no domain is specified and you are using Pi-hole's DHCP server, then any hostnames with a domain part \(i.e., with a period\) will be disallowed. If a domain is specified, then hostnames with a domain parts matching the domain here are allowed. In addition, when a suffix is set then hostnames without a domain part have the suffix added as an optional domain part." "Die DNS-Domänen für Ihr Pi-hole. Diese DNS-Domäne ist rein lokal. FTL kann Anfragen aus seinem lokalen Cache und seiner Konfiguration beantworten, leitet aber *nie* irgendwelche Anfragen weiter, es sei denn, Sie haben einen dns.rev-Server genau für diese Domäne konfiguriert. Wenn keine Domäne angegeben ist und Sie den DHCP-Server von Pi-hole verwenden, werden alle Hostnamen mit einem Domänenteil (d. h. mit einem Punkt) nicht zugelassen. Wenn eine Domäne angegeben ist, werden Hostnamen mit einem Domänenteil, der mit der Domäne übereinstimmt, zugelassen. Wenn ein Suffix angegeben wird, wird bei Hostnamen ohne Domänenteil zusätzlich das Suffix als optionaler Domänenteil hinzugefügt." /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'Expand hostnames' 'Rechnernamen erweitern' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'If set, the domain is added to simple names \(without a period\) in /etc/hosts in the same way as for DHCP-derived names.' 'Wenn diese Option gesetzt ist, wird die Domain mit einem einfachen Namen (ohne Punkt) in die /etc/hosts auf die gleiche Weise hinzugefügt wie bei DHCP-abgeleiteten Namen.' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'Advanced DNS settings</h3>' 'Erweiterte DNS Einstellungen</h3>' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'Never forward non-FQDN queries' 'Niemals Nicht-FQDN Anfragen weiterleiten' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'Tells Pi-hole to never forward queries for plain' 'Weist Pi-hole an, niemals Anfragen für einfache Namen ohne Punkte oder' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'names, without dots or domain parts, to upstream nameservers. If' 'Teile einer Domain an vorgelagerte Nameserver weiterzuleiten. Wenn der Name nicht aus <code>/etc/hosts</code>' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'the name is not known from <code>/etc/hosts</code> or DHCP then a "not found"' 'oder DHCP bekannt ist, wird die Antwort „nicht gefunden“ zurückgegeben.<br> Wenn die' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'answer is returned.<br>' 'bedingte Weiterleitung aktiviert ist, kann das Deaktivieren dieses Kontrollkästchens' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'If Conditional Forwarding is enabled, unticking this box may cause a partial' 'unter bestimmten Umständen zu einer teilweisen DNS-Schleife führen (z. B. wenn' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'DNS loop under certain circumstances \(e.g. if a client would send TLD DNSSEC queries\).' 'ein Client TLD-DNSSEC-Anfragen senden würde).' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'Never forward reverse lookups for private IP ranges' 'Niemals Reverse-Lookups für private IP-Bereiche weiterleiten' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'All reverse lookups for private IP ranges \(i.e., <code>192.168.0.x/24</code>, etc.\)' 'Alle Reverse-Lookups für private IP-Bereiche (z. B. <code>192.168.0.x/24</code> usw.),' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'which are not found in <code>/etc/hosts</code> or the DHCP leases are answered' 'die nicht in <code>/etc/hosts</code> oder den DHCP-Vergaben gefunden werden, werden mit' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'with "no such domain" rather than being forwarded upstream. The set' '„keine solche Domain“ beantwortet, anstatt weitergeleitet zu werden. Die betroffenen ' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'of prefixes affected is the list given in <a href="https://tools.ietf.org/html/rfc6303" rel="noopener noreferrer" target="_blank">RFC6303</a>.' 'Präfixe sind in der Liste <a href="https://tools.ietf.org/html/rfc6303" rel="noopener noreferrer" target="_blank">RFC6303</a> aufgeführt.' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'Important:</strong><br>Enabling these two options may increase your privacy,' 'Wichtig:</strong> Die Aktivierung dieser beiden Optionen erhöht möglicherweise Ihre Privatsphäre,' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'but may also prevent you from being able to access local hostnames if the Pi-hole is not used as DHCP server.' 'aber auch verhindern, dass Sie auf lokale Hostnamen zugreifen können, wenn Pi-hole nicht als DHCP-Server verwendet wird.' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'Make sure you have set up conditional forwarding in this case.' 'Stellen Sie sicher, dass Sie in diesem Fall die bedingte Weiterleitung eingerichtet haben.' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'Use DNSSEC</strong>' 'Benutze DNSSEC</strong>' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'Validate DNS replies and cache DNSSEC data. When forwarding DNS' 'Überprüfen Sie die DNS-Antworten und speichern Sie DNSSEC-Daten im Cache zwischen.' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'queries, Pi-hole requests the DNSSEC records needed to validate' 'Beim Weiterleiten von DNS-Anfragen fordert Pi-hole die DNSSEC-Einträge an, die zur' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'the replies. If a domain fails validation or the upstream does not' 'Überprüfung der Antworten erforderlich sind. Wenn eine Domain die Überprüfung nicht' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'support DNSSEC, this setting can cause issues resolving domains.' 'besteht oder der Upstream DNSSEC nicht unterstützt, kann diese Einstellung Probleme' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'Use an upstream DNS server which supports DNSSEC when activating DNSSEC. Note that' 'beim Auflösen von Domains verursachen. Verwenden Sie bei der Aktivierung von DNSSEC' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'the size of your log might increase significantly' 'einen vorgelagerten DNS-Server, der DNSSEC unterstützt. Beachten Sie, dass sich die' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'when enabling DNSSEC. A DNSSEC resolver test can be found' 'Größe Ihres Protokolls erheblich erhöhen kann, wenn Sie DNSSEC aktivieren.' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 '<a href="https://dnssec.vs.uni-due.de/" rel="noopener noreferrer" target="_blank">here</a>' 'Einen DNSSEC-Resolver-Test gibt es <a href="https://dnssec.vs.uni-due.de/" rel="noopener noreferrer" target="_blank">hier</a>' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'Rate-limiting</h3>' 'Anfragebeschränkung</h3>' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'Block clients making more than ' 'Blockieren Sie Geräte, die mehr als ' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 '> queries within' '> Anfragen in' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 '> seconds.' '> Sekunden stellen.' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'When a client makes too many queries in too short time, it' 'Wenn ein Gerät in zu kurzer Zeit zu viele Anfragen durchführt,' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'gets rate-limited. Rate-limited queries are answered with a' 'werden die Anfragen begrenzt. Begrenzte Anfragen werden mit der Antwort' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 '<code>REFUSED</code> reply and not further processed by FTL' '<code>REFUSED</code> beantwortet und von FTL nicht weiter' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'and prevent Pi-holes getting overwhelmed by rogue clients.' 'verarbeitet, um zu verhindern, dass Pi-hole von bösartigen Geräten' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'It is important to note that rate-limiting is happening on a' 'überlastet wird. Es ist wichtig zu beachten, dass die Anfragebegrenzung' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'per-client basis. Other clients can continue to use FTL while' 'pro Gerät erfolgt. Andere Geräte können FTL jedoch weiterhin verwenden,' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'rate-limited clients are short-circuited at the same time.' 'während anfragebegrenzte Geräte gleichzeitig ausgeschlossen werden.' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'Rate-limiting may be disabled altogether by setting both' 'Die Ratenbegrenzung kann vollständig deaktiviert werden,' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'values to zero.' 'indem beide Werte auf Null gesetzt werden.' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'The following list contains all reverse servers you want to add. The expected format is one server per line in form of ' 'Die folgende Liste enthält alle Reverse-Server, die Sie hinzufügen möchten. Das erwartete Format ist ein Server pro Zeile in Form von ' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'A valid config line could look like ' 'Eine gültige Konfigurationszeile könnte wie folgt aussehen ' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'Enter reverse DNS servers, one per line' 'Geben Sie einen Reverse-DNS-Server pro Zeile ein' /var/www/html/admin/settings-dns.lp
sudo rpl --encoding UTF-8 'Save & Apply</button>' 'Speichern & Anwenden</button>' /var/www/html/admin/settings-dns.lp



# /var/www/html/admin/settings-dnsrecords.lp
sudo rpl --encoding UTF-8 'Local DNS Settings' 'Lokale DNS Einstellungen' /var/www/html/admin/settings-dnsrecords.lp
sudo rpl --encoding UTF-8 '>Local DNS records' '>Lokale DNS-Einträge' /var/www/html/admin/settings-dnsrecords.lp
sudo rpl --encoding UTF-8 'List of local DNS records</h3>' 'Übersicht der lokalen DNS-Einträge</h3>' /var/www/html/admin/settings-dnsrecords.lp
sudo rpl --encoding UTF-8 'placeholder="Associated IP' 'placeholder="Zugehörige IP' /var/www/html/admin/settings-dnsrecords.lp
sudo rpl --encoding UTF-8 'Note:</strong>' 'Hinweis:</strong>' /var/www/html/admin/settings-dnsrecords.lp
sudo rpl --encoding UTF-8 'Adding/removing local DNS records will flush the cache but does not require a restart of the DNS server.' 'Das Hinzufügen/Entfernen von lokalen DNS-Einträgen leert den Zwischenspeicher, erfordert aber keinen Neustart des DNS-Servers.' /var/www/html/admin/settings-dnsrecords.lp
sudo rpl --encoding UTF-8 '>Local CNAME records' '>Lokale CNAME-Einträge' /var/www/html/admin/settings-dnsrecords.lp
sudo rpl --encoding UTF-8 'List of local CNAME records</h3>' 'Übersicht der lokalen CNAME-Einträge</h3>' /var/www/html/admin/settings-dnsrecords.lp
sudo rpl --encoding UTF-8 'Target</th>' 'Ziel</th>' /var/www/html/admin/settings-dnsrecords.lp
sudo rpl --encoding UTF-8 'placeholder="Target Domain"' 'placeholder="Zieldomain"' /var/www/html/admin/settings-dnsrecords.lp
sudo rpl --encoding UTF-8 'The target of a <code>CNAME</code> must be a domain that the Pi-hole already has in its cache or is authoritative for. This is a universal limitation of <code>CNAME</code> records.' 'Das Ziel eines <code>CNAME</code> muss eine Domain sein, die Pi-hole bereits in seinem Zwischenspeicher hat oder dafür maßgebend ist. Dies ist eine universelle Einschränkung von <code>CNAME</code>-Datensätzen.' /var/www/html/admin/settings-dnsrecords.lp
sudo rpl --encoding UTF-8 "The reason for this is that Pi-hole will not send additional queries upstream when serving <code>CNAME</code> replies. As consequence, if you set a target that isn\'t already known, the reply to the client may be incomplete. Pi-hole just returns the information it knows at the time of the query. This results in certain limitations for <code>CNAME</code> targets," "Der Grund dafür ist, dass Pi-hole bei der Bereitstellung von <code>CNAME</code>-Antworten keine zusätzlichen Anfragen im Upstream sendet. Wenn Sie ein Ziel festlegen, das noch nicht bekannt ist, ist die Antwort an das Gerät möglicherweise unvollständig. Pi-hole gibt lediglich die Informationen zurück, die es zum Zeitpunkt der Anfrage kennt. Dies führt zu bestimmten Einschränkungen für" /var/www/html/admin/settings-dnsrecords.lp
sudo rpl --encoding UTF-8 "for instance, only <em>active</em> DHCP leases work as targets - mere DHCP <em>leases</em> aren\'t sufficient as they aren\'t \(yet\) valid DNS records." "<code>CNAME</code>-Ziele. Beispielsweise funktionieren nur <em>aktive</em> DHCP-Vergaben als Ziele – bloße DHCP-<i>Vergaben</i> reichen nicht aus, da es sich (noch) nicht um gültige DNS-Einträge handelt." /var/www/html/admin/settings-dnsrecords.lp
sudo rpl --encoding UTF-8 "Additionally, you can\'t <code>CNAME</code> external domains \(<code>bing.com</code> to <code>google.com</code>\) successfully as this could result in invalid SSL certificate errors when the target server does not serve content for the requested domain." "Ausserdem können Sie externe Domains (<code>bing.com</code> bis <code>google.com</code>) nicht erfolgreich mit <code>CNAME</code> versehen, da dies zu Fehlern aufgrund ungültiger SSL-Zertifikate führen kann. Der Zielserver stellt keinen Inhalt für die angeforderte Domain bereit." /var/www/html/admin/settings-dnsrecords.lp
sudo rpl --encoding UTF-8 'Adding/removing local CNAME records will restart the DNS server.' 'Das Hinzufügen/Entfernen von lokalen CNAME-Einträgen führt zu einem Neustart des DNS-Servers.' /var/www/html/admin/settings-dnsrecords.lp



# /var/www/html/admin/settings-privacy.lp
sudo rpl --encoding UTF-8 'Privacy Settings' 'Datenschutz Einstellungen' /var/www/html/admin/settings-privacy.lp
sudo rpl --encoding UTF-8 'Query Logging</h3>' 'Anfrage Protokollierung</h3>' /var/www/html/admin/settings-privacy.lp
sudo rpl --encoding UTF-8 'The currently configured logging file is ' 'Die aktuell konfigurierte Protokollierungsdatei ist ' /var/www/html/admin/settings-privacy.lp
sudo rpl --encoding UTF-8 'Log DNS queries and replies' 'Protokollierung von DNS-Anfragen und DNS-Antworten' /var/www/html/admin/settings-privacy.lp
sudo rpl --encoding UTF-8 'Privacy-related database settings' 'Datenschutzrelevante Datenbank-Einstellungen' /var/www/html/admin/settings-privacy.lp
sudo rpl --encoding UTF-8 "Pi-hole's long-term database is stored at <code id=\"files.database\"></code></p>" "Die Langzeitdatenbank von Pi-hole wird unter <code id="files.database"></code> gespeichert.</p>" /var/www/html/admin/settings-privacy.lp
sudo rpl --encoding UTF-8 'Should FTL load queries from the database on \(re\)start\?' 'Soll FTL beim (erneuten) starten Anfragen aus der Datenbank laden?' /var/www/html/admin/settings-privacy.lp
sudo rpl --encoding UTF-8 'Maximum number of days to keep queries in the database' 'Maximale Anzahl von Tagen, um Anfragen in der Datenbank zu speichern' /var/www/html/admin/settings-privacy.lp
sudo rpl --encoding UTF-8 'How long should IP addresses be kept in the network_addresses table \[days\]\?' 'Wieviel Tage sollen IP-Adressen in der Tabelle <i>network_addresses</i> gespeichert werden?' /var/www/html/admin/settings-privacy.lp
sudo rpl --encoding UTF-8 'IP addresses \(and associated host names\) older than the specified number of days are removed to avoid dead entries in the network overview table.' 'IP-Adressen (und zugehörige Rechnernamen), die älter als die angegebene Anzahl von Tagen sind, werden entfernt, um fehlerhafte Einträge in der Netzwerkübersichtstabelle zu vermeiden.' /var/www/html/admin/settings-privacy.lp
sudo rpl --encoding UTF-8 'Query Anonymization \("Privacy Level"\)' 'Anonymisierung von Anfragen ("Datenschutz Level")' /var/www/html/admin/settings-privacy.lp
sudo rpl --encoding UTF-8 'Specify if DNS queries should be anonymized, available options are:' 'Legen Sie fest, ob DNS-Anfragen anonymisiert werden sollen; die verfügbaren Optionen sind:' /var/www/html/admin/settings-privacy.lp
sudo rpl --encoding UTF-8 'Show everything and record everything' 'Alles zeigen und alles aufzeichnen' /var/www/html/admin/settings-privacy.lp
sudo rpl --encoding UTF-8 'Gives maximum amount of statistics' 'Pi-hole liefert ein Maximum an Statistiken.' /var/www/html/admin/settings-privacy.lp
sudo rpl --encoding UTF-8 'Hide domains: Display and store all domains as <code>hidden</code>' 'Domains ausblenden: Alle Domains ausblenden und als <code>hidden</code> speichern' /var/www/html/admin/settings-privacy.lp
sudo rpl --encoding UTF-8 'This disables the Top Permitted Domains and Top Blocked Domains tables on the dashboard' 'Dadurch werden die Tabellen „Am häufigsten zugelassene Domains“ und „Am häufigsten blockierte Domains“ im Hauptmenü deaktiviert.' /var/www/html/admin/settings-privacy.lp
sudo rpl --encoding UTF-8 'Hide domains and clients: Display and store all domains as <code>hidden</code> and all clients as <code>0.0.0.0</code> </strong>' 'Domains und Geräte ausblenden: Alle Domains als <code>versteckt</code> und alle Geräte als <code>0.0.0.0</code> anzeigen</strong>' /var/www/html/admin/settings-privacy.lp
sudo rpl --encoding UTF-8 'This disables all tables on the dashboard' 'Es werden alle Tabellen im Hauptmenü deaktiviert.' /var/www/html/admin/settings-privacy.lp
sudo rpl --encoding UTF-8 'Anonymous mode: This disables basically everything except the live anonymous statistics' 'Anonymer Modus: Damit wird im Grunde alles deaktiviert, außer der anonymen Live-Statistik' /var/www/html/admin/settings-privacy.lp
sudo rpl --encoding UTF-8 'No history is saved at all to the database, and nothing is shown in the query log. Also, there are no top item lists. Note that this also largely disabled regex capabilities.' 'Es wird kein Verlauf in der Datenbank gespeichert und im Anfrageprotokoll wird nichts angezeigt. Außerdem gibt es keine Listen mit den Top-Einträgen. Beachten Sie, dass dadurch auch die RegEx-Funktionen weitestgehend deaktiviert wurden.' /var/www/html/admin/settings-privacy.lp
sudo rpl --encoding UTF-8 'The privacy level may be increased at any time without having to restart the DNS resolver. However, note that the DNS resolver needs to be restarted when lowering the privacy level. This restarting is automatically done when saving.' 'Die Datenschutzstufe kann jederzeit erhöht werden, ohne dass der DNS-Resolver neu gestartet werden muss. Beachten Sie jedoch, dass der DNS-Resolver neu gestartet werden muss, wenn Sie die Datenschutzstufe herabsetzen. Dieser Neustart wird beim Speichern automatisch durchgeführt.' /var/www/html/admin/settings-privacy.lp
sudo rpl --encoding UTF-8 'Save & Apply</button>' 'Speichern & Anwenden</button>' /var/www/html/admin/settings-privacy.lp



# /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'System Settings' 'System Einstellungen' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'System Information</h3>' 'System Informationen</h3>' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'Hostname:</th>' 'Rechnername:</th>' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'RAM:</th>' 'Arbeitsspeicher:</th>' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'The machine uptime. For containers, this will match the host uptime' 'Die Maschinenverfügbarkeit. Bei Containern entspricht diese der Verfügbarkeit des Hosts.' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'Uptime:</th>' 'Laufzeit:</th>' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'PID <span id="sysinfo-pid-ftl">\?</span>, last restart was on <span id="sysinfo-uptime-ftl">' 'PID <span id="sysinfo-pid-ftl">?</span>, letzter Neustart war am <span id="sysinfo-uptime-ftl">' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'Primary IP addresses</h4>' 'Primäre IP-Adresse</h4>' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'DHCP server metrics</h3>' 'DHCP-Server-Kennzahlen</h3>' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'Client broadcast to locate available servers' 'Geräte-Aufruf zum Auffinden verfügbarer Server' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'Server to client in response to DHCPDISCOVER with offer of configuration parameters' 'Server an Gerät als Antwort auf DHCPDISCOVER mit Angebot von Konfigurationsparametern' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'Client message to servers either \&\#010;  \(a\) requesting offered parameters from one server and implicitly declining offers from all others, \&\#010;  \(b\) confirming correctness of previously allocated address after, e.g., system reboot, or \&\#010;  \(c\) extending the lease on a particular network address"' 'Geräte-Nachricht an Server, die entweder &#010; (a) die angebotenen Parameter von einem Server anfordert und Angebote von allen anderen implizit ablehnt, &#010; (b) die Korrektheit einer zuvor zugewiesenen Adresse bestätigt, z. B. nach einem Systemneustart, oder &#010; (c) die Vergabezeit für eine bestimmte Netzadresse verlängert"                      ' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'Server to client with configuration parameters, including committed network address' 'Server an Gerät mit Konfigurationsparametern, einschließlich verbindlicher Netzwerkadresse' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 "Server to client indicating client's notion of network address is incorrect \(e.g., client has moved to new subnet\) or client\'s lease as expired" "Server an Gerät, der mitteilt, dass die vom Gerät angegebene Netzwerkadresse nicht korrekt ist (z. B. weil der Client in ein neues Subnetz umgezogen ist) oder dass die Vergabezeit des Gerätes abgelaufen ist" /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'Client to server indicating network address is already in use' 'Gerät an Server, der anzeigt, dass die Netzwerkadresse bereits verwendet wird' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'Client to server, asking only for local configuration parameters; client already has externally configured network address' 'Gerät an Server, fragt nur nach lokalen Konfigurationsparametern; Gerät hat bereits eine extern konfigurierte Netzwerkadresse' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'Client to server relinquishing network address and cancelling remaining lease' 'Gerät an Server, der seine Netzadresse aufgibt und die verbleibende Vergabezeit aufgibt' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'Could not provide an answer, e.g., because there are no leases left, the client wants to renew a lease that is outside of our range, or the explicitly requested address is already in use' 'Konnte keine Antwort geben, z. B. weil keine Vergabezeit mehr besteht, das Gerät eine Vergabezeit verlängern möchte, die außerhalb unseres Bereichs liegt, oder die ausdrücklich angeforderte Adresse bereits verwendet wird' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'Processed BOOTP packets' 'Verarbeitete BOOTP-Pakete' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'Processed PXE packets' 'Verarbeitete PXE Pakete' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'Allocated / pruned IPv4 leases:' 'Zugewiesene/gekürzte IPv4-Vergaben:' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'Allocated / pruned IPv6 leases:' 'Zugewiesene/gekürzte IPv6-Vergaben:' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'DNS cache metrics</h3>' 'DNS Zwischenspeicher-Kennzahlen</h3>' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'Total size of the DNS cache' 'Gesamtgröße des DNS Zwischenspeichers' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'DNS cache size:' 'Gesamtgröße des DNS Zwischenspeichers:' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'Share of the allocated cache that is currently in use \(this includes stale/expired entries\). If the percentage value is very low, it is advisable to reduce the DNS cache size to optimize performance' 'Anteil des zugewiesenen Zwischenspeichers, der derzeit verwendet wird (einschließlich veralteter/abgelaufener Einträge). Wenn der prozentuale Wert sehr niedrig ist, ist es ratsam, die Größe des DNS-Zwischenspeichers zu reduzieren, um die Leistung zu optimieren.' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'Active cache records:' 'Aktive Zwischenspeicher Aufnahmen' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'Number of cache insertions, this number will grow continuously as expiring records naturally make space for new records' 'Anzahl der Einfügungen in den Zwischenspeicher; diese Zahl wächst kontinuierlich, da auslaufende Datensätze auf natürliche Weise Platz für neue Datensätze schaffen.' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'Total cache insertions:' 'Zwischenspeicher-Einfügungen insgesamt:' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'Number of cache entries that had to be removed although they are not expired. When this number if larger than zero, you should consider increasing your total cache size' 'Anzahl der Cache-Einträge, die entfernt werden mussten, obwohl sie noch nicht abgelaufen sind. Wenn diese Zahl größer als Null ist, sollten Sie in Erwägung ziehen, die Gesamtgröße Ihres Caches zu erhöhen.' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'DNS cache evictions:</th>' 'DNS-Zwischenspeicher-Leerungen:</th>' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'Number of expired cache entries \(they can still be used by the cache optimizer\). These entries will only be freed when space is really needed \(for efficiency reasons\)' 'Anzahl der abgelaufenen Zwischenspeicher-Einträge (sie können weiterhin vom Zwischenspeicher-Optimierer verwendet werden). Diese Einträge werden nur dann freigegeben, wenn tatsächlich Platz benötigt wird (aus Effizienzgründen).' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'Expired DNS cache entries:' 'Abgelaufene DNS-Cache-Einträge:' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'Number of immortal cache entries that will never expire \(e.g. from /etc/hosts or local configuration\)' 'Anzahl der dauerhaften Zwischenspeicher-Einträge, die nie ablaufen (z. B. aus /etc/hosts oder lokaler Konfiguration)' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'Immortal DNS cache entries:' 'Dauerhafte DNS-Cache-Einträge:' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'See also our <a href="https://docs.pi-hole.net/ftldns/dns-cache/" rel="noopener noreferrer" target="_blank">DNS cache documentation</a>.' 'Siehe auch unsere <a href="https://docs.pi-hole.net/ftldns/dns-cache/" rel="noopener noreferrer" target="_blank">DNS Zwischenspeicher Dokumentation</a>.' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'DNS reply metrics</h3>' 'DNS-Antwort-Kennzahlen</h3>' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'Local/cache replies:' 'Lokale/Zwischenspeicher-Antworten:' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'Forwarded queries:' 'Weitergeleitete Anfragen:' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'Cache optimizer replies:' 'Optimierte Zwischenspeicher-Antworten:' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'Unanswered queries:' 'Unbeantwortete Anfragen:' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'Authoritative replies:' 'Authorisierte Antworten:' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'Actions</h3>' 'Aktionen</h3>' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'Restart DNS resolver</button>' 'DNS-Resolver neu starten</button>' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'Flush network table</button>' 'Lösche die Netzwerk Tabelle</button>' /var/www/html/admin/settings-system.lp
sudo rpl --encoding UTF-8 'Flush logs \(last 24 hours\)</button>' 'Protokolle löschen (letzten 24 Std.)</button>' /var/www/html/admin/settings-system.lp



# /var/www/html/admin/settings-teleporter.lp
sudo rpl --encoding UTF-8 "Export your Pi-hole\'s configuration</h3>" "Exportieren Sie Ihre Pi-hole Einstellungen</h3>" /var/www/html/admin/settings-teleporter.lp
sudo rpl --encoding UTF-8 'Warning:</strong><br>This archive contains sensitive information about your Pi-hole installation, e.g. your 2FA-TOTP secret \(if enabled\). Please be careful with this file and do not share it with anyone even if they claim to help you.' 'Warnung:</strong><br>Dieses Archiv enthält sensible Informationen über Ihre Pi-hole-Installation, wie z.B. Ihre 2FA-TOTP-Verschlüsselung (falls aktiviert). Bitte seien Sie vorsichtig mit dieser Datei und geben Sie sie nicht an andere weiter, auch wenn diese vorgeben, Ihnen zu helfen zu wollen.' /var/www/html/admin/settings-teleporter.lp
sudo rpl --encoding UTF-8 'Warning:</strong><br>You are currently not using an end-to-end encryption. This means that secrets like your 2FA-TOTP secret will be transmitted in plain text. We recommend to use HTTPS when' 'Warnung:</strong><br>Sie verwenden derzeit keine Ende-zu-Ende-Verschlüsselung. Das bedeutet, dass Geheimnisse wie Ihr 2FA-TOTP-Geheimnis im Klartext übertragen werden. Wir empfehlen, HTTPS zu verwenden, ' /var/www/html/admin/settings-teleporter.lp
sudo rpl --encoding UTF-8 'exporting your configuration.' 'wenn Sie Ihre Konfiguration exportieren.' /var/www/html/admin/settings-teleporter.lp
sudo rpl --encoding UTF-8 '<br>Export' '<br>Exportieren' /var/www/html/admin/settings-teleporter.lp
sudo rpl --encoding UTF-8 'Import previously exported configuration</h3>' 'Zuvor exportierte Konfiguration importieren</h3>' /var/www/html/admin/settings-teleporter.lp
sudo rpl --encoding UTF-8 'File input</label>' 'Dateieingabe</label>' /var/www/html/admin/settings-teleporter.lp
sudo rpl --encoding UTF-8 'When importing settings from a <em>newer</em> version of Pi-hole, not yet existing settings will be ignored. When importing from an <em>older</em> version of Pi-hole, settings for newer features will be initialized with their default values.' 'Beim Importieren von Einstellungen aus einer <em>neueren</em> Version von Pi-hole werden noch nicht vorhandene Einstellungen ignoriert. Beim Import aus einer <em>älteren</em> Version von Pi-hole werden die Einstellungen für neuere Funktionen mit ihren Standardwerten initialisiert.' /var/www/html/admin/settings-teleporter.lp
sudo rpl --encoding UTF-8 'Select what to import' 'Wählen Sie aus, was importiert werden soll:' /var/www/html/admin/settings-teleporter.lp
sudo rpl --encoding UTF-8 'Configuration</strong' 'Konfiguration</strong' /var/www/html/admin/settings-teleporter.lp
sudo rpl --encoding UTF-8 'DHCP leases</strong' 'DHCP-Vergaben</strong' /var/www/html/admin/settings-teleporter.lp
sudo rpl --encoding UTF-8 'Groups</strong' 'Gruppen</strong' /var/www/html/admin/settings-teleporter.lp
sudo rpl --encoding UTF-8 'Lists</strong>' 'Listen</strong>' /var/www/html/admin/settings-teleporter.lp
sudo rpl --encoding UTF-8 'Domains/Regexes</strong' 'Domains/RegExes</strong' /var/www/html/admin/settings-teleporter.lp
sudo rpl --encoding UTF-8 'Clients</strong>' 'Geräte</strong>' /var/www/html/admin/settings-teleporter.lp
sudo rpl --encoding UTF-8 '<br>Import' '<br>Importieren' /var/www/html/admin/settings-teleporter.lp
sudo rpl --encoding UTF-8 'aria-label="Close"' 'aria-label="Schließen"' /var/www/html/admin/settings-teleporter.lp
sudo rpl --encoding UTF-8 'Importing Pi-hole teleporter file...</h4>' 'Importieren der Pi-hole Teleporter Datei ...</h4>' /var/www/html/admin/settings-teleporter.lp
sudo rpl --encoding UTF-8 "Depending on your network speed, it may take a few moments until the file is uploaded and imported. Please be patient and don't interrupt the process..." "Je nach Netzwerkgeschwindigkeit kann es ein paar Augenblicke dauern, bis die Datei hochgeladen und importiert ist. Bitte haben Sie Geduld und unterbrechen Sie den Vorgang nicht ..." /var/www/html/admin/settings-teleporter.lp
sudo rpl --encoding UTF-8 'Please run gravity</h4>' 'Bitte starten Sie die Gravity</h4>' /var/www/html/admin/settings-teleporter.lp
sudo rpl --encoding UTF-8 '<p>Use <a href=' '<p>Unter <a href=' /var/www/html/admin/settings-teleporter.lp
sudo rpl --encoding UTF-8 'Tools &rarr; Update Gravity</a> or run <code>pihole -g</code> to update your lists.' 'Werkzeuge &rarr; Aktualisierung der Gravity</a> oder im Terminal <code>pihole -g</code> um die Listen aktualisieren.' /var/www/html/admin/settings-teleporter.lp
sudo rpl --encoding UTF-8 'Close</button>' 'Schließen</button>' /var/www/html/admin/settings-teleporter.lp



# /var/www/html/admin/taillog.lp
sudo rpl --encoding UTF-8 'Autoscroll:' 'Automatisch scrollen:' /var/www/html/admin/taillog.lp



# /var/www/html/admin/js/charts.js
sudo rpl --encoding UTF-8 '"Toggle visibility"' '"Sichtbarkeit ein- und ausschalten"' /var/www/html/admin/scripts/js/charts.js
sudo rpl --encoding UTF-8 'List \$\{item.text\} queries' 'Anzeigen der ${item.text} Anfragen' /var/www/html/admin/scripts/js/charts.js
sudo rpl --encoding UTF-8 'No activity recorded</td>' 'Keine Aktivität aufgezeichnet.</td>' /var/www/html/admin/scripts/js/charts.js
sudo rpl --encoding UTF-8 '% of all data' '% aller Daten' /var/www/html/admin/scripts/js/charts.js
sudo rpl --encoding UTF-8 '% of shown items' '% der gezeigten Einträge' /var/www/html/admin/scripts/js/charts.js



# /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 'nbsp;Active' 'nbsp;Pi-<b>hole</b> ist aktiv' /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 'nbsp;Blocking disabled' 'nbsp;Blockierung ist aus!' /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 'DNS server failure</span>' 'Ausfall des DNS-Servers</span>' /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 'nbsp;Status unknown' 'nbsp;Status unbekannt' /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 '"Enable Blocking' '"Blocken ausgeschaltet' /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 '"q/min"' '"Anfragen pro Minute"' /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 '"Queries per minute"' '"DNS-Anfragen pro Minute"' /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 '"q/s"' '"Anfragen pro Sekunde"' /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 '"Queries per second"' '"Anfragen pro Sekunden"' /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 '"Allowed: "' '"Erlaubt: "' /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 '" exact domains and "' '" exakte Domains und "' /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 '" regex filters are enabled"' '" RegEx Filter sind aktiv"' /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 '"Denied: "' '"Gesperrt: "' /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 '\% used by FTL\)' '% durch FTL)' /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 '.format\("dddd, MMMM Do YYYY, HH:mm:ss"\);' '.format("dddd, D. MMMM YYYY, HH:mm:ss") + " Uhr";' /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 'Destructive actions are disabled by a config setting' 'Destruktive Aktionen sind durch eine Konfigurationseinstellung deaktiviert!' /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 'Memory usage:' 'Speichernutzung:' /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 'Total memory:' 'Gesamtspeicher:' /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 ' Swap usage: ' ' Swap-Nutzung: ' /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 '" is used"' '" werden benutzt"' /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 '"\% of "' '"% von "' /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 'No swap space available' 'Kein Swap-Speicher verfügbar!' /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 'Load:&nbsp' 'CPU-Last:&nbsp' /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 'Load averages for the past 1, 5, and 15 minutes\\non a system with ' 'Lastdurchschnitt für die letzten 1, 5 und 15 Minuten bei einem System mit ' /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 'load is higher than the number of cores' 'die Last ist höher als die Anzahl der Kerne' /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 ' on "' ' auf "' /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 '" core" \+' '" Kern" +' /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 '"s" : ""' '"en," : ""' /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 '" running " ' '" es laufen " ' /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 ' processes' ' Prozesse' /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 'System uptime: ' 'Betriebszeit des Systems: ' /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 'running since' 'läuft seit' /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 'Update available!' 'Update verfügbar!' /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 'To install updates, run ' 'Zum Installieren der Updates starte ' /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 'replace this old container with a fresh upgraded image' 'diesen alten Container durch ein frisches, aktualisiertes Image ersetzen' /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 'on: "Expert"' 'on: "Experte"' /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 'off: "Basic"' 'off: "Basis"' /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 'Client: ' 'Gerät: ' /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 'Your connection is ' 'Die Verbindung ist ' /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 '"NOT "' '"NICHT "' /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 'end-to-end encrypted ' 'Ende-zu-Ende verschlüsselt ' /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 'Original remote address: ' 'Ursprüngliche Remote-Adresse: ' /var/www/html/admin/scripts/js/footer.js
sudo rpl --encoding UTF-8 'Render time:' 'Renderzeit:' /var/www/html/admin/scripts/js/footer.js



# /var/www/html/admin/scripts/js/gravity.js
# noch nichts zu übersetzen
# sudo rpl --encoding UTF-8 '' '' /var/www/html/admin/scripts/js/gravity.js



# /var/www/html/admin/scripts/js/groups.js
sudo rpl --encoding UTF-8 'The server took too long to send the data.' 'Der Server hat zu lange gebraucht, um die Daten zu senden.' /var/www/html/admin/scripts/js/groups.js
sudo rpl --encoding UTF-8 'An unknown error occurred while loading the data.' 'Beim Laden der Daten ist ein unbekannter Fehler aufgetreten.' /var/www/html/admin/scripts/js/groups.js
sudo rpl --encoding UTF-8 '"Added: " ' '"Hinzugefügt am: " ' /var/www/html/admin/scripts/js/groups.js
sudo rpl --encoding UTF-8 'Last modified: " ' 'Zuletzt geändert am: " ' /var/www/html/admin/scripts/js/groups.js
sudo rpl --encoding UTF-8 'Database ID: " ' 'Datenbank ID: " ' /var/www/html/admin/scripts/js/groups.js
sudo rpl --encoding UTF-8 'on: "Enabled"' 'on: "Aktiviert"' /var/www/html/admin/scripts/js/groups.js
sudo rpl --encoding UTF-8 'off: "Disabled"' 'off: "Deaktiviert"' /var/www/html/admin/scripts/js/groups.js
sudo rpl --encoding UTF-8 '"Select All"' '"Alle Auswählen"' /var/www/html/admin/scripts/js/groups.js
sudo rpl --encoding UTF-8 '"Deselect All"' '"Alle Abwählen"' /var/www/html/admin/scripts/js/groups.js
sudo rpl --encoding UTF-8 '"Delete Selected"' '"Ausgewählte löschen"' /var/www/html/admin/scripts/js/groups.js
sudo rpl --encoding UTF-8 '10, 25, 50, 100, "All"' '10, 25, 50, 100, "Alle"' /var/www/html/admin/scripts/js/groups.js
sudo rpl --encoding UTF-8 'Adding group\(s\)...' 'Hinzufügen der Gruppe(n) ...' /var/www/html/admin/scripts/js/groups.js
sudo rpl --encoding UTF-8 '"Warning", "Please specify a group name"' '"Warnung", "Bitte geben Sie einen Gruppennamen an"' /var/www/html/admin/scripts/js/groups.js
sudo rpl --encoding UTF-8 'Error while adding new group' 'Fehler beim Hinzufügen  einer neuen Gruppe' /var/www/html/admin/scripts/js/groups.js
sudo rpl --encoding UFT-8 '"edited name of"' '"bearbeitet den Namen"' /var/www/html/admin/scripts/js/groups.js
sudo rpl --encoding UTF-8 '"edited comment of"' '"bearbeitet den Kommentar von"' /var/www/html/admin/scripts/js/groups.js
sudo rpl --encoding UTF-8 'Editing group...' 'Bearbeite Gruppe ...' /var/www/html/admin/scripts/js/groups.js
sudo rpl --encoding UTF-8 'Error while ' 'Fehler während ' /var/www/html/admin/scripts/js/groups.js
sudo rpl --encoding UTF-8 'group with name' 'Gruppe mit Name' /var/www/html/admin/scripts/js/groups.js



echo -e "${blaufett}   50 % ...${standard}"


# /var/www/html/admin/scripts/js/groups-clients.js
sudo rpl --encoding UTF-8 'Select client...' 'Gerät auswählen ...' /var/www/html/admin/scripts/js/groups-clients.js
sudo rpl --encoding UTF-8 'Added: ' 'Hinzugefügt am: ' /var/www/html/admin/scripts/js/groups-clients.js
sudo rpl --encoding UTF-8 'Last modified: ' 'Zuletzt bearbeitet am: ' /var/www/html/admin/scripts/js/groups-clients.js
sudo rpl --encoding UTF-8 'Database ID: ' 'Datenbank ID: ' /var/www/html/admin/scripts/js/groups-clients.js
sudo rpl --encoding UTF-8 '"Select All"' '"Alle auswählen"' /var/www/html/admin/scripts/js/groups-clients.js
sudo rpl --encoding UTF-8 'Deselect All' 'Alle abwählen' /var/www/html/admin/scripts/js/groups-clients.js
sudo rpl --encoding UTF-8 '"All"' '"Alle"' /var/www/html/admin/scripts/js/groups-clients.js
sudo rpl --encoding UTF-8 'Warning' 'Achtung' /var/www/html/admin/scripts/js/groups-clients.js
sudo rpl --encoding UTF-8 'Input is neither a valid IP or MAC address nor a valid host name!' 'Die Eingabe ist weder eine gültige IP- oder MAC-Adresse noch ein gültiger Hostname!' /var/www/html/admin/scripts/js/groups-clients.js
sudo rpl --encoding UTF-8 'Adding client\(s\)...' 'Füge Gerät hinzu ...' /var/www/html/admin/scripts/js/groups-clients.js
sudo rpl --encoding UTF-8 'Please specify a client IP or MAC address' 'Bitte geben Sie eine Geräte-IP oder MAC-Adresse an' /var/www/html/admin/scripts/js/groups-clients.js
sudo rpl --encoding UTF-8 'Error while adding new client' 'Fehler beim Hinzufügen eines neuen Gerätes' /var/www/html/admin/scripts/js/groups-clients.js
sudo rpl --encoding UTF-8 'Editing client...' 'Bearbeite Gerät ...' /var/www/html/admin/scripts/js/groups-clients.js
sudo rpl --encoding UTF-8 '"Error while " \+ notDone \+ " client "' '"Fehler beim " + notDone + " Gerät "' /var/www/html/admin/scripts/js/groups-clients.js



# /var/www/html/admin/scripts/js/groups-common.js
sudo rpl --encoding UTF-8 'Successfully \$' 'Erfolgreich $' /var/www/html/admin/scripts/js/groups-common.js
sudo rpl --encoding UTF-8 'Error while \$' 'Fehler während $' /var/www/html/admin/scripts/js/groups-common.js
sudo rpl --encoding UTF-8 '"Deleting "' '"Lösche "' /var/www/html/admin/scripts/js/groups-common.js
sudo rpl --encoding UTF-8 'Successfully deleted ' 'Erfolgreich gelöscht ' /var/www/html/admin/scripts/js/groups-common.js
sudo rpl --encoding UTF-8 '"Error while deleting "' '"Fehler beim Löschen "' /var/www/html/admin/scripts/js/groups-common.js



# /var/www/html/admin/scripts/js/groups-domains.js
sudo rpl --encoding UTF-8 'Did you mean" : "or"' 'Meinten Sie" : "oder"' /var/www/html/admin/scripts/js/groups-domains.js
sudo rpl --encoding UTF-8 '"Added: " \+' '"Hinzugefügt am: " +' /var/www/html/admin/scripts/js/groups-domains.js
sudo rpl --encoding UTF-8 'Last modified: " \+' 'Zuletzt bearbeitet am: " +' /var/www/html/admin/scripts/js/groups-domains.js
sudo rpl --encoding UTF-8 'Database ID: " \+' 'Databank ID: " +' /var/www/html/admin/scripts/js/groups-domains.js
sudo rpl --encoding UTF-8 'Exact allow</option>' 'Exakt erlaubt</option>' /var/www/html/admin/scripts/js/groups-domains.js
sudo rpl --encoding UTF-8 'Regex allow</option>' 'RegEx erlaubt</option>' /var/www/html/admin/scripts/js/groups-domains.js
sudo rpl --encoding UTF-8 'Exact deny</option>' 'Exakt verboten</option>' /var/www/html/admin/scripts/js/groups-domains.js
sudo rpl --encoding UTF-8 'Regex deny</option' 'RegEx verboten</option' /var/www/html/admin/scripts/js/groups-domains.js
sudo rpl --encoding UTF-8 'on: "Enabled"' 'on: "Aktiviert"' /var/www/html/admin/scripts/js/groups-domains.js
sudo rpl --encoding UTF-8 'off: "Disabled"' 'off: "Deaktiviert"' /var/www/html/admin/scripts/js/groups-domains.js
sudo rpl --encoding UTF-8 'Apply</button>' 'Anwenden</button>' /var/www/html/admin/scripts/js/groups-domains.js
sudo rpl --encoding UTF-8 '"Select All"' '"Alle auswählen"' /var/www/html/admin/scripts/js/groups-domains.js
sudo rpl --encoding UTF-8 '"Deselect All"' '"Alle abwählen"' /var/www/html/admin/scripts/js/groups-domains.js
sudo rpl --encoding UTF-8 '"Delete Selected"' '"Ausgewählte löschen"' /var/www/html/admin/scripts/js/groups-domains.js
sudo rpl --encoding UTF-8 '10, 25, 50, 100, "All"' '10, 25, 50, 100, "Alle"' /var/www/html/admin/scripts/js/groups-domains.js
sudo rpl --encoding UTF-8 '"Adding domain\(s\)..."' '"Hinzufügen der Domains ..."' /var/www/html/admin/scripts/js/groups-domains.js
sudo rpl --encoding UTF-8 '"Warning", "Please specify at least one domain"' '"Warnung", "Bitte geben Sie mindestens eine Domain an!"' /var/www/html/admin/scripts/js/groups-domains.js
sudo rpl --encoding UTF-8 '"Error while adding new domain"' '"Fehler beim Hinzufügen einer neuen Domain."' /var/www/html/admin/scripts/js/groups-domains.js
sudo rpl --encoding UTF-8 '"Editing domain..."' '"Bearbeite Domain ..."' /var/www/html/admin/scripts/js/groups-domains.js
sudo rpl --encoding UTF-8 '"Error while "' '"Fehler beim "' /var/www/html/admin/scripts/js/groups-domains.js



# /var/www/html/admin/scripts/js/groups-lists.js
sudo rpl --encoding UTF-8 'out of which ' 'von denen ' /var/www/html/admin/scripts/js/groups-lists.js
sudo rpl --encoding UTF-8 'are in ABP-style' 'im ABP-Style sind' /var/www/html/admin/scripts/js/groups-lists.js
sudo rpl --encoding UTF-8 '<td>Type:' '<td>Typ:' /var/www/html/admin/scripts/js/groups-lists.js
sudo rpl --encoding UTF-8 'list</td>' 'Liste</td>' /var/www/html/admin/scripts/js/groups-lists.js
sudo rpl --encoding UTF-8 'Health status:' 'Verfügbarkeitsstatus:' /var/www/html/admin/scripts/js/groups-lists.js
sudo rpl --encoding UTF-8 'Added to Pi-hole:' 'In Pi-hole hinzugefügt am:' /var/www/html/admin/scripts/js/groups-lists.js
sudo rpl --encoding UTF-8 'Database entry last modified:' 'Datenbankeintrag wurde zuletzt geändert am:' /var/www/html/admin/scripts/js/groups-lists.js
sudo rpl --encoding UTF-8 'Content last updated on:' 'Inhalt zuletzt geändert am:' /var/www/html/admin/scripts/js/groups-lists.js
sudo rpl --encoding UTF-8 'Number of entries:' 'Anzahl der Einträge:' /var/www/html/admin/scripts/js/groups-lists.js
sudo rpl --encoding UTF-8 'Number of non-domains:' 'Anzahl von Nicht-Domains:' /var/www/html/admin/scripts/js/groups-lists.js
sudo rpl --encoding UTF-8 'Database ID:' 'Datenbank ID' /var/www/html/admin/scripts/js/groups-lists.js
sudo rpl --encoding UTF-8 'Click for details about this list' 'Klicken Sie für Details zu dieser Liste' /var/www/html/admin/scripts/js/groups-lists.js
sudo rpl --encoding UTF-8 'List is disabled and not checked' 'Liste ist deaktiviert und nicht geprüft' /var/www/html/admin/scripts/js/groups-lists.js
sudo rpl --encoding UTF-8 'List was not downloaded so far' 'Liste wurde noch nicht heruntergeladen' /var/www/html/admin/scripts/js/groups-lists.js
sudo rpl --encoding UTF-8 'List download was successful' 'Liste wurde erfolgreich heruntergeladen' /var/www/html/admin/scripts/js/groups-lists.js
sudo rpl --encoding UTF-8 'List unchanged upstream, Pi-hole used a local copy' 'Liste ist unverändert, Pi-hole verwendet eine lokale Kopie' /var/www/html/admin/scripts/js/groups-lists.js
sudo rpl --encoding UTF-8 'List unavailable, Pi-hole used a local copy' 'Liste ist nicht verfügbar, Pi-hole verwendet eine lokale Kopie' /var/www/html/admin/scripts/js/groups-lists.js
sudo rpl --encoding UTF-8 'List unavailable, there is no local copy of this list available on your Pi-hole' 'Liste ist nicht verfügbar, es ist keine lokale Kopie dieser Liste auf dem Pi-hole verfügbar.' /var/www/html/admin/scripts/js/groups-lists.js
sudo rpl --encoding UTF-8 'replace list</span>' 'Liste ersetzen</span>' /var/www/html/admin/scripts/js/groups-lists.js
sudo rpl --encoding UTF-8 '= "Unknown";' '= "Unbekannt";' /var/www/html/admin/scripts/js/groups-lists.js
sudo rpl --encoding UTF-8 'This list is of unknown type' 'Unbekannter Listentyp' /var/www/html/admin/scripts/js/groups-lists.js
sudo rpl --encoding UTF-8 'This is a blocklist' 'Dies ist eine Blacklist' /var/www/html/admin/scripts/js/groups-lists.js
sudo rpl --encoding UTF-8 'This is an allowlist' 'Dies ist eine Whitelist' /var/www/html/admin/scripts/js/groups-lists.js
sudo rpl --encoding UTF-8 'on: "Enabled"' 'on: "Aktiviert"' /var/www/html/admin/scripts/js/groups-lists.js
sudo rpl --encoding UTF-8 'off: "Disabled"' 'off: "Deaktiviert"' /var/www/html/admin/scripts/js/groups-lists.js
sudo rpl --encoding UTF-8 'Apply</button>' 'Anwenden</button>' /var/www/html/admin/scripts/js/groups-lists.js
sudo rpl --encoding UTF-8 '10, 25, 50, 100, "All"' '10, 25, 50, 100, "Alle"' /var/www/html/admin/scripts/js/groups-lists.js
sudo rpl --encoding UTF-8 '"Select All"' '"Alle auswählen"' /var/www/html/admin/scripts/js/groups-lists.js
sudo rpl --encoding UTF-8 '"Deselect All"' '"Alle abwählen"' /var/www/html/admin/scripts/js/groups-lists.js
sudo rpl --encoding UTF-8 '"Delete Selected"' '"Ausgewählte löschen"' /var/www/html/admin/scripts/js/groups-lists.js
sudo rpl --encoding UTF-8 '"Adding subscribed " \+ type \+ "list\(s\)..."' '"Hinzufügen der abonnierten " + type + "Liste(n) ..."' /var/www/html/admin/scripts/js/groups-lists.js
sudo rpl --encoding UTF-8 '"warning", "", "Warning", "Please specify " \+ type \+ "list address"' '"warning", "", "Warnung", "Bitte geben Sie die " + type + " Listenadresse an"' /var/www/html/admin/scripts/js/groups-lists.js
sudo rpl --encoding UTF-8 '"Error while adding new " \+ type \+ "list"' '"Fehler beim Hinzufügen der " + type + "Liste"' /var/www/html/admin/scripts/js/groups-lists.js
sudo rpl --encoding UTF-8 'Editing address...' 'Bearbeite die Adresse ...' /var/www/html/admin/scripts/js/groups-lists.js
sudo rpl --encoding UTF-8 'Error while " \+ notDone \+ type \+ "list ' 'Fehler beim " + notDone + type + "Liste ' /var/www/html/admin/scripts/js/groups-lists.js



# /var/www/html/admin/scripts/js/index.js
sudo rpl --encoding UTF-8 '"Other DNS Queries"' '"Andere DNS Anfragen"' /var/www/html/admin/scripts/js/index.js
sudo rpl --encoding UTF-8 '"Blocked DNS Queries"' '"Geblockte DNS Anfragen"' /var/www/html/admin/scripts/js/index.js
sudo rpl --encoding UTF-8 'Cached DNS Queries' 'Zwischengespeicherte DNS Anfragen' /var/www/html/admin/scripts/js/index.js
sudo rpl --encoding UTF-8 '"Forwarded DNS Queries"' '"Weitergeleitete DNS Anfragen"' /var/www/html/admin/scripts/js/index.js
sudo rpl --encoding UTF-8 '\- No data \-' '\- Keine Daten \-' /var/www/html/admin/scripts/js/index.js
sudo rpl --encoding UTF-8 '" total clients"' '" Geräte insgesamt"' /var/www/html/admin/scripts/js/index.js
sudo rpl --encoding UTF-8 'Lists were never updated' 'Listen wurden nie aktualisiert' /var/www/html/admin/scripts/js/index.js
sudo rpl --encoding UTF-8 'Lists updated ' 'Aktualisierte Listen ' /var/www/html/admin/scripts/js/index.js
sudo rpl --encoding UTF-8 'Error! Update gravity to reset this value.' 'Fehler! Aktualisieren Sie die Gravity-Datenbank, um diesen Wert zurückzusetzen!' /var/www/html/admin/scripts/js/index.js
sudo rpl --encoding UTF-8 'return "Queries from " \+ from \+ " to " \+ to' 'return "Anfragen von " + from + " Uhr bis " + to + " Uhr"' /var/www/html/admin/scripts/js/index.js
sudo rpl --encoding UTF-8 'return "Client activity from " \+ from \+ " to " \+ to' 'return "Geräteaktivität von " + from + " Uhr bis " + to + " Uhr"' /var/www/html/admin/scripts/js/index.js
sudo rpl --encoding UTF-8 'return "Query type"' 'return "Anfragetyp"' /var/www/html/admin/scripts/js/index.js
sudo rpl --encoding UTF-8 'return "Upstream server"' 'return "Upstream Server"' /var/www/html/admin/scripts/js/index.js



# /var/www/html/admin/scripts/js/interfaces.js
sudo rpl --encoding UTF-8 'Master interface: <code>' 'Haupt-Interface: <code>' /var/www/html/admin/scripts/js/interfaces.js
sudo rpl --encoding UTF-8 'Speed: \$' 'Geschwindigkeit: $' /var/www/html/admin/scripts/js/interfaces.js
sudo rpl --encoding UTF-8 'Type: \$' 'Typ: $' /var/www/html/admin/scripts/js/interfaces.js
sudo rpl --encoding UTF-8 'Hardware address: <code>' 'Hardware Adresse: <code>' /var/www/html/admin/scripts/js/interfaces.js
sudo rpl --encoding UTF-8 ' connected to interface' '  verbunden mit der Schnittstelle' /var/www/html/admin/scripts/js/interfaces.js
sudo rpl --encoding UTF-8 'address" \: " addresses' 'Adresse" : " Adressen' /var/www/html/admin/scripts/js/interfaces.js
sudo rpl --encoding UTF-8 'Address: <code>' 'Adresse: <code>' /var/www/html/admin/scripts/js/interfaces.js
sudo rpl --encoding UTF-8 'Local: <code>' 'Lokal: <code>' /var/www/html/admin/scripts/js/interfaces.js
sudo rpl --encoding UTF-8 'Scope: \$' 'Umfang: $' /var/www/html/admin/scripts/js/interfaces.js
sudo rpl --encoding UTF-8 'Preferred lifetime: \$' 'Bevorzugte Lebensdauer: $' /var/www/html/admin/scripts/js/interfaces.js
sudo rpl --encoding UTF-8 'Valid lifetime: \$' 'Gültige Lebensdauer: $' /var/www/html/admin/scripts/js/interfaces.js
sudo rpl --encoding UTF-8 'Created: \$' 'Erstellt am: $' /var/www/html/admin/scripts/js/interfaces.js
sudo rpl --encoding UTF-8 'Last updated: \$' 'Zuletzt aktualisiert: $' /var/www/html/admin/scripts/js/interfaces.js
sudo rpl --encoding UTF-8 '"Statistics"' '"Statistik"' /var/www/html/admin/scripts/js/interfaces.js
sudo rpl --encoding UTF-8 'RX bytes: \$' 'RX Bytes: $' /var/www/html/admin/scripts/js/interfaces.js
sudo rpl --encoding UTF-8 'TX bytes: \$' 'TX Bytes: $' /var/www/html/admin/scripts/js/interfaces.js
sudo rpl --encoding UTF-8 'RX packets: \$' 'RX Pakete: $' /var/www/html/admin/scripts/js/interfaces.js
sudo rpl --encoding UTF-8 'RX errors: \$' 'RX Fehler: $' /var/www/html/admin/scripts/js/interfaces.js
sudo rpl --encoding UTF-8 'RX dropped: \$' 'RX verworfen: $' /var/www/html/admin/scripts/js/interfaces.js
sudo rpl --encoding UTF-8 'TX packets: \$' 'TX Pakete: $' /var/www/html/admin/scripts/js/interfaces.js
sudo rpl --encoding UTF-8 'TX errors: \$' 'TX Fehler: $' /var/www/html/admin/scripts/js/interfaces.js
sudo rpl --encoding UTF-8 'TX dropped: \$' 'TX verworfen: $' /var/www/html/admin/scripts/js/interfaces.js
sudo rpl --encoding UTF-8 'Collisions: \$' 'Kollisionen: $' /var/www/html/admin/scripts/js/interfaces.js
sudo rpl --encoding UTF-8 '"Further details"' '"Weitere Details"' /var/www/html/admin/scripts/js/interfaces.js
sudo rpl --encoding UTF-8 'Carrier: ' 'Betreiber: ' /var/www/html/admin/scripts/js/interfaces.js
sudo rpl --encoding UTF-8 'Connected</span>' 'Verbunden</span>' /var/www/html/admin/scripts/js/interfaces.js
sudo rpl --encoding UTF-8 'Disconnected</span>' 'Nicht verbunden</span>' /var/www/html/admin/scripts/js/interfaces.js
sudo rpl --encoding UTF-8 'State: \$' 'Status: $' /var/www/html/admin/scripts/js/interfaces.js
sudo rpl --encoding UTF-8 'Parent device: <code>' 'Übergeordnetes Gerät: <code>' /var/www/html/admin/scripts/js/interfaces.js
sudo rpl --encoding UTF-8 'Carrier changes: \$' 'Betreiberwechsel: $' /var/www/html/admin/scripts/js/interfaces.js
sudo rpl --encoding UTF-8 'Broadcast: <code>' 'Übertragung: <code>' /var/www/html/admin/scripts/js/interfaces.js
sudo rpl --encoding UTF-8 ' bytes, ' ' Bytes, ' /var/www/html/admin/scripts/js/interfaces.js
sudo rpl --encoding UTF-8 'TX queue length: \$' 'TX Länge der Warteschlange: $' /var/www/html/admin/scripts/js/interfaces.js
sudo rpl --encoding UTF-8 'Promiscuity mode: \$' 'Promiskuität-Modus: $' /var/www/html/admin/scripts/js/interfaces.js
sudo rpl --encoding UTF-8 '"Yes" : "No"' '"Ja" : "Nein"' /var/www/html/admin/scripts/js/interfaces.js
sudo rpl --encoding UTF-8 'Scheduler: \$' 'Planer: $' /var/www/html/admin/scripts/js/interfaces.js



# /var/www/html/admin/scripts/js/ip-address-sorting.js
# noch nichts zu übersetzen
# sudo rpl --encoding UTF-8 '' '' /var/www/html/admin/scripts/js/ip-address-sorting.js



# /var/www/html/admin/scripts/js/login.js
sudo rpl --encoding UTF-8 'Invalid 2FA token' 'Fehlerhafter 2FA token' /var/www/html/admin/scripts/js/login.js
sudo rpl --encoding UTF-8 'Wrong password!' 'Falsches Passwort!' /var/www/html/admin/scripts/js/login.js
sudo rpl --encoding UTF-8 'Show password as plain text. Warning: this will display your password on the screen' 'Passwort als Klartext anzeigen. Achtung: Ihr Kennwort wird auf dem Bildschirm angezeigt.' /var/www/html/admin/scripts/js/login.js



# /var/www/html/admin/scripts/js/logout.js
# noch nichts zu übersetzen
# sudo rpl --encoding UTF-8 '' '' /var/www/html/admin/scripts/js/logout.js



# /var/www/html/admin/scripts/js/messages.js
sudo rpl --encoding UTF-8 '"Select All"' '"Alle auswählen"' /var/www/html/admin/scripts/js/messages.js
sudo rpl --encoding UTF-8 '"Deselect All"' '"Alle abwählen"' /var/www/html/admin/scripts/js/messages.js
sudo rpl --encoding UTF-8 '"Delete Selected"' '"Ausgewählte löschen"' /var/www/html/admin/scripts/js/messages.js
sudo rpl --encoding UTF-8 '10, 25, 50, 100, "All"' '10, 25, 50, 100, "Alle"' /var/www/html/admin/scripts/js/messages.js
sudo rpl --encoding UTF-8 '"No issues found."' '"Keine Fehler gefunden"' /var/www/html/admin/scripts/js/messages.js
sudo rpl --encoding UTF-8 '"Deleting message..."' '"Lösche Nachricht ..."' /var/www/html/admin/scripts/js/messages.js
sudo rpl --encoding UTF-8 'Successfully deleted message' 'Nachricht erfolgreich gelöscht' /var/www/html/admin/scripts/js/messages.js
sudo rpl --encoding UTF-8 '"Error while deleting message: "' '"Fehler beim Löschen der Nachricht: "' /var/www/html/admin/scripts/js/messages.js



# /var/www/html/admin/scripts/js/network.js
sudo rpl --encoding UTF-8 'The server took too long to send the data.' 'Der Server hat zu lange gebraucht, um die Daten zu senden.' /var/www/html/admin/scripts/js/network.js
sudo rpl --encoding UTF-8 'An unknown error occurred while loading the data.' 'Beim Laden der Daten ist ein unbekannter Fehler aufgetreten.' /var/www/html/admin/scripts/js/network.js
sudo rpl --encoding UTF-8 'An error occurred while loading the data: Connection refused. Is FTL running\?' 'Beim Laden der Daten ist ein Fehler aufgetreten: Verbindung verweigert. Läuft FTL?' /var/www/html/admin/scripts/js/network.js
sudo rpl --encoding UTF-8 'Deleting network table entry...' 'lösche den Netzwerk Tabellen Eintrag ...' /var/www/html/admin/scripts/js/network.js
sudo rpl --encoding UTF-8 'Successfully deleted network table entry' 'Erfolgreich den Netzwerk Tabellen Eintrag gelöscht' /var/www/html/admin/scripts/js/network.js
sudo rpl --encoding UTF-8 'Error while deleting network table entry with ID' 'Fehler beim Löschen des Netzwerk Tabellen Eintrags mit der ID' /var/www/html/admin/scripts/js/network.js
sudo rpl --encoding UTF-8 'text\("Never"\)' 'text("Noch nie")' /var/www/html/admin/scripts/js/network.js
sudo rpl --encoding UTF-8 'Mock MAC address' 'Mock MAC Adresse' /var/www/html/admin/scripts/js/network.js
sudo rpl --encoding UTF-8 '10, 25, 50, 100, "All"' '10, 25, 50, 100, "Alle"' /var/www/html/admin/scripts/js/network.js
sudo rpl --encoding UTF-8 '' '' /var/www/html/admin/scripts/js/network.js



# /var/www/html/admin/scripts/js/queries.js
sudo rpl --encoding UTF-8 '"Last 10 Minutes":' '"Letzten 10 Minuten":' /var/www/html/admin/scripts/js/queries.js
sudo rpl --encoding UTF-8 '"Last Hour":' '"Letzte Stunde":' /var/www/html/admin/scripts/js/queries.js
sudo rpl --encoding UTF-8 'Today: ' 'Heute: ' /var/www/html/admin/scripts/js/queries.js
sudo rpl --encoding UTF-8 'Yesterday: ' 'Gestern: ' /var/www/html/admin/scripts/js/queries.js
sudo rpl --encoding UTF-8 '"Last 7 Days":' '"Letzten 7 Tage":' /var/www/html/admin/scripts/js/queries.js
sudo rpl --encoding UTF-8 '"Last 30 Days":' '"Letzten 30 Tage":' /var/www/html/admin/scripts/js/queries.js
sudo rpl --encoding UTF-8 '"This Month":' '"Dieser Monat":' /var/www/html/admin/scripts/js/queries.js
sudo rpl --encoding UTF-8 '"Last Month":' '"Letzter Monat":' /var/www/html/admin/scripts/js/queries.js
sudo rpl --encoding UTF-8 '"This Year":' '"Dieses Jahr":' /var/www/html/admin/scripts/js/queries.js
sudo rpl --encoding UTF-8 '"All Time"' '"Gesamter Zeitraum"' /var/www/html/admin/scripts/js/queries.js
sudo rpl --encoding UTF-8 'The server took too long to send the data.' 'Der Server hat zu lange gebraucht, um die Daten zu senden.' /var/www/html/admin/scripts/js/queries.js
sudo rpl --encoding UTF-8 'An unknown error occurred while loading the data.' 'Beim Laden der Daten ist ein unbekannter Fehler aufgetreten.' /var/www/html/admin/scripts/js/queries.js
sudo rpl --encoding UTF-8 'Blocked \(gravity\)' 'Geblockt (Gravity)' /var/www/html/admin/scripts/js/queries.js
sudo rpl --encoding UTF-8 'Allow</button>' 'Erlauben</button>' /var/www/html/admin/scripts/js/queries.js
sudo rpl --encoding UTF-8 '"Forwarded, reply from "' '"Weitergeleitet, Antwort von "' /var/www/html/admin/scripts/js/queries.js
sudo rpl --encoding UTF-8 '"Forwarded to "' '"Weitergeleitet zur Adresse "' /var/www/html/admin/scripts/js/queries.js
sudo rpl --encoding UTF-8 'Deny</button>' 'Verbieten</button>' /var/www/html/admin/scripts/js/queries.js
sudo rpl --encoding UTF-8 '"Served from cache"' '"Aus dem Zwischenspeicher geholt"' /var/www/html/admin/scripts/js/queries.js
sudo rpl --encoding UTF-8 '"Blocked \(regex\)"' '"Geblockt (RegEx)"' /var/www/html/admin/scripts/js/queries.js
sudo rpl --encoding UTF-8 '"Blocked \(exact\)"' '"Geblockt (Exakt)"' /var/www/html/admin/scripts/js/queries.js
sudo rpl --encoding UTF-8 '"Blocked \(external, IP\)"' '"Geblockt (extern, IP)"' /var/www/html/admin/scripts/js/queries.js
sudo rpl --encoding UTF-8 '"Blocked \(external, NULL\)"' '"Geblockt (extern, NULL)"' /var/www/html/admin/scripts/js/queries.js
sudo rpl --encoding UTF-8 '"Blocked \(external, NXRA\)"' '"Geblockt (extern, NXRA)"' /var/www/html/admin/scripts/js/queries.js
sudo rpl --encoding UTF-8 'Blocked \(external, EDE15\)' 'Gebockt (extern, EDE15)' /var/www/html/admin/scripts/js/queries.js
sudo rpl --encoding UTF-8 '"Blocked \(gravity, CNAME\)"' '"Geblockt (Gravity, CNAME)"' /var/www/html/admin/scripts/js/queries.js
sudo rpl --encoding UTF-8 '"Blocked \(regex denied, CNAME\)"' '"Geblockt (RegEx verweigert, CNAME)"' /var/www/html/admin/scripts/js/queries.js
sudo rpl --encoding UTF-8 '"Blocked \(exact denied, CNAME\)"' '"Geblockt (Exakt verweigert, CNAME)"' /var/www/html/admin/scripts/js/queries.js
sudo rpl --encoding UTF-8 'fieldtext = "Retried"' 'fieldtext = "Erneut versucht"' /var/www/html/admin/scripts/js/queries.js
sudo rpl --encoding UTF-8 '"Retried \(ignored\)"' '"Erneut versucht (ignored)"' /var/www/html/admin/scripts/js/queries.js
sudo rpl --encoding UTF-8 '"Already forwarded, awaiting reply"' '"Bereits weitergeleitet, erwarte Antwort"' /var/www/html/admin/scripts/js/queries.js
sudo rpl --encoding UTF-8 '"Served by cache optimizer"' '"Bereitgestellt vom Zwischenspeicher-Optimierer"' /var/www/html/admin/scripts/js/queries.js
sudo rpl --encoding UTF-8 '"Query Status:' '"Status der Abfrage:' /var/www/html/admin/scripts/js/queries.js
sudo rpl --encoding UTF-8 'Query was \$' 'Anfrage war $' /var/www/html/admin/scripts/js/queries.js
sudo rpl --encoding UTF-8 'Query was blocked during CNAME inspection of' 'Die Anfrage wurde bei der CNAME-Prüfung von' /var/www/html/admin/scripts/js/queries.js
sudo rpl --encoding UTF-8 'Time-to-live \(TTL\):' 'Lebensdauer (TTL):' /var/www/html/admin/scripts/js/queries.js
sudo rpl --encoding UTF-8 '"Client:' '"Gerät:' /var/www/html/admin/scripts/js/queries.js
sudo rpl --encoding UTF-8 'DNSSEC status:' 'DNSSEC-Status:' /var/www/html/admin/scripts/js/queries.js
sudo rpl --encoding UTF-8 '"Database ID:' '"Datenbank ID:' /var/www/html/admin/scripts/js/queries.js
sudo rpl --encoding UTF-8 '"Reply:' '"Antwort:' /var/www/html/admin/scripts/js/queries.js
sudo rpl --encoding UTF-8 '"Query received on:' '"Anfrage erhalten am:' /var/www/html/admin/scripts/js/queries.js
sudo rpl --encoding UTF-8 '"Select..."' '"Auswählen ..."' /var/www/html/admin/scripts/js/queries.js
sudo rpl --encoding UTF-8 '\(blocked "' '(geblockt "' /var/www/html/admin/scripts/js/queries.js



# /var/www/html/admin/scripts/js/search.js
sudo rpl --encoding UTF-8 '"partially" : "exactly"' '"teilweise" : "genau"' /var/www/html/admin/scripts/js/search.js
sudo rpl --encoding UTF-8 '"Found " \+' '"Gefunden in " +' /var/www/html/admin/scripts/js/search.js
sudo rpl --encoding UTF-8 '" domain" \+' '" Domai" +' /var/www/html/admin/scripts/js/search.js
sudo rpl --encoding UTF-8 '\(numDomains \!== 1 \? "s" \: ""\)' '(numDomains !== 1 ? "ns," : "n,")' /var/www/html/admin/scripts/js/search.js
sudo rpl --encoding UTF-8 '</em> matching ' '</em> übereinstimmend ' /var/www/html/admin/scripts/js/search.js
sudo rpl --encoding UTF-8 'added:         ' 'hinzugefügt am:           ' /var/www/html/admin/scripts/js/search.js
sudo rpl --encoding UTF-8 ', "display"\) \+' ', "display") + " Uhr" +' /var/www/html/admin/scripts/js/search.js
sudo rpl --encoding UTF-8 'last modified: "' 'zuletzt geändert am:      "' /var/www/html/admin/scripts/js/search.js
sudo rpl --encoding UTF-8 '" domains\)"' '" Domains)"' /var/www/html/admin/scripts/js/search.js
sudo rpl --encoding UTF-8 'enabled" : "disabled' 'aktiviert" : "deaktiviert' /var/www/html/admin/scripts/js/search.js
sudo rpl --encoding UTF-8 ' used in "' ' benutzt in "' /var/www/html/admin/scripts/js/search.js
sudo rpl --encoding UTF-8 '" group" ' '" Gruppe" ' /var/www/html/admin/scripts/js/search.js
sudo rpl --encoding UTF-8 '\(domain.groups.length === 1 \? "" \: "s"\)' '(domain.groups.length === 1 ? "" : "n")' /var/www/html/admin/scripts/js/search.js
sudo rpl --encoding UTF-8 'comment: "' 'Anmerkung: "' /var/www/html/admin/scripts/js/search.js
sudo rpl --encoding UTF-8 'no comment"' 'keine Hinweise"' /var/www/html/admin/scripts/js/search.js
sudo rpl --encoding UTF-8 '" list" \+' '" List" +' /var/www/html/admin/scripts/js/search.js
sudo rpl --encoding UTF-8 '\(numLists \!== 1 \? "s" \: ""\)' '(numLists !== 1 ? "en," : "e,")' /var/www/html/admin/scripts/js/search.js
sudo rpl --encoding UTF-8 'last updated:' 'zuletzt aktualisiert am:' /var/www/html/admin/scripts/js/search.js
sudo rpl --encoding UTF-8 'matching entries:' 'übereinstimmende Einträge:' /var/www/html/admin/scripts/js/search.js
sudo rpl --encoding UTF-8 'Number of results per type:' 'Anzahl der Ergebnisse pro Typ:' /var/www/html/admin/scripts/js/search.js
sudo rpl --encoding UTF-8 'exact domain matches' 'genaue Domainübereinstimmungen' /var/www/html/admin/scripts/js/search.js
sudo rpl --encoding UTF-8 'regex domain matches' 'RegEx Domainübereinstimmungen' /var/www/html/admin/scripts/js/search.js
sudo rpl --encoding UTF-8 'allowlist \(antigravity\) matches' 'Whitelist Übereinstimmungen (Anti-Gravity) ' /var/www/html/admin/scripts/js/search.js
sudo rpl --encoding UTF-8 'blocklist \(gravity\) matches' 'Blacklist Übereinstimmungen (Gravity-Datenbank)' /var/www/html/admin/scripts/js/search.js
sudo rpl --encoding UTF-8 'Note:</strong>' 'Hinweis:</strong>' /var/www/html/admin/scripts/js/search.js
sudo rpl --encoding UTF-8 'The number of results to return per type is limited to' 'Die Anzahl der Ergebnisse, die pro Typ zurückgegeben werden, ist auf' /var/www/html/admin/scripts/js/search.js
sudo rpl --encoding UTF-8 ' entries.<br>' ' Einträge begrenzt.<br>' /var/www/html/admin/scripts/js/search.js
sudo rpl --encoding UTF-8 'There are "' '   Insgesamt gibt es "' /var/www/html/admin/scripts/js/search.js
sudo rpl --encoding UTF-8 ' matching entries in total.' ' übereinstimmende Einträge.' /var/www/html/admin/scripts/js/search.js
sudo rpl --encoding UTF-8 'Consider "' '   Benutzen Sie "' /var/www/html/admin/scripts/js/search.js
sudo rpl --encoding UTF-8 'using a more specific search term or increase N.' 'bitte einen spezifischeren Suchbegriff.' /var/www/html/admin/scripts/js/search.js



# /var/www/html/admin/scripts/js/settings.js
sudo rpl --encoding UTF-8 'Expert level setting' 'Einstellung auf Expertenebene' /var/www/html/admin/scripts/js/settings.js
sudo rpl --encoding UTF-8 'Setting requires FTL restart on change' 'Einstellung erfordert bei Änderung einen FTL-Neustart' /var/www/html/admin/scripts/js/settings.js
sudo rpl --encoding UTF-8 'Settings overwritten by an environmental variable are read-only' 'Einstellungen, die durch eine Umgebungsvariable überschrieben werden, sind schreibgeschützt.' /var/www/html/admin/scripts/js/settings.js
sudo rpl --encoding UTF-8 'Successfully saved and applied settings' 'Die Einstellungen wurden erfolgreich gespeichert und angewendet.' /var/www/html/admin/scripts/js/settings.js
sudo rpl --encoding UTF-8 'Error while applying settings' 'Fehler beim Anwenden der Einstellungen' /var/www/html/admin/scripts/js/settings.js



# /var/www/html/admin/scripts/js/settings-advanced.js
sudo rpl --encoding UTF-8 'Available options:' 'Verfügbare Optionen:' /var/www/html/admin/scripts/js/settings-advanced.js
sudo rpl --encoding UTF-8 'Allowed value:' 'Zulässiger Wert:' /var/www/html/admin/scripts/js/settings-advanced.js
sudo rpl --encoding UTF-8 'Modified from default' 'Geändert vom Standard' /var/www/html/admin/scripts/js/settings-advanced.js
sudo rpl --encoding UTF-8 'Setting requires FTL restart on change' 'Die Einstellung erfordert bei Änderung einen FTL-Neustart' /var/www/html/admin/scripts/js/settings-advanced.js
sudo rpl --encoding UTF-8 'Settings overwritten by an environmental variable are read-only' 'Einstellungen, die durch eine Umgebungsvariable überschrieben werden, sind schreibgeschützt.' /var/www/html/admin/scripts/js/settings-advanced.js
sudo rpl --encoding UTF-8 'Default Value:' 'Standardwert:' /var/www/html/admin/scripts/js/settings-advanced.js
sudo rpl --encoding UTF-8 '>Value ' '>Wert ' /var/www/html/admin/scripts/js/settings-advanced.js
sudo rpl --encoding UTF-8 '<small>\(string\)' '<small>(Zeichenkette)' /var/www/html/admin/scripts/js/settings-advanced.js
sudo rpl --encoding UTF-8 '>Value</label>' '>Wert</label>' /var/www/html/admin/scripts/js/settings-advanced.js
sudo rpl --encoding UTF-8 '<small>\(integer\)' '<small>(Ganzzahl)' /var/www/html/admin/scripts/js/settings-advanced.js
sudo rpl --encoding UTF-8 '<small>\(unsigned integer\)' '<small>(unsignierte Ganzzahl)' /var/www/html/admin/scripts/js/settings-advanced.js
sudo rpl --encoding UTF-8 '<small>\(unsigned 16bit integer\)' '<small>(unsignierte 16-Bit-Ganzzahl)' /var/www/html/admin/scripts/js/settings-advanced.js
sudo rpl --encoding UTF-8 '>Values <small>\(one item per line\)' '>Werte <small>(ein Wert pro Zeile)' /var/www/html/admin/scripts/js/settings-advanced.js
sudo rpl --encoding UTF-8 '"Modified settings"' '"Geänderte Einstellungen"' /var/www/html/admin/scripts/js/settings-advanced.js
sudo rpl --encoding UTF-8 '"All settings"' '"Alle Einstellungen"' /var/www/html/admin/scripts/js/settings-advanced.js



echo -e "${blaufett}   75 % ...${standard}"
echo
echo



# /var/www/html/admin/scripts/js/settings-api.js
sudo rpl --encoding UTF-8 '" title="Delete ' '" title="Lösche ' /var/www/html/admin/scripts/js/settings-api.js
sudo rpl --encoding UTF-8 '"your current session' '"Ihre aktuelle Sitzung.' /var/www/html/admin/scripts/js/settings-api.js
sudo rpl --encoding UTF-8 'WARNING: This will require you to re-login"' 'Achtung: Dazu müssen Sie sich erneut "' /var/www/html/admin/scripts/js/settings-api.js
sudo rpl --encoding UTF-8 '"this session"' '"zu dieser Sitzung anmelden."' /var/www/html/admin/scripts/js/settings-api.js
sudo rpl --encoding UTF-8 'This is the session you are currently using for the web interface' 'Dies ist die Sitzung, die Sie derzeit für die Weboberfläche verwenden.' /var/www/html/admin/scripts/js/settings-api.js
sudo rpl --encoding UTF-8 'Session is PARTIALLY end-to-end encrypted' 'Die Sitzung ist TEILWEISE Ende-zu-Ende-verschlüsselt.' /var/www/html/admin/scripts/js/settings-api.js
sudo rpl --encoding UTF-8 'Session is end-to-end encrypted \(TLS/SSL\)' 'Die Sitzung ist Ende-zu-Ende verschlüsselt (TLS/SSL).' /var/www/html/admin/scripts/js/settings-api.js
sudo rpl --encoding UTF-8 'Session is NOT end-to-end encrypted \(TLS/SSL\)' 'Sitzung ist NICHT Ende-zu-Ende-verschlüsselt (TLS/SSL).' /var/www/html/admin/scripts/js/settings-api.js
sudo rpl --encoding UTF-8 '"Select All"' '"Alle auswählen"' /var/www/html/admin/scripts/js/settings-api.js
sudo rpl --encoding UTF-8 '"Deselect All"' '"Alle abwählen"' /var/www/html/admin/scripts/js/settings-api.js
sudo rpl --encoding UTF-8 '"Delete Selected"' '"Ausgewählte löschen"' /var/www/html/admin/scripts/js/settings-api.js
sudo rpl --encoding UTF-8 '10, 25, 50, 100, "All"' '10, 25, 50, 100, "Alle"' /var/www/html/admin/scripts/js/settings-api.js
sudo rpl --encoding UTF-8 'No active sessions found.' 'Keine aktiven Sitzungen gefunden.' /var/www/html/admin/scripts/js/settings-api.js
sudo rpl --encoding UTF-8 'App password has been ' 'Das Passwort der App wurde ' /var/www/html/admin/scripts/js/settings-api.js
sudo rpl --encoding UTF-8 '", you "' '", Sie "' /var/www/html/admin/scripts/js/settings-api.js
sudo rpl --encoding UTF-8 '" need to re-login to continue using the web interface."' '" müssen sich neu anmelden, um die Weboberfläche weiter nutzen zu können."' /var/www/html/admin/scripts/js/settings-api.js
sudo rpl --encoding UTF-8 'Two-factor authentication has been ' 'Die Zwei-Faktor-Authentifizierung wurde ' /var/www/html/admin/scripts/js/settings-api.js
sudo rpl --encoding UTF-8 ', you will need to re-login to continue using the web interface.' 'müssen Sie sich erneut anmelden, um die Weboberfläche weiter nutzen zu können.' /var/www/html/admin/scripts/js/settings-api.js
sudo rpl --encoding UTF-8 'Are you sure you want to disable 2FA authentication on your Pi-hole\?' 'Sind Sie sicher, dass Sie die 2FA-Authentifizierung auf Ihrem Pi-hole deaktivieren möchten?' /var/www/html/admin/scripts/js/settings-api.js
sudo rpl --encoding UTF-8 'Confirmation required' 'Bestätigung erforderlich' /var/www/html/admin/scripts/js/settings-api.js
sudo rpl --encoding UTF-8 'Yes, disable 2FA' 'Ja, deaktiviere die 2FA' /var/www/html/admin/scripts/js/settings-api.js
sudo rpl --encoding UTF-8 'No, keep 2FA enabled' 'Nein, 2FA aktiviert lassen' /var/www/html/admin/scripts/js/settings-api.js



# /var/www/html/admin/scripts/js/settings-dhcp.js
sudo rpl --encoding UTF-8 '"Select All"' '"Alle auswählen"' /var/www/html/admin/scripts/js/settings-dhcp.js
sudo rpl --encoding UTF-8 '"Deselect All"' '"Alle abwählen"' /var/www/html/admin/scripts/js/settings-dhcp.js
sudo rpl --encoding UTF-8 '"Delete Selected"' '"Ausgewählte löschen"' /var/www/html/admin/scripts/js/settings-dhcp.js
sudo rpl --encoding UTF-8 '10, 25, 50, 100, "All"' '10, 25, 50, 100, "Alle"' /var/www/html/admin/scripts/js/settings-dhcp.js
sudo rpl --encoding UTF-8 'No DHCP leases found.' 'Keine DHCP-Vergaben gefunden.' /var/www/html/admin/scripts/js/settings-dhcp.js
sudo rpl --encoding UTF-8 'Deleting lease...' 'Lösche DHCP-Vergaben ...' /var/www/html/admin/scripts/js/settings-dhcp.js
sudo rpl --encoding UTF-8 'Successfully deleted lease' 'DHCP-Vergabe erfolgreich gelöscht' /var/www/html/admin/scripts/js/settings-dhcp.js
sudo rpl --encoding UTF-8 'Error while deleting lease: ' 'Fehler beim Löschen der DHCP-Vergabe: ' /var/www/html/admin/scripts/js/settings-dhcp.js



# /var/www/html/admin/scripts/js/settings-dns.js
sudo rpl --encoding UTF-8 ' " custom server" ' ' " benutzerdefinierte" ' /var/www/html/admin/scripts/js/settings-dns.js
sudo rpl --encoding UTF-8 '"" : "s"\) \+ " enabled\)"' '"r" : "") + " Server aktiviert)"' /var/www/html/admin/scripts/js/settings-dns.js



# /var/www/html/admin/scripts/js/settings-dns-records.js
sudo rpl --encoding UTF-8 '10, 25, 50, 100, "All"' '10, 25, 50, 100, "Alle"' /var/www/html/admin/scripts/js/settings-dns-records.js
sudo rpl --encoding UTF-8 'No local DNS records defined.' 'Es sind keine lokalen DNS-Einträge definiert.' /var/www/html/admin/scripts/js/settings-dns-records.js
sudo rpl --encoding UTF-8 'No local CNAME records defined.' 'Es sind keine lokalen CNAME-Einträge definiert.' /var/www/html/admin/scripts/js/settings-dns-records.js
sudo rpl --encoding UTF-8 'Deleting DNS record...' 'Lösche den DNS-Eintrag ...' /var/www/html/admin/scripts/js/settings-dns-records.js
sudo rpl --encoding UTF-8 'Successfully deleted DNS record' 'Erfolgreich den DNS-Eintrag gelöscht.' /var/www/html/admin/scripts/js/settings-dns-records.js
sudo rpl --encoding UTF-8 'Error while deleting DNS record: ' 'Fehler beim Löschen des DNS-Eintrags: ' /var/www/html/admin/scripts/js/settings-dns-records.js
sudo rpl --encoding UTF-8 'Deleting local CNAME record...' 'Lösche lokalen CNAME-Eintrag ...' /var/www/html/admin/scripts/js/settings-dns-records.js
sudo rpl --encoding UTF-8 'Successfully deleted local CNAME record' 'Erfolgreich den lokalen CNAME-Eintrag gelöscht.' /var/www/html/admin/scripts/js/settings-dns-records.js
sudo rpl --encoding UTF-8 'Error while deleting CNAME record: ' 'Fehler beim Löschen des CNAME-Eintrags: ' /var/www/html/admin/scripts/js/settings-dns-records.js
sudo rpl --encoding UTF-8 'Adding DNS record...' 'Hinzufügen eines DNS-Eintrags ...' /var/www/html/admin/scripts/js/settings-dns-records.js
sudo rpl --encoding UTF-8 'Successfully added DNS record' 'Erfolgreich einen DNS-Eintrag hinzugefügt.' /var/www/html/admin/scripts/js/settings-dns-records.js
sudo rpl --encoding UTF-8 'Error while adding DNS record' 'Fehler beim Hinzufügen des DNS-Eintrags' /var/www/html/admin/scripts/js/settings-dns-records.js
sudo rpl --encoding UTF-8 'Successfully added CNAME record' 'Erfolgreich den CNAME-Eintrag hinzugefügt.' /var/www/html/admin/scripts/js/settings-dns-records.js
sudo rpl --encoding UTF-8 'Error while adding CNAME record' 'Fehler beim Hinzufügen des CNAME-Eintrags.' /var/www/html/admin/scripts/js/settings-dns-records.js
sudo rpl --encoding UTF-8 'in seconds <em>' 'in Sekunden <em>' /var/www/html/admin/scripts/js/settings-dns-records.js



# /var/www/html/admin/scripts/js/settings-privacy.js
# noch nichts zu übersetzen
# sudo rpl --encoding UTF-8 '' '' /var/www/html/admin/scripts/js/settings-privacy.js



# /var/www/html/admin/scripts/js/settings-system.js
sudo rpl --encoding UTF-8 'records in cache:' 'Einträge im Zwischenspeicher:' /var/www/html/admin/scripts/js/settings-system.js
sudo rpl --encoding UTF-8 '"Disable query logging"' '"Deaktiviere Anfrageprotokollierung"' /var/www/html/admin/scripts/js/settings-system.js
sudo rpl --encoding UTF-8 '"Enable query logging"' '"Aktiviere Anfrageprotokollierung"' /var/www/html/admin/scripts/js/settings-system.js
sudo rpl --encoding UTF-8 'Are you sure you want to send a restart command to your DNS server\?' 'Sind Sie sicher, dass Sie den DNS-Server neu starten wollen?' /var/www/html/admin/scripts/js/settings-system.js
sudo rpl --encoding UTF-8 'This will clear the DNS cache and may temporarily interrupt your internet connection.' 'Dadurch wird der DNS-Cache gelöscht und Ihre Internetverbindung kann vorübergehend unterbrochen werden.' /var/www/html/admin/scripts/js/settings-system.js
sudo rpl --encoding UTF-8 'Furthermore, you will be logged out of the web interface as consequence of this action.' 'Außerdem werden Sie infolge dieser Aktion von der Weboberfläche abgemeldet.' /var/www/html/admin/scripts/js/settings-system.js
sudo rpl --encoding UTF-8 'Confirmation required' 'Bestätigung erforderlich' /var/www/html/admin/scripts/js/settings-system.js
sudo rpl --encoding UTF-8 'Yes, restart DNS server' 'Ja, Neustart des DNS-Servers' /var/www/html/admin/scripts/js/settings-system.js
sudo rpl --encoding UTF-8 'No, go back' 'Nein, zurück' /var/www/html/admin/scripts/js/settings-system.js
sudo rpl --encoding UTF-8 'Are you sure you want to flush your logs\?' 'Sind Sie sicher, dass Sie Ihre Protokolle löschen möchten?' /var/www/html/admin/scripts/js/settings-system.js
sudo rpl --encoding UTF-8 'This will clear all logs and cannot be undone.' 'Dies löscht alle Protokolle und kann nicht rückgängig gemacht werden.' /var/www/html/admin/scripts/js/settings-system.js
sudo rpl --encoding UTF-8 'Yes, flush logs' 'Ja, lösche die Protokolle' /var/www/html/admin/scripts/js/settings-system.js
sudo rpl --encoding UTF-8 'Are you sure you want to flush your network table\?' 'Sind Sie sicher, dass Sie Ihre Netzwerk-Tabelle leeren möchten?' /var/www/html/admin/scripts/js/settings-system.js
sudo rpl --encoding UTF-8 'This will clear all entries and cannot be undone.' 'Dadurch werden alle Einträge gelöscht und können nicht rückgängig gemacht werden.' /var/www/html/admin/scripts/js/settings-system.js
sudo rpl --encoding UTF-8 'Yes, flush my network table' 'Ja, lösche meine Netzwerk-Tabelle' /var/www/html/admin/scripts/js/settings-system.js
sudo rpl --encoding UTF-8 'Are you sure you want to switch query logging mode\?' 'Sind Sie sicher, dass Sie in den Protokollierungsmodus wechseln möchten?' /var/www/html/admin/scripts/js/settings-system.js
sudo rpl --encoding UTF-8 'This will restart the DNS server.' 'Dies startet den DNS-Server neu.' /var/www/html/admin/scripts/js/settings-system.js
sudo rpl --encoding UTF-8 'As consequence of this action, your DNS cache will be cleared and you may temporarily lose your internet connection.' 'Infolge dieser Aktion wird Ihr DNS-Cache geleert und Sie können vorübergehend Ihre Internetverbindung verlieren.' /var/www/html/admin/scripts/js/settings-system.js
sudo rpl --encoding UTF-8 'Furthermore, you will be logged out of the web interface.' 'Außerdem werden Sie von der Weboberfläche abgemeldet.' /var/www/html/admin/scripts/js/settings-system.js
sudo rpl --encoding UTF-8 'Yes, change query logging' 'Ja, zur Anfrageprotokollierng wechseln' /var/www/html/admin/scripts/js/settings-system.js
sudo rpl --encoding UTF-8 'return "Cache content"' 'return "Zwischenspeicher"' /var/www/html/admin/scripts/js/settings-system.js



# /var/www/html/admin/scripts/js/settings-teleporter.js
sudo rpl --encoding UTF-8 'Please select a file to import.' 'Bitte wählen Sie eine Datei zum Importieren aus.' /var/www/html/admin/scripts/js/settings-teleporter.js
sudo rpl --encoding UTF-8 '"Import successful"' '"Import erfolgreich"' /var/www/html/admin/scripts/js/settings-teleporter.js
sudo rpl --encoding UTF-8 'Processed files:' 'Verarbeitete Dateien:' /var/www/html/admin/scripts/js/settings-teleporter.js
sudo rpl --encoding UTF-8 'An unexpected error occurred.' 'Ein unerwarteter Fehler trat auf.' /var/www/html/admin/scripts/js/settings-teleporter.js



# /var/www/html/admin/scripts/js/taillog.js
sudo rpl --encoding UTF-8 'Invalid file parameter: \$' 'Ungültiger Dateiparameter: $' /var/www/html/admin/scripts/js/taillog.js
sudo rpl --encoding UTF-8 'Allowed values are: ' 'Zulässige Werte sind: ' /var/www/html/admin/scripts/js/taillog.js
sudo rpl --encoding UTF-8 ' Error: ' ' Fehler: ' /var/www/html/admin/scripts/js/taillog.js
sudo rpl --encoding UTF-8 '\*\*\* FTL restarted \*\*\*' '*** FTL wurde neu gestartet ***' /var/www/html/admin/scripts/js/taillog.js
sudo rpl --encoding UTF-8 '\*\*\* Log file is empty \*\*\*' '*** Die Protokolldatei ist leer. ***' /var/www/html/admin/scripts/js/taillog.js
sudo rpl --encoding UTF-8 'YYYY-MM-DD HH:mm:ss.SSS' 'DD.MM.YYYY - HH:mm:ss' /var/www/html/admin/scripts/js/taillog.js
sudo rpl --encoding UTF-8 '"Paused"' '"Pause"' /var/www/html/admin/scripts/js/taillog.js



# /var/www/html/admin/scripts/js/utils.js
sudo rpl --encoding UTF-8 'Error, something went wrong!' 'Fehler, etwas ist schief gelaufen!' /var/www/html/admin/scripts/js/utils.js
sudo rpl --encoding UTF-8 'Unknown alert type: ' 'Unbekannte Alarmart:' /var/www/html/admin/scripts/js/utils.js
sudo rpl --encoding UTF-8 'Added from Query Log' 'Vom Anfrageprotokoll hinzugefügt' /var/www/html/admin/scripts/js/utils.js
sudo rpl --encoding UTF-8 '\{formattedPercentage\} of ' '{formattedPercentage} von ' /var/www/html/admin/scripts/js/utils.js
sudo rpl --encoding UTF-8 'Access "Tools/Pi-hole diagnosis" for further details' 'Weitere Einzelheiten finden Sie unter "Tools/Pi-hole Diganose"' /var/www/html/admin/scripts/js/utils.js
sudo rpl --encoding UTF-8 '"There are "' '"Dort sind "' /var/www/html/admin/scripts/js/utils.js
sudo rpl --encoding UTF-8 '" warnings."' '" Warnungen."' /var/www/html/admin/scripts/js/utils.js
sudo rpl --encoding UTF-8 '"There is one warning."' '"Es gibt eine Warnung."' /var/www/html/admin/scripts/js/utils.js
sudo rpl --encoding UTF-8 'Successfully added "' 'Erfolgreich hinzugefügt "' /var/www/html/admin/scripts/js/utils.js
sudo rpl --encoding UTF-8 'Failed to add "' 'Hinzufügen fehlgeschlagen "' /var/www/html/admin/scripts/js/utils.js
sudo rpl --encoding UTF-8 'UNIQUE constraint failed' 'UNIQUE-Beschränkung ist fehlgeschlagen' /var/www/html/admin/scripts/js/utils.js
sudo rpl --encoding UTF-8 'Already present' 'Bereits vorhanden' /var/www/html/admin/scripts/js/utils.js
sudo rpl --encoding UTF-8 '"warning",' '"Warnung",' /var/www/html/admin/scripts/js/utils.js
sudo rpl --encoding UTF-8 '"Some " ' '"Einige " ' /var/www/html/admin/scripts/js/utils.js
sudo rpl --encoding UTF-8 '" could not be added "' '"konnten nicht hinzugefügt werden "' /var/www/html/admin/scripts/js/utils.js
sudo rpl --encoding UTF-8 'Pi-hole is currently applying your changes...' 'Pi-hole wendet Ihre Änderungen gerade an ...' /var/www/html/admin/scripts/js/utils.js



# /var/www/html/admin/scripts/lua/footer.lp
sudo rpl --encoding UTF-8 '"Close"><span' '"Schließen"><span' /var/www/html/admin/scripts/lua/footer.lp
sudo rpl --encoding UTF-8 'Custom disable timeout</h4>' 'Benutzerdefinierte Zeitüberschreitung deaktivieren</h4>' /var/www/html/admin/scripts/lua/footer.lp
sudo rpl --encoding UTF-8 '> Secs' '> Sek.' /var/www/html/admin/scripts/lua/footer.lp
sudo rpl --encoding UTF-8 '> Mins' '> Min.' /var/www/html/admin/scripts/lua/footer.lp
sudo rpl --encoding UTF-8 'Close</button>' 'Schließen</button>' /var/www/html/admin/scripts/lua/footer.lp
sudo rpl --encoding UTF-8 'Submit</button>' 'Absenden</button>' /var/www/html/admin/scripts/lua/footer.lp
sudo rpl --encoding UTF-8 '<strong><a href="https://pi-hole.net/donate/" rel="noopener noreferrer" target="_blank"><i class="fa fa-heart text-red"></i> Donate</a></strong> if you found this useful.' '<strong><a href="https://pi-hole.net/donate/" rel="noopener noreferrer" target="_blank"><i class="fa fa-heart text-red"></i> Spenden</a></strong> Sie bitte, wenn Sie Pi-hole nützlich finden.<br><a href="http://www.github.com/pimanDE/translate2german" rel="noopener" target="_blank"</a> <i class="fa fa-edit"></a></i> Übersetzt von <a href="https://github.com/pimanDE" rel="noopener" target="_blank"><strong>pimanDE</strong></a>.' /var/www/html/admin/scripts/lua/footer.lp



# /var/www/html/admin/scripts/lua/header.lp
# noch nichts zu übersetzen
# sudo rpl --encoding UTF-8 '' '' /var/www/html/admin/scripts/lua/header.lp



# /var/www/html/admin/scripts/lua/header_authenticated.lp
sudo rpl --encoding UTF-8 'JavaScript Is Disabled</h1><p>JavaScript is required for the site to function.' 'JavaScript ist deaktiviert.</h1><p>JavaScript ist jedoch erforderlich, damit die Webseite funktioniert.' /var/www/html/admin/scripts/lua/header_authenticated.lp
sudo rpl --encoding UTF-8 'To learn how to enable JavaScript click ' 'Um zu erfahren, wie Sie JavaScript aktivieren können, klicken Sie ' /var/www/html/admin/scripts/lua/header_authenticated.lp
sudo rpl --encoding UTF-8 'here</a></p><label for="js-hide">Close</label>' 'hier</a></p><label for="js-hide">Schließen</label>' /var/www/html/admin/scripts/lua/header_authenticated.lp
sudo rpl --encoding UTF-8 '"Toggle Navigation"' '"Navigation umschalten"' /var/www/html/admin/scripts/lua/header_authenticated.lp
sudo rpl --encoding UTF-8 'hostname:</span>' 'Rechnername:</span>' /var/www/html/admin/scripts/lua/header_authenticated.lp
sudo rpl --encoding UTF-8 'Open Source Ad Blocker' 'Quelloffener Ad Blocker' /var/www/html/admin/scripts/lua/header_authenticated.lp
sudo rpl --encoding UTF-8 'Pi-hole Website' 'Pi-hole Webseite' /var/www/html/admin/scripts/lua/header_authenticated.lp
sudo rpl --encoding UTF-8 'Documentation</a>' 'Dokumentation</a>' /var/www/html/admin/scripts/lua/header_authenticated.lp
sudo rpl --encoding UTF-8 'Pi-hole Discourse</a>' 'Pi-hole Forum</a>' /var/www/html/admin/scripts/lua/header_authenticated.lp
sudo rpl --encoding UTF-8 'Pi-hole Releases</a>' 'Pi-hole Veröffentlichungen</a>' /var/www/html/admin/scripts/lua/header_authenticated.lp



# /var/www/html/admin/scripts/lua/settings_header.lp
# noch nichts zu übersetzen
# sudo rpl --encoding UTF-8 '' '' /var/www/html/admin/scripts/lua/settings_header.lp



# /var/www/html/admin/scripts/lua/sidebar.lp
sudo rpl --encoding UTF-8 'Main</li>' 'Hauptmenü</li>' /var/www/html/admin/scripts/lua/sidebar.lp
sudo rpl --encoding UTF-8 'Dashboard</span>' 'Übersicht</span>' /var/www/html/admin/scripts/lua/sidebar.lp
sudo rpl --encoding UTF-8 'Query Log</span>' 'Anfragenprotokoll</span>' /var/www/html/admin/scripts/lua/sidebar.lp
sudo rpl --encoding UTF-8 'Group Management</li>' 'Gruppenverwaltung</li>' /var/www/html/admin/scripts/lua/sidebar.lp
sudo rpl --encoding UTF-8 '<span>Groups' '<span>Gruppen' /var/www/html/admin/scripts/lua/sidebar.lp
sudo rpl --encoding UTF-8 'Number of enabled groups' 'Anzahl der definierten Gruppen' /var/www/html/admin/scripts/lua/sidebar.lp
sudo rpl --encoding UTF-8 '<span>Clients' '<span>Geräte' /var/www/html/admin/scripts/lua/sidebar.lp
sudo rpl --encoding UTF-8 'Number of defined clients' 'Anzahl der definierten Geräte' /var/www/html/admin/scripts/lua/sidebar.lp
sudo rpl --encoding UTF-8 'Number of enabled deny rules \(domains and regex\)' 'Anzahl der nicht erlaubten Regeln (Domänen und RegEx)' /var/www/html/admin/scripts/lua/sidebar.lp
sudo rpl --encoding UTF-8 'Number of enabled allow rules \(domains and regex\)' 'Anzahl der erlaubten Regeln (Domains und RegEx)' /var/www/html/admin/scripts/lua/sidebar.lp
sudo rpl --encoding UTF-8 '<span>Lists' '<span>Blocklisten' /var/www/html/admin/scripts/lua/sidebar.lp
sudo rpl --encoding UTF-8 'Number of subscribed and enabled lists' 'Anzahl der abonnierten und aktivierten Listen' /var/www/html/admin/scripts/lua/sidebar.lp
sudo rpl --encoding UTF-8 'Total number of domains subscribed by your Pi-hole' 'Gesamtanzahl der von Pi-hole überwachten Domains' /var/www/html/admin/scripts/lua/sidebar.lp
sudo rpl --encoding UTF-8 'DNS Control</li>' 'DNS Kontrolle</li>' /var/www/html/admin/scripts/lua/sidebar.lp
sudo rpl --encoding UTF-8 '<span>Disable Blocking' '<span>Blocken ausschalten' /var/www/html/admin/scripts/lua/sidebar.lp
sudo rpl --encoding UTF-8 '</i> Indefinitely' '</i> Dauerhaft' /var/www/html/admin/scripts/lua/sidebar.lp
sudo rpl --encoding UTF-8 '</i> For 10 seconds' '</i> Für 10 Sekunden' /var/www/html/admin/scripts/lua/sidebar.lp
sudo rpl --encoding UTF-8 '</i> For 30 seconds' '</i> Für 30 Sekunden' /var/www/html/admin/scripts/lua/sidebar.lp
sudo rpl --encoding UTF-8 '</i> For 5 minutes' '</i> Für 5 Minuten' /var/www/html/admin/scripts/lua/sidebar.lp
sudo rpl --encoding UTF-8 '</i> Custom time' '</i> Benutzerdefinierte Zeit' /var/www/html/admin/scripts/lua/sidebar.lp
sudo rpl --encoding UTF-8 'Disable</span>' 'Deaktivieren</span>' /var/www/html/admin/scripts/lua/sidebar.lp
sudo rpl --encoding UTF-8 'Enable Blocking' 'Blocken einschalten' /var/www/html/admin/scripts/lua/sidebar.lp
sudo rpl --encoding UTF-8 'Settings</span>' 'Einstellungen</span>' /var/www/html/admin/scripts/lua/sidebar.lp
sudo rpl --encoding UTF-8 'Web interface / API</span>' 'Weboberfläche / API</span>' /var/www/html/admin/scripts/lua/sidebar.lp
sudo rpl --encoding UTF-8 'Privacy</span>' 'Privatsphäre</span>' /var/www/html/admin/scripts/lua/sidebar.lp
sudo rpl --encoding UTF-8 'Local DNS Records</span' 'Lokale DNS-Einträge</span' /var/www/html/admin/scripts/lua/sidebar.lp
sudo rpl --encoding UTF-8 'All settings</span>' 'Alle Einstellungen</span>' /var/www/html/admin/scripts/lua/sidebar.lp
sudo rpl --encoding UTF-8 'Tools</span>' 'Werkzeuge</span>' /var/www/html/admin/scripts/lua/sidebar.lp
sudo rpl --encoding UTF-8 'Pi-hole diagnosis</span>' 'Pi-hole Diagnose</span>' /var/www/html/admin/scripts/lua/sidebar.lp
sudo rpl --encoding UTF-8 'Tail log files</span>' 'Tail Protokolldateien</span>' /var/www/html/admin/scripts/lua/sidebar.lp
sudo rpl --encoding UTF-8 'Update Gravity</span>' 'Aktualisierung der Blocklisten</span>' /var/www/html/admin/scripts/lua/sidebar.lp
sudo rpl --encoding UTF-8 'Search Lists</span>' 'Blocklisten durchsuchen</span>' /var/www/html/admin/scripts/lua/sidebar.lp
sudo rpl --encoding UTF-8 'Network</span>' 'Netzwerk</span>' /var/www/html/admin/scripts/lua/sidebar.lp
sudo rpl --encoding UTF-8 'Donate</li>' 'Spenden</li>' /var/www/html/admin/scripts/lua/sidebar.lp
sudo rpl --encoding UTF-8 'Donate</span>' 'Spenden</span>' /var/www/html/admin/scripts/lua/sidebar.lp



# /var/www/html/admin/scripts/vendor/adminlte.min.js
# noch nichts zu übersetzen
# sudo rpl --encoding UTF-8 '' '' /var/www/html/admin/scripts/pi-hole/vendor/adminlte.min.js


# /var/www/html/admin/vendor/bootstrap-select/bootstrap-select.min.js
sudo rpl --encoding UTF-8 '"Nothing selected"' '"Nichts ausgewählt"' /var/www/html/admin/vendor/bootstrap-select/bootstrap-select.min.js



# /var/www/html/admin/vendor/datatables/datatables.min.js
sudo rpl --encoding UTF-8 'activate to sort column ascending' 'aktivieren, um die Spalte aufsteigend zu sortieren' /var/www/html/admin/vendor/datatables/datatables.min.js
sudo rpl --encoding UTF-8 'activate to sort column descending' 'aktivieren, um die Spalte absteigend zu sortieren' /var/www/html/admin/vendor/datatables/datatables.min.js
sudo rpl --encoding UTF-8 'sFirst:"First",sLast:"Last"' 'sFirst:"Erste",sLast:"Letzte"' /var/www/html/admin/vendor/datatables/datatables.min.js
sudo rpl --encoding UTF-8 'sNext:"Next",sPrevious:"Previous"' 'sNext:"Nächste",sPrevious:"Zurück"' /var/www/html/admin/vendor/datatables/datatables.min.js
sudo rpl --encoding UTF-8 'sEmptyTable:"No data available in table' 'sEmptyTable:"Keine Daten in der Tabelle vorhanden.' /var/www/html/admin/vendor/datatables/datatables.min.js
sudo rpl --encoding UTF-8 'Showing _START_ to _END_ of _TOTAL_ entries' 'Zeige _START_ bis _END_ von _TOTAL_ Einträgen' /var/www/html/admin/vendor/datatables/datatables.min.js
sudo rpl --encoding UTF-8 'Showing 0 to 0 of 0 entries' 'Zeige 0 bis 0 von 0 Einträgen' /var/www/html/admin/vendor/datatables/datatables.min.js
sudo rpl --encoding UTF-8 'filtered from _MAX_ total entries' 'gefiltert aus insgesamt _MAX_ Einträgen' /var/www/html/admin/vendor/datatables/datatables.min.js
sudo rpl --encoding UTF-8 '"Show _MENU_ entries"' '"Zeige _MENU_ Einträge"' /var/www/html/admin/vendor/datatables/datatables.min.js
sudo rpl --encoding UTF-8 'sLoadingRecords:"Loading..."' 'sLoadingRecords:"Lade ..."' /var/www/html/admin/vendor/datatables/datatables.min.js
sudo rpl --encoding UTF-8 'sProcessing:"Processing...' 'sProcessing:"Wird bearbeitet ...' /var/www/html/admin/vendor/datatables/datatables.min.js
sudo rpl --encoding UTF-8 'sSearch:"Search:' 'sSearch:"Suche:' /var/www/html/admin/vendor/datatables/datatables.min.js
sudo rpl --encoding UTF-8 'No matching records found' 'Keine passenden Datensätze gefunden.' /var/www/html/admin/vendor/datatables/datatables.min.js



# /var/www/html/admin/vendor/daterangepicker/daterangepicker.min.js
sudo rpl --encoding UTF-8 'separator:" - "' 'separator:"  Uhr  bis  "' /var/www/html/admin/vendor/daterangepicker/daterangepicker.min.js
sudo rpl --encoding UTF-8 'applyLabel:"Apply"' 'applyLabel:"Anwenden"' /var/www/html/admin/vendor/daterangepicker/daterangepicker.min.js
sudo rpl --encoding UTF-8 'cancelLabel:"Cancel"' 'cancelLabel:"Abbrechen"' /var/www/html/admin/vendor/daterangepicker/daterangepicker.min.js
sudo rpl --encoding UTF-8 '"Custom Range"' '"Benutzerdefinierter Bereich"' /var/www/html/admin/vendor/daterangepicker/daterangepicker.min.js



# /var/www/html/admin/vendor/moment/moment.min.js
sudo rpl --encoding UTF-8 '"%s ago"' '"%s zuvor"' /var/www/html/admin/vendor/moment/moment.min.js
sudo rpl --encoding UTF-8 '"a few seconds"' '"ein paar Sekunden"' /var/www/html/admin/vendor/moment/moment.min.js
sudo rpl --encoding UTF-8 '"%d seconds"' '"%d Sekunden"' /var/www/html/admin/vendor/moment/moment.min.js
sudo rpl --encoding UTF-8 '"a minute"' '"eine Minuten"' /var/www/html/admin/vendor/moment/moment.min.js
sudo rpl --encoding UTF-8 '"%d minutes"' '"%d Minuten"' /var/www/html/admin/vendor/moment/moment.min.js
sudo rpl --encoding UTF-8 '"an hour"' '"eine Stunde"' /var/www/html/admin/vendor/moment/moment.min.js
sudo rpl --encoding UTF-8 '"%d hours"' '"%d Stunden"' /var/www/html/admin/vendor/moment/moment.min.js
sudo rpl --encoding UTF-8 '"a day"' '"einen Tag"' /var/www/html/admin/vendor/moment/moment.min.js
sudo rpl --encoding UTF-8 '"%d days"' '"%d Tage"' /var/www/html/admin/vendor/moment/moment.min.js
sudo rpl --encoding UTF-8 '"a week"' '"eine Woche"' /var/www/html/admin/vendor/moment/moment.min.js
sudo rpl --encoding UTF-8 '"%d weeks"' '"%d Wochen"' /var/www/html/admin/vendor/moment/moment.min.js
sudo rpl --encoding UTF-8 '"a month"' '"einem Monat"' /var/www/html/admin/vendor/moment/moment.min.js
sudo rpl --encoding UTF-8 '"%d months"' '"%d Monaten"' /var/www/html/admin/vendor/moment/moment.min.js
sudo rpl --encoding UTF-8 '"a year"' '"einem Jahr"' /var/www/html/admin/vendor/moment/moment.min.js
sudo rpl --encoding UTF-8 '"%d years"' '"%d Jahren"' /var/www/html/admin/vendor/moment/moment.min.js
sudo rpl --encoding UTF-8 'Sunday_Monday_Tuesday_Wednesday_Thursday_Friday_Saturday' 'Sonntag_Montag_Dienstag_Mittwoch_Donnerstag_Freitag_Samstag' /var/www/html/admin/vendor/moment/moment.min.js
sudo rpl --encoding UTF-8 'January_February_March_April_May_June_July_August_September_October_November_December' 'Januar_Februar_März_April_Mai_Juni_Juli_August_September_Oktober_November_Dezember' /var/www/html/admin/vendor/moment/moment.min.js
sudo rpl --encoding UTF-8 '"Jan_Feb_Mar_Apr_May_Jun_Jul_Aug_Sep_Oct_Nov_Dec"' '"Jan_Feb_Mar_Apr_Mai_Jun_Jul_Aug_Sep_Okt_Nov_Dez"' /var/www/html/admin/vendor/moment/moment.min.js
sudo rpl --encoding UTF-8 'Mon\|Tue\|Wed\|Thu\|Fri\|Sat\|Sun' 'Mo|Di|Mi|Do|Fr|Sa|So' /var/www/html/admin/vendor/moment/moment.min.js
sudo rpl --encoding UTF-8 'Jan\|Feb\|Mar\|Apr\|May\|Jun\|Jul\|Aug\|Sep\|Oct\|Nov\|Dec' 'Jan|Feb|Mar|Apr|Mai|Jun|Jul|Aug|Sep|Okt|Nov|Dez' /var/www/html/admin/vendor/moment/moment.min.js
sudo rpl --encoding UTF-8 'Su_Mo_Tu_We_Th_Fr_Sa' 'So_Mo_Di_Mi_Do_Fr_Sa' /var/www/html/admin/vendor/moment/moment.min.js



# /var/www/html/admin/vendor/select2/select2.min.js
sudo rpl --encoding UTF-8 'No results found' 'Keine Ergebnisse gefunden' /var/www/html/admin/vendor/select2/select2.min.js
sudo rpl --encoding UTF-8 'Remove all items' 'Entferne die Einträge' /var/www/html/admin/vendor/select2/select2.min.js



echo -e "${blaufett}   Fast fertig ...${standard}"



# /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Gravity temporary directory does not exist or is not a writeable directory, falling back to /tmp.' 'Das temporäre Verzeichnis Gravity existiert nicht oder ist kein beschreibbares Verzeichnis, so dass auf /tmp zurückgegriffen wird.' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Unable to create \$\{gravityDBfile\}' '${gravityDBfile} kann nicht erstellt werden' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Building tree' 'Datenbaum wurde aufgebaut' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Unable to build gravity tree in ' 'Die Gravity Liste kann nicht erstellt werden in ' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'If you have a large amount of domains, make sure your Pi-hole has enough RAM available' 'Wenn Sie eine große Anzahl von Domains haben, stellen Sie sicher, dass Ihr Pi-hole genügend RAM zur Verfügung hat' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Swapping databases' 'Austausch der Datenbanken' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Unable to clean current database for backup' 'Die aktuelle Datenbank kann für die Sicherung nicht bereinigt werden' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'The old database remains available' 'Die alte Datenbank ist weiterhin verfügbar' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 '\${CROSS\} Unable to update gravity timestamp in database' '${CROSS} Zeitstempel der Gravity-Datenbank kann nicht aktualisiert werden' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Migrated from ' 'Migriert von ' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Unable to fill table ' 'Tabelle kann nicht gefüllt werden ' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'in database \$\{gravityDBfile\}' 'in der Datenbank ${gravityDBfile}' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Unable to backup ' 'Sicherung nicht möglich' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Unable to remove ' 'Entfernen nicht möglich' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Unable to update number of domains in adlist with ID' 'Die Anzahl der Domains in der Blockliste mit der ID' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'in database \$\{gravityTEMPfile\}' 'kann in der Datenbank nicht aktualisiert werden. ${gravityTEMPfile}' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Unable to update status of adlist with ID' 'Der Status der Blockliste mit der ID' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 '\$\{INFO\} Creating new gravity database' '${INFO} Erstellen einer neuen Gravity-Datenbank' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Error creating new gravity database. Please contact support.' 'Fehler beim Erstellen einer neuen Gravity-Datenbank. Bitte kontaktieren Sie den Support.' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Migrating content of \$\{adListFile\} into new database' 'Migrieren des Inhalts von ${adListFile} in die neue Datenbank.' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Migrating content of \$\{blacklistFile\} into new database' 'Migrieren des Inhalts von ${blacklistFile} in die neue Datenbank.' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Migrating content of \$\{whitelistFile\} into new database' 'Migrieren des Inhalts von ${whitelistFile} in die neue Datenbank.' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Migrating content of \$\{regexFile\} into new database' 'Migrieren des Inhalts von ${regexFile} in die neue Datenbank.' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 '\$\{TICK\} DNS resolution is available' '${TICK} DNS-Auflösung ist verfügbar' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'DNS resolution is currently unavailable' 'Die DNS-Auflösung ist derzeitig nicht verfügbar!' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Waiting up to 120 seconds for DNS resolution...' 'Bis zu 2 Minuten auf die DNS-Auflösung warten...' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Attempting to restore previous database from backup no.' 'Versuch der Wiederherstellung der vorherigen Datenbank von der Sicherungsnummer.' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Neutrino emissions detected\$\{COL_NC\}...' 'Neutrino Emissions erkannt${COL_NC}' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Storing gravity database in ' 'Speicherung der Gravity-Datenbank in ' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Pulling blocklist source list into range' 'Heranziehen der Blocklisten Quelle' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'No source list found, or it is empty' 'Keine Quellenliste gefunden, oder sie ist leer' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Preparing new gravity database' 'Aufbereitung einer neuen Gravity-Datenbank' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Creating new gravity databases' 'Erstelle eine neue Gravity-Datenbank' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Unable to create new database ' 'Neue Datenbank kann nicht erstellt werden ' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Unable to copy data from' 'Daten konnten nicht kopiert werden von' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Successfully restored from backup \(\$\{gravityBCKfile\}.\$\{num\} at \$\{timestamp\}\)' 'Erfolgreich vom Backup wiederhergestellt (${gravityBCKfile}.${num} vom ${timestamp})' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Unable to restore backup no.' 'Sicherung kann nicht wiederhergestellt werden von Nr.:' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Backup no. \$\{num\} not available' 'Sicherung Nr. ${num} ist nicht verfügbar' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'gravityDBfile} to' 'gravityDBfile} bis' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Using libz compression' 'Verwenden der libz-Komprimierung' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Libz compression not available' 'Libz-Komprimierung ist nicht verfügbar!' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Unable to write to ' 'Es kann nicht geschrieben werden in ' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Please run pihole -g as root' 'Bitte starten Sie pihole -g als root' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Target: ' 'Quelle: ' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 ' Invalid Target' ' Ungültiges Ziel' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 '\${INFO\} List has been updated' '${INFO} Die Liste wurde aktualisiert.' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 '\${INFO\} List stayed unchanged' '${INFO} Die Liste hat sich nicht geändert.' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'str="Status:"' 'str="Ergebnis:"' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Pending...' 'Ausstehend ...' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'is blocked by one of your lists. Using DNS server \$\{upstream\} instead' 'wird durch eine Ihrer Listen geblockt. Verwenden Sie stattdessen den DNS-Server ${upstream}.' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'does not exist"' 'existiert nicht"' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Using local file ' 'Benutze eine lokale Datei ' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Cannot read file \(file needs to have a\+r permission\)' 'Datei kann icht gelesen werden (Datei benötigt a+r Berechtigungenen)' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Invalid protocol specified. Ignoring list.' 'Ungültiges Protokoll angegeben. Liste wird ignoriert.' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Ensure your URL starts with a valid protocol like http:\/\/ , https:\/\/ or file:\/\/ .' 'Stellen Sie sicher, dass Ihre URL mit einem gültigen Protokoll beginnt, wie z.B. http:// , https:// or file:// .' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Retrieval successful"' 'Abruf erfolgreich"' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Retrieval failed \/ empty list' 'Abruf fehlgeschlagen / leere Liste' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'No changes detected"' 'Keine Änderungen erkannt"' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Connection Refused"' 'Verbindung abgelehnt"' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Forbidden"' 'Verboten"' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Not found"' 'Die Liste wurde nicht gefunden."' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Time-out"' 'Zeitüberschreitung"' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Unavailable For Legal Reasons"' 'Aus rechtlichen Gründen nicht verfügbar"' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Internal Server Error"' 'Interner Server Fehler"' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Connection Timed Out \(Gateway\)"' 'Zeitüberschreitung der Verbindung (Gateway)"' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Web Server Is Down \(Cloudflare\)"' 'Webserver ist ausgefallen (Cloudflare)"' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Connection Timed Out \(Cloudflare\)"' 'Zeitüberschreitung der Verbindung (Cloudflare)"' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Received empty file' 'Leere Datei empfangen' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 '\$\{CROSS\} List download failed: \$\{COL_GREEN\}using previously cached list\$\{COL_NC\}' '${CROSS} Herunterladen der Liste nicht möglich: ${COL_GREEN}benutze zwischengespeicherte Liste${COL_NC}' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 '\$\{CROSS\} List download failed: \$\{COL_RED\}no cached list available\$\{COL_NC\}' '$\{CROSS\} Herunterladen der Liste nicht möglich: ${COL_RED}keine zwischengespeicherte Liste vorhanden${COL_NC}' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Number of \${str\}:' 'Anzahl der ${str}:' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'unique domains' 'einzelne Domains' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 '"gravity domains"' '"Domains in der Gravity-Datenbank"' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 '"exact denied domains"' '"exakt verweigerten Domains"' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 '"regex denied filters"' '"durch RegEx Filter verweigerten Domains"' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 '"exact allowed domains"' '"exakt erlaubten Domains"' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 '"regex allowed filters"' '"durch RegEx erlaubten Domains"' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 '\${INFO\} \${COL_RED\}User-abort detected\$\{COL_NC\}"; gravity_Cleanup "error"' '${INFO} ${COL_RED}Abbruch durch Benutzer festgestellt${COL_NC}"; gravity_Cleanup "Fehler"' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 '"Cleaning up stray matter"' '"Aufräumen"' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 '\$\{CROSS\} Failed to remove' '${CROSS} Nicht entfernt' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 '"Usage: pihole -g' '"Verwende: pihole -g' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Checking integrity of existing gravity database \(this can take a while\)' 'Überprüfung der Integrität der bestehenden Gravity-Datenbank (dies kann eine Weile dauern)' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Checking foreign keys of existing gravity database \(this can take a while\)' 'Fremdschlüssel der vorhandenen Gravity-Datenbank prüfen (dies kann eine Weile dauern)' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'no errors found"' 'keine Fehler gefunden"' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'errors found:' 'Fehler gefunden:' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Trying to recover existing gravity database' 'Es wird versucht, die vorhandene Gravity-Datenbank wiederherzustellen' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 '\- success' '\- erfolgreich' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'has been recovered' 'wurde wiederhergestellt' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'has been moved to' 'wurde verschoben nach' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'the following errors happened:' 'die folgenden Fehler sind aufgetreten:' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Recovery failed. Try \\"pihole -r recreate\\" instead.' 'Die Wiederherstellung ist fehlgeschlagen. Versuchen Sie stattdessen \"pihole -r recreate\".' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Optimizing database' 'Optimierung der Datenbank' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Unable to optimize database ' 'Die Datenbank kann nicht optimiert werden' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 '\{recover,recreate\}' '{wiederherstellen, neu erstellen}' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Update domains from blocklists specified in adlists.list' 'Domains aus den in adlists.list angegebenen Blocklisten aktualisieren' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Options:' 'Optionen:' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Force the download of all specified blocklists' 'Erzwingt den Download aller angegebenen Blocklisten' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Show this help dialog' 'Zeigt die Hilfe an' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Attempt to repair gravity database' 'Versuche, die Gravity-Datenbank zu reparieren' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Available options:' 'Verfügbare Optionen:' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Try to recover a damaged gravity database file.' 'Versuchen Sie, eine beschädigte Gravity-Datenbankdatei wiederherzustellen.' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Pi-hole tries to restore as much as possible' 'Pi-hole versucht, so viel wie möglich aus einer' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'from a corrupted gravity database.' 'beschädigten Gravity-Datenbank wiederherzustellen.' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Pi-hole will run the recovery process even when' 'Pi-hole führt den Wiederherstellungsprozess auch dann durch,' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'no damage is detected. This option is meant to be' 'wenn kein Schaden festgestellt wird. Diese Option ist als' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'a last resort. Recovery is a fragile task' 'letzter Ausweg gedacht. Die Wiederherstellung ist eine fragile' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 "consuming a lot of resources and shouldn\'t be" "Aufgabe, die viele Ressourcen verbraucht und nicht unnötig" /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'performed unnecessarily.' 'durchgeführt werden sollte.' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Create a new gravity database file from scratch.' 'Erstellen Sie eine Gravity-Datenbankdatei von Grund auf neu.' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'This will remove your existing gravity database' 'Dadurch wird Ihre vorhandene Gravity-Datenbank' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'and create a new file from scratch. If you still' 'entfernt und eine neue Datei wird erstellt. Wenn Sie' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'have the migration backup created when migrating' 'bei der Migration auf Pi-hole v5.0 das Migrations-Backup' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'to Pi-hole v5.0, Pi-hole will import these files.' 'erstellen lassen, importiert Pi-hole diese Dateien.' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'No DNS resolution available. Please contact support.' 'Es ist keine DNS-Auflösung verfügbar. Bitte kontaktieren Sie den Support.' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Recreating gravity database from migration backup' 'Wiederherstellung der Gravity-Datenbank aus der Migrationssicherung' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Unable to migrate to database. Please contact support.' 'Die Migration der Datenbank ist nicht möglich. Bitte kontaktieren Sie den Support.' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Deleting existing list cache' 'Löschen des bestehenden List-Caches' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Unable to create gravity database. Please try again later. If the problem persists, please contact support.' 'Die Gravity-Datenbank kann nicht erstellt werden. Bitte versuchen Sie es später erneut. Wenn das Problem weiterhin besteht, wenden Sie sich bitte an den Support.' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 'Unable to create database. Please contact support.' 'Die Gravity-Datenbank kann nicht erstellt werden. Bitte kontaktieren Sie den Support.' /opt/pihole/gravity.sh
sudo rpl --encoding UTF-8 ' Done.' ' Fertig.' /opt/pihole/gravity.sh



# /usr/local/bin/pihole
sudo rpl --encoding UTF-8 'Example: ' 'Beispiel: ' /usr/local/bin/pihole
sudo rpl --encoding UTF-8 'DNS service is NOT running' 'DNS Dienst läuft nicht!' /usr/local/bin/pihole
sudo rpl --encoding UTF-8 'DNS service is NOT listening' 'DNS Dienst hört NICHT!' /usr/local/bin/pihole
sudo rpl --encoding UTF-8 'FTL is listening on port' 'FTL hört am Port' /usr/local/bin/pihole
sudo rpl --encoding UTF-8 'Pi-hole blocking is enabled' 'Pi-hole ist aktiviert' /usr/local/bin/pihole
sudo rpl --encoding UTF-8 'Pi-hole blocking is disabled' 'Pi-hole ist deaktiviert!' /usr/local/bin/pihole
sudo rpl --encoding UTF-8 'Warning: Query logging is disabled' 'Warnung: Anfrageprotokollierung ist deaktiviert' /usr/local/bin/pihole
sudo rpl --encoding UTF-8 'Press Ctrl-C to exit' 'Drücke Ctrl-C um zu beenden' /usr/local/bin/pihole
sudo rpl --encoding UTF-8 'Please do not call Tricorder directly' 'Bitte rufen Sie Tricorder Funktion nicht direkt auf' /usr/local/bin/pihole
sudo rpl --encoding UTF-8 'Error message: ' 'Fehlermeldung: ' /usr/local/bin/pihole
sudo rpl --encoding UTF-8 'Upload successful, your token is:' 'Hochladen erfolgreich, Ihr Token ist:' /usr/local/bin/pihole
sudo rpl --encoding UTF-8 'Function not supported in Docker images' 'Funktion wird in Docker-Images nicht unterstützt' /usr/local/bin/pihole
sudo rpl --encoding UTF-8 'Usage: pihole \[options\]' 'Verwende: pihole [Optionen]' /usr/local/bin/pihole



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
rpl --encoding UTF-8 '" with "' '"   wurde nicht ersetzt durch   "' /tmp/error2-translate.log
rpl --encoding UTF-8 'rpl: ' ' ' /tmp/error2-translate.log

echo >> /tmp/error2-translate.log
echo >> /tmp/error2-translate.log
sudo chmod 777 /tmp/erro*-translate.log
sudo rm /tmp/error3-translate.log
sudo mv /tmp/error2-translate.log /tmp/error-translate.log



echo
echo
echo -e "${gruenfett}   Erledigt.${standard}"
echo
echo

cat /tmp/error-translate.log



exit
