require 'set'

def solution(a, b, m, x, y)

  elevator_number_capacity = x
  elevator_weight_capacity = y
  current_elevator_stops = Set.new
  total_stops = 0
  until a.empty?
    if allow_person(a[0], elevator_number_capacity, elevator_weight_capacity)
      elevator_number_capacity -= 1
      elevator_weight_capacity -= a[0]
      current_elevator_stops << b.shift
      a.shift
    else
      total_stops += current_elevator_stops.length + 1
      current_elevator_stops = Set.new
      elevator_number_capacity = x
      elevator_weight_capacity = y
    end
  end

  unless current_elevator_stops.empty?
    total_stops += current_elevator_stops.length + 1
  end
  total_stops
end

def allow_person(person_weight, elevator_capacity, elevator_weight_capacity)
  if person_weight <= elevator_weight_capacity && elevator_capacity > 0
    return true
  end
  false
end

p solution([60,80,40], [2,3,5], 3, 2, 200) == 5
p solution([60,80,140,180], [2,3,5,4,1], 5, 2, 200) == 7
p solution([60,80,140,180], [3,3,3,3,3], 5, 2, 200) == 6
p solution([60], [3], 5, 2, 200) == 2
