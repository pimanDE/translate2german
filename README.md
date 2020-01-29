# translate2german
**Übersetzung der pi-hole Weboberfläche auf deutsch**


Mit diesem Script wird die Weboberfläche des pi-hole auf deutsch übersetzt.

Bevor die Übersetzung beginnt, wird das Verzeichnis

/var/www/html/admin und die Datei

/var/www/html/pihole/index.php gesichert.
<br>
<br>

**Installationsanleitung:**

<code> sudo apt install rpl</code><br>
<code>git clone https://github.com/pimanDE/translate2german/</code><br>
<code>cd translate2german</code><br>
<code>chmod 775 translate2german.sh</code><br>
<code>sudo ./translate2german.sh</code><br>
<br>
<br>

**Hinweise:**

- getestet unter Pi-hole Version v4.3.2 Web Interface Version v4.3.2 FTL Version v4.3.1
- Die Übersetzung umfasst auch das Speedtestmodul.
(https://github.com/arevindh/pihole-speedtest/wiki/Installing-Speedtest-Mod)
- ...
- ...
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
<code> sudo rm /var/www/html/pihole/index.php</code><br>
<code> sudo rm /var/www/html/pihole/blockingpage.css</code><br>
<code> sudo mv /var/www/html/admin.sicherung.vom.XXX /var/www/html/admin</code><br>
<code> sudo mv /var/www/html/pihole/index.php.sicherung.vom.XXX /var/www/html/pihole/index.php</code><br>
<code> sudo mv /var/www/html/pihole/blockingpage.css.sicherung.vom.XXX /var/www/html/pihole/blockingpage.css</code>
