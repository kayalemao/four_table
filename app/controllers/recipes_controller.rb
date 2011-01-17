class RecipesController < ApplicationController

  hobo_model_controller
  before_filter :save_fusion_chart_data, :only => [:index]
  
  auto_actions :all

  def index
	hobo_index Recipe.viewable(current_user).apply_scopes(:search => [params[:search], :title, :body], :order_by => parse_sort_param(:title, :country))
  end
  
  def do_publish
	do_transition_action :publish do
		redirect_to recipes_path
	end
  end
  
  def do_not_publish
	do_transition_action :not_publish do
		redirect_to recipes_path
	end
  end
  

private

	def save_fusion_chart_data
		@recipes_count_by_countries = Recipe.find(:all, :select => 'country_id, count(*) as counter', :group => 'country_id')
		filename = "#{RAILS_ROOT}/public/recipes_count_by_countries.xml"
		xml_string = render_to_string(:partial => 'chart_data_generator_for_count_by_country')
		save_xml_file(filename, xml_string)
		@recipes_count_by_categories = CategoryAssignment.find(:all, :select => 'category_id, count(*) as counter', :group => 'category_id')
		filename = "#{RAILS_ROOT}/public/recipes_count_by_categories.xml"
		xml_string = render_to_string(:partial => 'chart_data_generator_for_count_by_categories')
		save_xml_file(filename, xml_string)
	end
	def save_xml_file(filename, data)
		FileUtils.rm(filename, :force => true)
		f = File.new(filename, 'w')
		f.write(data)
		f.close
	end
end
