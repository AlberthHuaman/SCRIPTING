import time
import subprocess
from datetime import datetime

LOG_FILE = "/var/log/checkhealth.log"

def log_undervoltage():
    check_volt = subprocess.run(["vcgencmd", "measure_volts"], capture_output=True, text=True)
    measure_volt = check_volt.stdout.strip().split("=")[1]
    with open(LOG_FILE, "a") as log:
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        log.write(f"{timestamp} - {measure_volt} -  Undervoltage detected!\n")

def log_voltage():
    check_volt = subprocess.run(["vcgencmd", "measure_volts"], capture_output=True, text=True)
    measure_volt = check_volt.stdout.strip().split("=")[1]
    with open(LOG_FILE, "a") as log:
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        log.write(f"{timestamp} - {measure_volt}\n")


def check_undervoltage():
    result = subprocess.run(["vcgencmd", "get_throttled"], capture_output=True, text=True)
    throttled = result.stdout.strip().split("=")[1]
    if int(throttled, 0) & 0x50000:
       log_undervoltage()
    else:
       log_voltage()

if __name__ == "__main__":
    while True:
        check_undervoltage()
        time.sleep(60)  # Check every 60 seconds

