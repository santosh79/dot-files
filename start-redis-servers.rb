%W{redis.conf redis-second.conf redis-third.conf redis-fourth.conf
   redis-fifth.conf redis-sixth.conf redis-seventh.conf redis-eight.conf
   redis-ninth.conf}.each do |conf_file|
    system("redis-server #{conf_file}")
   end
