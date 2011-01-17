xml.instruct!
xml.chart :caption => 'Recipes Count by Country' do
	@recipes_count_by_countries.each do |recipe|
		xml.set(:label => recipe.country.name, :value => recipe['counter'])
	end
end
