import socket

from i3pystatus import Status
#from i3pystatus.updates import pacman
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
    format="\u3000 {volume}%",
    color_muted="#FFFF00"
)

# brightness
status.register(
    "backlight",
    format="\u3000 {percentage}%",
    backlight="intel_backlight",
    on_upscroll=None,
    on_downscroll=None,
    interval=1
)

# battery
status.register(
    'battery',
    format='\u3000 {percentage:.0f}%[ {consumption:.2f}W][ ({remaining})]',
    not_present_text="No battery",
    alert=True,
    alert_percentage=5,
    color="#ffc700",
    interval=5,
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

if socket.gethostname() in ['golem', 'guzzlord']:
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
    format="\uf0e7\u3000 {avg1}",
    color="#84daff"
)

# available RAM
status.register(
    "mem",
    format="\u3000 {percent_used_mem}%",
    divisor=1024**3
)

# free disk space
status.register("disk",
    path="/",
    format="\u3000 {avail}G"
)


# ping
status.register(
    "ping",
    format="\uF079\u3000 {ping} ms",
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
#status.register(
#    "updates",
#    format="  {count}",
#    backends = pacman.Pacman(),
#    color="#ffa99e"
#)


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
