require 'rails_helper'

# describe Recipe, type: :model do 
#     describe 'title' do
#         it 'has title' do
#             recipe = Recipe.new
#             recipe.title = "Baked Ziti"
#             expect(recipe.title).to eq "Baked Ziti"
#     end
# end
# end


describe Recipe do
    let(:attributes) do 
        {
            title: "Baked Ziti",
            description: "Baked ziti recipe here",
            # link: "www.link.com",
            # user_id: 1,
            # group_id: 7
        }
    end

    it "has valid title and description" do 
        expect(Recipe.new(attributes)).to be_valid
    end
end

#how to get above to work?