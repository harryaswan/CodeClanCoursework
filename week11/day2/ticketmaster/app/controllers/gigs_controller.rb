class GigsController < ApplicationController
    def index
        # render(json: Artist.find(params[:artist_id]).gigs)
        render(json: Gig.where({artist: params[:artist_id]}).as_json({include: :venue}))
    end
    def show
        render(json: Gig.where({artist: params[:artist_id]})[params[:id].to_i - 1].as_json({include: :venue}))
    end
    def create
        # gig = Gig.create({artist_id: params[:artist_id], date:params[:date], price: params[:price], venue_id: params[:venue_id]})
        # g = params[]
        # g["artist_id"] = params[:artist_id]
        gig = Gig.create(params)
        render(json: gig.as_json({include: :venue}))
        # render(json: params[:gig])
    end
end
