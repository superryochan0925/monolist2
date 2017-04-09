class RankingController < ApplicationController
  def have
    @title = "Have ranking"
    @ranking = Have.ranking_ownerships
    item_ids = @ranking.keys
    @items = Item.ranking_items(item_ids)
    render :ranking
  end
  
  def want
    @title = "Want ranking"
    @ranking = Want.ranking_ownerships
    item_ids = @ranking.keys
    @items = Item.ranking_items(item_ids)
    render :ranking
  end
end