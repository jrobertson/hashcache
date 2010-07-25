#!/usr/bin/ruby

# file: hashcache.rb

class HashCache
  attr_accessor :size, :file_cache, :file_path

  def initialize(opt={})
    o = {size: 5, file_cache: false, file_path: '/tmp'}.merge(opt)
    @size = o[:size]
    @file_cache = o[:file_cache]
    @file_path = o[:file_path]
    @h = {}
  end

  def read(item)
    if @h.include? item then
      self.refresh item
    else
      if @file_cache == true and File.exists? @file_path + '/' + item then
        read_file item
      else
        val = yield
        @h[item] = val
        @h.shift if @h.length > @size
        write_file(item, val) if @file_cache == true
        val
      end
    end    
  end
  
  def refresh(item)
    val = @h[item]
    @h.delete item
    @h[item] = val
    val        
  end

  def reset
    @h = {}
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
