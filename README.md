# Introducing the Humble_Rpi-plugin-ds18b20 gem


## Testing the gem

    require 'humble_rpi-plugin-ds18b20'


    class Echo

      def notice(s)
        puts "%s: %s" % [Time.now, s]
      end
    end


    h = {
      settings: {id: '28-0000049a0085', pushrate: 0, threshold: 0.5}, 
      variables: {notifier: Echo.new}
    }

    rpi = HumbleRPiPluginDs18b20Sensor.new(h)
    rpi.start

Output:

<pre>
ready to monitor temperature
2016-02-20 20:13:07 +0000: pi/ds18b20_sensor/28-0000049a0085: temperature: 18.25
2016-02-20 20:13:46 +0000: pi/ds18b20_sensor/28-0000049a0085: temperature: 18.812
2016-02-20 20:13:54 +0000: pi/ds18b20_sensor/28-0000049a0085: temperature: 19.312
2016-02-20 20:14:05 +0000: pi/ds18b20_sensor/28-0000049a0085: temperature: 19.937
2016-02-20 20:14:17 +0000: pi/ds18b20_sensor/28-0000049a0085: temperature: 20.625
2016-02-20 20:14:28 +0000: pi/ds18b20_sensor/28-0000049a0085: temperature: 21.25
2016-02-20 20:14:47 +0000: pi/ds18b20_sensor/28-0000049a0085: temperature: 21.75
2016-02-20 20:15:37 +0000: pi/ds18b20_sensor/28-0000049a0085: temperature: 22.312
2016-02-20 20:16:38 +0000: pi/ds18b20_sensor/28-0000049a0085: temperature: 21.812
2016-02-20 20:16:57 +0000: pi/ds18b20_sensor/28-0000049a0085: temperature: 21.25
2016-02-20 20:17:28 +0000: pi/ds18b20_sensor/28-0000049a0085: temperature: 20.75
2016-02-20 20:18:06 +0000: pi/ds18b20_sensor/28-0000049a0085: temperature: 20.25
2016-02-20 20:19:00 +0000: pi/ds18b20_sensor/28-0000049a0085: temperature: 19.75
2016-02-20 20:20:39 +0000: pi/ds18b20_sensor/28-0000049a0085: temperature: 19.25
2016-02-20 20:23:50 +0000: pi/ds18b20_sensor/28-0000049a0085: temperature: 18.75
</pre>

In the above example I tested the sensor by placing a cup of hot water next to the DHT11 sensor for a few minutes.

Notes: 

* By default the temperature and humidity is refreshed every 3 seconds
* The temperature will be published when ever the temperature value changes by 1 or more
* By default will now only publish notifications once every 60 seconds or more.


## Using the plugin with the Humble RPi gem

    require 'humble_rpi'
    require 'humble_rpi-plugin-ds18b20'

    r = HumbleRPi.new device_name: 'ottavia', sps_address: '192.168.4.140',\
      plugins: {Ds18b20Sensor: {id: '28-0000049a0085'} }
    r.start


## Resources

* Reading the temperature from a DS18B20 Digital Thermometer http://www.jamesrobertson.eu/snippets/2016/feb/20/reading-the-temperature-from-a-ds18b20-digital-thermometer.html

humblerpids18b20 gem temperature sensor humblerpi
