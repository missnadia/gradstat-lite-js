# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

students = Student.create([{ 
    username: "sfields",
    password: "password",
    email: "sfields@abc.com",
    first_name: "Sally",
    last_name: "Fields",
    admin: true
},
{
    username: "tbear",
    password: "password",
    email: "tbear@efg.com",
    first_name: "Teddy",
    last_name: "Bear",
    admin: false
}])