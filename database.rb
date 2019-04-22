class Database
  USERS = {
    1 => { name: "Jason", bike: "Cannondale" },
    2 => { name: "Coraline", bike: "Trek" }
  }

  def self.users
    USERS
  end

  @rides = {
    1 => { user_id: 1, title: "Morning commute", date: "2016-09-28" },
    2 => { user_id: 1, title: "Evening commute", date: "2016-09-28" }
  }

  def self.rides
    @rides
  end

  def self.add_ride(ride)
    @rides[@rides.length+1] = ride
  end
end

