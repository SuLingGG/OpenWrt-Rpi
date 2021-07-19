# rpi-openwrt-packages

### Warning
Please use with OpenWRT Trunk Version, 15.05 can be troublesome with these packages.

### wiringpi 
Original work by https://sourceforge.net/projects/atomproducts/ - I have taken the sourcecode from their svn and updated the libraries so that it is useable again - in hopes to preserve their awesome work - and put it to good use in my next projects :).
Thanks a lot to the AtomEmbedded Machine Learning Products Team :)!
Updated from 2.21 ([10.10.2014](https://git.drogon.net/?p=wiringPi;a=commit;h=0a9fdeb29d31609ef834f050bdb8a7a65cd35e2b)) to 2.44 ([03.03.2017](https://git.drogon.net/?p=wiringPi;a=commit;h=96344ff7125182989f98d3be8d111952a8f74e15))

### i2c-tools
Updated from 3.10 ([07.07.2015](https://github.com/groeck/i2c-tools/commit/9726bed900c1e4a46b2c024a43dec987215570be)) to 3.12 ([03.04.2017](https://github.com/groeck/i2c-tools/commit/fe13737567e7733d8cbe587a08ccb7af5ff8ee8e)) to 3.12 ([03.07.2017](https://git.kernel.org/pub/scm/utils/i2c-tools/i2c-tools.git/commit/?id=cb5ad58d3c25700c9d4d588ae354c8dadada37bb))

### Onion Omega 2 i2c-exp-driver
Fetched on [22.05.2017](https://github.com/OnionIoT/OpenWRT-Packages/commit/6ef97880bf5a33936a6c73e3b0c249319b4cc648)
This includes SSD1306 OLED Support for Python, I patched the I2C lib to use the I2C Port 1 and not 0 (Omega does use Port 0 on its Boards, RPi uses Port 1, patched [here](https://github.com/nmaas87/rpi-openwrt-packages/blob/master/src/i2c-exp-driver/include/onion-i2c.h#L29) by changing 0 to 1. 

### Python SSD1306
Fetched on [22.05.2017](https://github.com/polkabana/bsb_ssd1306_i2c)
Another SSD1306 OLED Support for Python, based on Adafruit Code. I patched it to be compatible with latest OpenWRT Trunk.

### python-wiringpi2 2.44.0
from [23.05.2017](https://pypi.python.org/pypi/wiringpi)

### paho_mqtt 1.3.1
from [12.10.2017](https://github.com/eclipse/paho.mqtt.python)

## How To:

#### Update feeds.conf in root Directory, add:
```
src-git wiringPi https://github.com/nmaas87/rpi-openwrt-packages.git
```

#### Update feeds:
```
./scripts/feeds update -a
./scripts/feeds install -a
```

#### Make Menu:
```
make menuconfig
```

#### Choose Packages:

##### wiringPi
- Category Atom-GPL
- Section libs

##### i2c-tools-clone
- Category Atom-GPL
- Section Utilities

##### python-smbus
- Category Languages
- Section lang
- Submenu Python

##### libi2c
- Category Libraries
- Section libs

##### i2c-exp-driver
- Category Onion
- Section Libraries

##### ssd1306_i2c
- Category Languages
- Section lang
- Submenu Python

##### python-wiringpi2
- Category Languages
- Section lang
- Submenu Python

##### paho_mqtt
- Category Languages
- Section lang
- Submenu Python

### Binary OPKG Repo

Use wiringPi files with i.e.
```
src/gz wiringPi https://nmaas87.github.io/rpi-openwrt-packages/bin_packages/wiringPi
```
in /etc/opkg/customfeeds.conf
