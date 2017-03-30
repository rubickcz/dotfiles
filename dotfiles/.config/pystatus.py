import socket

from i3pystatus import Status
from i3pystatus.updates import pacman
from i3pystatus.weather import weathercom

status = Status()

# clock
status.register(
    "clock",
    format="%a %b %-d %H:%M",
    on_leftclick="gsimplecal"

)

# audio volume
status.register(
    "alsa",
    format="  {volume}%",
    color_muted="#FFFF00"
)

# audio pre-amp
#status.register(
#    "alsa",
#    mixer="Pre-Amp",
#    format="Pre: {volume}%",
#    color_muted="#FFFF00",
#    on_upscroll = ["increase_volume", 20],
#    on_downscroll = ["decrease_volume", 20]
#)

if socket.gethostname() == 'golem':
    # for golem machine (desktop pc), use thermal zone #2
    tz = '2'
else:
    # other machines use thermal zone #0
    tz = '0'

# cpu temp
status.register(
    "temp",
    format="{temp:.0f}°C",
    color="#84daff",
    file="/sys/class/thermal/thermal_zone"+tz+"/temp"
)

# cpu frequency
status.register(
    "cpu_freq",
    format="{avgg} Ghz",
    color="#84daff"
)

# load
status.register(
    "load",
    format="  {avg1}",
    color="#84daff"
)

# available RAM
status.register(
    "mem",
    format="  {percent_used_mem}%",
    divisor=1024**3
)

# free disk space
status.register("disk",
    path="/",
    format="  {avail}G"
)


if socket.gethostname() == 'golem':
    # golem machine (desktop pc)
    iface = 'enp2s0'
else:
    # other machines
    iface = 'eth0'

# network
status.register(
    "network",
    interface=iface,
    color_up="#A0A0A0",
    format_up="{v4}"
)

# ping
status.register(
    "ping",
    format="  {ping} ms",
    format_down="unreachable",
    color="#1ad892"
)

# network usage
#status.register(
#   "network",
#   format_up=" {bytes_recv:3d} MB/s  {bytes_sent} MB/s",
#    format_up="{network_graph}",
#    graph_style="braille-fill",
#    graph_width=30,
#    format_down="NET DOWN",
#    interface="enp2s0",
#)

# pacman updates
status.register(
    "updates",
    format="  {count}",
    backends = pacman.Pacman(),
    color="#ffa99e"
)

# weather
status.register(
    'weather',
    format='{condition} {current_temp}{temp_unit}, {wind_speed} {wind_unit}, {humidity}% [ {update_error}]',
    colorize=True,
    backend=weathercom.Weathercom(
        location_code='EZOL0370:1:EZ',
        units='metric',
    ),
)

status.run()
