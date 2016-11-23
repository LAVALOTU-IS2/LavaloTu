OrderDetail.delete_all
Deliverer.delete_all
Service.delete_all
Order.delete_all
Laundry.delete_all
Garment.delete_all

l1 = Laundry.create(name: "Lavaexpress", address: "Calle 127 #57-45", phone: "6459122", opening_time: "08:00", closing_time: "15:00", score: 4.4)
l2 = Laundry.create(name: "Lavatodo", address: "Carrera 22A este #12-87", phone: "3604117", opening_time: "09:00", closing_time: "15:00", score: 3.4)
l3 = Laundry.create(name: "Lavanderia Juanca", address: "Diagonal 91A #27-18 sur", phone: "7836904", opening_time: "08:00", closing_time: "16:00", score: 4.6)
l4 = Laundry.create(name: "Lavaseco Angie Express", address: "Calle 151 # 103C-03", phone: "6923994", opening_time: "08:00", closing_time: "16:00", score: 5.0)
l5 = Laundry.create(name: "Lavafast", address: "Carrera 80b #24c-15", phone: "7458860", opening_time: "09:00", closing_time: "16:00", score: 0.5)

g1 = Garment.create(name: "Jeans")
g2 = Garment.create(name: "Dress")
g3 = Garment.create(name: "Jacket")
g4 = Garment.create(name: "Shirt")
g5 = Garment.create(name: "Polo")
g6 = Garment.create(name: "Undershirt")
g7 = Garment.create(name: "Blouse")
g8 = Garment.create(name: "Suit")
g9 = Garment.create(name: "Tie")
g10 = Garment.create(name: "Queen Size Quilt")
g11 = Garment.create(name: "King Size Quilt")

s1 = Service.create(name: "Washed And Dryed", cost: 4000, laundry_id: 1, garment_id: 1)
s2 = Service.create(name: "Dyed", cost: 14000, laundry_id: 1, garment_id: 1)
s3 = Service.create(name: "Washed And Dryed", cost: 6000, laundry_id: 1, garment_id: 2)
s4 = Service.create(name: "Washed And Dryed", cost: 7000, laundry_id: 1, garment_id: 3)
s5 = Service.create(name: "Dyed", cost: 17000, laundry_id: 1, garment_id: 3)
s6 = Service.create(name: "Washed And Dryed", cost: 5000, laundry_id: 1, garment_id: 4)
s7 = Service.create(name: "Washed And Dryed", cost: 4000, laundry_id: 1, garment_id: 5)
s8 = Service.create(name: "Dyed", cost: 14000, laundry_id: 1, garment_id: 5)
s9 = Service.create(name: "Washed And Dryed", cost: 4000, laundry_id: 1, garment_id: 6)
s10 = Service.create(name: "Dyed", cost: 8000, laundry_id: 1, garment_id: 6)
s10 = Service.create(name: "Washed And Dryed", cost: 6000, laundry_id: 1, garment_id: 7)
s11 = Service.create(name: "Washed And Dryed", cost: 15000, laundry_id: 1, garment_id: 8)
s12 = Service.create(name: "Washed And Dryed", cost: 2000, laundry_id: 1, garment_id: 9)
s11 = Service.create(name: "Washed And Dryed", cost: 10000, laundry_id: 1, garment_id: 10)
s12 = Service.create(name: "Washed And Dryed", cost: 13000, laundry_id: 1, garment_id: 11)

s13 = Service.create(name: "Washed And Dryed", cost: 5000, laundry_id: 2, garment_id: 1)
s14 = Service.create(name: "Dyed", cost: 15000, laundry_id: 2, garment_id: 1)
s15 = Service.create(name: "Washed And Dryed", cost: 7000, laundry_id: 2, garment_id: 2)
s16 = Service.create(name: "Washed And Dryed", cost: 8000, laundry_id: 2, garment_id: 3)
s17 = Service.create(name: "Dyed", cost: 18000, laundry_id: 2, garment_id: 3)
s18 = Service.create(name: "Washed And Dryed", cost: 6000, laundry_id: 2, garment_id: 4)
s19 = Service.create(name: "Washed And Dryed", cost: 5000, laundry_id: 2, garment_id: 5)
s20 = Service.create(name: "Dyed", cost: 15000, laundry_id: 2, garment_id: 5)
s21 = Service.create(name: "Washed And Dryed", cost: 6000, laundry_id: 2, garment_id: 6)
s22 = Service.create(name: "Dyed", cost: 9000, laundry_id: 2, garment_id: 6)
s23 = Service.create(name: "Washed And Dryed", cost: 8000, laundry_id: 2, garment_id: 7)
s24 = Service.create(name: "Washed And Dryed", cost: 18000, laundry_id: 2, garment_id: 8)
s25 = Service.create(name: "Washed And Dryed", cost: 3000, laundry_id: 2, garment_id: 9)
s26 = Service.create(name: "Washed And Dryed", cost: 14000, laundry_id: 2, garment_id: 10)
s27 = Service.create(name: "Washed And Dryed", cost: 17000, laundry_id: 2, garment_id: 11)

