# this class is responsible for displaying a menu, adding dishes with quantities and finalizing the order by sending an sms.
require 'dotenv'
Dotenv.load
require_relative "./order"
require_relative './sms.rb'
require_relative './menu.rb'

class TakeAway

  attr_reader :menu

  def initialize(menu:, order: , sms:)
    @order = order
    @sms = sms
    @menu = menu
  end

  def print_menu
    menu.print
  end

  def add_to_basket(dish,number)
    @order.add(dish,number)
    "You added #{number} x #{dish} to the basket."
  end

  def check_price(my_price)
    my_price == total_price
  end

  def checkout(value)
    raise "The price doesn't match: enter the correct value." unless check_price(value)
    reset_order
    send_message("Your order will arrive at #{Time.now.hour+1}:#{Time.now.min}")
  end

  private
    attr_reader :menu

    def send_message(message)
      @sms.text_message(message)
    end

    def reset_order
      @order.reset_order
    end

    def total_price
      @order.total
    end


end
