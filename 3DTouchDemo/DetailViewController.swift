//
//  DetailViewController.swift
//  3DTouchDemo
//
//  Created by sunyazhou on 16/3/4.
//  Copyright © 2016年 Baidu, Inc. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var doneLabel: UILabel!
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        doneLabel.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self.view).inset(40)
        }
        
        
        navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem()
        navigationItem.leftItemsSupplementBackButton = true
    }
    
    override func previewActionItems() -> [UIPreviewActionItem] {
        let action1 = UIPreviewAction(title: "默认的按钮类型safl asas;lkfkas;lfk a;sfk ;alfska;slfk alskf \n asd asd sad sad ", style: .Default) { (previewAction, viewController) -> Void in
            if viewController is DetailViewController {
                print(previewAction.title)
            }
        }
        
        let action2 = UIPreviewAction(title: "Destructive类型按钮", style: .Destructive) { (previewAction, viewController) -> Void in
            if viewController is DetailViewController {
                print(previewAction.title)
            }
        }
        
        let subAction1 = UIPreviewAction(title: "组1", style: .Default) { (previewAction, viewController) -> Void in
            if viewController is DetailViewController {
                print(previewAction.title)
            }
        }
        
        let subAction2 = UIPreviewAction(title: "组2", style: .Destructive) { (previewAction, viewController) -> Void in
            if viewController is DetailViewController {
                print(previewAction.title)
            }
        }
        
        let subAction3 = UIPreviewAction(title: "组3", style: .Default) { (previewAction, viewController) -> Void in
            if viewController is DetailViewController {
                print(previewAction.title)
            }
        }
        
        let subAction4 = UIPreviewAction(title: "组3", style: .Default) { (previewAction, viewController) -> Void in
            if viewController is DetailViewController {
                print(previewAction.title)
            }
        }
        
        let groupActions = UIPreviewActionGroup(title: "点我包含一组按钮", style: .Default, actions: [subAction1, subAction2, subAction3, subAction4])
        
         let groupActions2 = UIPreviewActionGroup(title: "点我包含一组按钮", style: .Selected, actions: [subAction1, subAction2, subAction3, subAction4, action1, action2])
        
        let groupActions6 = UIPreviewActionGroup(title: "点我包含一组按钮", style: .Selected, actions: [subAction1, subAction2, subAction3, subAction4, action1, action2])
        
        let groupActions3 = UIPreviewActionGroup(title: "点我包含一组按钮", style: .Selected, actions: [subAction1, subAction2, subAction3, subAction4, action1, action2])
        
        let groupActions4 = UIPreviewActionGroup(title: "点我包含一组按钮", style: .Selected, actions: [subAction1, subAction2, subAction3, subAction4, action1, action2])
        
        let groupActions5 = UIPreviewActionGroup(title: "点我包含一组按钮", style: .Selected, actions: [subAction1, subAction2, subAction3, subAction4, action1, action2])
        
        return [action1,action2,groupActions,groupActions2,groupActions6,groupActions3,groupActions4,groupActions5]
    }
    
}
