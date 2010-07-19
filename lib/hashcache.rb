#!/usr/bin/ruby

# file: hashcache.rb

class HashCache
  attr_accessor :size

  def initialize(opt={})
    o = {size: 5}.merge(opt)
    @size = o[:size]
    @h = {}
  end

  def read(item)
    if @h.include? item then
      self.refresh item
    else
      val = yield
      @h[item] = val
      @h.shift if @h.length > @size
      val
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

end
