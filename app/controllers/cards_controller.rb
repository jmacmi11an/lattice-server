class CardsController < ApplicationController


  def index
    @cards = Card.all
    if @cards
      render json: {
        cards: @cards
      }
    else
      render json: {
        status: 500,
        errors: ['no cards found']
      }
    end
  end

  def new
    @card = Card.new
  end

  def create
    card = Card.create card_params
    render json: {name: card.name, id: card.id, project_id: card.project_id, tasks: card.tasks}
  end

  def update
    card = Card.find params[:id]
    card.update card_params
    redirect_to cards_path
  end

  def edit
    @card = Card.find params[:id]
  end

  def show
    @card = Card.find params[:id]
    if @card
       render json: {
         card: @card
       }
     else
       render json: {
         status: 500,
         errors: ['card not found']
       }
     end
  end


  def destroy
    card = Card.find params[:id]
    card.destroy
  end

  private
  def card_params
    params.require(:card).permit(:name, :project_id)
  end
end
