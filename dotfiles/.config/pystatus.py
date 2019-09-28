import socket

from i3pystatus import Status
from i3pystatus.updates import pacman
from i3pystatus.weather import weathercom

status = Status()

# clock
status.register(
    'clock',
    format='\uf073 %a %b %-d %H:%M',
    on_leftclick='gsimplecal',
)

# keyboard layout
status.register(
    'xkblayout',
    format='\uf11c {symbol}',
    color='#6b7cff',
    on_upscroll=None,
    on_downscroll=None,
)

# redshift
status.register(
    'redshift',
    format='\uf0eb {inhibit}',
    color='#ff8c00',
    format_inhibit=['ON', 'OFF'],
    redshift_parameters=['-l', '50.08804:14.42076'],
)

# audio volume
status.register(
    'pulseaudio',
    format='\uf028 {volume}%',
    color_muted='#FFFF00',
)

if socket.gethostname() != 'golem':

    # brightness
    status.register(
        'backlight',
        format='\uf185 {percentage}%',
        backlight='intel_backlight',
        on_upscroll=None,
        on_downscroll=None,
        interval=1,
    )

    # battery
    status.register(
        'battery',
        format='\uf240 {percentage:.0f}%[ {consumption:.2f}W][ ({remaining})]',
        color='#ffc700',
        not_present_text='No battery',
        alert=True,
        alert_percentage=5,
        interval=5,
    )

if socket.gethostname() == 'golem':

    # gpu temp
    status.register(
        'gpu_temp',
        format='\uf1b2 {temp:.0f}°C',
        color='#84daff',
    )

if socket.gethostname() in ['golem', 'guzzlord']:
    tz = '2'
else:
    tz = '0'

# cpu temp
status.register(
    'temp',
    format='\uf2c8 {temp:.0f}°C',
    color='#84daff',
    file='/sys/class/thermal/thermal_zone'+tz+'/temp',
)

# cpu frequency
status.register(
    'cpu_freq',
    format='\uf3fd {avgg} GHz',
    color='#84daff',
)

# load
status.register(
    'load',
    format='\uf496 {avg1}',
    color='#84daff',
)

# available RAM
status.register(
    'mem',
    format='\uf2db {percent_used_mem}%',
)

# free disk space
status.register('disk',
    path='/',
    format='\uf1c0 {avail} GB',
)

# external ip
status.register(
    'external_ip',
    format='{ip}({country_code})',
    color='#4682b4',
    on_leftclick=None,
    on_rightclick=None,
)

# ping
status.register(
    'ping',
    format='\uf079 {ping} ms',
    format_down='unreachable',
    color='#1ad892',
)

# pacman updates
status.register(
    'updates',
    format='\uf019 {count}',
    backends = pacman.Pacman(),
    color='#ffa99e',
)

# bitcoin
status.register(
    'bitcoin',
    format='\uf15a {last_price}',
    color='#ffd700',
    on_rightclick=None,
    on_upscroll=None,
    on_downscroll=None,
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
