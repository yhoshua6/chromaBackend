# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.new

user_info = InfoUser.new
user_info.user_id = user.id
user_info.name = 'Marcelo Ortiz'
user_info.cellphone = '000-000-0000'
user_info.payment_method = ''
user_info.bank_name = ''
user_info.bank_account = 0
user_info.bank_clabe = 0
user_info.rfc = ''
user_info.save!

user.role = "Administrador"
user.info_id = user_info.id
user.user = 'licMarcelo'
user.password = 'chroma123'
user.password_confirmation = 'chroma123'
user.save!
=begin
# Client's user
user = User.new
user_info = UsersInfo.new
user_info.user_id = user.id
user_info.first_name = 'Claudia'
user_info.last_name = ''
user_info.cell_phone = 000000000
user_info.payment_method = ''
user_info.bank_name = ''
user_info.bank_account = 0
user_info.bank_clabe = 0
user_info.rfc = ''
user_info.save!
user.role_id = default_role.id
user.info_id = user_info.id
user.user = 'cpena@achedesarrollos.com'
user.password = 'iRentals123'
user.password_confirmation = 'iRentals123'
user.save!
=end

# My user

user = User.new

user_info = InfoUser.new
user_info.name = 'José Epifanio'
user_info.cellphone = '812-513-4218'
user_info.payment_method = 'Debit'
user_info.bank_name = 'Cocodrile Inc.'
user_info.bank_account = 1234
user_info.bank_clabe = 102930
user_info.rfc = 'some rfc'
user_info.save!

user.role = "Administrador"
user.info_id = user_info.id
user.user = 'test123'
user.password = 'chroma123'
user.password_confirmation = 'chroma123'
user.save!

user_info.user_id = user.id
user_info.save!

type = PropertyType.new
type.property_type = "Local Comercial"
type.save!

type = PropertyType.new
type.property_type = "Local Restaurante"
type.save!

type = PropertyType.new
type.property_type = "Bodega"
type.save!

type = PropertyType.new
type.property_type = "Cajón Estacionamiento"
type.save!

type = PropertyType.new
type.property_type = "Loft/Oficina"
type.save!


directory_name = "files"
Dir.mkdir(directory_name) unless File.exists?(directory_name)

directory_name = "files/bills"
Dir.mkdir(directory_name) unless File.exists?(directory_name)

directory_name = "files/vouchers"
Dir.mkdir(directory_name) unless File.exists?(directory_name)

directory_name = "files/documents"
Dir.mkdir(directory_name) unless File.exists?(directory_name)

directory_name = "files/reports"
Dir.mkdir(directory_name) unless File.exists?(directory_name)

directory_name = "files/gatherings"
Dir.mkdir(directory_name) unless File.exists?(directory_name)
