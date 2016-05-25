class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction
  # write associations here

  def take_ride
    user_ride_values = {
      tickets: (user.tickets -= attraction.tickets),
      nausea: (user.nausea += attraction.nausea_rating),
      happiness: (user.happiness += attraction.happiness_rating)
       }
    errors.add(:user, "You do not have enough tickets the #{self.attraction.name}.") if user.tickets < attraction.tickets
    errors.add(:user, "You are not tall enough to ride the #{self.attraction.name}.") if user.height < attraction.min_height
    if errors.any?
      "Sorry. #{errors[:user].join(" ")}"
    else
      user.update(user_ride_values)
      "Thanks for riding the #{attraction.name}!"
    end
  end
end
