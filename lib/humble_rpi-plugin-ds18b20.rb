#!/usr/bin/env ruby

# file: humble_rpi-plugin-ds18b20.rb



class HumbleRPiPluginDs18b20Sensor
  

  def initialize(settings: {}, variables: {})

    @sensor_id = settings[:id]
    
    if @sensor_id.nil? then
      raise 'HumbleRPiPluginDhtSensor: settings error: please supply an ID'
    end
    
    h = {
      threshold: 1,
      interval: 3,
      msg_format: "%s/ds18b20_sensor/%s: temperature: %s",
      pushrate: 60
    }.merge settings
    
    @threshold = h[:threshold]
    @interval = h[:interval]
    @msg_format = h[:msg_format]
    @pushrate = h[:pushrate]
    
    @notifier = variables[:notifier]
    @device_id = variables[:device_id] || 'pi'
    
    filename = 'w1_slave'
    @filepath = File.join('/sys/bus/w1/devices/', @sensor_id, filename)    
    
    unless File.exists? @filepath then
      return 'HumbleRPiPluginDs18b20Sensor error: ' + \
                                    'file doesn\'t exist -> ' + @filepath
    end    
    
  end

  def start()
    
    puts 'ready to monitor temperature'
    
    temp = read()
    push temp
    last_push = Time.now
    
    loop do
      
      temp = read()

      if last_push + @pushrate < Time.now and \
            (@old_temp - temp).abs >= @threshold then
        push temp
        last_push = Time.now
      end      

      sleep @interval
      
    end
          
  end
  
  alias on_start start

  private
  
  def push(temp)
    
    @notifier.notice @msg_format % [@device_id, @sensor_id, temp]
    @old_temp = temp
    
  end
  
  def read()
    
    begin

      buffer = File.read @filepath
      a = buffer.lines
      crc = a.shift =~ /YES$/
      crc ? (a.shift[/t=(\d+)/,1].to_f / 1000).round(3)  : 99999

    rescue
      99999
    end

  end
  
end
