class FruitsController < ApplicationController
    def index
        fruits = Fruit.all
        render( json: fruits )
    end
    def show
        fruit = Fruit.find(params[:id])
        render( json: fruit )
    end
    def create

        #   fruit = Fruit.new
        #   fruit.name = params[:name]
        #   fruit.save

        fruit = Fruit.create({name: params[:name]})
        render(json: fruit)
    end
    def update
        Fruit.update(params[:id], name: params[:name])
        show()
    end
    def destroy
        Fruit.delete(params[:id])
        index()
    end

end
