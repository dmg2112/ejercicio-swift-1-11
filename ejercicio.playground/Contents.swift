//: Playground - noun: a place where people can play

import UIKit
enum TeacherType{
    case interno
    case externo}
enum Salary: CustomStringConvertible{
    case junior(amount: Float)
    case senior(amount: Float)
    case medium(amount: Float)
    
    var description: String{
        switch self{
        case .junior:
            return "Junior"
        case .medium :
           return "Medium"
        case .senior :
            return "Senior"
        }
    }
    var amount: String {
        var sueldo : Float = 0.0
        switch self{
        case .junior(let amount):
            sueldo = amount
        case .medium (let amount):
            sueldo = amount
        case .senior (let amount):
            sueldo = amount
        }
        return "\(sueldo)"

    }
}
class Student{
    var name : String?
    var surname : String?
    var age : Int?
    var phone : String?
    var address : String?
    var email : String?

    convenience init (name : String? = nil, surname : String? = nil, age: Int?, address : String? = nil, email : String? = nil){
        self.init()
        self.name = name
        self.surname = surname
        self.age = age
        self.address = address
        self.email = email
    }
}
class Teacher{
    var name : String?
    var surname : String?
    var age : Int?
    var type : TeacherType?
    var email : String?
    var sueldo : Salary?
    
    convenience init (name : String? = nil, surname : String? = nil, age: Int? = nil, type : TeacherType? = nil, email : String? = nil,sueldo : Salary? = nil){
        self.init()
        self.name = name
        self.surname = surname
        self.age = age
        self.type = type
        self.email = email
        self.sueldo = sueldo
    }
}
class Subject{
    var name : String?
    var year : Date?
    var teachers : [Teacher]?
    var students : [Student]?
    
    convenience init (name : String? = nil, year : Date? = nil, teachers : [Teacher]? = nil, students : [Student]? = nil ){
        self.init()
        self.name = name
        self.students = students
        self.teachers = teachers
        self.year = year
    }
}

let students = [Student(name: "David",
                        age: 9,
                        email: "dadaadaol@adsasd.com"),
                Student(name: "Diego",
                        age: 14,
                        email: "ddddddol@adsasd.com"),
                Student(name: "Mario",
                        age: 16,
                        email: "aaaaol@adsasd.com"),
                Student(name: "Javier",
                        age: 20,
                        email: "ddddol@adsasd.com"),
                Student(name: "Oliver",
                        age: 5,
                        email: "wwwwol@adsasd.com"),
                Student(name: "Carlos",
                        age: 6,
                        email: "aaaol@adsasd.com"),
                Student(name: "Alvaro",
                        age: 5,
                        email: "olddd@adsasd.com"),
                Student(name: "Minguez",
                        age: 3,
                        email: "dsadasol@adsasd.com")]

let teachers = [Teacher(name: "John",
                        type: .interno,
                        email: "jjjhhhholasas@adsasd.com",
                        sueldo: .senior(amount: 120.0)),
                
                Teacher(name: "James",
                        type: .interno,
                        email: "jjjjol@adsasd.com",
                        sueldo: .junior(amount: 10.0)),
                Teacher(name: "Cris",
                        type: .externo,
                        email: "cccccol@adsasd.com",
                        sueldo: .medium(amount: 50.0)),
                Teacher(name: "Michel",
                        type: .externo,
                        email: "mmmmol@adsasd.com",
                        sueldo: .senior(amount: 1230.0)),
                Teacher(name: "Rust",
                        type: .interno,
                        email: "rrrrol@adsasd.com",
                        sueldo: .senior(amount: 145.0)),
                Teacher(name: "Martin",
                        type: .interno,
                        email: "mmmmol@adsasd.com",
                        sueldo: .junior(amount: 25.0)),
                Teacher(name: "Wendell",
                        type: .externo,
                        email: "wwwwol@adsasd.com",
                        sueldo: .senior(amount: 150.0)),
                Teacher(name: "Elli",
                        type: .externo,
                        email: "eeeol@adsasd.com",
                        sueldo: .senior(amount: 500.0))]
