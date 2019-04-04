//: Playground - noun: a place where people can play

import UIKit
enum TeacherType{
    case interno
    case externo}

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
    
    convenience init (name : String? = nil, surname : String? = nil, age: Int? = nil, type : TeacherType? = nil, email : String? = nil){
        self.init()
        self.name = name
        self.surname = surname
        self.age = age
        self.type = type
        self.email = email
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
                        email: "jjjhhhholasas@adsasd.com"),
                Teacher(name: "James",
                        type: .interno,
                        email: "jjjjol@adsasd.com"),
                Teacher(name: "Cris",
                        type: .externo,
                        email: "cccccol@adsasd.com"),
                Teacher(name: "Michel",
                        type: .externo,
                        email: "mmmmol@adsasd.com"),
                Teacher(name: "Rust",
                        type: .interno,
                        email: "rrrrol@adsasd.com"),
                Teacher(name: "Martin",
                        type: .interno,
                        email: "mmmmol@adsasd.com"),
                Teacher(name: "Wendell",
                        type: .externo,
                        email: "wwwwol@adsasd.com"),
                Teacher(name: "Elli",
                        type: .externo,
                        email: "eeeol@adsasd.com")]
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
        return StudentSubjectName.compare(studentName) == .orderedSame
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
    
    
    return fecha1.compare(fecha2) == .orderedDescending
    
    
}
print(sortedByDate.compactMap{$0.name})
print(sortedByDate.compactMap{$0.year})
