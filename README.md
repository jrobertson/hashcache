# Introducing the hashcache gem

    require 'hashcache'

    hc = HashCache.new(size:5)
    hc.read('fun') {'apple'}
    hc.read('run') {'banana'}
    hc.read('dun') {'grapes'}
    hc.read('tun') {'pear'}
    hc.read('sun') {'pineapple'}
    hc.read('dun') {'grapes'}
    hc.read('dun') {'grapes'}
    hc.read('fun') {'apple'}
    hc.read('wun') {'cherries'}

    hc
    #=> #<HashCache:0x97db1f4 @size=5, @h={"tun"=>"pear", "sun"=>"pineapple", "dun"=>"grapes", "fun"=>"apple", "wun"=>"cherries"}>

Only the 5 most recent items will be stored in the hash, and the block is only used if the item is being added to the hash.

