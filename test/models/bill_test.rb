require 'test_helper'

class BillTest < ActiveSupport::TestCase
	test "the truth" do
		assert true
	end

	test "no guardar si no hay datos" do
		bill = Bill.new
		assert_not bill.save, "debe fallar, ya que no hay datos"
	end

	test "guardar si hay datos" do
		bill = Bill.new
		bill = bills(:one)
		assert bill.save, "debe aprobar, todos los datos estan"
	end

	test "no guardar numeros negativos en total_bill" do
		bill = Bill.new
		bill = bills(:two)
		assert_not bill.save, "debe fallar, no admitir numeros negativos"
	end

	test "no guardar si no hay orden relacionada" do
		bill = Bill.new
		bill = bills(:three)
		assert_not bill.save, "debe fallar, no hay información en order_id"
	end	

	test "guardar si el valor de total_bill es cero" do
		bill = Bill.new
		bill = bills(:four)
		assert bill.save, "debe aprobar, admite valores en cero"
	end
end
