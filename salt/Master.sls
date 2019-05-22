apache2:
  pkg:
    - installed
  service.running:
    - enable: True
    - reload: True  

munin:
  pkg:
    - installed

rsyslog:
  pkg:
    - installed
  service.running:
    - enable: True
    - reload: True

/etc/munin/munin.conf:
  file.managed:
    - source: salt://munin.conf
    - user: root
    - group: root
    - mode: 777
    - template: jinja
    - defaults:
      MuninNode: "10.0.0.9"

/etc/munin/apache.conf:
  file.managed:
    - source: salt://apache.conf
    - user: root
    - group: root
    - mode: 777

/etc/munin/apache24.conf:
  file.managed:
    - source: salt://apache24.conf
    - user: root
    - group: root
    - mode: 777

/etc/rsyslog.conf:
  file.managed:
    - source: salt://rsyslogserver.conf
    - user: root
    - group: root
    - mode: 777
