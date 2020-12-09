# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed commands (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Question.create(description: "Ավ․Իսահակյան․ «Կեսգիշերին գետի ափին/ես նստած եմ սիրավառ․/Գետն հոսում է,և հոսանքին/ես նայում եմ ․․․»։",
                point: 10).answers.create([
                                             {description: "Զինավառ", right: false},
                                             {description: "Բոցավառ", right: false},
                                             {description: "Անդադար", right: false},
                                             {description: "Միալար", right: true},
                                         ])
Question.create(description: "17թ․ Կապադովկիայի Մաժաք տեղավայրը դարձավ հռոմեական պրովինցիա և վերանվանվեց ․․․",
                point: 15).answers.create([
                                             {description: "Բութանիա", right: false},
                                             {description: "Մալաթիա", right: false},
                                             {description: "Կեսարիա", right: true},
                                             {description: "Սեբաստիա", right: false},
                                         ])
Question.create(description: "Ամենափոքր տառատեսակը",
                point: 18).answers.create([
                                              {description: "Բրիլիանտ", right: true},
                                              {description: "Պետիտ", right: false},
                                              {description: "Մինյոն", right: false},
                                              {description: "Ցիցերո", right: false},
                                          ])
Question.create(description: "Ժողովուրդն ասում է․ «Քանի լեզու գիտես, այնքան ․․․»",
                point: 5).answers.create([
                                              {description: "Մարդ ես", right: true},
                                              {description: "Զարդ ես ", right: false},
                                              {description: "Շատ փող ունես", right: false},
                                              {description: "Քիչ ես վաստակում", right: false},
                                          ])
Question.create(description: "Երկու տարեկան կովին կոչում են ․․․",
                point: 5).answers.create([
                                              {description: "Մոզի", right: true},
                                              {description: "Կովամոզի", right: false},
                                              {description: "Կովի ձագ", right: false},
                                              {description: "էշի ձագ", right: false},
                                          ])
Question.create(description: "Բառը, որի վրա շեշտ է դրվում կոչվում է ․․․",
                point: 18).answers.create([
                                              {description: "Կոչական", right: true},
                                              {description: "Քննչական", right: false},
                                              {description: "Պոչական", right: false},
                                              {description: "Պոչով֊պոզովական", right: false},
                                          ])
Question.create(description: "Այս գործիքներից ո՞րն է ստեղնաշարային լարային  կամիթավոր",
                point: 18).answers.create([
                                              {description: "Դաշնամուր", right: false},
                                              {description: "Կլավեսին", right: true},
                                              {description: "Տավիղ", right: false},
                                              {description: "Չելեստա", right: false},
                                          ])