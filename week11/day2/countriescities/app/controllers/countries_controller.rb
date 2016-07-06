class CountriesController < ApplicationController

    def index
        if params[:continent_id]
            countries = Country.where({continent_id: params[:continent_id]})
        else
            countries = Country.all.to_json(include: [:continent, :cities])
        end

        render(json: countries)
    end

    def show
        if params[:continent_id]
            country = Country.where({continent_id: params[:continent_id]})[params[:id].to_i - 1]
        else
            country = Country.find(params[:id]).to_json(include: [:continent, :cities])
        end

        render(json: country)
    end
end
