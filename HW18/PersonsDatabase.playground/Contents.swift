import UIKit
import RealmSwift

final class PersonDetails: Object {
    @objc dynamic var fullname: String?
    @objc dynamic var height: Double = 0.0
    @objc dynamic var weight: Double = 0.0
    @objc dynamic var gender: String?
    @objc dynamic var dateOfBirth: String?
}

final class Manager {
    static let shared = Manager()
    private let realm = try! Realm()
    var results: Results<PersonDetails>!
    
    internal func getPersons() -> Results<PersonDetails> {
        realm.objects(PersonDetails.self)
    }
    
    internal func printPersons() {
        let objects = realm.objects(PersonDetails.self)
        for i in objects.indices {
            print(objects[i].fullname!)
        }
    }
 
    internal func add(fullname: String, height: Double, weight: Double, gender: String, dateOfBirth: String) {
        try! realm.write {
            let person = PersonDetails()
            person.fullname = fullname
            person.height = height
            person.weight = weight
            person.gender = gender
            person.dateOfBirth = dateOfBirth
            realm.add(person)
        }
    }

    internal func remove(person: PersonDetails) {
        try! realm.write { realm.delete(person) }
    }
    internal func deleteAll() {
        try! realm.write { realm.deleteAll() }
    }

    func findDinosaur() -> PersonDetails? {
        if realm.objects(PersonDetails.self).count > 0 {
            var older = realm.objects(PersonDetails.self)[0]
            for human in realm.objects(PersonDetails.self) {
                if !compareDateOfBirth(p1: human, p2: older) {
                older = human
            }}
            print("Dinosaur 🦖: \(older.fullname!) (\(older.dateOfBirth!.toDateISO8601().1) years)")
            return older
        }
        return nil
    }

    func findYoung() -> PersonDetails? {
        if realm.objects(PersonDetails.self).count > 0 {
            var young = realm.objects(PersonDetails.self)[0]
            for human in realm.objects(PersonDetails.self) {
                if compareDateOfBirth(p1: human, p2: young) {
                young = human
            }}
            print("Zoomer 🗿: \(young.fullname!) (\(young.dateOfBirth!.toDateISO8601().1) years)")
            return young
        }
        return nil
    }

    private func compareDateOfBirth(p1: PersonDetails, p2: PersonDetails) -> Bool {
        let p1bday = Int(truncating: (p1.dateOfBirth?.toDateISO8601().0.timeIntervalSinceNow)! as NSNumber)
        let p2bday = Int(truncating: (p2.dateOfBirth?.toDateISO8601().0.timeIntervalSinceNow)! as NSNumber)
        return p1bday > p2bday
    }
}

extension String {

    internal func toDateISO8601() -> (Date,Int) {
        let df = DateFormatter()
        df.dateFormat = "YYYY-MM-DD"
        guard let date = df.date(from: self) else {
      
            preconditionFailure("Error convert: unknown date format in input")
        }
        let age = Calendar.current.dateComponents([.year], from: date, to: Date())
        return (date, age.year!)
    }
}


let manager = Manager()
manager.deleteAll()

manager.add(fullname: "Kacie Sargent", height: 172.0, weight: 52.2, gender: "Female", dateOfBirth: "1992-04-24")
manager.add(fullname: "Ash Thatcher", height: 181.5, weight: 79.3, gender: "Male", dateOfBirth: "1994-06-19")
manager.add(fullname: "Daniel Camacho", height: 178.2, weight: 80.5, gender: "Male", dateOfBirth: "1993-10-29")
manager.add(fullname: "Sydney Haworth", height: 176.8, weight: 73.0, gender: "Male", dateOfBirth: "1996-11-22")
manager.add(fullname: "Delores Thompson", height: 174.0, weight: 62.3, gender: "Female", dateOfBirth: "1998-02-09")

manager.printPersons()
manager.findDinosaur()
manager.findYoung()
