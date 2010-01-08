# extend Time#strftime to provide for windows unix like formating patterns for numbers without leading zeros
class Time
  alias strftime_without_win_fix strftime
  def strftime(pattern)
    # Day of the month (1..31)
    pattern = pattern.gsub('%e', self.day.to_s) if pattern.include? '%e'
    # Hour of the day, 12-hour clock (1..12)
    pattern = pattern.gsub('%l', self.strftime_without_win_fix('%I').gsub(/0(\d)/, '\1')) if pattern.include? '%l'
    # Hour of the day, 24-hour clock (1..12)
    pattern = pattern.gsub('%k', self.hour.to_s) if pattern.include? '%k'
    self.strftime_without_win_fix(pattern)
  end
end