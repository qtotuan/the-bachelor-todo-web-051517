require 'pry'

def get_first_name_of_season_winner(data, season)
  data[season].each do |e|
    if e["status"].downcase == "winner"
      return e["name"].split[0]
    end
  end
end

def all_contestants(data)
  all_contestants = []
  data.each do |key, value|
    all_contestants << value
  end
  all_contestants.flatten
end

def get_contestant_name(data, occupation)
  all_contestants = all_contestants(data)
  all_contestants.each do |e|
    if e["occupation"] == occupation
      return e["name"]
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  all_contestants = all_contestants(data)
  count = 0
  all_contestants.each do |e|
    if e["hometown"] == hometown
      count += 1
    end
  end
  count
end

def get_occupation(data, hometown)
  all_contestants = all_contestants(data)
  all_contestants.each do |e|
    if e["hometown"] == hometown
      return e["occupation"]
    end
  end
end

def get_average_age_for_season(data, season)
  sum = 0
  num_contestants = 0
  data[season].each do |e|
    sum += e["age"].to_i
    num_contestants += 1
  end
  (sum / num_contestants.to_f).round(0)
end
