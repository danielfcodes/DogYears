//
//  ViewController.swift
//  DogYears
//
//  Created by Daniel Fernandez on 10/19/17.
//  Copyright © 2017 Ronteq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var dogYearsTextField: UITextField!
  @IBOutlet weak var resultLabel: UILabel!
  @IBOutlet var resultLabelCenterAnchor: NSLayoutConstraint!
  var resultOnScreen = false
  
  @IBAction func calculateYears(_ sender: UIButton){
    guard let dogAgeString = dogYearsTextField.text else { return }
    guard let dogAge = Int(dogAgeString) else { return }
    
    calculateDogAge(dogAge)
  }
  
  func calculateDogAge(_ dogAge: Int){
    let result = dogAge * 9
    
    if result < 20{
      resultLabel.text = "Tu mascota tiene \(result) años. Es un pequeño 🐶"
    }else if result > 20 && result < 70{
      resultLabel.text = "Tu mascota tiene \(result) años 😄"
    }else if result > 70 && result < 108{
      resultLabel.text = "Tu mascota tiene \(result) años. Esta viejito 😔"
    }else{
      resultLabel.text = "Tu mascota tiene \(result) años 😨"
    }
    
    //Opcional
    animateResultLabel()
  }
    
  func animateResultLabel(){
    if resultOnScreen{
      sendResultOutside()
    }else{
      sendResultInside()
    }
  }
  
  func sendResultOutside(){
    resultLabelCenterAnchor.isActive = false
    resultLabelCenterAnchor.constant = 600
    resultLabelCenterAnchor.isActive = true
    
    UIView.animate(withDuration: 0.5, animations: {
      self.view.layoutIfNeeded()
    }, completion: { _ in
      self.resultOnScreen = false
      self.resetResultToInitialPosition()
      self.animateResultLabel()
    })
  }
  
  func sendResultInside(){
    resultLabelCenterAnchor.isActive = false
    resultLabelCenterAnchor.constant = 0
    resultLabelCenterAnchor.isActive = true
    
    UIView.animate(withDuration: 0.5, animations: {
      self.view.layoutIfNeeded()
    }, completion: { _ in
      self.resultOnScreen = true
    })
  }
  
  func resetResultToInitialPosition(){
    resultLabelCenterAnchor.isActive = false
    resultLabelCenterAnchor.constant = -600
    resultLabelCenterAnchor.isActive = true
    
    view.layoutIfNeeded()
  }

  /*Agregue un TapGesture a mi view principal para
   cuando hagan tap en la vista, el teclado desaparezca.
   */
  @IBAction func viewTapped(_ sender: UITapGestureRecognizer) {
    dogYearsTextField.resignFirstResponder()
  }
}

