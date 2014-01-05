class CharityVerifiersController < ApplicationController

def search
  step = 20
  offset = params[:offset] || 0

  @search_name = params[:name].upcase
  render json: CharityVerifier.where("org_name LIKE ?", "%#{@search_name}%").limit(step).offset(offset)
end



end
