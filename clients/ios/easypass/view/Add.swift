
import RealmSwift
import UIKit

class AddItemView: BaseView {

    var name: UITextField!
    var desc: UITextField!
    var pass: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func initView() {
        let back = UIButton()
        back.setTitle("Back", for: .normal)
        back.layer.cornerRadius = 5
        back.frame = CGRect(x: 20, y: 20, width: 40, height: 30)
        back.addTarget(self, action: #selector(AddItemView.gotoList), for: .touchUpInside)

        view.addSubview(back)

        let name = UITextField()
        name.placeholder = "name"
        name.frame = CGRect(x: 20, y: 60, width: 240, height: 30)

        view.addSubview(name)
        self.name = name

        let desc = UITextField()
        desc.placeholder = "description"
        desc.frame = CGRect(x: 20, y: 100, width: 240, height: 30)

        view.addSubview(desc)
        self.desc = desc

        let pass = UITextField()
        pass.placeholder = "password"
        pass.frame = CGRect(x: 20, y: 140, width: 240, height: 30)

        view.addSubview(pass)
        self.pass = pass

        let add = UIButton()
        add.setTitle("Add", for: .normal)
        add.layer.cornerRadius = 5
        add.frame = CGRect(x: 20, y: 180, width: 40, height: 30)
        add.addTarget(self, action: #selector(AddItemView.addItem), for: .touchUpInside)

        view.addSubview(add)
    }

    func addItem() {
        let item = ItemR()
        item.id = UUID().uuidString
        item.name = self.name.text!
        item.desc = self.desc.text!
        item.pass = self.pass.text!

        let realm = try! Realm()

        try! realm.write {
            realm.add(item)
        }

        gotoList()
    }

    func gotoList() {
        let view = ListView()
        navigationController?.pushViewController(view, animated: true)
    }
}
