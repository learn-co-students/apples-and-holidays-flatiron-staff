require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array

  holiday_hash[:summer][:fourth_of_july][1]

end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays

  holiday_hash[:winter].each do |key, value|
    holiday_hash[:winter][key] << supply
  end

end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array


    holiday_hash[:spring][:memorial_day] << supply


end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)

  # remember to return the updated hash
  holiday_hash[season] = {holiday_name=>supply_array}
  holiday_hash

end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  new_array = []
  holiday_hash[:winter].collect do |holiday, supply|
    new_array << supply
  end
  new_array.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.

  #first, iterate over hash to get seasons and holidays with their data
  holiday_hash.each do |season, holiday|
    #make the seasons into strings and then capitalize, add a colon
    puts "#{season.to_s.capitalize}:"
    #iterate over the holiday value to separate the holiday names and their arrays of supplies
    holiday.each do |holiday_name, supplies|
      #make into a string first, then split into two words if there is a space, then caps

      puts "  #{holiday_name.to_s.split("_").map {|w| w.capitalize}.join(" ")}: #{supplies.join(", ")}"
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists include the string "BBQ"
  array = []
  #iterate through holiday_hash and separate the seasons from the data associated
  holiday_hash.collect do |season, holiday|
    #take the holidays and iterate through to separate the holidays and the arrays that are associated
    holiday.collect do |holiday, supply|
      #take the supply arrays and find the ones with BBQ in them
      supply.find do |supply|

        if supply == "BBQ"
          #add the holiday name as a symbol that has BBQ as a supply to a new array
          array << holiday
        end
      end
    end
  end
  return array
end
