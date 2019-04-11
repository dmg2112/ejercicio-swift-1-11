//: Playground - noun: a place where people can play

import UIKit
enum TeacherType: CustomStringConvertible{
    case interno
    case externo
    var description: String{
        switch self{
        case .interno:
            return "Interno"
        case .externo :
            return "Externo"
        
        }
    }
}
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
extension Date{
     func formatea () -> String{
        let subjectDateFormatted = DateFormatter()
        subjectDateFormatted.locale = Locale(identifier: "es_ES")
        subjectDateFormatted.dateFormat="eeee dd 'de' MMMM 'de' yyyy"
        return "\(subjectDateFormatted.string(from: self))"
        
    }
    func edad() -> String {
        let now = Date()
        let calendr = Calendar.current
        let ageComponents = calendr.dateComponents([.year],from: self, to: now)
        guard let age = ageComponents.year else{
            return "0"
        }
        
        return " tiene \(age) años"
    }
}
class Student : CustomStringConvertible{
    var name : String?
    var surname : String?
    var age : Date?
    var phone : String?
    var address : String?
    var email : String?

    convenience init (name : String? = nil, surname : String? = nil, age: Date?, phone: String? = nil, address : String? = nil, email : String? = nil){
        self.init()
        self.name = name
        self.surname = surname
        self.age = age
        self.phone = phone;
        self.address = address
        self.email = email
    }
    var description: String{
        var descripcion = ""
        
        if let nombre = self.name{
            descripcion += "name: " + nombre + ","
        }
        if let apellido = self.surname{
            descripcion += "surname: " + apellido + ","
        }
        if let edad = self.age{
            descripcion += "age: \(edad.edad()) ,"
        }
        if let telefono = self.phone{
            descripcion += "phone: " + telefono + ","
        }
        if let direccion = self.address{
            descripcion += "address: " + direccion + ","
        }
        if let mail = self.email{
            descripcion += "email:" +  mail + ""
        }
        descripcion+="\n"
        return descripcion
        
        
        
    }
}
class Teacher : CustomStringConvertible{
    var name : String?
    var surname : String?
    var age : Date?
    var type : TeacherType?
    var email : String?
    var sueldo : Salary?
    
    convenience init (name : String? = nil, surname : String? = nil, age: Date? = nil, type : TeacherType? = nil, email : String? = nil,sueldo : Salary? = nil){
        self.init()
        self.name = name
        self.surname = surname
        self.age = age
        self.type = type
        self.email = email
        self.sueldo = sueldo
    }
    
    var description: String{
        var descripcion = ""
        
        if let nombre = self.name{
            descripcion += "name: " + nombre + ","
        }
        if let apellido = self.surname{
            descripcion += "surname: " + apellido + ","
        }
        if let edad = self.age{
            descripcion += "age: \(edad.edad()) ,"
        }
        if let sueldo = self.sueldo{
            descripcion += "sueldo: " + sueldo.description + ","
        }
        if let tipo = self.type{
            descripcion += "type: " + tipo.description + ","
        }
        if let mail = self.email{
            descripcion += "email:" +  mail + ""
        }
        descripcion+="\n"
        return descripcion
        
        
    }
}
class Subject: CustomStringConvertible{
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
    
    var description: String{
        var descripcion = ""
        
        if let nombre = self.name{
            descripcion += "name: " + nombre + ","
        }
        if let estudiantes = self.students{
            var studiantes = "["
            estudiantes.forEach{
                guard let nombre = $0.name else{
                    return
                }
                studiantes+=" "+nombre
                
                
            }
            studiantes += "]"
            descripcion += "students: " + studiantes + ","
        }
        if let profesores = self.teachers{
            var teaches = "["
            profesores.forEach{
                guard let nombre = $0.name else{
                    return
                }
                teaches+=" "+nombre
                
                
            }
            teaches += "]"
            descripcion += "teachers: " + teaches + ","
        }
        if let fin = self.year{
            descripcion += "fin: " + fin.formatea() + ","
        }
        descripcion+="\n"
        return descripcion
        
        
    }
}

