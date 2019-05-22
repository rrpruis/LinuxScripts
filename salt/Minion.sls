munin-node:
  pkg:
    - installed
  service:
    - running
    - enable: True
    - restart: True
    - watch:
      - pkg: munin-node
      - file: /etc/munin/munin-node.conf

/etc/munin/munin-node.conf:
  file.managed:
    - source: salt://munin-node.conf
    - user: root
    - group: root
    - mode: 777
    - template: jinja
    - defaults:
      muninmaster: "^40\\.115\\.29\\.76$"

rsyslog:
  pkg:
    - installed
  service:
    - running
    - enable: True
    - restart: True
    - watch:
      - pkg: rsyslog
      - file: /etc/rsyslog.conf

/etc/rsyslog.conf:
  file.managed:
    - source: salt://rsyslogminion.conf
    - user: root
    - group: root
    - mode: 777
    - template: jinja
    - defaults:
      rsyslogminion: "@40.115.29.76"
