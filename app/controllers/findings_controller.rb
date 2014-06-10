class FindingsController < ApplicationController

  def index
   @point = Point.find(params[:point])
   @query = Finding.ransack(params[:q]) 
   @findings = @query.result(distinct: true).includes(:research).paginate(page: params[:page])     
   @researches = Research.find(@findings.map(&:research_id).uniq)
  end

  def search
    index
    render :index
  end 
  
end   