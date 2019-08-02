//
//  AddVehicalController.swift
//  Washer
//
//  Created by Excelsior Technologies on 02/08/19.
//  Copyright © 2019 Excelsior Technologies. All rights reserved.
//

import UIKit

class AddVehicalController: UIViewController
{
    @IBOutlet weak var btnWhite: UIButton!
    @IBOutlet weak var btnBlack: UIButton!
    @IBOutlet weak var btnBlue: UIButton!
    @IBOutlet weak var btnBrown: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        btnWhite.applyRadiusBorder(radius: self.btnWhite.frame.width/2, borderWidth: 1, borderColor: .black)
        btnBlue.applyRadiusBorder(radius: self.btnBlue.frame.width/2, borderWidth: 1, borderColor: .black)
        btnBrown.applyRadiusBorder(radius: self.btnBrown.frame.width/2, borderWidth: 1, borderColor: .black)
        btnBlack.applyRadiusBorder(radius: self.btnBlack.frame.width/2, borderWidth: 1, borderColor: .black)


        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onBtnBlackClicked(_ sender: UIButton)
    {
        if sender == btnBlack {
            btnBlack.isSelected = true
            sender.setImage(UIImage(named: "whitear.png"), for: .normal)
            btnWhite.setImage(UIImage(named: ""), for: .normal)
            btnBlue.setImage(UIImage(named: ""), for: .normal)
            btnBrown.setImage(UIImage(named: ""), for: .normal)
        }
        else
        {
            btnBlue.isSelected = false
            btnBrown.isSelected = false
            btnBrown.isSelected = false
            btnBlack.backgroundColor = UIColor.black
        }
    }
    
    @IBAction func onBtnWhiteClicked(_ sender: UIButton)
    {
        if sender == btnWhite {
            btnWhite.isSelected = true
            sender.setImage(UIImage(named: "whitear.png"), for: .normal)
            btnBlue.setImage(UIImage(named: ""), for: .normal)
            btnBlack.setImage(UIImage(named: ""), for: .normal)
            btnBrown.setImage(UIImage(named: ""), for: .normal)
        }
        else
        {
            btnBlack.isSelected = false
            btnBrown.isSelected = false
            btnBlue.isSelected = false
            btnWhite.backgroundColor = UIColor.white
        }
    }
    
    
    @IBAction func onBtnBlueClicked(_ sender: UIButton)
    {
        if sender == btnBlue {
            btnBlue.isSelected = true
            sender.setImage(UIImage(named: "whitear.png"), for: .normal)
            btnWhite.setImage(UIImage(named: ""), for: .normal)
            btnBlack.setImage(UIImage(named: ""), for: .normal)
            btnBrown.setImage(UIImage(named: ""), for: .normal)

        }
        else
        {
            btnBlack.isSelected = false
            btnBrown.isSelected = false
            btnWhite.isSelected = false
            btnBlue.backgroundColor = UIColor.blue
        }
    }
    
    
    
    @IBAction func onBtnBrownClicked(_ sender: UIButton)
    {
        if sender == btnBrown {
            btnBrown.isSelected = true
            sender.setImage(UIImage(named: "whitear.png"), for: .normal)
            btnWhite.setImage(UIImage(named: ""), for: .normal)
            btnBlack.setImage(UIImage(named: ""), for: .normal)
            btnBlue.setImage(UIImage(named: ""), for: .normal)
        }
        else
        {
            btnBlack.isSelected = false
            btnWhite.isSelected = false
            btnBlue.isSelected = false
            btnBrown.backgroundColor = UIColor.brown
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
