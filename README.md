# translate2german
**Übersetzung der pi-hole Weboberfläche auf deutsch**


Mit diesem Script wird die Weboberfläche des pi-hole auf deutsch übersetzt.

Bevor die Übersetzung beginnt, wird das Verzeichnis

/var/www/html/admin und die Datei

/var/www/html/pihole/index.php gesichert.
<br>
<br>

**Installationsanleitung:**

<code>git clone https://github.com/pimanDE/translate2german/</code><br>
<code>cd translate2german</code><br>
<code>chmod 775 translate2german.sh</code><br>
<code>sudo ./translate2german.sh</code><br>
<br>
<br>

**Hinweise:**

- Die Übersetzung umfasst auch das Speedtestmodul.

(https://github.com/arevindh/pihole-speedtest/wiki/Installing-Speedtest-Mod)
- ...
<br>

**Rückgängig machen:**

Wenn Sie die Übersetzung wieder rückgängig machen wollen:

<code> sudo apt install rpl</code><br>
<code> sudo rm -r /var/www/html/admin</code><br>
<code> sudo rm /var/www/html/pihole/index.php</code><br>
<code> sudo mv /var/www/html/admin.sicherung.vom.XXX /var/www/html/admin</code><br>
<code> sudo mv /var/www/html/pihole/index.php.sicherung.vom.XXX /var/www/html/pihole/index.php</code>
