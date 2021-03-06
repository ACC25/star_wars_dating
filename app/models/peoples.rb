class Peoples < ActiveRecord::Base
  has_many :favourites
  has_many :vehicles
  has_many :starships

  belongs_to :race
  belongs_to :planet


  def self.list_of_genders
    genders = []
    Peoples.order(:gender).find_each do |race|
      genders << race.gender
    end
    genders.uniq!
  end

  def self.find_my_name(person_id)
    if person_id.class != Fixnum
      "Database hiccup"
    else
      Peoples.find(person_id).name
    end
  end

end
