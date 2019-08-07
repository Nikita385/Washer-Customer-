//
//  BottomSheetController.swift
//  Washer
//
//  Created by Excelsior Technologies on 31/07/19.
//  Copyright © 2019 Excelsior Technologies. All rights reserved.
//

import UIKit
enum SheetLevel{
    case top, bottom, middle
}

protocol BottomSheetDelegate {
    func updateBottomSheet(frame: CGRect)
}

class BottomSheetController: UIViewController,UIScrollViewDelegate {
    @IBOutlet weak var panView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var view_Gold: UIView!
    @IBOutlet weak var view_Silver: UIView!
    @IBOutlet weak var view_Basic: UIView!
    
    @IBOutlet weak var view_SelectVehicle: UIView!
    @IBOutlet weak var view_Date: UIView!
    @IBOutlet weak var view_Time: UIView!
    @IBOutlet weak var btn_Continue: UIButton!
    

    
    
    var lastY: CGFloat = 0
    var pan: UIPanGestureRecognizer!
    
    var bottomSheetDelegate: BottomSheetDelegate?
    var parentView: UIView!
    
    var initalFrame: CGRect!
    var topY: CGFloat = 130 //change this in viewWillAppear for top position
    var middleY: CGFloat = 400 //change this in viewWillAppear to decide if animate to top or bottom
    var bottomY: CGFloat = 600 //no need to change this
    let bottomOffset: CGFloat = 130 //sheet height on bottom position
    var lastLevel: SheetLevel = .top //choose inital position of the sheet
    
    var disableTableScroll = false
    
    //hack panOffset To prevent jump when goes from top to down
    var panOffset: CGFloat = 0
    var applyPanOffset = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        pan.delegate = self  
        self.panView.addGestureRecognizer(pan)
        
        self.scrollView.panGestureRecognizer.addTarget(self, action: #selector(handlePan(_:)))
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(handleTap(_:)))
        tap.delegate = self
        scrollView.addGestureRecognizer(tap)
        
        view_Gold.applyRadiusBorder(radius: 8.0, borderWidth: 0.0, borderColor: .clear)
        view_Silver.applyRadiusBorder(radius: 8.0, borderWidth: 0.0, borderColor: .clear)
        view_Basic.applyRadiusBorder(radius: 8.0, borderWidth: 0.0, borderColor: .clear)
        view_Date.applyRadiusBorder(radius: 8.0, borderWidth: 0.0, borderColor: .clear)
        view_Time.applyRadiusBorder(radius: 8.0, borderWidth: 0.0, borderColor: .clear)
        view_SelectVehicle.applyRadiusBorder(radius: 5.0, borderWidth: 0.0, borderColor: .clear)
        btn_Continue.applyRadiusBorder(radius: 5.0, borderWidth: 0.0, borderColor: .clear)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.initalFrame = UIScreen.main.bounds
        self.topY = round(initalFrame.height * 0.05)
        self.middleY = initalFrame.height * 0.6
        self.bottomY = initalFrame.height - bottomOffset
        self.lastY = self.middleY
        
