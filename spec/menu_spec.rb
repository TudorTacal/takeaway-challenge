require "menu"

describe Menu do
  subject(:menu) {described_class.new}
  let(:dishes) do
    {
      chicken: 5,
      beef: 6,
      pork: 7
    }
  end
  it "should contain a list of dishes with prices" do
    expect(menu.dishes).to eq ({chicken:5, beef:6, pork: 7})
  end

  it "should be able to add dishes on the menu" do
    menu.add("caviar", 4)
    expect(menu.dishes).to eq ({chicken:5, beef:6, pork: 7, caviar: 4})
  end

  it "should be able to delete a dish from the dish list" do
    menu.remove_dish("chicken")
    expect(menu.dishes).to eq ({beef:6, pork: 7})
  end

  it "should print a list of dishes with prices" do
    printed_menu = "Chicken £5, Beef £6, Pork £7"
    expect(menu.print).to eq printed_menu
  end
end
