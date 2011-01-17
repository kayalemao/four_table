class Recipe < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    title   :string
    body    :text
    #country enum_string(:American, :French, :Chinese)
    timestamps
  end

	belongs_to :country
	has_many :categories, :through => :category_assignments, :accessible => :true
	has_many :category_assignments, :dependent => :destroy 

	lifecycle :state_field => :lifecycle_state do
	
		state :not_published, :default => true
		state :published
		
		transition :publish, { :not_published => :published }, :available_to => "User"
		transition :not_publish, { :published => :not_published }, :available_to => "User"
		
	end
	
	named_scope :viewable, lambda {|acting_user| {:conditions => "#{acting_user.signed_up? ? 1 : 0}=1 or lifecycle_state='published'"  }}


  # --- Permissions --- #

  def create_permitted?
    acting_user.signed_up?
  end

  def update_permitted?
    acting_user.signed_up?
  end

  def destroy_permitted?
    acting_user.signed_up?
  end

  def view_permitted?(field)
    true
  end

end
