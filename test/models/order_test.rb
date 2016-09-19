require 'test_helper'

class OrderTest < ActiveSupport::TestCase
	test "the truth" do
		assert true
	end

	test "no guardar si no hay datos" do
		order = Order.new
		assert_not order.save, "Debe fallar, ya que no hay datos"
	end

	test "guardar si hay datos" do
		order = Order.new
		order = orders(:one)
		assert order.save, "debe aprobar, ya que estan llenos los datos"
	end

	test "no guardar si no hay estado" do
		order = Order.new
		order = orders(:two)
		assert_not order.save, "debe fallar, no hay información en el campo estado"
	end

	test "no guardar si no hay información en score" do
		order = Order.new
		order = orders(:three)
		assert_not order.save, "debe fallar, no hay información en el campo score"
	end

	#test "no guardar si hay letras en el score" do
	#	order = Order.new
	#	order = orders(:four)
	#	assert_not order.save, "debe fallar, hay información incorrecta en el campo score"
	#end

end