        bottomSheetDelegate?.updateBottomSheet(frame: self.initalFrame.offsetBy(dx: 0, dy: self.middleY))
    }
    @IBAction func tap_Date(_ sender: Any)
    {
        PopupController
            .create(self)
            .show(SelectDatePopupController.instance())
    }
    @IBAction func tap_Time(_ sender: Any)
    {
        PopupController
            .create(self)
            .show(SelectTimePopupController.instance())
    }
    @IBAction func tap_SelectVehicle(_ sender: Any)
    {
        PopupController
            .create(self)
            .show(AddVehicalPopupController.instance())
    }


    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView == scrollView else {return}
        
        if (self.parentView.frame.minY > topY){
            self.scrollView.contentOffset.y = 0
        }
    }
    
    
    //this stops unintended tableview scrolling while animating to top
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        guard scrollView == scrollView else {return}
        
        if disableTableScroll{
            targetContentOffset.pointee = scrollView.contentOffset
            disableTableScroll = false
        }
    }
    
    //Bug fix #5. see https://github.com/OfTheWolf/UBottomSheet/issues/5
    @objc func handleTap(_ recognizer: UITapGestureRecognizer){
        let p = recognizer.location(in: self.scrollView)
//        let index = scrollView.indexPathForRow(at: p)
        //WARNING: calling selectRow doesn't trigger tableView didselect delegate. So handle selected row here.
        //You can remove this line if you dont want to force select the cell
//        scrollView.selectRow(at: index, animated: false, scrollPosition: .none)
    }//Bug fix #5 end
    
    
    @objc func handlePan(_ recognizer: UIPanGestureRecognizer){
        
        let dy = recognizer.translation(in: self.parentView).y
        switch recognizer.state {
        case .began:
            applyPanOffset = (self.scrollView.contentOffset.y > 0)
        case .changed:
            if self.scrollView.contentOffset.y > 0{
                panOffset = dy
                return
            }
            
            if self.scrollView.contentOffset.y <= 0{
                if !applyPanOffset{panOffset = 0}
                let maxY = max(topY, lastY + dy - panOffset)
                let y = min(bottomY, maxY)
                //                self.panView.frame = self.initalFrame.offsetBy(dx: 0, dy: y)
                bottomSheetDelegate?.updateBottomSheet(frame: self.initalFrame.offsetBy(dx: 0, dy: y))
            }
            
            if self.parentView.frame.minY > topY{
                self.scrollView.contentOffset.y = 0
            }
        case .failed, .ended, .cancelled:
            panOffset = 0
            
            //bug fix #6. see https://github.com/OfTheWolf/UBottomSheet/issues/6
            if (self.scrollView.contentOffset.y > 0){
                return
            }//bug fix #6 end
            
            self.panView.isUserInteractionEnabled = false
            
            self.disableTableScroll = self.lastLevel != .top
            
            self.lastY = self.parentView.frame.minY
            self.lastLevel = self.nextLevel(recognizer: recognizer)
            
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.9, options: .curveEaseOut, animations: {
                
                switch self.lastLevel{
                case .top:
                    //                    self.panView.frame = self.initalFrame.offsetBy(dx: 0, dy: self.topY)
                    self.bottomSheetDelegate?.updateBottomSheet(frame: self.initalFrame.offsetBy(dx: 0, dy: self.topY))
                    self.scrollView.contentInset.bottom = 50
                case .middle:
                    //                    self.panView.frame = self.initalFrame.offsetBy(dx: 0, dy: self.middleY)
                    self.bottomSheetDelegate?.updateBottomSheet(frame: self.initalFrame.offsetBy(dx: 0, dy: self.middleY))
                case .bottom:
                    //                    self.panView.frame = self.initalFrame.offsetBy(dx: 0, dy: self.bottomY)
                    self.bottomSheetDelegate?.updateBottomSheet(frame: self.initalFrame.offsetBy(dx: 0, dy: self.bottomY))
                }
                
            }) { (_) in
                self.panView.isUserInteractionEnabled = true
                self.lastY = self.parentView.frame.minY
            }
        default:
            break
        }
    }
    
    func nextLevel(recognizer: UIPanGestureRecognizer) -> SheetLevel{
        let y = self.lastY
        let velY = recognizer.velocity(in: self.view).y
        if velY < -200{
            return y > middleY ? .middle : .top
        }else if velY > 200{
            return y < (middleY + 1) ? .middle : .bottom
        }else{
            if y > middleY {
                return (y - middleY) < (bottomY - y) ? .middle : .bottom
            }else{
                return (y - topY) < (middleY - y) ? .top : .middle
            }
        }
    }
}



extension BottomSheetController: UIGestureRecognizerDelegate{
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
}

