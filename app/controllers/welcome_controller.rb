class WelcomeController < ApplicationController
  def index
  end

  def edit
  end

  def update

		if @wMessage.update(params[:welcome].permit(:mainTitle, :title, :body))
			redirect_to root_path
		else
			render 'edit'
		end
  end
  private
  def welcomeMessage_params
    params.require(:welcome).permit(:mainTitle, :title, :body)
  end
end
