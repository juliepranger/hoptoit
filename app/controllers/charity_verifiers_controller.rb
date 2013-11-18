class CharityVerifiersController < ApplicationController

def search
  @search_name = params[:name].upcase
  render json: CharityVerifier.where("org_name LIKE '%#{@search_name}%'")
end



end
