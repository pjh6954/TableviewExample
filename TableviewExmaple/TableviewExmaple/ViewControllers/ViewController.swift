//
//  ViewController.swift
//  TableviewExmaple
//
//  Created by Dannian Park on 2021/10/14.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tbvList: UITableView!
    
    private var cellCountArr: [Int] = [5, 2, 1]
    
    private let cellName: String = "TableViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NSLog("VIEW DID LOAD")
        self.view.backgroundColor = .darkGray
        
        tbvList.delegate = self
        tbvList.dataSource = self
        let tableviewNib = UINib(nibName: cellName, bundle: nil)
        tbvList.register(tableviewNib, forCellReuseIdentifier: cellName)
        tbvList.separatorStyle = .none
        tbvList.contentInsetAdjustmentBehavior = .never

    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return cellCountArr.count
    }
    
    // header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = CustomHeaderView(frame: .zero)
        view.delegate = self
        view.setData(section)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nil
    }
    
    // footer
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    // cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCountArr[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellName, for: indexPath) as? TableViewCell else {
            return TableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension ViewController: CustomHeaderDelegate {
    func selectViewTag(_ value: Int) {
        guard value >= 0 else {
            return
        }
        cellCountArr[value] += 1
        self.tbvList.reloadData()
    }
}
