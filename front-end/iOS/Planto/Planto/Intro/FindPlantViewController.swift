//
//  FindPlantViewController.swift
//  Planto
//
//  Created by Aaron Lee on 7/26/20.
//  Copyright © 2020 D&D. All rights reserved.
//

import UIKit

class FindPlantViewController: UIViewController {
    
    // - MARK: IBOutlets
    @IBOutlet weak var imgView: UIImageView!
    
    var image: UIImage! // UIImage 변수
    let width = UIScreen.main.bounds.width  // 화면 width
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgView.image = image   // 이미지 추가
        
        // 이미지 크기 및 라운드 처리
        imgView.frame = CGRect(x: 0, y: 0, width: width, height: width)
        imgView.layer.cornerRadius = imgView.layer.frame.height / 2
        imgView.layer.masksToBounds = true
        imgView.clipsToBounds = true
        
        // 화면 전환 + 지연 3초
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.performSegue(withIdentifier: "PlantFound", sender: self)
        }
    }
    
//    // To Do: 이미지 검색 및 결과 도출 후 화면 전환
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if (segue.identifier == "PlantFound") {
//            guard let nextVc = segue.destination as? PlantFoundViewController else { return }
//            nextVc.plantName = "스투키"    // 임시 이름
//            nextVc.plantNameEN = "Stuckyi"    // 임시 이름
//        }
//    }

}
