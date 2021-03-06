# Bitcoin SV

- Creates virtual server(s) with docker
- Creates cloud volume(s) and mount to /srv
- Register server(s) in domain `var.domain`
- Creates cloud firewall and apply network policy to server(s)
- Deploy bitcoin-sv in `/srv/bitcoin`

## Components

_Bitcoin SV_ is the original Bitcoin. It restores the original Bitcoin protocol, will keep it stable, and allow it to massively scale.

- Original software git repo: <https://github.com/bitcoin-sv/bitcoin-sv.git>
- Docker image git repo: <https://github.com/4ops/bitcoin-sv.git>

## Cloud resources

- DigitalOcean droplet
- DigitalOcean volume
- DigitalOcean cloud firewall

## Default firewall rules

### Incoming

- Allow SSH from `var.trusted_sources`

### Outgoing

- Allow tcp to world
- Allow udp to world
- Allow icmp to world
