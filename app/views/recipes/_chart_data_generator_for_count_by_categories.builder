xml.instruct!
xml.chart :caption => 'Recipes Count by Category' do
	@recipes_count_by_categories.each do |category_assignment|
		xml.set(:label => category_assignment.category.name, :value => category_assignment['counter'])
	end
end
