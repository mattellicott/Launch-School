[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# any?() will return TRUE if any of the iterations returns TRUE.
# num.odd? returns TRUE for 1, and stops iterating, meaning any?() returns TRUE
# Since any?() only iterates once, puts num is only executed once, when num is 1
# 1
