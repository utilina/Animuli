//
//  QuizViewController.swift
//  Animuli
//
//  Created by Анастасия Улитина on 22.11.2020.
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet weak var quizImage: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var quizLabel: UILabel!
    @IBOutlet weak var answerButton: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    
    private var gameScore = ""
//    let quizModel = [
//        QuizModel(title: <#T##String#>, image: <#T##String#>),
//        QuizModel(title: , image: <#T##String#>),
//        QuizModel(title: <#T##String#>, image: <#T##String#>),
//        QuizModel(title: <#T##String#>, image: <#T##String#>),
//        QuizModel(title: <#T##String#>, image: <#T##String#>),
//        QuizModel(title: <#T##String#>, image: <#T##String#>)
//    ]
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        quizLabel.text = "0"
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        
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
