
import PFColorHash
import RealmSwift
import UIKit

class ListView: BaseView, UITableViewDelegate, UITableViewDataSource {

    let cellIndetifier = "TextCell"
    let table = UITableView()

    var items = [Item]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func initView() {
        self.loadItems()

        let label = UILabel()
        let count = self.items.count
        label.text = "total: \(count)"
        label.frame = CGRect(x: 20, y: 20, width: 120, height: 30)

        view.addSubview(label)

        let btn = UIButton()
        btn.setTitle("Add", for: .normal)
        btn.layer.cornerRadius = 5
        btn.frame = CGRect(x: 320, y: 20, width: 40, height: 30)
        btn.addTarget(self, action: #selector(ListView.gotoAddItem), for: .touchUpInside)

        view.addSubview(btn)

        initTableView()
    }

    func initTableView() {
        table.delegate = self
        table.dataSource = self

        table.frame = CGRect(x: 0, y: 60, width: view.frame.width, height: view.frame.height - 40)

        view.addSubview(table)
    }

    func loadItems() {
        let realm = try! Realm()
        let items = realm.objects(ItemR.self)

        for item in items {
            let i = Item()
            i.name = item.name
            i.desc = item.desc
            i.pass = item.pass
            i.id = item.id

            self.items.append(i)
        }
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let cell = tableView.cellForRow(at: indexPath)

            let realm = try! Realm()
            let item = realm.objects(ItemR.self).filter("nam == \(cell?.textLabel?.text)").first

            realm.delete(item!)

            tableView.deleteRows(at: [indexPath as IndexPath], with: .fade)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: cellIndetifier)
        let item = self.items[indexPath.row]
        cell.textLabel?.text = item.name
        cell.textLabel?.textColor = getColor(item.name)
        cell.detailTextLabel?.text = item.desc
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        table.deselectRow(at: indexPath, animated: true)
        let board = UIPasteboard.general
        board.string = self.items[indexPath.row].pass
    }

    func getColor(_ str: String) -> UIColor {
        let colorHash = PFColorHash()
        let rgb = colorHash.rgb(str)

        return UIColor(
            red: (CGFloat)(rgb.r) / 255.0,
            green: (CGFloat)(rgb.g) / 255.0,
            blue: (CGFloat)(rgb.b) / 255.0,
            alpha: 1.0
        )
    }

    func gotoAddItem() {
        let view = AddItemView()
        navigationController?.pushViewController(view, animated: true)
    }

}
