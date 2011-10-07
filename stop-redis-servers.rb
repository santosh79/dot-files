9.times do |i|
  system("redis-cli -p #{6379 + i*1000} SHUTDOWN")
end
