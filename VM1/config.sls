# Configuration eth1
# RAPPEL: eth0 est à vagrant, ne pas y toucher

## Désactivation de network-manager
NetworkManager:
  service:
    - dead
    - enable: False
    
## Suppression de la passerelle par défaut
ip route del default:
  cmd:
    - run

##Configuration de VM1
eth1:
  network.managed:
    - enabled: True
    - type: eth
    - proto: none
    - ipaddr: 172.16.2.131
    - netmask: 28

eth2:
  network.managed:
    - enabled: True
    - type: eth
    - proto: none
    - enable_ipv4: false
    - enable_ipv6: true
    - ipaddr: fc00:1234:3::1
    - netmask: 64

## Configuration de la route vers LAN2 via VM2
routesETH1:
  network.routes:
    - name: eth1
    - routes:
      - name: LAN2
        ipaddr: 172.16.2.160/28
        gateway: 172.16.2.132

routesETH2:
  network.routes:
    - name: eth2
    - routes:
      - name: LAN1-6
        ipaddr: fc00:1234:1::4/64
        gateway: fc00:1234:3::16


