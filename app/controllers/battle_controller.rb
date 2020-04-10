class BattleController < ApplicationController
    def index
        @card_list = Card.order(id: "ASC").where(opend: false).group(:name).count
    end
end
