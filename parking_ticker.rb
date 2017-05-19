def solution(e, l)

  enter_time = e.split(":")
  enter_hour = enter_time[0].to_i
  enter_minutes = enter_time[1].to_i

  leave_time = l.split(":")
  leave_hour = leave_time[0].to_i
  leave_minutes = leave_time[1].to_i

  number_of_hours = leave_hour - enter_hour

  if leave_minutes > enter_minutes
    number_of_hours += 1
  end

  if leave_hour == enter_hour && leave_minutes == enter_minutes
    return 2
  end

  5 + (number_of_hours - 1) * 4
end

p solution("10:00", "13:21") == 17
p solution('09:42', "11:42") == 9
p solution('09:42', "09:43") == 5
p solution('09:55', "10:01") == 5
p solution('09:59', "11:00") == 9
p solution('09:59', "09:59") == 2
p solution('09:52', "10:42") == 5
