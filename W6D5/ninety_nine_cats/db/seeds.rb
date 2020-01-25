# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all

c1 = Cat.create(birth_date: '2015/04/22', color: 'tuxedo', name: 'Mary', sex: 'F', description: "" )
c2 = Cat.create(birth_date: '2012/12/01', color: 'orange', name: 'Gus', sex: 'M', description: "the fattest" )
c3 = Cat.create(birth_date: '2018/08/14', color: 'yellow', name: 'Taz', sex: 'F', description: "does not like toys" )
c4 = Cat.create(birth_date: '2015/04/01', color: 'black', name: 'Fred', sex: 'F', description: "woof cat" )
c5 = Cat.create(birth_date: '2015/04/02', color: 'grey', name: 'Pickles', sex: 'F', description: "likes lights" )
c6 = Cat.create(birth_date: '2015/04/03', color: 'brown', name: 'Hanky', sex: 'F', description: "" )    