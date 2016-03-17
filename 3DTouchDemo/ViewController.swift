//
//  ViewController.swift
//  3DTouchDemo
//
//  Created by sunyazhou on 16/3/4.
//  Copyright © 2016年 Baidu, Inc. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self.view)
        }
        tableview.backgroundColor = UIColor.cyanColor()
        tableview.dataSource = self
        tableview.delegate = self
        
        if self.traitCollection.forceTouchCapability == .Available {
            registerForPreviewingWithDelegate(self, sourceView: tableview)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK - All Delegate
extension ViewController: UIViewControllerPreviewingDelegate, UITableViewDataSource, UITableViewDelegate {
    
    //MARK - UITableViewDelegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let str = "sunyazhou"
        let cell = UITableViewCell(style: .Default, reuseIdentifier: str)
        
        
        cell.textLabel!.text = "aaaa"
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row % 3==0 { return 110 }
        else { return 50}
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 200))
        view.backgroundColor = UIColor.purpleColor()
        return view
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
        showViewController(detailVC, sender: self)
    }
    
    
    //MARK - 3DTouch Peek & Pop
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        let indexPath = tableview.indexPathForRowAtPoint(location)
        let cell:UITableViewCell = tableview.cellForRowAtIndexPath(indexPath!)!
        //3DTouch给预览上下文设置起始位置frame 用户 突出显示
        previewingContext.sourceRect = cell.frame
        
        let detailVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
        //3DTouch显示的预览大小
        detailVC.preferredContentSize = CGSize(width: 320, height: 400)
        
        
        return detailVC
    }
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
        
        showViewController(viewControllerToCommit, sender: self)
    }

}
