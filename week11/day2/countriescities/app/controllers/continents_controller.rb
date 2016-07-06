class ContinentsController < ApplicationController
    def index
        render(json: Continent.all.to_json( include: { countries:  { include: :cities } } ))
    end
    def show
        render(json: Continent.find(params[:id]).to_json( include: { countries:  { include: :cities } } ))
    end
end
