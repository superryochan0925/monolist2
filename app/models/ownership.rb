class Ownership < ActiveRecord::Base
  belongs_to :user, class_name: "User"
  belongs_to :item, class_name: "Item"
  
  def self.ranking_ownerships
    self.group(:item_id).order('count_all desc').limit(10).count
  end
end