let subjects = [Subject(name: "iOS",
                        year: Calendar.current.date(from: DateComponents(year:2018,month:3)),
                        teachers: teachers.filter{ $0.name?.contains("u") ?? false},
                        students: students.filter{ $0.name?.contains("a") ?? false}),
                Subject(name: "Java",
                        year: Calendar.current.date(from: DateComponents(year:2017,month:3)),
                        teachers: teachers.filter{ $0.name?.contains("o") ?? false},
                        students: students.filter{ $0.name?.contains("e") ?? false}),
                Subject(name: "Python",
                        year: Calendar.current.date(from: DateComponents(year:2019,month:6)),
                        teachers: teachers.filter{ $0.name?.contains("u") ?? false},
                        students: students.filter{ $0.name?.contains("u") ?? false}),
                Subject(name: "C",
                        year: Calendar.current.date(from: DateComponents(year:2019,month:2)),
                        teachers: teachers.filter{ $0.name?.contains("u") ?? false},
                        students: students.filter{ $0.name?.contains("u") ?? false}),
                Subject(name: "Android",
                        year: Calendar.current.date(from: DateComponents(year:2018,month:3)),
                        teachers: teachers.filter{ $0.name?.contains("u") ?? false},
                        students: students.filter{ $0.name?.contains("u") ?? false}),
                Subject(name: "C++",
                        year: Calendar.current.date(from: DateComponents(year:2019,month:11)),
                        teachers: teachers.filter{ $0.name?.contains("a") ?? false},
                        students: students.filter{ $0.name?.contains("u") ?? false}),
                Subject(name: "HTML",
                        year: Calendar.current.date(from: DateComponents(year:2018,month:3)),
                        teachers: teachers.filter{ $0.name?.contains("u") ?? false},
                        students: students.filter{ $0.name?.contains("a") ?? false}),
                
]
students.forEach { student in
    guard let studentName = student.name else {
        return
    }
    let subject = subjects.filter{$0.students?.contains( where: {subject in
        guard let StudentSubjectName = subject.name else{
        return false }
        return StudentSubjectName.compare(studentName) == .orderedSame
    }) ?? false }
    print(studentName)
    print (subject.count)
    print(subject.compactMap {$0.name})
    
}
students.forEach { student in
    guard let studentName = student.name else {
        return
    }
    let subject = subjects.filter{$0.students?.contains( where: {subject in
        guard let StudentSubjectName = subject.name else{
            return false }
        return StudentSubjectName.compare(studentName) == .orderedDescending
    }) ?? false }
    if(subject.count>1){
            print("\(studentName) esta en mas de una asignatura")
    }

    
    
}







teachers.forEach { teacher in
    guard let teacherName = teacher.name else {
        return
    }
    let subject = subjects.filter{$0.teachers?.contains( where: {subject in
        guard let teacherSubjectName = subject.name else{
            return false }
        return teacherSubjectName.compare(teacherName) == .orderedSame
    }) ?? false }
    if(subject.count>1){
        print (subject.count)
        print(subject.compactMap {$0.name})
        print("\(teacherName) imparte  mas de una asignatura")
        
    }
    
    
    
}
teachers.forEach { teacher in
    guard let teacherName = teacher.name else {
        return
    }
    let subject = subjects.filter{$0.teachers?.contains( where: {subject in
        guard let teacherSubjectName = subject.name else{
            return false }
        return teacherSubjectName.compare(teacherName) == .orderedSame
    }) ?? false }
    if(subject.count>1){
        print (subject.count)
        print(subject.compactMap {$0.name})
        print("\(teacherName) imparte  mas de una asignatura")
        
    }
    
    
    
}


let sortedStudents = students.sorted(by:{$0.age ?? 0 < $1.age ?? 0})
print(sortedStudents.compactMap{$0.name})
print(sortedStudents.compactMap{$0.age})

let internos = teachers.filter{$0.type == .interno}
let externos = teachers.filter{$0.type == .externo}
print (internos.compactMap{$0.name})
print(internos.count)
print (externos.compactMap{$0.name})
print (externos.count)

let sortedByDate = subjects.sorted { actual, next in
    guard   let fecha1 = actual.year,
            let fecha2 = next.year
        else{
        return false}
    
    
    return fecha1.compare(fecha2) == .orderedAscending
    
    
}

print(sortedByDate.compactMap{$0.name})
print(sortedByDate.compactMap{$0.year})

let subjectDateFormatted = DateFormatter()
subjectDateFormatted.locale = Locale(identifier: "es_ES")
subjectDateFormatted.dateFormat="eeee dd 'de' MMMM 'de' yyyy"
subjects.forEach{ subject in
    guard let name = subject.name,
        let year=subject.year
        else{
        return
    }
    print("\(name)")
    print("\(subjectDateFormatted.string(from: year))")
    
}

teachers.forEach{
    guard let sueldo = $0.sueldo, let name = $0.name else{
        return
    }
    print (name)
    print (sueldo.description)
    print (sueldo.amount)
    print()
    
    
}
