#!/usr/bin/ruby

# file: hashcache.rb

require 'chronic_duration'


class HashCache
  attr_accessor :size, :file_cache, :file_path

  def initialize(opt={})
    o = {size: 5, file_cache: false, file_path: '/tmp'}.merge(opt)
    @size = o[:size]
    @file_cache = o[:file_cache]
    @file_path = o[:file_path]
    @h = {}
    
    def @h.expired?(item)
      expiry_time = self.fetch(item)[:expiry_time]
      return false unless expiry_time
      expiry_time < Time.now
    end
    
  end

  def read(item, &blk)

    if @h.include? item then
      !@h.expired?(item) ? self.refresh(item) : @h.delete(item)[:val]
    else
      if @file_cache == true and File.exists? @file_path + '/' + item then
        read_file item
      elsif block_given?
        self.write(item) { blk.call }
      end
    end    
  end
  
  def write(item, duration=nil, &blk)
    
    expiry_time = nil
    val = blk.call    
        
    expiry_time =  Time.now + ChronicDuration.parse(duration) if duration
    
    @h[item] = {val: val, expiry: duration, expiry_time: expiry_time}
    @h.shift if @h.length > @size
    write_file(item, val) if @file_cache == true
    val
  end  
  
  alias read! write
  
  def refresh(item)
    x = @h[item]    
    @h.delete item
    @h[item] = x
    x[:val]
  end

  def reset
    @h = {}
  end
  
  def delete(item)
    @h.delete item    
  end
  
  private
  
  def read_file(item)
    obj = nil
    File.open(@file_path + '/' + item) {|f| obj = Marshal.load(f) }
    obj
  end
  
  def write_file(item, obj)
    File.open(@file_path + '/' + item, 'w+') {|f| Marshal.dump(obj, f) }     
  end
  
end
