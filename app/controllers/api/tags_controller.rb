class Api::TagsController < ActionController::Base
  def index
    @all_tags = ActsAsTaggableOn::Tag.all
    render json: @all_tags
  end
  
  def most_used
    @most_used = ActsAsTaggableOn::Tag.most_used
    render json: @most_used
  end
end
