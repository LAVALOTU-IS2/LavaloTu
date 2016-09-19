require 'test_helper'

class GarmentTest < ActiveSupport::TestCase
	test "the truth" do
		assert true
	end

	test "no guardar si no hay datos" do
		garment = Garment.new
		assert_not garment.save, "debe fallar. no hay datos de entrada"
	end

	test "guardar si hay datos de entrada" do
		garment = Garment.new
		garment = garments(:one)
		assert garment.save, "debe aprobar. los campos de entrada estan completos"
	end

	test "no guardar si el nombre esta vacio" do
		garment = Garment.new
		garment = garments(:two)
		assert_not garment.save, "debe fallar, no debe haber titulo"
	end

	test "guardar si la descripcion esta vacio" do
		garment = Garment.new
		garment = garments(:three)
		assert garment.save, "debe aprobar,debe guardar asi no tenga descripcion"
	end

end
