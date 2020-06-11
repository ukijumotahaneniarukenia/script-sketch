s='123-4567-89'

mc=s.match(/(\d+)-(\d+)-(\d+)/)

p mc.values_at(1..(mc.size-1))
