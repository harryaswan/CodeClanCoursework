class CitiesController < ApplicationController
    def index
        if params[:country_id]
            if params[:continent_id]
                cities = City.where({country_id: Country.where({continent_id: params[:continent_id]})[params[:country_id].to_i - 1]})
            else
                cities = City.where({country_id: params[:country_id]})
            end
        elsif params[:continent_id]
            cities = City.where({country_id: Country.where({continent_id: params[:continent_id]})})
        else
            cities = City.all.to_json( include: { country:  { include: :continent } } )
        end

        render( json: cities )
    end
    def show

        if params[:country_id]
            if params[:continent_id]
                city = City.where({country_id: Country.where({continent_id: params[:continent_id]})[params[:country_id].to_i - 1]})[params[:id].to_i - 1]
            else
                city = City.where({country_id: params[:country_id]})[params[:id].to_i - 1]
            end
        elsif params[:continent_id]
            city = City.where({country_id: Country.where({continent_id: params[:continent_id]})})[params[:id].to_i - 1]
        else
            city = City.find(params[:id]).to_json( include: { country:  { include: :continent } } )
        end

        render( json: city )
    end
    def update

    end
end