let students = [Student(name: "Vivian",
                        age: Calendar.current.date(from: DateComponents(year:1900,month:3)),
                        email: "Campbell@adsasd.com"),
                Student(name: "Ronnie",
                        age: Calendar.current.date(from: DateComponents(year:2000,month:2)),
                        email: "james@dio.com"),
                Student(name: "Mario",
                        age: Calendar.current.date(from: DateComponents(year:1893,month:3)),
                        email: "luigi@peach.com"),
                Student(name: "Cliff",
                        age: Calendar.current.date(from: DateComponents(year:2001,month:6)),
                        email: "ddddol@adsasd.com"),
                Student(name: "Oliver",
                        age: Calendar.current.date(from: DateComponents(year:1980,month:3)),
                        email: "wwwwol@adsasd.com"),
                Student(name: "Carlos",
                        age: Calendar.current.date(from: DateComponents(year:1997,month:3)),
                        email: "aaaol@adsasd.com"),
                Student(name: "Eddard",
                        age: Calendar.current.date(from: DateComponents(year:2000,month:7)),
                        email: "olddd@adsasd.com"),
                Student(name: "Luke",
                        age: Calendar.current.date(from: DateComponents(year:1999,month:3)),
                        email: "dsadasol@adsasd.com")]

let teachers = [Teacher(name: "John",
                         age: Calendar.current.date(from: DateComponents(year:1949,month:3)),
                        type: .interno,
                        
                        email: "Targaryen@adsasd.com",
                        sueldo: .senior(amount: 120.0)),
                
                Teacher(name: "X",
                        age: Calendar.current.date(from: DateComponents(year:1995,month:3)),
                        type: .interno,
                        email: "X@adsasd.com",
                        sueldo: .junior(amount: 10.0)),
                Teacher(name: "Tonny",
                        age: Calendar.current.date(from: DateComponents(year:1909,month:3)),
                        type: .externo,
                        email: "cccccol@Iommi",
                        sueldo: .medium(amount: 50.0)),
                Teacher(name: "Ozzy",
                        age: Calendar.current.date(from: DateComponents(year:1099,month:3)),
                        type: .externo,
                        email: "mmmmol@Crowley",
                        sueldo: .senior(amount: 1230.0)),
                Teacher(name: "Dio",
                        age: Calendar.current.date(from: DateComponents(year:1909,month:3)),
                        type: .interno,
                        email: "rrrrol@adsasd.com",
                        sueldo: .senior(amount: 145.0)),
                Teacher(name: "Aleister",
                        age: Calendar.current.date(from: DateComponents(year:1299,month:3)),
                        type: .interno,
                        email: "aleister@adsasd.com",
                        sueldo: .junior(amount: 25.0)),
                Teacher(name: "Ritchie",
                        age: Calendar.current.date(from: DateComponents(year:1992,month:3)),
                        type: .externo,
                        email: "balckmoore@rainbow.com",
                        sueldo: .senior(amount: 150.0)),
                Teacher(name: "Kubo",
                        age: Calendar.current.date(from: DateComponents(year:1994,month:3)),
                        type: .externo,
                        email: "two@strings.com",
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
/*
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
        print()
        
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
        print()
        
    }
    
    
    
}

// comentado hasta que haga un 
let sortedStudents = students.sorted(by:{$0.age ?? 0 < $1.age ?? 0})
print(sortedStudents.compactMap{$0.name})
print(sortedStudents.compactMap{$0.age})

let internos = teachers.filter{$0.type == .interno}
let externos = teachers.filter{$0.type == .externo}
print (internos.compactMap{$0.name})
print(internos.count)
print (externos.compactMap{$0.name})
print (externos.count)
print()

let sortedByDate = subjects.sorted { actual, next in
    guard   let fecha1 = actual.year,
            let fecha2 = next.year
        else{
        return false}
    
    
    return fecha1.compare(fecha2) == .orderedAscending
    
    
}

print(sortedByDate.compactMap{$0.name})
print(sortedByDate.compactMap{$0.year})


subjects.forEach{ subject in
    guard let name = subject.name,
        let year=subject.year
        else{
        return
    }
    print("\(name)")
    print(year.formatea())
    print()
    
}


teachers.forEach{
    guard let sueldo = $0.sueldo, let name = $0.name else{
        return
    }
    print (name)
    print (sueldo.description)
    print (sueldo.amount)
    print()
    
    
}*/
print("**********10*********")
print(students)
print("*******************")
print(teachers)
print("*******************")
print (subjects)
print("*******************")
print ()
print("**********11*********")



print("students")
students.forEach{
    guard let edad = $0.age else{
        return
    }
    guard let name = $0.name else{
        return
    }
    print(name)
    print(edad.edad())
}


print ()
print ("teachers")
teachers.forEach{
    guard let edad = $0.age else{
        return
    }
    guard let name = $0.name else{
        return
    }
    print(name)
    print(edad.edad())
}





