class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user 

    def take_ride
        msg = ["Sorry."]
        if user.tickets < attraction.tickets
          msg << "You do not have enough tickets to ride the #{self.attraction.name}."
        end
        if user.height < attraction.min_height
          msg << "You are not tall enough to ride the #{self.attraction.name}."
        end
        if user.tickets >= attraction.tickets && user.height >= attraction.min_height
          user.tickets -= attraction.tickets
          user.nausea += attraction.nausea_rating
          user.happiness += attraction.happiness_rating
          user.save
          msg << "Thanks for riding the #{self.attraction.name}!"
        end
        msg.join(" ")
      end
end
