
require "take_away"

describe TakeAway do
  subject(:take_away) {described_class.new(Order)}

  context "when #menu it" do
    it "should respond to menu" do
      expect(take_away).to respond_to(:menu)
    end
    it "should display a list of dishes with prices" do
      expect(take_away.menu).to eq ({chicken: 5, beef: 6, pork: 7})
    end
  end

  context "when #add_to_basket it" do
    it "should have a add_to_basket method" do
      expect(take_away).to respond_to(:add_to_basket)
    end
    it "should send a message with the added items" do
      expect(take_away.add_to_basket("chicken",5)).to eq   "You added 5 x chicken to the basket."
    end
  end
    context "when #check_price it" do
      it {is_expected.to respond_to(:check_price).with(1).argument}
      it "should verify the given value against the total price of the dishes added to basket" do
        take_away.add_to_basket("chicken",5)
        take_away.add_to_basket("pork",5)
        expect(take_away.check_price(60)).to eq true
      end
  end
end



# it "should return a list of dishes with the number of dishes ordered" do
#   expect(take_away.order("chicken",2,10)).to eq "You ordered 2 dish(es) of chicken "
# end
# it "should raise an error if the price introduced is different than the total price of the dishes" do
#   expect{take_away.order("chicken",2,11)}.to raise_error "Incorrect total value."
# end
