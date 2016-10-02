l1 = Laundry.create(name: "Lavaexpress", address: "Calle 127 #57-45", phone: "6459122", score: 4.4)
l2 = Laundry.create(name: "Lavatodo", address: "Carrera 22A #12-87", phone: "3604117", score: 3.4)
l3 = Laundry.create(name: "Lavanderia Juanca", address: "Diagonal 91A #27-18 sur", phone: "7836904", score: 4.6)

g1 = Garment.create(name: "Jean")
g2 = Garment.create(name: "Vestido de paño mujer")
g3 = Garment.create(name: "Traje de paño hombre")
g4 = Garment.create(name: "Camisa hombre")
g5 = Garment.create(name: "Sweater")

s1 = Service.create(price: 4000, laundry_id: 1, garment_id: 1)
s2 = Service.create(price: 10000, laundry_id: 1, garment_id: 2)
s3 = Service.create(price: 15000, laundry_id: 1, garment_id: 3)
s4 = Service.create(price: 5000, laundry_id: 1, garment_id: 4)

s5 = Service.create(price: 5000, laundry_id: 2, garment_id: 1)
s6 = Service.create(price: 12000, laundry_id: 2, garment_id: 2)
s7 = Service.create(price: 12000, laundry_id: 2, garment_id: 3)

s8 = Service.create(price: 3000, laundry_id: 3, garment_id: 1)
s9 = Service.create(price: 11000, laundry_id: 3, garment_id: 2)
s10 = Service.create(price: 16000, laundry_id: 3, garment_id: 3)
s11 = Service.create(price: 6000, laundry_id: 3, garment_id: 4)
s12 = Service.create(price: 8000, laundry_id: 3, garment_id: 5)