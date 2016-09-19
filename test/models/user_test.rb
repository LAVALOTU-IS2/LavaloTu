require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test "the truth" do
		assert true
	end

	test "no guardar si no hay datos" do
		user = User.new
		assert_not user.save, "debe fallar. no hay datos para guardar"
	end

	#test "guardar si hay datos" do
	#	user = User.new
	#	user = users(:one)
	#	assert user.save, "debe aprobar. los datos estan completos"
	#end

	test "no guardar si no hay name" do
		user = User.new
		user = users(:two)
		assert_not user.save, "debe fallar. no esta el dato name"
	end

	test "no guardar si no hay lastname" do
		user = User.new
		user = users(:three)
		assert_not user.save, "debe fallar, no esta el dato lastname"
	end

	test "no guardar si no hay telefono" do
		user = User.new
		user = users(:four)
		assert_not user.save, "debe fallar, no esta el dato phone"
	end
end
