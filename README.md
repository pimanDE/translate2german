# translate2german
**Übersetzung der Pi-hole Weboberfläche auf deutsch**
<br>
Mit diesem Script wird die Weboberfläche Version 5.18.4 des Pi-hole auf deutsch übersetzt.
<br>
**Screenshot:**

![img](https://raw.githubusercontent.com/pimanDE/translate2german/master/pihole-weboberfl%C3%A4che-auf-deutsch.png)
<br>
Dieses Script wurde unter Raspberry Pi OS Bullseye vom 22.09.2022 getestet!
<br>
Bevor die Übersetzung beginnt, werden
das Verzeichnis
```bash
/var/www/html/
```

und die Dateien<br>

```bash
/usr/local/bin/pihole
/opt/pihole/gravity.sh
/opt/pihole/query.sh
```
gesichert.
<br>
**Bevor Sie mit der Übersetzung beginnen:**

- haben Sie ein Backup von Ihrem System gemacht,
- haben Sie sich vom Quellcode überzeugt,
- wissen Sie, dass Sie alles auf eigene Gefahr tun,
- ...<br><br>

**Installationsanleitung:**

Wer schnell und bequem loslegen möchte, kann die Übersetzung mit folgendem Befehl starten:

```bash
sudo curl -sSL https://raw.githubusercontent.com/pimanDE/translate2german/master/translate2german.sh | bash
```
<br>
Alternativ kann die Übersetzung auch folgendermaßen durchgeführt werden:
```bash
wget https://raw.githubusercontent.com/pimanDE/translate2german/master/translate2german.sh
chmod 775 translate2german.sh
./translate2german.sh
```
<br>
**Hinweise:**

- getestet unter Pi-hole Version v5.15.5 FTL Version 5.21 und Web Interface Version v5.18.4
- vor einer Aktualisierung der Web Interface Version (pihole -up) muss erst das Backup zurückgespielt werden (siehe weiter unten)<br>
<br>

**Rückgängig machen:**

Wenn Sie die Übersetzung wieder rückgängig machen wollen:

```bash
bash -c "$(curl -sSL https://raw.githubusercontent.com/pimanDE/translate2german/master/restore2translate.sh)"
```
<br>
Alternativ kann die Übersetzung auch folgendermaßen rückgängig gemacht werden:

```bash
sudo rm -r /var/www/html/
sudo rm /usr/local/bin/pihole
sudo rm /opt/pihole/gravity.sh
sudo rm /opt/pihole/query.sh
```
<br>
XXX = Datum der Sicherung im Format 'YYYYMMDD - HHMMSS'

```bash
sudo mv /var/www/html.sicherung.vom.XXX /var/www/html/
sudo mv /usr/local/bin/pihole.sicherung.vom.XXX /usr/local/bin/pihole
sudo mv /opt/pihole/gravity.sh.sicherung.vom.XXX /opt/pihole/gravity.sh
sudo mv /opt/pihole/query.sh.sicherung.vom.XXX /opt/pihole/query.sh
```
<br>
oder

```bash
pihole -r
```