s28 = Service.create(name: "Washed And Dryed", cost: 6000, laundry_id: 3, garment_id: 1)
s29 = Service.create(name: "Washed And Dryed", cost: 5000, laundry_id: 3, garment_id: 2)
s30 = Service.create(name: "Washed And Dryed", cost: 5000, laundry_id: 3, garment_id: 4)
s31 = Service.create(name: "Washed And Dryed", cost: 5000, laundry_id: 3, garment_id: 5)
s32 = Service.create(name: "Washed And Dryed", cost: 5000, laundry_id: 3, garment_id: 6)
s33 = Service.create(name: "Washed And Dryed", cost: 5000, laundry_id: 3, garment_id: 7)
s34 = Service.create(name: "Washed And Dryed", cost: 15000, laundry_id: 3, garment_id: 8)
s35 = Service.create(name: "Washed And Dryed", cost: 2500, laundry_id: 3, garment_id: 9)
s36 = Service.create(name: "Washed And Dryed", cost: 12000, laundry_id: 3, garment_id: 10)
s37 = Service.create(name: "Washed And Dryed", cost: 15000, laundry_id: 3, garment_id: 11)

s38 = Service.create(name: "Washed And Dryed", cost: 3000, laundry_id: 4, garment_id: 1)
s39 = Service.create(name: "Dyed", cost: 15000, laundry_id: 4, garment_id: 1)
s40 = Service.create(name: "Washed And Dryed", cost: 5000, laundry_id: 4, garment_id: 2)
s41 = Service.create(name: "Washed And Dryed", cost: 6000, laundry_id: 4, garment_id: 3)
s42 = Service.create(name: "Dyed", cost: 18000, laundry_id: 4, garment_id: 3)
s43 = Service.create(name: "Washed And Dryed", cost: 6000, laundry_id: 4, garment_id: 4)
s44 = Service.create(name: "Washed And Dryed", cost: 5000, laundry_id: 4, garment_id: 5)
s45 = Service.create(name: "Dyed", cost: 13000, laundry_id: 4, garment_id: 5)
s46 = Service.create(name: "Washed And Dryed", cost: 4500, laundry_id: 4, garment_id: 6)
s47 = Service.create(name: "Dyed", cost: 9000, laundry_id: 4, garment_id: 6)
s48 = Service.create(name: "Washed And Dryed", cost: 5000, laundry_id: 4, garment_id: 7)
s49 = Service.create(name: "Washed And Dryed", cost: 14000, laundry_id: 4, garment_id: 8)
s50 = Service.create(name: "Washed And Dryed", cost: 1500, laundry_id: 4, garment_id: 9)
s51 = Service.create(name: "Washed And Dryed", cost: 12000, laundry_id: 4, garment_id: 10)
s52 = Service.create(name: "Washed And Dryed", cost: 14000, laundry_id: 4, garment_id: 11)

#o1 = Order.create(pickup_date: "2016-11-13 13:00", total_cost: 22000, user_id: 1, laundry_id: 1, status: "Generated")
#o2 = Order.create(pickup_date: "2016-11-13 11:00", total_cost: 47000, user_id: 1, laundry_id: 3, status: "Generated")
#o3 = Order.create(date_pickup: "2016-11-13 14:00", date_deliver: "2016-11-15 08:00", score: 5, comment: "Excelente servicio", total_cost: 49000, user_id: 1, laundry_id: 2, status: "Completed")
#o4 = Order.create(date_pickup: "2016-10-20 15:00", date_deliver: "2016-11-15 09:00", score: 4, comment: "Buen servicio", total_cost: 19000, user_id: 2, laundry_id: 4, status: "Completed")


#od1 = OrderDetail.create(order_id: 1, garment_id: 1, service_name: "Washed and Dryed", quantity: 1, cost: 4000)
#od2 = OrderDetail.create(order_id: 1, garment_id: 2, service_name: "Washed and Dryed", quantity: 3, cost: 6000)

#od3 = OrderDetail.create(order_id: 2, garment_id: 1, service_name: "Washed and Dryed", quantity: 5, cost: 6000)
#od4 = OrderDetail.create(order_id: 2, garment_id: 8, service_name: "Washed and Dryed", quantity: 1, cost: 15000)
#od5 = OrderDetail.create(order_id: 2, garment_id: 9, service_name: "Washed and Dryed", quantity: 2, cost: 2500)

#od6 = OrderDetail.create(order_id: 3, garment_id: 2, service_name: "Washed and Dryed", quantity: 3, cost: 7000)
#od7 = OrderDetail.create(order_id: 3, garment_id: 3, service_name: "Washed and Dryed", quantity: 2, cost: 8000)
#od8 = OrderDetail.create(order_id: 3, garment_id: 4, service_name: "Washed and Dryed", quantity: 2, cost: 6000)

#od9 = OrderDetail.create(order_id: 4, garment_id: 5, service_name: "Washed and Dryed", quantity: 2, cost: 5000)
#od10 = OrderDetail.create(order_id: 4, garment_id: 6, service_name: "Washed and Dryed", quantity: 2, cost: 4500)


d1 = Deliverer.create(name: "Zulma Hurtado", email: "zehurtadop@gmail.com", phone: "3123456543", laundry_id: 4)
d2 = Deliverer.create(name: "Julian Garcia", email: "julior@gmail.com", phone: "3125678754", laundry_id: 4)
d3 = Deliverer.create(name: "Luis Rojas", email: "luro@gmail.com", phone: "3133456543", laundry_id: 4)
