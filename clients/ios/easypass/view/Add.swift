
import UIKit

class AddItemView: BaseView {

    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
    }

    func initView() {
        let btn = UIButton()
        btn.setTitle("Back", for: .normal)
        btn.layer.cornerRadius = 5
        btn.frame = CGRect(x: 20, y: 20, width: 40, height: 30)
        btn.addTarget(self, action: #selector(AddItemView.gotoList), for: .touchUpInside)

        view.addSubview(btn)
    }

    func gotoList() {
        let view = ListView()
        navigationController?.pushViewController(view, animated: true)
    }
}
