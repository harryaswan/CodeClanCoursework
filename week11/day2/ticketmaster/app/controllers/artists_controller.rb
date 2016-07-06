class ArtistsController < ApplicationController

    def index
      render(json: Artist.all)
    end
    def create
      render(json: Artist.create({name: params[:name]}))
    end
    def show
      render(json: Artist.find(params[:id]))
    end
    def update
      render(json: Artist.update(params[:id], {name: params[:name]}))
    end
    def destroy
      Artist.delete(params[:id])
      index()
    end

end
