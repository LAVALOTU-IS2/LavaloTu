require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
	test "the truth" do
		assert true
	end

	test "no guardar si no hay datos" do
		place = Place.new
		assert_not place.save, "debe fallar, no hay datos "
	end

	test "guardad si hay datos" do
		place = Place.new
		place = places(:one)
		assert place.save, "debe fallar, no hay datos"
	end

	test "no guardar si no hay nombre" do
		place = Place.new
		place = places(:two)
		assert_not place.save, "debe fallar, no hay informacion del nombre"
	end

	test "no guardar si no hay direccion" do
		place = Place.new
		place = places(:three)
		assert_not place.save, "debe fallar, no hay informacion del nombre"
	end

	test "no guardar si no hay user_id" do
		place = Place.new
		place = places(:four)
		assert_not place.save, "debe fallar, no hay informacion del user_id"
	end

	

end
