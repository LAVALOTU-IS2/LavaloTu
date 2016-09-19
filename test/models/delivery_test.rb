require 'test_helper'

class DeliveryTest < ActiveSupport::TestCase
	test "the truth" do
		assert true
	end

	test "no guardar si no hay datos" do
		delivery = Delivery.new
		assert_not delivery.save, "Esta prueba debe fallar. Hay datos de entrada"
	end

	test "guardar si hay datos" do
		delibery = Delivery.new
		delibery = deliveries(:one)
		assert delibery.save, "Esta prueba debe aprobar. No estan todos los datos llenos"
	end

	test "no guardar si hay letras en el atributo de telefono" do
		delibery = Delivery.new
		delibery = deliveries(:two)
		assert_not delibery.save, "Esta prueba debe fallar. No hay letras en el numero telefonico"
	end

	#test "no guardar si el numero no empieza por 3" do
	#	delibery = Delivery.new
	#	delibery = deliveries(:three)
	#	assert_not delibery.save, "Esta prueba debe fallar. Asegurece que el numero no empiece por 3"
	#end

	test "no guardar por la longitud de nombre" do
		delibery = Delivery.new
		delibery = deliveries(:four)		
		assert_not delibery.save, "esta prueba debe fallar. Hay menos de 20 caracteres en la entrada"
	end

end
