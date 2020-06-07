# translate2german
**Übersetzung der pi-hole Weboberfläche auf deutsch**
<br>
<br>
Mit diesem Script wird die Weboberfläche des Pi-hole Version 5.0 auf deutsch übersetzt.
<br>
<br>
Bevor die Übersetzung beginnt, wird

das Verzeichnis<br>
`/var/www/html/admin`<br>

und die Dateien<br>
`/usr/local/bin/pihole`<br>
`/opt/pihole/gravity.sh`<br>
`/etc/.pihole/gravity.sh`<br>
`/var/www/html/pihole/index.php`<br>
`/var/www/html/pihole/blockingpage.css`<br>

gesichert.
<br>
<br>
<br>

**Bevor Sie mit der Übersetzung beginnen:**

* haben Sie ein Backup von Ihrem System gemacht,
* haben Sie sich vom Quellcode überzeugt,
* wissen Sie, dass Sie alles auf eigene Gefahr tun,
* ...
<br>
<br>

**Installationsanleitung:**

Wer schnell und bequem loslegen möchte, kann die Übersetzung mit folgendem Befehl starten:

<code>sudo curl -sSL https://raw.githubusercontent.com/pimanDE/translate2german/master/translate2german.sh | bash</code><br><br>

Alternativ kann die Übersetzung auch folgendermaßen durchgeführt werden:

<code>wget https://raw.githubusercontent.com/pimanDE/translate2german/master/translate2german.sh</code><br>
<code>chmod 775 translate2german.sh</code><br>
<code>sudo ./translate2german.sh</code><br>
<br>
<br>

**Hinweise:**

* getestet unter Pi-hole Version v5.0 Web Interface Version v5.0 FTL Version v5.0
* vor einer Aktualisierung der Web Interface Version (pihole -up) muss erst das Backup zurückgespielt werden (siehe unten)
* ...
<br>
<br>

**Screenshot:**
<br>
![img](https://raw.githubusercontent.com/pimanDE/translate2german/master/pihole-weboberfl%C3%A4che-auf-deutsch.png)
<br>
<br>
<br>

**Rückgängig machen:**

Wenn Sie die Übersetzung wieder rückgängig machen wollen:

<code> sudo rm -r /var/www/html/admin</code><br>
<code> sudo rm -r /usr/local/bin/pihole</code><br>
<code> sudo rm -r /opt/pihole/gravity.sh</code><br>
<code> sudo rm -r /etc/.pihole/gravity.sh</code><br>
<code> sudo rm -r /var/www/html/pihole/index.php</code><br>
<code> sudo rm -r /var/www/html/pihole/blockingpage.css</code><br>
<br>
<br>
<code>XXX = Datum der Sicherung im Format 'YYYYMMDD - HHMMSS'</code>

<code>sudo mv /var/www/html/admin.sicherung.vom.XXX /var/www/html/admin</code><br>
<code>sudo mv /usr/local/bin/pihole.sicherung.vom.XXX /usr/local/bin/pihole</code><br>
<code>sudo mv /opt/pihole/gravity.sh.sicherung.vom.XXX /opt/pihole/gravity.sh</code><br>
<code>sudo mv /etc/.pihole/gravity.sh.sicherung.vom.XXX /etc/.pihole/gravity.sh</code><br>
<code>sudo mv /var/www/html/pihole/index.php.sicherung.vom.XXX /var/www/html/pihole/index.php</code><br>
<code>sudo mv /var/www/html/pihole/blockingpage.css.sicherung.vom.XXX /var/www/html/pihole/blockingpage.css</code><br>
