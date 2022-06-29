//
//  ViewController.swift
//  SceneKit3D
//
//  Created by Kiroshan Thayaparan on 6/29/22.
//

import UIKit
import SceneKit

class ViewController: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "modelCell")
        return tableView
    }()
    
    let modelArray = [["Sneakers", "converse_obj.obj"], ["Snake", "Snake.obj"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Model List"
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "modelCell", for: indexPath as IndexPath)
        cell.textLabel?.text = modelArray[indexPath.row][0]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = SceneViewController()
        controller.model = modelArray[indexPath.row][1]
        navigationController?.pushViewController(controller, animated: true)
    }
}
