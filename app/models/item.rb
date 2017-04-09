class Item < ActiveRecord::Base
  has_many :ownerships  , foreign_key: "item_id" , dependent: :destroy
  has_many :users , through: :ownerships
  
  has_many :wants, class_name: "Want", foreign_key: "item_id", dependent: :destroy
  has_many :want_users , through: :wants, source: :user
  
  has_many :haves, class_name: "Have", foreign_key: "item_id", dependent: :destroy
  has_many :have_users , through: :haves, source: :user
  
  def self.ranking_items(item_ids)
    self.find(item_ids).sort_by{ |o| item_ids.index(o.id) }
  end
end

  #user.rb
  # has_many :wants, class_name: "Want", foreign_key: "user_id", dependent: :destroy
  # has_many :want_items , through: :wants, source: :item
  
  # has_many :haves, class_name: "Have", foreign_key: "user_id", dependent: :destroy
  # has_many :have_items , through: :haves, source: :item