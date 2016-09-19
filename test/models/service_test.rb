require 'test_helper'

class ServiceTest < ActiveSupport::TestCase
	test "the truth" do
		assert true
	end

	test "no guardar si no hay datos" do
		service = Service.new
		assert_not service.save, "debe fallar, no hay datos de entrada"
	end


	test "guardar si hay datos" do
		service = Service.new
		service = services(:one)
		assert service.save, "debe aprobar, hay datos de entrada"
	end

	test "no guardar si no hay nombre" do
		service = Service.new
		service = services(:two)
		assert_not service.save, "debe fallar, no hay datos de name"
	end

	test "no guardar si no hay cost" do
		service = Service.new
		service = services(:three)
		assert_not service.save, "debe fallar, no hay datos de cost"
	end	

end
