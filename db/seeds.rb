# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
DEGREE = ["Associate's degree",
          "Bachelor's degree",
          "Master's degree",
          "Doctorate"]
COURSES = ["Machine Learning", "Artificial Intelligence", "School of Engineering",
           "Aeronautics & Astronautics (AA)",
           "Bioengineering (BIOE)",
           "Chemical Engineering (CHEMENG)",
           "Civil & Environmental Engineering (CEE)",
           "Computational & Mathematical Engineering (CME)",
           "Computer Science (CS)",
           "Design Institute (DESINST)",
           "Electrical Engineering (EE)",
           "Engineering (ENGR)",
           "Management Science & Engineering (MS&E)",
           "Materials Science & Engineer (MATSCI)",
           "Mechanical Engineering (ME)",
           "Scientific Computing & Comput'l Math (SCCM)",
           "Earth Systems (EARTHSYS)",
           "Earth, Energy, & Environmental Sciences (EEES)",
           "Energy Resources Engineering (ENERGY)",
           "Environment and Resources (ENVRES)",
           "Earth System Science (ESS)",
           "Geological Sciences (GEOLSCI)",
           "Geophysics (GEOPHYS)",
           "Sustainability Science and Practice (SUST)",
           "Woods Institute for the Environment (ENVRINST)",
           "Block Chain",
           "Computer Vision", "Predictive Analysis", "Image Processing", "VLSI", "Embedded Systems"]

DEGREE.uniq.each do |course|
  Degree.create(name: course, description: Faker::Lorem.sentence(word_count: 50))
end
COURSES.uniq.each do |course|
  degrees = Degree.all
  Course.create(name: course, description: Faker::Lorem.sentence(word_count: 50), degree: degrees.sample)
end

100.times do
  degrees = Degree.all
  Student.create(name: Faker::Name.unique.name, email: Faker::Internet.unique.email,
                 enrollment_no: Faker::IDNumber.unique.valid, degree: degrees.sample)
end

Student.all.each do |student|
  degree = student.degree
  courses = degree.courses
  count = rand 1..(courses.size + 1)
  courses = courses.sample(count)
  courses.each do |course|
    StudentsCourses.create(course: course, student: student)
  end
end
