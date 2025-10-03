# translate2german
[![Stars](https://img.shields.io/github/stars/pimande/translate2german?style=flat&label=Stars&color=brightgreen)](https://github.com/pimanDE/translate2german/stargazers) [![Conributors](https://img.shields.io/github/contributors/pimande/translate2german?style=flat&label=Mitwirkende&color=brightgreen)](https://github.com/pimanDE/translate2german/graphs/contributors) [![GitHub Last Commit](https://img.shields.io/github/last-commit/pimanDE/translate2german?style=flat&label=Letzte%20Änderung&color=brightgreen)](https://github.com/pimanDE/translate2german/commit/master) [![Forks](https://img.shields.io/github/forks/pimande/settings2pi?style=flat&label=Forks&color=blue)](https://github.com/pimanDE/settings2pi/network/members) [![Issues](https://img.shields.io/github/issues/pimande/translate2german?style=flat&label=Issues&color=yellow)](https://github.com/pimanDE/translate2german/issues) [![License](https://img.shields.io/github/license/pimanDE/translate2german?style=flat&label=Lizenz&color=1abc9c)](https://github.com/pimanDE/translate2german/blob/master/LICENSE) ![Badge](https://hitscounter.dev/api/hit?url=https%3A%2F%2Fgithub.com%2FpimanDE%2Ftranslate2german&label=Aufrufe&color=brightgreen&message=&style=plastic&tz=UTC)
<br>
<br>
**Übersetzung der Pi-hole Weboberfläche auf deutsch**
<br>
<br>
Mit diesem Script wird die Weboberfläche Version **v6.2.1** des Pi-hole auf deutsch übersetzt.
<br>
<br>
**Screenshot:**

![img](https://raw.githubusercontent.com/pimanDE/translate2german/master/pihole-weboberfl%C3%A4che-auf-deutsch.png)
<br>
<br>
Dieses Script wurde unter Raspberry Pi OS Lite Debian Version: 13 (trixie) vom 01.10.2025 getestet!
<br>
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

- getestet unter Pi-hole Version v6.1.4, FTL Version v6.2.3 und Web Interface Version **v6.2.1**
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
