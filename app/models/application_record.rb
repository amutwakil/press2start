class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  def scrub_input
    #"playstation 1"
    self.display_name = display_name.strip
    #"playstation 1"
  end
  def check_uniqueness
    if self.class.find_by(backend_name: self.display_name.downcase) #Plaform.find_by(backend_name: )
      self.errors.add(:base, "already exists. Select it in the dropdown") #p.errors.add(:base, "already exists"..)
    end
  end

  def store_backend_name
    #display_name = "bunGIE"
    #backend_name = nil
    self.backend_name = self.display_name.downcase
    #backned_name = "bungie"
  end

end
