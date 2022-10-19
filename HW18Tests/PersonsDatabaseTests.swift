import XCTest
import Quick
import Nimble
import RealmSwift
@testable import HW18

class PersonsDatabaseTests: QuickSpec {
    override func tearDown() {
        
    }

    override func spec() {
        describe("RealmTests") {
            it("ManagerTests") {
            Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name

            let p1 = Manager.shared.person(fullname: "Kacie Sargent", height: 172.0, weight: 52.2, gender: "Female", dateOfBirth: "1992-04-24")
            Manager.shared.add(person: p1)
            let p2 = Manager.shared.person(fullname: "Ash Thatcher", height: 181.5, weight: 79.3, gender: "Male", dateOfBirth: "1994-06-19")
            Manager.shared.add(person: p2)
            let p3 = Manager.shared.person(fullname: "Daniel Camacho", height: 178.2, weight: 80.5, gender: "Male", dateOfBirth: "1993-10-29")
            Manager.shared.add(person: p3)
            let p4 = Manager.shared.person(fullname: "Sydney Haworth", height: 176.8, weight: 73.0, gender: "Male", dateOfBirth: "1996-11-22")
            Manager.shared.add(person: p4)
            let p5 = Manager.shared.person(fullname: "Delory Thompson", height: 174.0, weight: 62.3, gender: "Female", dateOfBirth: "1998-02-09")
            Manager.shared.add(person: p5)
                
            print(Manager.shared.getPersons())
                
 
            let realm = try! Realm()
            let objects = realm.objects(PersonDetails.self)
            if objects.isEmpty == false {
 
                expect(Manager.shared.remove(person: objects.first!)).to(beTrue())
            }

            expect(Manager.shared.findYoung()?.dateOfBirth).to(equal(p5.dateOfBirth))
            expect(Manager.shared.findDinosaur()?.dateOfBirth).to(equal(p3.dateOfBirth))
                
            print(Manager.shared.getPersons())
            }
        }
    }
}
