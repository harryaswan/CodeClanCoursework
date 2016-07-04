class PigeonsController < ApplicationController
    def index
      @pigeons = [ {name: "Frank"}, {name: "Colin"}, {name: "Jeff"} ]
      respond_to do |format|
        format.html
        format.json { render json: @pigeons }
      end
    end
end
