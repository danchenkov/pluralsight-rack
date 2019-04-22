class Database
  USERS = {
    1 => { name: "Jason", bike: "Cannondale" },
    2 => { name: "Coraline", bike: "Trek" }
  }

  def self.users
    USERS
  end
end

