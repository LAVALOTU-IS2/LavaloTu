require 'test_helper'

class IdentityTest < ActiveSupport::TestCase
	test "the truth" do
		assert true
	end

	test "no guardar si no hay datos" do
		identity = Identity.new
		assert_not identity.save, "debe fallar, no hay datos de entrada"
	end

	test "guardar si hay datos" do
		identity = Identity.new
		identity = identities(:one)
		assert identity.save, "debe aprobar, todos los datos de entrada estan completos"
	end

	test "no guardar si no hay provider" do
		identity = Identity.new
		identity = identities(:two)
		assert_not identity.save, "debe fallar, no debe estar el valor de provider"
	end

	test "no guardar si no esta uid" do
		identity = Identity.new
		identity = identities(:three)
		assert_not identity.save, "debe fallar, no debe estar el valor de uid"
	end

	test "no guardar si no hay user_id" do
		identity = Identity.new
		identity = identities(:four)
		assert_not identity.save, "debe fallar, no debe estar el valor de user_id"
	end

	test "no guardar si no es int el valor de user_id" do
		identity = Identity.new
		identity = identities(:five)
		assert_not identity.save, "debe fallar, no debe contener caracteres el user_id"
	end
end
