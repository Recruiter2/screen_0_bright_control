import subprocess

# Get the current brightness values
output = subprocess.check_output("xrandr --verbose | grep 'Brightness' | awk '{print $2}'", shell=True)
brightness_values = [float(x) for x in output.decode().strip().split('\n')]

# Get the first brightness value (assuming it's the laptop display)
current_brightness = brightness_values[0]

# Decrement the brightness by 0.1 (or any other value you prefer)
new_brightness = min(current_brightness + 0.1, 1.0)
subprocess.call(f"xrandr --output eDP --brightness {new_brightness}", shell=True)
# print(f"Brightness of eDP changed from {current_brightness} to {new_brightness}")

