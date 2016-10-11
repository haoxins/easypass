
import UIKit

class ListView: BaseView {

    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
    }

    func initView() {
        let btn = UIButton()
        btn.setTitle("Add", for: .normal)
        btn.layer.cornerRadius = 5
        btn.frame = CGRect(x: 320, y: 20, width: 40, height: 30)
        btn.addTarget(self, action: #selector(ListView.gotoAddItem), for: .touchUpInside)

        view.addSubview(btn)
    }

    func gotoAddItem() {
        let view = AddItemView()
        navigationController?.pushViewController(view, animated: true)
    }

}
