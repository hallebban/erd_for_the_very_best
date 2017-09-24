class BestAtsController < ApplicationController
  def index
    @best_ats = BestAt.all

    render("best_ats/index.html.erb")
  end

  def show
    @best_at = BestAt.find(params[:id])

    render("best_ats/show.html.erb")
  end

  def new
    @best_at = BestAt.new

    render("best_ats/new.html.erb")
  end

  def create
    @best_at = BestAt.new

    @best_at.user_id = params[:user_id]
    @best_at.dish_id = params[:dish_id]

    save_status = @best_at.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/best_ats/new", "/create_best_at"
        redirect_to("/best_ats")
      else
        redirect_back(:fallback_location => "/", :notice => "Best at created successfully.")
      end
    else
      render("best_ats/new.html.erb")
    end
  end

  def edit
    @best_at = BestAt.find(params[:id])

    render("best_ats/edit.html.erb")
  end

  def update
    @best_at = BestAt.find(params[:id])

    @best_at.user_id = params[:user_id]
    @best_at.dish_id = params[:dish_id]

    save_status = @best_at.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/best_ats/#{@best_at.id}/edit", "/update_best_at"
        redirect_to("/best_ats/#{@best_at.id}", :notice => "Best at updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Best at updated successfully.")
      end
    else
      render("best_ats/edit.html.erb")
    end
  end

  def destroy
    @best_at = BestAt.find(params[:id])

    @best_at.destroy

    if URI(request.referer).path == "/best_ats/#{@best_at.id}"
      redirect_to("/", :notice => "Best at deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Best at deleted.")
    end
  end
end
