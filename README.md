# IPYourTables
Quickly add and remove ranges of rules from iptables.

## Usage
Run ./IPYourTables.\
**Requires bash.**

## Syntax
`[t u] port[-endport] [i o] [+ -]`
- `t` tcp
- `u` udp
- `port[-endport]` single or a range of ports
- `i` incoming
- `o` outgoing
- `\+` add **(default)**
- `\-` remove

### Adding
`t 80 i +` (tcp port 80 incoming add)\
`u 53 o +` (udp port 53 outgoing add)\
`t 5900-5910 i +` (tcp ports 5900 thru 5910 incoming add)

### Removing
`t 80 i -` (tcp port 80 incoming remove)\
`u 53 o -` (udp port 53 outgoing remove)\
`t 5900-5910 i -` (tcp ports 5900 thru 5910 incoming remove)
